import 'package:acars_aggregation_server/aas.dart';
import 'package:angel_orm_postgres/angel_orm_postgres.dart';
import 'package:nats/nats.dart';
import 'package:quick_log/quick_log.dart';

class TLeconteJsonMessageImporter {
  JsonMessage jsonMessage;
  NatsClient natsClient;
  PostgreSqlExecutorPool executor;
  Logger logger;
  Source source;

  TLeconteJsonMessageImporter(Source source, JsonMessage jsonMessage, NatsClient natsClient, executor, Logger logger) {
    this.jsonMessage = jsonMessage;
    this.natsClient = natsClient;
    this.executor = executor;
    this.logger = logger;
    this.source = source;

    calculateVdlFields();
    identifyTail();
  }

  calculateVdlFields() {
    if (jsonMessage.fromHex == null && jsonMessage.toHex == null) {
      jsonMessage.source = 'acarsdec';
      jsonMessage.sourceType = 'acars';
    } else {
      jsonMessage.source = 'vdlm2dec';
      jsonMessage.sourceType = 'vdl';
      if (jsonMessage.fromHex != null) {
        jsonMessage.linkDirection = 'uplink';
        jsonMessage.toHex = jsonMessage.icao;
      }
      if (jsonMessage.toHex != null) {
        jsonMessage.linkDirection = 'downlink';
        jsonMessage.fromHex = jsonMessage.icao;
      }
    }
  }

  Future findOrCreateAirframe() async {
    var airframe;

    if (jsonMessage.sanitizedTail != null) {
      if (jsonMessage.tail != jsonMessage.sanitizedTail) {
        this.logger.debug("[${jsonMessage.sourceType}] Sanitized tail from '${jsonMessage.tail}' to ${jsonMessage.sanitizedTail}'");
      }

      if (jsonMessage.sanitizedTail != '') {
        var airframeQuery = new AirframeQuery();
        airframeQuery.where
          ..tail.equals(jsonMessage.sanitizedTail);
        airframe = await airframeQuery.getOne(executor);
        if (airframe != null && airframe.id != null) {
          this.logger.debug('[${jsonMessage.sourceType}] Retrieved airframe (id: ${airframe.id})');
        } else {
          if (jsonMessage.error != null && jsonMessage.error >= 2) {
            this.logger.debug('[${jsonMessage.sourceType}] Message error level (${jsonMessage.error}) is too high to be reliable to create an airframe');
            return;
          }

          var airframeInsertQuery = new AirframeQuery();
          airframeInsertQuery.values
            ..tail = jsonMessage.sanitizedTail;
          try {
            airframe = await airframeInsertQuery.insert(executor);
            this.logger.debug('[${jsonMessage.sourceType}] Inserted airframe (id: ${airframe.id})');
            natsClient.publish(airframe.toString(), 'airframe.created', onSuccess: () => {});
          }
          catch(e) {
            this.logger.error('[${jsonMessage.sourceType}] Unable to insert airframe: ${e}');
            airframe = await findOrCreateAirframe();
          }
        }
      } else {
        this.logger.debug('[${jsonMessage.sourceType}] After sanitization, still no valid tail');
      }
    } else {
      this.logger.debug('[${jsonMessage.sourceType}] No tail, no related airframe');
    }

    return airframe;
  }

  Future updateOrCreateFlight(airframe) async {
    Flight flight;
    if (airframe != null) {
      if (jsonMessage.flightNumber != null && jsonMessage.flightNumber != '') {
        var flightQuery = new FlightQuery();
        flightQuery.where
          ..airframeId.equals(airframe.idAsInt)
          ..flight.equals(jsonMessage.flightNumber)
          ..createdAt.greaterThanOrEqualTo(DateTime.now().toUtc().subtract(new Duration(days: 1)));
        flight = await flightQuery.getOne(executor);

        if (flight != null && flight.id != null) {
          this.logger.debug('[${jsonMessage.sourceType}] Retrieved flight (id: ${flight.id})');
          var flightUpdateQuery = new FlightQuery()
            ..where.id.equals(flight.idAsInt)
            ..values.status = 'in-flight'
            ..values.updatedAt = DateTime.now().toUtc();
          if (jsonMessage.latitude != null) {
            flightUpdateQuery.values.latitude = jsonMessage.latitude;
          }
          if (jsonMessage.longitude != null) {
            flightUpdateQuery.values.longitude = jsonMessage.longitude;
          }
          if (jsonMessage.altitude != null) {
            flightUpdateQuery.values.altitude = jsonMessage.altitude;
          }
          flight = await flightUpdateQuery.updateOne(executor);
          this.logger.debug('[${jsonMessage.sourceType}] Updated flight (id: ${flight.id})');
        } else {
          var flightInsertQuery = new FlightQuery();
          flightInsertQuery.values
            ..airframeId = airframe.idAsInt
            ..flight = jsonMessage.flightNumber
            ..departingAirport = jsonMessage.departingAirport
            ..destinationAirport = jsonMessage.destinationAirport
            ..messagesCount = 1
            ..status = 'in-flight';
          if (jsonMessage.latitude != null) {
            flightInsertQuery.values.latitude = jsonMessage.latitude;
          }
          if (jsonMessage.longitude != null) {
            flightInsertQuery.values.longitude = jsonMessage.longitude;
          }
          if (jsonMessage.altitude != null) {
            flightInsertQuery.values.altitude = jsonMessage.altitude;
          }
          try {
            flight = await flightInsertQuery.insert(executor);
            this.logger.debug('[${jsonMessage.sourceType}] Inserted flight (id: ${flight.id})');
            natsClient.publish(flight.toString(), 'flight.created', onSuccess: () => {});
          }
          catch(e) {
            this.logger.error('[${jsonMessage.sourceType}] Unable to insert flight: ${e}');
            flight = await updateOrCreateFlight(airframe);
          }
        }
      } else {
        // See if there's a recently active flight that matches the airframe
        var flightQuery = new FlightQuery();
        flightQuery.where
          ..airframeId.equals(airframe.idAsInt)
          ..status.equals('in-flight')
          ..updatedAt.greaterThanOrEqualTo(DateTime.now().toUtc().subtract(new Duration(minutes: 60)));
        flight = await flightQuery.getOne(executor);

        if (flight != null) {
          this.logger.debug("[${jsonMessage.sourceType}] Retrieved flight (id: ${flight.id})");
          var flightUpdateQuery = new FlightQuery();
          flightUpdateQuery
            ..where.id.equals(flight.idAsInt)
            ..values.status = 'in-flight'
            ..values.updatedAt = DateTime.now().toUtc();
          if (jsonMessage.latitude != null) {
            flightUpdateQuery.values.latitude = jsonMessage.latitude;
          }
          if (jsonMessage.longitude != null) {
            flightUpdateQuery.values.longitude = jsonMessage.longitude;
          }
          if (jsonMessage.altitude != null) {
            flightUpdateQuery.values.altitude = jsonMessage.altitude;
          }
          flight = await flightUpdateQuery.updateOne(executor);
          if (flight != null) {
            this.logger.debug('[${jsonMessage.sourceType}] Updated flight (id: ${flight.id})');
            natsClient.publish(flight.toString(), 'flight.updated', onSuccess: () => {});
          }
        } else {
          this.logger.debug("[${jsonMessage.sourceType}] No recent active flight");
        }
      }
    } else {
      this.logger.debug('[${jsonMessage.sourceType}] No airframe, no related flight');
    }

    return flight;
  }

  Future findOrCreateStation(String ipAddress) async {
    var stationQuery = new StationQuery();
    stationQuery.where
      ..ident.equals(jsonMessage.stationIdent);
    var station = await stationQuery.getOne(executor);
    if (station != null && station.id != null) {
      this.logger.debug('[${jsonMessage.sourceType}] Retrieved station (id: ${station.id}, ident: ${station.ident}, ident from msg: ${jsonMessage.stationIdent})');
    } else {
      this.logger.debug('[${jsonMessage.sourceType}] Unable to find a station for ident: ${jsonMessage.stationIdent}');
      var stationInsertQuery = new StationQuery();
      stationInsertQuery.values
        ..ident = jsonMessage.stationIdent
        ..ipAddress = ipAddress
        ..lastReportAt = DateTime.now().toUtc()
        ..messagesCount = 1;
      try {
        station = await stationInsertQuery.insert(executor);
        this.logger.debug('[${jsonMessage.sourceType}] Inserted station (id: ${station.id})');
        natsClient.publish(station.toString(), 'station.created', onSuccess: () => {});
      }
      catch(e) {
        this.logger.error('[${jsonMessage.sourceType}] Unable to insert station: ${e}');
      }
    }

    return station;
  }

  Future identifyTail() async {
    // FAA Aircraft Registration Touchup
    if (jsonMessage.fromHex != null && (jsonMessage.tail == null || jsonMessage.tail == '')) {
      this.logger.debug('[${jsonMessage.sourceType}] The tail is missing but we have ICAO. Checking FAA DB...');
      var faaQuery = new FaaAircraftRegistrationQuery();
      faaQuery.where
        ..modeSCodeHex.equals(jsonMessage.fromHex.toUpperCase());
      var faaRegistration = await faaQuery.getOne(executor);

      if (faaRegistration != null) {
        this.logger.debug('[${jsonMessage.sourceType}] Match found! Updating tail to be "N${faaRegistration.nNumber}".');
        jsonMessage.tail = 'N${faaRegistration.nNumber}';
        jsonMessage.sanitizedTail = 'N${faaRegistration.nNumber}';
      } else {
        this.logger.debug('[${jsonMessage.sourceType}] No match found. Leaving blank.');
      }
    }
  }

  Future insertOrSkipMessage(station, airframe, flight, String ipAddress) async {
    var existingMessage;
    var message;
    if (jsonMessage.sanitizedTail != null && jsonMessage.messageNumber != null) {
      var query = new MessageQuery();
      query.where
        ..tail.equals(jsonMessage.sanitizedTail)
        ..messageNumber.equals(jsonMessage.messageNumber)
        ..createdAt.equals(DateTime.now().toUtc().subtract(new Duration(minutes: 5)));
      existingMessage = await query.getOne(executor);
    }

    if (existingMessage != null) {
      this.logger.debug('[${jsonMessage.sourceType}] Existing message! Not inserting.' + existingMessage.toString());
      var messageReportQuery = new MessageReportQuery();
      messageReportQuery.values
        ..stationId = station.idAsInt
        ..messageId = message.idAsInt
        ..firstToReport = false
        ..sourceName = this.source.name
        ..sourceApplication = this.source.application
        ..sourceType = this.source.type
        ..sourceFormat = this.source.format
        ..sourceProtocol = this.source.protocol
        ..sourceNetworkProtocol = this.source.networkProtocol
        ..sourceRemoteIp = ipAddress
        ..frequency = message.frequency
        ..channel = message.channel;
      try {
        var messageReport = await messageReportQuery.insert(executor);
        if (messageReport != null) {
          logger.debug('[${jsonMessage.sourceType}] Inserted message report (id: ${messageReport.id})');
        }
      }
      catch(e) {
        logger.error('[${jsonMessage.sourceType}] Unable to insert message report: ${e}');
      }
    } else {
      var messageQuery = new MessageQuery();
      messageQuery.values
        ..timestamp = jsonMessage.timestamp
        ..sourceType = jsonMessage.sourceType
        ..source = jsonMessage.source
        ..linkDirection = jsonMessage.linkDirection
        ..fromHex = jsonMessage.fromHex
        ..toHex = jsonMessage.toHex
        ..channel = jsonMessage.channel
        ..frequency = jsonMessage.frequency
        ..level = jsonMessage.level
        ..error = jsonMessage.error
        ..mode = jsonMessage.mode
        ..label = jsonMessage.label
        ..blockId = jsonMessage.blockId
        ..ack = jsonMessage.ack
        ..tail = jsonMessage.sanitizedTail
        ..flight = jsonMessage.flightNumber
        ..messageNumber = jsonMessage.messageNumber
        ..data = jsonMessage.data
        ..text = jsonMessage.text
        ..departingAirport = jsonMessage.departingAirport
        ..destinationAirport = jsonMessage.destinationAirport
        ..blockEnd = jsonMessage.blockEnd;
      if (station != null) {
        messageQuery.values.stationId = station.idAsInt;
      }
      if (airframe != null) {
        messageQuery.values.airframeId = airframe.idAsInt;
      }
      if (flight != null) {
        messageQuery.values.flightId = flight.idAsInt;
      }
      if (jsonMessage.latitude != null) {
        messageQuery.values.latitude = jsonMessage.latitude;
      }
      if (jsonMessage.longitude != null) {
        messageQuery.values.longitude = jsonMessage.longitude;
      }
      if (jsonMessage.altitude != null) {
        messageQuery.values.altitude = jsonMessage.altitude;
      }
      message = await messageQuery.insert(executor);
      logger.debug('[${jsonMessage.sourceType}] Inserted message (id: ${message.id})');
      logger.fine('Message = ${message.toString()}');

      if (station != null) {
        var stationUpdateQuery = new StationQuery();
        stationUpdateQuery
          ..where.id.equals(station.idAsInt)
          ..values.ipAddress = ipAddress
          ..values.sourceApplication = this.source.application
          ..values.sourceType = this.source.type
          ..values.sourceProtocol = this.source.protocol
          ..values.lastReportAt = DateTime.now().toUtc();
        station = await stationUpdateQuery.updateOne(executor);
        if (station != null) {
          logger.debug('[${jsonMessage.sourceType}] Updated station last report at (id: ${station.id})');
        }
      }

      if (message != null) {
        var messageReportQuery = new MessageReportQuery();
        messageReportQuery.values
          ..stationId = station.idAsInt
          ..messageId = message.idAsInt
          ..firstToReport = true
          ..sourceName = this.source.name
          ..sourceApplication = this.source.application
          ..sourceType = this.source.type
          ..sourceFormat = this.source.format
          ..sourceProtocol = this.source.protocol
          ..sourceNetworkProtocol = this.source.networkProtocol
          ..sourceRemoteIp = ipAddress
          ..frequency = message.frequency
          ..channel = message.channel;
        try {
          var messageReport = await messageReportQuery.insert(executor);
          if (messageReport != null) {
            logger.debug('[${jsonMessage.sourceType}] Inserted message report (id: ${messageReport.id})');
          }
        }
        catch(e) {
          logger.error('[${jsonMessage.sourceType}] Unable to insert message report: ${e}');
        }

        natsClient.publish('{ "id": ${message.id} }', 'message.created', onSuccess: () => { logger.fine('[${jsonMessage.sourceType} / ${jsonMessage.source}] Published message to NATS') });
      }
    }

    return message;
  }
}

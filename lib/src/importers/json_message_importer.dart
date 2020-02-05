import 'package:acars_aggregation_server/aas.dart';
import 'package:angel_orm_postgres/angel_orm_postgres.dart';
import 'package:nats/nats.dart';
import 'package:quick_log/quick_log.dart';

class JsonMessageImporter {
  JsonMessage jsonMessage;
  NatsClient natsClient;
  PostgreSqlExecutorPool executor;
  Logger logger;

  JsonMessageImporter(JsonMessage jsonMessage, NatsClient natsClient, executor, Logger logger) {
    this.jsonMessage = jsonMessage;
    this.natsClient = natsClient;
    this.executor = executor;
    this.logger = logger;

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
    if (jsonMessage.tail != null) {
      var airframeQuery = new AirframeQuery();
      airframeQuery.where
        ..tail.equals(jsonMessage.tail);
      airframe = await airframeQuery.getOne(executor);
      if (airframe != null && airframe.id != null) {
        this.logger.debug('[${jsonMessage.sourceType} / ${jsonMessage.source}] Retrieved airframe (id: ${airframe.id})');
      } else {
        var airframeInsertQuery = new AirframeQuery();
        airframeInsertQuery.values
          ..tail = jsonMessage.tail;
        try {
          airframe = await airframeInsertQuery.insert(executor);
          this.logger.debug('[${jsonMessage.sourceType} / ${jsonMessage.source}] Inserted airframe (id: ${airframe.id})');
          natsClient.publish(airframe.toString(), 'airframe.created', onSuccess: () => {});
        }
        catch(e) {
          this.logger.error('[${jsonMessage.sourceType} / ${jsonMessage.source}] Unable to insert airframe: ${e}');
          airframe = await findOrCreateAirframe();
        }
      }
    } else {
      this.logger.debug('[${jsonMessage.sourceType} / ${jsonMessage.source}] No related airframe');
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
          this.logger.debug('[${jsonMessage.sourceType} / ${jsonMessage.source}] Retrieved flight (id: ${flight.id})');
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
          this.logger.debug('[${jsonMessage.sourceType} / ${jsonMessage.source}] Updated flight (id: ${flight.id})');
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
            this.logger.debug('[${jsonMessage.sourceType} / ${jsonMessage.source}] Inserted flight (id: ${flight.id})');
            natsClient.publish(flight.toString(), 'flight.created', onSuccess: () => {});
          }
          catch(e) {
            this.logger.error('[${jsonMessage.sourceType} / ${jsonMessage.source}] Unable to insert flight: ${e}');
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
          this.logger.debug("[${jsonMessage.sourceType} / ${jsonMessage.source}] Retrieved flight (id: ${flight.id})");
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
            this.logger.debug('[${jsonMessage.sourceType} / ${jsonMessage.source}] Updated flight (id: ${flight.id})');
            natsClient.publish(flight.toString(), 'flight.updated', onSuccess: () => {});
          }
        } else {
          this.logger.debug("[${jsonMessage.sourceType} / ${jsonMessage.source}] No recent active flight");
        }
      }
    } else {
      this.logger.debug('[${jsonMessage.sourceType} / ${jsonMessage.source}] No related flight');
    }

    return flight;
  }

  Future findOrCreateStation() async {
    var stationQuery = new StationQuery();
    stationQuery.where
      ..ident.equals(jsonMessage.stationIdent);
    var station = await stationQuery.getOne(executor);
    if (station != null && station.id != null) {
      this.logger.debug('[${jsonMessage.sourceType} / ${jsonMessage.source}] Retrieved station (id: ${station.id})');
    } else {
      var stationInsertQuery = new StationQuery();
      stationInsertQuery.values
        ..ident = jsonMessage.stationIdent
        ..ipAddress = 'soon'
        ..lastReportAt = DateTime.now().toUtc()
        ..messagesCount = 1;
      try {
        station = await stationInsertQuery.insert(executor);
        this.logger.debug('[${jsonMessage.sourceType} / ${jsonMessage.source}] Inserted station (id: ${station.id})');
        natsClient.publish(station.toString(), 'station.created', onSuccess: () => {});
      }
      catch(e) {
        this.logger.error('[${jsonMessage.sourceType} / ${jsonMessage.source}] Unable to insert station: ${e}');
        station = await findOrCreateStation();
      }
    }

    return station;
  }

  Future identifyTail() async {
    // FAA Aircraft Registration Touchup
    if (jsonMessage.fromHex != null && (jsonMessage.tail == null || jsonMessage.tail == '')) {
      this.logger.debug('[${jsonMessage.sourceType} / ${jsonMessage.source}] The tail is missing but we have ICAO. Checking FAA DB...');
      var faaQuery = new FaaAircraftRegistrationQuery();
      faaQuery.where
        ..modeSCodeHex.equals(jsonMessage.fromHex.toUpperCase());
      var faaRegistration = await faaQuery.getOne(executor);

      if (faaRegistration != null) {
        this.logger.debug('[${jsonMessage.sourceType} / ${jsonMessage.source}] Match found! Updating tail to be "N${faaRegistration.nNumber}".');
        jsonMessage.tail = 'N${faaRegistration.nNumber}';
      } else {
        this.logger.debug('[${jsonMessage.sourceType} / ${jsonMessage.source}] No match found. Leaving blank.');
      }
    }
  }

  Future insertOrSkipMessage(station, airframe, flight) async {
    var existingMessage;
    var message;
    if (jsonMessage.messageNumber != null) {
      var query = new MessageQuery();
      query.where
        ..tail.equals(jsonMessage.tail)
        ..messageNumber.equals(jsonMessage.messageNumber)
        ..createdAt.equals(DateTime.now().toUtc().subtract(new Duration(minutes: 5)));
      existingMessage = await query.getOne(executor);
    }

    if (existingMessage != null) {
      this.logger.debug('[${jsonMessage.sourceType} / ${jsonMessage.source}] Existing message! Not inserting.' + existingMessage.toString());
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
        ..tail = jsonMessage.tail
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
      logger.debug('[${jsonMessage.sourceType} / ${jsonMessage.source}] Inserted message (id: ${message.id})');
      logger.fine('Message = ${message.toString()}');

      if (station != null) {
        var stationUpdateQuery = new StationQuery();
        stationUpdateQuery
          ..where.id.equals(station.idAsInt)
          ..values.lastReportAt = DateTime.now().toUtc();
        station = await stationUpdateQuery.updateOne(executor);
        if (station != null) {
          logger.debug('[${jsonMessage.sourceType} / ${jsonMessage.source}] Updated station last report at (id: ${station.id})');
        }
      }

      if (message != null) {
        natsClient.publish('{ "id": ${message.id} }', 'message.created', onSuccess: () => { logger.fine('[${jsonMessage.sourceType} / ${jsonMessage.source}] Published message to NATS') });
      }
    }

    return message;
  }
}

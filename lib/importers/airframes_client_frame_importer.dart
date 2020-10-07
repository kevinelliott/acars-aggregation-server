import 'package:airframes_aggregation_server/common.dart';
import 'package:angel_orm_postgres/angel_orm_postgres.dart';
import 'package:nats/nats.dart';
import 'package:quick_log/quick_log.dart';

class AirframesClientFrameImporter {
  AirframesClientFrame frame;
  NatsClient natsClient;
  PostgreSqlExecutorPool executor;
  Logger logger;
  Source source;
  ClientMessage clientMessage;

  AirframesClientFrameImporter(Source source, AirframesClientFrame frame,
      NatsClient natsClient, executor, Logger logger) {
    this.frame = frame;
    this.natsClient = natsClient;
    this.executor = executor;
    this.logger = logger;
    this.source = source;

    // identifyTail();
    this.logger.debug('AirframesClientFrameImporter: ${frame.toProto3Json()})');

    switch (frame.source.app.type) {
      case AirframesClientFrame_Source_App_AppType.ACARSDEC:
        clientMessage = AcarsdecClientMessage.fromAirframesClientFrame(frame);
        break;
      case AirframesClientFrame_Source_App_AppType.ACARSDECO2:
        clientMessage = Acarsdeco2ClientMessage.fromAirframesClientFrame(frame);
        break;
      case AirframesClientFrame_Source_App_AppType.DUMPVDL2:
        clientMessage = Dumpvdl2ClientMessage.fromAirframesClientFrame(frame);
        break;
      case AirframesClientFrame_Source_App_AppType.JAERO:
        clientMessage = JaeroClientMessage.fromAirframesClientFrame(frame);
        break;
      case AirframesClientFrame_Source_App_AppType.PC_HFDL:
        clientMessage = PcHfdlClientMessage.fromAirframesClientFrame(frame);
        break;
      case AirframesClientFrame_Source_App_AppType.SORCERER:
        clientMessage = SorcererClientMessage.fromAirframesClientFrame(frame);
        break;
      case AirframesClientFrame_Source_App_AppType.VDLM2DEC:
        clientMessage = Vdlm2decClientMessage.fromAirframesClientFrame(frame);
        break;
      default:
        this.logger.info(
            'AirframesClientFrameImporter: Not importing message from unknown source app type: ${frame.source.app.type}');
    }
  }

  logPrefix() {
    return '[${clientMessage.source}/${clientMessage.sourceType}]';
  }

  Future<Station> updateStation(Station station) async {
    var stationUpdateQuery = new StationQuery();
    stationUpdateQuery
      ..where.id.equals(station.idAsInt)
      // ..values.ipAddress = ipAddress
      ..values.messagesCount = station.messagesCount + 1
      ..values.lastReportAt = DateTime.now().toUtc();
    station = await stationUpdateQuery.updateOne(executor);
    if (station != null) {
      logger.debug(
          '[${clientMessage.sourceType}] Updated station last report at (id: ${station.id})');
    }
  }

  Future<Station> findOrCreateStation() async {
    var stationQuery = new StationQuery();
    stationQuery.where..ident.equals(clientMessage.stationId);
    var station = await stationQuery.getOne(executor);

    if (station != null && station.id != null) {
      this.logger.debug(
          '[${clientMessage.sourceType}] Retrieved station (id: ${station.id}, ident: ${station.ident}, ident from msg: ${clientMessage.stationId})');
      return station;
    }

    this.logger.debug(
        '[${clientMessage.sourceType}] Unable to find a station for ident: ${clientMessage.stationId}');
    var stationInsertQuery = new StationQuery();
    stationInsertQuery.values
      ..ident = clientMessage.stationId
      ..lastReportAt = DateTime.now().toUtc()
      ..messagesCount = 0;
    try {
      station = await stationInsertQuery.insert(executor);
      this.logger.debug(
          '[${clientMessage.sourceType}] Inserted station (id: ${station.id})');
      natsClient.publish(station.toString(), 'station.created',
          onSuccess: () => {});
    } catch (e) {
      this.logger.error(
          '[${clientMessage.sourceType}] Unable to insert station: ${e}');
    }

    return station;
  }

  Future<Airframe> findOrCreateAirframe() async {
    var airframe;

    if (clientMessage.tail == null || clientMessage.tail == '') {
      this.logger.debug('${logPrefix()} No related airframe');
      return null;
    }

    var airframeQuery = new AirframeQuery();
    airframeQuery.where..tail.equals(clientMessage.sanitizedTail());
    airframe = await airframeQuery.getOne(executor);
    if (airframe != null && airframe.id != null) {
      this
          .logger
          .debug('${logPrefix()} Retrieved airframe (id: ${airframe.id})');
    } else {
      var airframeInsertQuery = new AirframeQuery();
      airframeInsertQuery.values..tail = clientMessage.sanitizedTail();
      try {
        airframe = await airframeInsertQuery.insert(executor);
        this
            .logger
            .debug('${logPrefix()} Inserted airframe (id: ${airframe.id})');
        natsClient.publish(airframe.toString(), 'airframe.created',
            onSuccess: () => {});
      } catch (e) {
        this.logger.error('${logPrefix()} Unable to insert airframe: ${e}');
        airframe = await findOrCreateAirframe();
      }
    }

    return airframe;
  }

  Future<Flight> findFlight(Airframe airframe, String flightId) async {
    var flightQuery = new FlightQuery();
    flightQuery.where
      ..airframeId.equals(airframe.idAsInt)
      ..flight.equals(flightId)
      ..createdAt.greaterThanOrEqualTo(
          DateTime.now().toUtc().subtract(new Duration(days: 1)));

    Flight flight = await flightQuery.getOne(executor);

    if (flight == null) {
      this.logger.debug(
          "[${clientMessage.sourceType}] Unable to find a flight (ID: ${flightId} for airframe with tail '${airframe.tail}'");
    } else {
      this.logger.debug(
          "[${clientMessage.sourceType}] Retrieved flight (id: ${flight.id})");
    }

    return flight;
  }

  Future<Flight> findActiveFlightForAirframe(Airframe airframe) async {
    var flightQuery = new FlightQuery();
    flightQuery.where
      ..airframeId.equals(airframe.idAsInt)
      ..status.equals('in-flight')
      ..updatedAt.greaterThanOrEqualTo(
          DateTime.now().toUtc().subtract(new Duration(minutes: 60)));

    Flight flight = await flightQuery.getOne(executor);

    if (flight == null) {
      this.logger.debug(
          "[${clientMessage.sourceType}] Unable to find an active flight for airframe with tail '${airframe.tail}'");
    } else {
      this.logger.debug(
          "[${clientMessage.sourceType}] Retrieved flight (id: ${flight.id})");
    }

    return flight;
  }

  Future<Flight> createFlight(Airframe airframe) async {
    Flight flight;
    var flightInsertQuery = new FlightQuery();
    flightInsertQuery.values
      ..airframeId = airframe.idAsInt
      ..flight = clientMessage.flightNumber
      ..departingAirport = clientMessage.departureAirport
      ..destinationAirport = clientMessage.destinationAirport
      ..messagesCount = 0
      ..status = 'in-flight';
    if (clientMessage.latitude != null) {
      flightInsertQuery.values.latitude = clientMessage.latitude;
    }
    if (clientMessage.longitude != null) {
      flightInsertQuery.values.longitude = clientMessage.longitude;
    }
    if (clientMessage.altitude != null) {
      flightInsertQuery.values.altitude = clientMessage.altitude;
    }
    try {
      flight = await flightInsertQuery.insert(executor);
      this.logger.debug(
          '[${clientMessage.sourceType}] Inserted flight (id: ${flight.id})');
      natsClient.publish(flight.toString(), 'flight.created',
          onSuccess: () => {});
    } catch (e) {
      this
          .logger
          .error('[${clientMessage.sourceType}] Unable to insert flight: ${e}');
    }
    return flight;
  }

  Future<Flight> updateFlight(Flight flight) async {
    var flightUpdateQuery = new FlightQuery()
      ..where.id.equals(flight.idAsInt)
      ..values.status = 'in-flight'
      ..values.updatedAt = DateTime.now().toUtc();
    if (clientMessage.latitude != null) {
      flightUpdateQuery.values.latitude = clientMessage.latitude;
    }
    if (clientMessage.longitude != null) {
      flightUpdateQuery.values.longitude = clientMessage.longitude;
    }
    if (clientMessage.altitude != null) {
      flightUpdateQuery.values.altitude = clientMessage.altitude;
    }
    Flight updatedFlight = await flightUpdateQuery.updateOne(executor);

    if (updatedFlight != null) {
      this.logger.debug(
          '[${clientMessage.sourceType}] Updated flight (id: ${updatedFlight.id})');
      natsClient.publish(updatedFlight.toString(), 'flight.updated',
          onSuccess: () => {});
    }

    return updatedFlight;
  }

  Future<Flight> updateOrCreateFlight(airframe) async {
    Flight flight;

    if (airframe == null || airframe.id == null) {
      this.logger.debug(
          '[${clientMessage.sourceType}] No airframe, so there cannot be a related flight');
      return null;
    }

    if (clientMessage.flightNumber != null &&
        clientMessage.flightNumber != '') {
      flight = await findFlight(airframe, clientMessage.flightNumber);

      if (flight != null && flight.id != null) {
        this.logger.debug(
            '[${clientMessage.sourceType}] Retrieved flight (id: ${flight.id})');
        flight = await updateFlight(flight);
      } else {
        flight = await createFlight(airframe);
      }
      return flight;
    }

    flight = await findActiveFlightForAirframe(airframe);

    if (flight == null) {
      this
          .logger
          .debug("[${clientMessage.sourceType}] No recent active flight");
      return null;
    }

    flight = await updateFlight(flight);

    return flight;
  }

  Future<MessageReport> createMessageReport(
      Station station, Message message, bool firstToReport) async {
    var messageReportQuery = new MessageReportQuery();
    messageReportQuery.values
      ..stationId = station.idAsInt
      ..messageId = message.idAsInt
      ..firstToReport = firstToReport
      ..sourceName = this.source.name
      ..sourceApplication = this.source.application
      ..sourceType = this.source.transmissionType
      ..sourceFormat = this.source.dataProtocolFormat
      ..sourceProtocol = this.source.dataProtocol
      ..sourceNetworkProtocol = this.source.networkProtocol
      // ..sourceRemoteIp = ipAddress
      ..frequency = message.frequency
      ..channel = message.channel;
    try {
      MessageReport messageReport = await messageReportQuery.insert(executor);
      if (messageReport != null) {
        logger.debug(
            '[${clientMessage.sourceType}] Inserted message report (id: ${messageReport.id})');
      }
    } catch (e) {
      logger.error(
          '[${clientMessage.sourceType}] Unable to insert message report: ${e}');
    }
  }

  Future insertOrSkipMessage(station, airframe, flight) async {
    Message existingMessage;
    Message message;

    if (clientMessage.sanitizedTail() != null &&
        clientMessage.messageNumber != null) {
      var query = new MessageQuery();
      query.where
        ..tail.equals(clientMessage.sanitizedTail())
        ..messageNumber.equals(clientMessage.messageNumber)
        ..createdAt
            .equals(DateTime.now().toUtc().subtract(new Duration(minutes: 5)));
      existingMessage = await query.getOne(executor);
    }

    if (existingMessage != null) {
      this.logger.debug(
          '[${clientMessage.sourceType}] Existing message! Not inserting. ' +
              existingMessage.toString());
      if (station != null) {
        createMessageReport(station, message, false);
      }
    } else {
      var messageQuery = new MessageQuery();
      messageQuery.values
        ..timestamp = clientMessage.timestamp
        ..sourceType = clientMessage.sourceType
        ..source = clientMessage.source
        ..linkDirection = clientMessage.linkDirection
        ..fromHex = clientMessage.fromIcao
        ..toHex = clientMessage.toIcao
        ..channel = clientMessage.channel
        ..frequency = clientMessage.frequency
        ..level = clientMessage.level
        ..error = clientMessage.error
        ..mode = clientMessage.mode
        ..label = clientMessage.label
        ..blockId = clientMessage.blockId
        ..ack = clientMessage.ack
        ..tail = clientMessage.sanitizedTail()
        ..flight = clientMessage.flightNumber
        ..messageNumber = clientMessage.messageNumber
        // ..data = clientMessage.data
        ..text = clientMessage.text
        ..departingAirport = clientMessage.departureAirport
        ..destinationAirport = clientMessage.destinationAirport
        ..blockEnd = clientMessage.end;

      if (station != null) {
        messageQuery.values.stationId = station.idAsInt;
      }
      if (airframe != null) {
        messageQuery.values.airframeId = airframe.idAsInt;
      }
      if (flight != null) {
        messageQuery.values.flightId = flight.idAsInt;
      }

      if (clientMessage.latitude != null) {
        messageQuery.values.latitude = clientMessage.latitude;
      }
      if (clientMessage.longitude != null) {
        messageQuery.values.longitude = clientMessage.longitude;
      }
      if (clientMessage.altitude != null) {
        messageQuery.values.altitude = clientMessage.altitude;
      }

      message = await messageQuery.insert(executor);
      logger.debug(
          '[${clientMessage.sourceType}] Inserted message (id: ${message.id})');
      logger.fine('Message = ${message.toString()}');

      if (station != null) {
        station = await updateStation(station);
      }

      if (message != null) {
        if (station != null) {
          createMessageReport(station, message, true);
        }

        // final json = jsonEncode(clientMessage);
        // logger.fine(json.toString());
        // natsClient.publish(json.toString(), 'message.raw',
        //     onSuccess: () => {
        //           logger.fine(
        //               '[${clientMessage.sourceType} / ${clientMessage.source}] Published message.raw to NATS')
        //         });
        natsClient.publish('{ "id": ${message.id} }', 'message.created',
            onSuccess: () => {
                  logger.fine(
                      '[${clientMessage.sourceType} / ${clientMessage.source}] Published message to NATS')
                });
      }
    }

    return message;
  }
}

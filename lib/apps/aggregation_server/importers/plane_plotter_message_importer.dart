import 'package:angel_orm_postgres/angel_orm_postgres.dart';
import 'package:quick_log/quick_log.dart';

import 'package:airframes_aggregation_server/common.dart';

class PlanePlotterMessageImporter {
  PlanePlotterMessage ppMessage;
  NatsManager natsManager;
  RedisManager redisManager;
  PostgreSqlExecutorPool executor;
  Logger logger;

  PlanePlotterMessageImporter(
      PlanePlotterMessage ppMessage,
      NatsManager natsManager,
      RedisManager redisManager,
      PostgreSqlExecutorPool executor,
      Logger logger) {
    this.ppMessage = ppMessage;
    this.executor = executor;
    this.logger = logger;
    this.natsManager = natsManager;
    this.redisManager = redisManager;
  }

  logPrefix() {
    return '[${ppMessage.source.name}/${ppMessage.source.transmissionType}]';
  }

  Future findOrCreateAirframe() async {
    var airframe;
    if (ppMessage.sanitizedTail != null) {
      var airframeQuery = new AirframeQuery();
      airframeQuery.where..tail.equals(ppMessage.sanitizedTail);
      airframe = await airframeQuery.getOne(executor);
      if (airframe != null && airframe.id != null) {
        this
            .logger
            .debug('${logPrefix()} Retrieved airframe (id: ${airframe.id})');
      } else {
        var airframeInsertQuery = new AirframeQuery();
        airframeInsertQuery.values..tail = ppMessage.sanitizedTail;
        try {
          airframe = await airframeInsertQuery.insert(executor);
          this
              .logger
              .debug('${logPrefix()} Inserted airframe (id: ${airframe.id})');
          natsManager.publish(airframe.toString(), 'airframe.created',
              onSuccess: () => {});
        } catch (e) {
          this.logger.error('${logPrefix()} Unable to insert airframe: ${e}');
          airframe = await findOrCreateAirframe();
        }
      }
    } else {
      this.logger.debug('${logPrefix()} No related airframe');
    }

    return airframe;
  }

  Future updateOrCreateFlight(airframe) async {
    Flight flight;
    if (airframe != null) {
      if (ppMessage.flightNumber != null && ppMessage.flightNumber != '') {
        var flightQuery = new FlightQuery();
        flightQuery.where
          ..airframeId.equals(airframe.idAsInt)
          ..flight.equals(ppMessage.flightNumber)
          ..createdAt.greaterThanOrEqualTo(
              DateTime.now().toUtc().subtract(new Duration(days: 1)));
        flight = await flightQuery.getOne(executor);

        if (flight != null && flight.id != null) {
          this
              .logger
              .debug('${logPrefix()} Retrieved flight (id: ${flight.id})');
          var flightUpdateQuery = new FlightQuery()
            ..where.id.equals(flight.idAsInt)
            ..values.status = 'in-flight'
            ..values.updatedAt = DateTime.now().toUtc();
          // if (ppMessage.latitude != null) {
          //   flightUpdateQuery.values.latitude = ppMessage.latitude;
          // }
          // if (ppMessage.longitude != null) {
          //   flightUpdateQuery.values.longitude = ppMessage.longitude;
          // }
          // if (ppMessage.altitude != null) {
          //   flightUpdateQuery.values.altitude = ppMessage.altitude;
          // }
          flight = await flightUpdateQuery.updateOne(executor);
          this.logger.debug('${logPrefix()} Updated flight (id: ${flight.id})');
        } else {
          var flightInsertQuery = new FlightQuery();
          flightInsertQuery.values
            ..airframeId = airframe.idAsInt
            ..flight = ppMessage.flightNumber
            ..messagesCount = 1
            ..status = 'in-flight';
          // if (ppMessage.latitude != null) {
          //   flightInsertQuery.values.latitude = ppMessage.latitude;
          // }
          // if (ppMessage.longitude != null) {
          //   flightInsertQuery.values.longitude = ppMessage.longitude;
          // }
          // if (ppMessage.altitude != null) {
          //   flightInsertQuery.values.altitude = ppMessage.altitude;
          // }
          try {
            flight = await flightInsertQuery.insert(executor);
            this
                .logger
                .debug('${logPrefix()} Inserted flight (id: ${flight.id})');
            natsManager.publish(flight.toString(), 'flight.created',
                onSuccess: () => {});
          } catch (e) {
            this.logger.error('${logPrefix()} Unable to insert flight: ${e}');
            flight = await updateOrCreateFlight(airframe);
          }
        }
      } else {
        // See if there's a recently active flight that matches the airframe
        var flightQuery = new FlightQuery();
        flightQuery.where
          ..airframeId.equals(airframe.idAsInt)
          ..status.equals('in-flight')
          ..updatedAt.greaterThanOrEqualTo(
              DateTime.now().toUtc().subtract(new Duration(minutes: 60)));
        flight = await flightQuery.getOne(executor);

        if (flight != null) {
          this
              .logger
              .debug("${logPrefix()} Retrieved flight (id: ${flight.id})");
          var flightUpdateQuery = new FlightQuery();
          flightUpdateQuery
            ..where.id.equals(flight.idAsInt)
            ..values.status = 'in-flight'
            ..values.updatedAt = DateTime.now().toUtc();
          // if (ppMessage.latitude != null) {
          //   flightUpdateQuery.values.latitude = ppMessage.latitude;
          // }
          // if (ppMessage.longitude != null) {
          //   flightUpdateQuery.values.longitude = ppMessage.longitude;
          // }
          // if (ppMessage.altitude != null) {
          //   flightUpdateQuery.values.altitude = ppMessage.altitude;
          // }
          flight = await flightUpdateQuery.updateOne(executor);
          if (flight != null) {
            this
                .logger
                .debug('${logPrefix()} Updated flight (id: ${flight.id})');
            natsManager.publish(flight.toString(), 'flight.updated',
                onSuccess: () => {});
          }
        } else {
          this.logger.debug('${logPrefix()} No recent active flight');
        }
      }
    } else {
      this.logger.debug('${logPrefix()} No related flight');
    }

    return flight;
  }

  Future findOrCreateStationByIpAddress(String ipAddress) async {
    var stationQuery = new StationQuery();
    stationQuery.where..ipAddress.equals(ipAddress);
    var station = await stationQuery.getOne(executor);

    if (station != null && station.id != null) {
      this.logger.debug('${logPrefix()} Retrieved station (id: ${station.id})');
    } else {
      var stationInsertQuery = new StationQuery();
      stationInsertQuery.values
        ..ident =
            'UNKNOWN-${ppMessage.source.name.toUpperCase()}-${ppMessage.source.transmissionType.toUpperCase()}'
        ..ipAddress = ipAddress
        ..lastReportAt = DateTime.now().toUtc()
        ..messagesCount = 1;
      try {
        station = await stationInsertQuery.insert(executor);
        this
            .logger
            .debug('${logPrefix()} Inserted station (id: ${station.id})');

        var stationMessageCountQuery = new StationMessageCountQuery();
        stationMessageCountQuery.values
          ..stationId = station.idAsInt
          ..messagesCount = 1;
        try {
          var stationMessageCount =
              await stationMessageCountQuery.insert(executor);
          this.logger.debug(
              '${logPrefix()} Inserted station message count (id: ${stationMessageCount.id}');
        } catch (e) {
          this.logger.error(
              '${logPrefix()} Unable to insert station message count: ${e}');
        }

        natsManager.publish(station.toString(), 'station.created',
            onSuccess: () => {});
      } catch (e) {
        this.logger.error('${logPrefix()} Unable to insert station: ${e}');
      }
    }

    return station;
  }

  Future insertOrSkipMessage(station, airframe, flight) async {
    var message;

    var messageQuery = new MessageQuery();
    messageQuery.values
      ..timestamp = DateTime.now()
      ..source = ppMessage.source.name
      ..sourceType = ppMessage.source.transmissionType
      ..flight = ppMessage.flightNumber
      ..tail = ppMessage.sanitizedTail
      ..text = ppMessage.text;
    if (station != null) {
      messageQuery.values.stationId = station.idAsInt;
    }
    if (airframe != null) {
      messageQuery.values.airframeId = airframe.idAsInt;
    }
    if (flight != null) {
      messageQuery.values.flightId = flight.idAsInt;
    }
    // if (ppMessage.latitude != null) {
    //   messageQuery.values.latitude = ppMessage.latitude;
    // }
    // if (ppMessage.longitude != null) {
    //   messageQuery.values.longitude = ppMessage.longitude;
    // }
    // if (ppMessage.altitude != null) {
    //   messageQuery.values.altitude = ppMessage.altitude;
    // }
    message = await messageQuery.insert(executor);
    logger.debug('${logPrefix()} Inserted message (id: ${message.id})');
    logger.fine('Message = ${message.toString()}');

    if (station != null) {
      var stationUpdateQuery = new StationQuery();
      stationUpdateQuery
        ..where.id.equals(station.idAsInt)
        ..values.sourceApplication = message.source
        ..values.sourceType = message.sourceType
        ..values.lastReportAt = DateTime.now().toUtc();
      station = await stationUpdateQuery.updateOne(executor);
      if (station != null) {
        logger.debug(
            '${logPrefix()} Updated station last report at (id: ${station.id})');
      }
    }

    if (message != null) {
      natsManager.publish('{ "id": ${message.id} }', 'message.created',
          onSuccess: () => {
                logger.fine(
                    '[${message.sourceType} / ${message.source}] Published message to NATS')
              });
      if (station != null) {
        redisManager
            .increment('aggregator.stations.${station.id}.messages.all-time');
      }
    }

    return message;
  }
}

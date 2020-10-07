import 'dart:convert';
import 'package:angel_orm_postgres/angel_orm_postgres.dart';
import 'package:nats/nats.dart';
import 'package:quick_log/quick_log.dart';

import 'package:airframes_aggregation_server/common.dart';

class SBSMessageImporter {
  SBSMessage sbsMessage;
  NatsClient natsClient;
  PostgreSqlExecutorPool executor;
  Logger logger;

  SBSMessageImporter(SBSMessage sbsMessage, NatsClient natsClient,
      PostgreSqlExecutorPool executor, Logger logger) {
    this.sbsMessage = sbsMessage;
    this.executor = executor;
    this.logger = logger;
    this.natsClient = natsClient;
  }

  logPrefix() {
    return '[${sbsMessage.source.name}/${sbsMessage.source.transmissionType}]';
  }

  Future findOrCreateAirframe() async {
    var airframe;
    if (sbsMessage.sanitizedTail != null) {
      var airframeQuery = new AirframeQuery();
      airframeQuery.where..tail.equals(sbsMessage.sanitizedTail);
      airframe = await airframeQuery.getOne(executor);
      if (airframe != null && airframe.id != null) {
        this
            .logger
            .debug('${logPrefix()} Retrieved airframe (id: ${airframe.id})');
      } else {
        var airframeInsertQuery = new AirframeQuery();
        airframeInsertQuery.values..tail = sbsMessage.sanitizedTail;
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
    } else {
      this.logger.debug('${logPrefix()} No related airframe');
    }

    return airframe;
  }

  Future updateOrCreateFlight(airframe) async {
    Flight flight;
    if (airframe != null) {
      if (sbsMessage.flightNumber != null && sbsMessage.flightNumber != '') {
        var flightQuery = new FlightQuery();
        flightQuery.where
          ..airframeId.equals(airframe.idAsInt)
          ..flight.equals(sbsMessage.flightNumber)
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
          if (sbsMessage.latitude != null) {
            flightUpdateQuery.values.latitude = sbsMessage.latitude;
          }
          if (sbsMessage.longitude != null) {
            flightUpdateQuery.values.longitude = sbsMessage.longitude;
          }
          if (sbsMessage.altitude != null) {
            flightUpdateQuery.values.altitude = sbsMessage.altitude;
          }
          if (sbsMessage.track != null) {
            flightUpdateQuery.values.track = sbsMessage.track;
          }
          flight = await flightUpdateQuery.updateOne(executor);
          this.logger.debug('${logPrefix()} Updated flight (id: ${flight.id})');
        } else {
          var flightInsertQuery = new FlightQuery();
          flightInsertQuery.values
            ..airframeId = airframe.idAsInt
            ..flight = sbsMessage.flightNumber
            ..messagesCount = 1
            ..status = 'in-flight';
          if (sbsMessage.latitude != null) {
            flightInsertQuery.values.latitude = sbsMessage.latitude;
          }
          if (sbsMessage.longitude != null) {
            flightInsertQuery.values.longitude = sbsMessage.longitude;
          }
          if (sbsMessage.altitude != null) {
            flightInsertQuery.values.altitude = sbsMessage.altitude;
          }
          if (sbsMessage.track != null) {
            flightInsertQuery.values.track = sbsMessage.track;
          }
          try {
            flight = await flightInsertQuery.insert(executor);
            this
                .logger
                .debug('${logPrefix()} Inserted flight (id: ${flight.id})');
            natsClient.publish(flight.toString(), 'flight.created',
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
          if (sbsMessage.latitude != null) {
            flightUpdateQuery.values.latitude = sbsMessage.latitude;
          }
          if (sbsMessage.longitude != null) {
            flightUpdateQuery.values.longitude = sbsMessage.longitude;
          }
          if (sbsMessage.altitude != null) {
            flightUpdateQuery.values.altitude = sbsMessage.altitude;
          }
          if (sbsMessage.track != null) {
            flightUpdateQuery.values.track = sbsMessage.track;
          }
          flight = await flightUpdateQuery.updateOne(executor);
          if (flight != null) {
            this
                .logger
                .debug('${logPrefix()} Updated flight (id: ${flight.id})');
            natsClient.publish(flight.toString(), 'flight.updated',
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
        ..ident = 'UNKNOWN-CBAND-ADSC'
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

        natsClient.publish(station.toString(), 'station.created',
            onSuccess: () => {});
      } catch (e) {
        this.logger.error('${logPrefix()} Unable to insert station: ${e}');
      }
    }

    return station;
  }

  Future identifyTail() async {
    // FAA Aircraft Registration Touchup
    if (sbsMessage.hexIdent != null &&
        (sbsMessage.tail == null || sbsMessage.tail == '')) {
      this.logger.debug(
          '${logPrefix()} The tail is missing but we have ICAO. Checking FAA DB...');
      var faaQuery = new FaaAircraftRegistrationQuery();
      faaQuery.where..modeSCodeHex.equals(sbsMessage.hexIdent.toUpperCase());
      var faaRegistration = await faaQuery.getOne(executor);

      if (faaRegistration != null) {
        this.logger.debug(
            '${logPrefix()} Match found! Updating tail to be "N${faaRegistration.nNumber}".');
        sbsMessage.tail = 'N${faaRegistration.nNumber}';
        sbsMessage.sanitizedTail = 'N${faaRegistration.nNumber}';
      } else {
        this.logger.debug('${logPrefix()} No match found. Leaving blank.');
      }
    }
  }

  Future insertOrSkipMessage(station, airframe, flight) async {
    var message;

    var messageQuery = new MessageQuery();
    messageQuery.values
      ..timestamp = DateTime.parse(
          '${sbsMessage.dateGenerated} ${sbsMessage.timeGenerated}')
      ..source = sbsMessage.source.name
      ..sourceType = sbsMessage.source.transmissionType
      ..flight = sbsMessage.flightNumber
      ..tail = sbsMessage.sanitizedTail
      ..text = sbsMessage.squawk;
    if (station != null) {
      messageQuery.values.stationId = station.idAsInt;
    }
    if (airframe != null) {
      messageQuery.values.airframeId = airframe.idAsInt;
    }
    if (flight != null) {
      messageQuery.values.flightId = flight.idAsInt;
    }
    if (sbsMessage.latitude != null) {
      messageQuery.values.latitude = sbsMessage.latitude;
    }
    if (sbsMessage.longitude != null) {
      messageQuery.values.longitude = sbsMessage.longitude;
    }
    if (sbsMessage.altitude != null) {
      messageQuery.values.altitude = sbsMessage.altitude;
    }
    message = await messageQuery.insert(executor);
    logger.debug('${logPrefix()} Inserted message (id: ${message.id})');
    logger.fine('Message = ${message.toString()}');

    if (station != null) {
      var stationUpdateQuery = new StationQuery();
      stationUpdateQuery
        ..where.id.equals(station.idAsInt)
        ..values.lastReportAt = DateTime.now().toUtc();
      station = await stationUpdateQuery.updateOne(executor);
      if (station != null) {
        logger.debug(
            '${logPrefix()} Updated station last report at (id: ${station.id})');
      }
    }

    if (message != null) {
      final json = jsonEncode(message);
      logger.fine(json.toString());
      natsClient.publish(json.toString(), 'message.raw',
          onSuccess: () => {
                logger.fine(
                    '[${message.sourceType} / ${message.source}] Published message.raw to NATS')
              });
      natsClient.publish('{ "id": ${message.id} }', 'message.created',
          onSuccess: () => {
                logger.fine(
                    '[${message.sourceType} / ${message.source}] Published message to NATS')
              });
    }

    return message;
  }
}

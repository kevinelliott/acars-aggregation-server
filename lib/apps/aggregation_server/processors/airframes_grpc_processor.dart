import 'package:angel_orm_postgres/angel_orm_postgres.dart';
import 'package:grpc/grpc.dart' as grpc;
import 'package:nats/nats.dart';
import 'package:quick_log/quick_log.dart';

import 'package:airframes_aggregation_server/common.dart';
import 'package:airframes_aggregation_server/apps/aggregation_server/support.dart';

class AirframesGrpcProcessor {
  Source source;
  Logger logger;
  PostgreSqlExecutorPool databaseExecutor;
  NatsManager natsManager;

  AirframesGrpcProcessor(
      this.source, this.databaseExecutor, this.natsManager, Logger logger) {}

  String truncateWithEllipsis(int cutoff, String myString) {
    return (myString.length <= cutoff)
        ? myString
        : '${myString.substring(0, cutoff)}...';
  }

  void minimalLogLine(AirframesClientFrame frame, Station station,
      Airframe airframe, Flight flight, Message message) {
    String output = '';

    output += 'S:${source.transmissionType.toUpperCase()} ';

    var frameMessage;
    switch (frame.source.app.type) {
      case AirframesClientFrame_Source_App_AppType.ACARSDEC:
        frameMessage = frame.acarsdecMessage;
        break;
      case AirframesClientFrame_Source_App_AppType.VDLM2DEC:
        frameMessage = frame.vdlm2decMessage;
        break;
      default:
    }
    if (frameMessage.frequency != 0.0) {
      output += 'FQ:${frameMessage.frequency} ';
    }

    output += 'E:${frameMessage.error} ';

    output += 'L:${frameMessage.level} ';

    if (station != null) {
      output += 'ST:${station.ident} ';
    }
    if (airframe != null) {
      output += 'A:${airframe.tail} ';
    }

    if (flight != null) {
      output += 'F:${flight.flight} ';
    }

    if (message != null) {
      output += 'ML:${message.label} ';
      output += 'MT:${truncateWithEllipsis(20, message.text)}';
    }

    this.logger.info(output);
  }

  Future<Message> process(
      grpc.ServiceCall call, AirframesClientFrame frame) async {
    var importer = new AirframesClientFrameImporter(
        source, frame, natsManager, databaseExecutor, logger);
    Station station = await importer.findOrCreateStation();
    Airframe airframe = await importer.findOrCreateAirframe();
    Flight flight = await importer.updateOrCreateFlight(airframe);
    Message message =
        await importer.insertOrSkipMessage(station, airframe, flight);
    minimalLogLine(frame, station, airframe, flight, message);
    return message;
  }
}

import 'package:nats/nats.dart';
import 'package:angel_orm_postgres/angel_orm_postgres.dart';
import 'package:quick_log/quick_log.dart';

import 'package:airframes_aggregation_server/common.dart';
import 'package:airframes_aggregation_server/apps/aggregation_server/support.dart';

class PlanePlotterProcessor extends Processor {
  PostgreSqlExecutorPool databaseExecutor;
  NatsClient natsClient;

  PlanePlotterProcessor(
      Source source, this.databaseExecutor, this.natsClient, Logger logger)
      : super(source, logger) {}

  logPrefix() {
    return '[${source.name}/${source.transmissionType}]';
  }

  Future parse(String str) async {
    PlanePlotterMessageParser parser =
        new PlanePlotterMessageParser(source, logger);
    PlanePlotterMessage ppMessage = await parser.parse(str);
    if (ppMessage != null) {
      ppMessage.sanitizedTail = new Tail(ppMessage.tail).sanitize();
    } else {
      logger.error(
          '${logPrefix()} Error parsing a useful PlanePlotter Message. Incoming was: ${str}');
    }
    return ppMessage;
  }

  Future process(String str, String ipAddress) async {
    PlanePlotterMessage ppMessage = await parse(str);
    var ppMessageImporter = new PlanePlotterMessageImporter(
        ppMessage, natsClient, databaseExecutor, logger);

    var station =
        await ppMessageImporter.findOrCreateStationByIpAddress(ipAddress);
    var airframe = await ppMessageImporter.findOrCreateAirframe();
    var flight = await ppMessageImporter.updateOrCreateFlight(airframe);
    var message =
        await ppMessageImporter.insertOrSkipMessage(station, airframe, flight);
  }
}

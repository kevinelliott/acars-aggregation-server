import 'package:nats/nats.dart';
import 'package:angel_orm_postgres/angel_orm_postgres.dart';
import 'package:quick_log/quick_log.dart';

import 'package:acars_aggregation_server/aas.dart';

class PlanePlotterProcessor extends Processor {
  PostgreSqlExecutorPool databaseExecutor;
  NatsClient natsClient;

  PlanePlotterProcessor(Source source, this.databaseExecutor, this.natsClient, Logger logger) : super(source, logger) {
  }

  logPrefix() {
    return '[${source.name}/${source.type}]';
  }

  Future parse(String str) async {
    PlanePlotterMessageParser parser = new PlanePlotterMessageParser(source, logger);
    PlanePlotterMessage ppMessage = await parser.parse(str);
    if (ppMessage != null) {
      ppMessage.sanitizedTail = new Tail(ppMessage.tail).sanitize();
    } else {
      logger.error('${logPrefix()} Error parsing a useful PlanePlotter Message. Incoming was: ${str}');
    }
    return ppMessage;
  }

  Future process(String str, String ipAddress) async {
    PlanePlotterMessage ppMessage = await parse(str);
    var ppMessageImporter = new PlanePlotterMessageImporter(ppMessage, natsClient, databaseExecutor, logger);

    var station = await ppMessageImporter.findOrCreateStationByIpAddress(ipAddress);
    var airframe = await ppMessageImporter.findOrCreateAirframe();
    var flight = await ppMessageImporter.updateOrCreateFlight(airframe);
    var message = await ppMessageImporter.insertOrSkipMessage(station, airframe, flight);
  }
}

import 'package:nats/nats.dart';
import 'package:angel_orm_postgres/angel_orm_postgres.dart';
import 'package:quick_log/quick_log.dart';

import 'package:acars_aggregation_server/aas.dart';

class JaeroADSCProcessor extends Processor {
  PostgreSqlExecutorPool databaseExecutor;
  NatsClient natsClient;

  JaeroADSCProcessor(Source source, this.databaseExecutor, this.natsClient, Logger logger) : super(source, logger) {
  }

  logPrefix() {
    return '[${source.name}/${source.type}]';
  }

  Future parse(String str) async {
    SBSParser parser = new SBSParser(source, logger);
    SBSMessage sbsMessage = await parser.parse(str);
    if (sbsMessage == null) {
      logger.error('${logPrefix()} Error parsing a useful SBS Message. Incoming was: ${str}');
    }
    return sbsMessage;
  }

  Future process(String str) async {
    SBSMessage sbsMessage = await parse(str);
    var sbsMessageImporter = new SBSMessageImporter(sbsMessage, natsClient, databaseExecutor, logger);
    await sbsMessageImporter.identifyTail();

    var station = await sbsMessageImporter.findOrCreateStationById(source.remoteIp);
    var airframe = await sbsMessageImporter.findOrCreateAirframe();
    var flight = await sbsMessageImporter.updateOrCreateFlight(airframe);
    var message = await sbsMessageImporter.insertOrSkipMessage(station, airframe, flight);
  }
}

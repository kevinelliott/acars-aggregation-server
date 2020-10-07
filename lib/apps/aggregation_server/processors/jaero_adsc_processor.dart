import 'package:nats/nats.dart';
import 'package:angel_orm_postgres/angel_orm_postgres.dart';
import 'package:quick_log/quick_log.dart';

import 'package:airframes_aggregation_server/common.dart';
import 'package:airframes_aggregation_server/apps/aggregation_server/support.dart';

class JaeroADSCProcessor extends Processor {
  PostgreSqlExecutorPool databaseExecutor;
  NatsClient natsClient;

  JaeroADSCProcessor(
      Source source, this.databaseExecutor, this.natsClient, Logger logger)
      : super(source, logger) {}

  logPrefix() {
    return '[${source.name}/${source.transmissionType}]';
  }

  Future parse(String str) async {
    SBSParser parser = new SBSParser(source, logger);
    SBSMessage sbsMessage = await parser.parse(str);
    if (sbsMessage != null) {
      if (sbsMessage.hexIdent != null) {
        if (sbsMessage.tail != null) {
          sbsMessage.sanitizedTail = new Tail(sbsMessage.tail).sanitize();
        }
      } else {
        logger.error(
            '${logPrefix()} Error parsing a useful SBS Message. Incoming was: ${str}');
      }
    }
    return sbsMessage;
  }

  Future process(String str, String ipAddress) async {
    SBSMessage sbsMessage = await parse(str);

    if (sbsMessage != null) {
      var sbsMessageImporter = new SBSMessageImporter(
          sbsMessage, natsClient, databaseExecutor, logger);
      await sbsMessageImporter.identifyTail();

      var station =
          await sbsMessageImporter.findOrCreateStationByIpAddress(ipAddress);
      var airframe = await sbsMessageImporter.findOrCreateAirframe();
      var flight = await sbsMessageImporter.updateOrCreateFlight(airframe);
      var message = await sbsMessageImporter.insertOrSkipMessage(
          station, airframe, flight);
    } else {
      logger.error(
          'SBS message was not successfully parsed, will not try to import.');
    }
  }
}

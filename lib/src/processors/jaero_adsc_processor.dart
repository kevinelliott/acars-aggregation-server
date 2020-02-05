import 'package:nats/nats.dart';
import 'package:angel_orm_postgres/angel_orm_postgres.dart';
import 'package:quick_log/quick_log.dart';

import 'package:acars_aggregation_server/aas.dart';

class JaeroADSCProcessor extends Processor {
  PostgreSqlExecutorPool databaseExecutor;
  NatsClient natsClient;

  JaeroADSCProcessor(Source source, this.databaseExecutor, this.natsClient, Logger logger) : super(source, logger) {
  }

  Future parse(String str) async {
    SBSParser parser = new SBSParser(source, logger);
    SBSMessage sbsMessage = await parser.parse(str);
    return sbsMessage;
  }

  Future process(String str) async {
    SBSMessage sbsMessage = await parse(str);
    var sbsMessageImporter = new SBSMessageImporter(sbsMessage, natsClient, databaseExecutor, logger);
    await sbsMessageImporter.identifyTail();

    // var station;
    // jsonMessageImporter.findOrCreateStation()
    //   .then((value) => station = value)
    //   .catchError((e) {
    //     logger.error('[${jsonMessage.source}] Error occurred while inserting station: ${e}');
    //   });
    var airframe = await sbsMessageImporter.findOrCreateAirframe();
    var flight = await sbsMessageImporter.updateOrCreateFlight(airframe);
    var message = await sbsMessageImporter.insertOrSkipMessage(null, airframe, flight);
  }
}

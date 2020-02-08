import 'package:angel_orm_postgres/angel_orm_postgres.dart';
import 'package:nats/nats.dart';
import 'package:quick_log/quick_log.dart';

import 'package:acars_aggregation_server/aas.dart';

class AcarsdecProcessor extends Processor {
  PostgreSqlExecutorPool databaseExecutor;
  NatsClient natsClient;

  AcarsdecProcessor(Source source, this.databaseExecutor, this.natsClient, Logger logger) : super(source, logger) {
  }

  Future parseJson(String str) async {
    JsonMessageParser jsonParser = new JsonMessageParser(logger);
    JsonMessage jsonMessage = await jsonParser.parse(str);
    return jsonMessage;
  }

  Future process(String str) async {
    var jsonMessage = await parseJson(str);
    var jsonMessageImporter = new JsonMessageImporter(source, jsonMessage, natsClient, databaseExecutor, logger);

    var station = await jsonMessageImporter.findOrCreateStation();
    var airframe = await jsonMessageImporter.findOrCreateAirframe();
    var flight = await jsonMessageImporter.updateOrCreateFlight(airframe);
    var message = await jsonMessageImporter.insertOrSkipMessage(station, airframe, flight);
  }
}

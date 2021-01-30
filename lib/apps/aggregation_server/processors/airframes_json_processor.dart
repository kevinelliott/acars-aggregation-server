import 'package:angel_orm_postgres/angel_orm_postgres.dart';
import 'package:nats/nats.dart';
import 'package:quick_log/quick_log.dart';

import 'package:airframes_aggregation_server/common.dart';
import 'package:airframes_aggregation_server/apps/aggregation_server/support.dart';

class AirframesJsonProcessor extends Processor {
  PostgreSqlExecutorPool databaseExecutor;
  NatsManager natsManager;

  AirframesJsonProcessor(
      Source source, this.databaseExecutor, this.natsManager, Logger logger)
      : super(source, logger) {}

  Future parseJson(String str) async {
    try {
      AirframesJsonParser jsonParser = new AirframesJsonParser(logger);
      dynamic json = await jsonParser.parse(str);
    } catch (err) {
      logger.error(err.toString());
      return null;
    }
  }

  Future process(String str, String ipAddress) async {
    var jsonMessage = await parseJson(str);
    if (jsonMessage != null) {
      var jsonMessageImporter = new TLeconteJsonMessageImporter(
          source, jsonMessage, natsManager, databaseExecutor, logger);

      var station = await jsonMessageImporter.findOrCreateStation(ipAddress);
      var airframe = await jsonMessageImporter.findOrCreateAirframe();
      var flight = await jsonMessageImporter.updateOrCreateFlight(airframe);
      var message = await jsonMessageImporter.insertOrSkipMessage(
          station, airframe, flight, ipAddress);
    } else {
      logger.error(
          "There was an error trying to parse invalid JSON input. Skipping...");
    }
  }
}

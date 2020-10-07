import 'package:nats/nats.dart';
import 'package:angel_orm_postgres/angel_orm_postgres.dart';
import 'package:quick_log/quick_log.dart';

import 'package:airframes_aggregation_server/common.dart';

class JaeroACARSProcessor extends Processor {
  PostgreSqlExecutorPool databaseExecutor;
  NatsClient natsClient;

  JaeroACARSProcessor(
      Source source, this.databaseExecutor, this.natsClient, Logger logger)
      : super(source, logger) {}

  Future parse(String str) async {
    JaeroACARSParser parser = new JaeroACARSParser(logger);
    var parsed = await parser.parse(str);
    return parsed;
  }

  Future process(String str, String ipAddress) async {
    var parsed = await parse(str);
  }
}

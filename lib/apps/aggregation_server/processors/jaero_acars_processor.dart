import 'package:nats/nats.dart';
import 'package:angel_orm_postgres/angel_orm_postgres.dart';
import 'package:quick_log/quick_log.dart';

import 'package:airframes_aggregation_server/common.dart';
import 'package:airframes_aggregation_server/apps/aggregation_server/support.dart';

class JaeroACARSProcessor extends Processor {
  PostgreSqlExecutorPool databaseExecutor;
  NatsManager natsManager;
  RedisManager redisManager;

  JaeroACARSProcessor(Source source, this.databaseExecutor, this.natsManager,
      this.redisManager, Logger logger)
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

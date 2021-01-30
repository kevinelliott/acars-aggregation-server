import 'package:quick_log/quick_log.dart';

import 'package:airframes_aggregation_server/common.dart';
import 'package:airframes_aggregation_server/apps/aggregation_server/support.dart';

class JaeroACARSIngestServer extends UDPIngestServer {
  JaeroACARSIngestServer(name, config, databaseConfig, natsConfig)
      : super(name, config, databaseConfig, natsConfig) {
    this.logger = Logger('Ingest(${name})');
    this.source = Source(
        name, 'JAERO', 'unknown', 'udp', 'ACARS', 'human-readable', 'text');
    this.processor = JaeroACARSProcessor(
        source, databaseConfig.executor(), natsManager, logger);
  }
}

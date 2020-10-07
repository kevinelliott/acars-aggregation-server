import 'package:quick_log/quick_log.dart';

import 'package:airframes_aggregation_server/common.dart';

class JaeroACARSIngestServer extends UDPIngestServer {
  JaeroACARSIngestServer(name, config, databaseConfig)
      : super(name, config, databaseConfig) {
    this.logger = Logger('Ingest(${name})');
    this.source = Source(
        name, 'JAERO', 'unknown', 'udp', 'ACARS', 'human-readable', 'text');
    this.processor = JaeroACARSProcessor(
        source, databaseConfig.executor(), natsClient, logger);
  }
}

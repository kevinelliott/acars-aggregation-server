import 'package:quick_log/quick_log.dart';

import 'package:acars_aggregation_server/aas.dart';

class JaeroACARSIngestServer extends UDPIngestServer {
  JaeroACARSIngestServer(name, config, databaseConfig)
      : super(name, config, databaseConfig) {
    this.logger = Logger('Ingest(${name})');
    this.source = Source(name, 'JAERO', 'ACARS', 'Custom', 'text', 'UDP');
    this.processor = JaeroACARSProcessor(
        source, databaseConfig.executor(), natsClient, logger);
  }
}

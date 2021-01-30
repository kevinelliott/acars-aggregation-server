import 'dart:async';

import 'package:quick_log/quick_log.dart';

import 'package:airframes_aggregation_server/common.dart';
import 'package:airframes_aggregation_server/apps/aggregation_server/support.dart';

class IngestServer {
  IngestConfig config;
  DatabaseConfig databaseConfig;
  var natsConfig;

  Logger logger;
  NatsManager natsManager;
  final String name;
  Processor processor;
  Source source;

  var receiver;
  int packetCount = 0;

  IngestServer(this.name, this.config, this.databaseConfig, this.natsConfig) {
    Logger.writer =
        ConsolePrinter(minLevel: LogLevel.fine, enableInReleaseMode: true);
    this.logger = Logger('Ingest(${name})');
    this.natsManager = NatsManager(natsConfig, logger);
    this.source = Source('unknown', 'unknown', 'unknown', 'unknown', 'unknown',
        'unknown', 'unknown');
    this.processor = Processor(source, logger);
  }

  Future start() async {
    logger.error(
        'Unable to setup ${name} ingest. Need to extend UDPIngestServer or TCPIngestServer.');
  }
}

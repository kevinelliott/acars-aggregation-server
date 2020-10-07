import 'dart:async';

import 'package:nats/nats.dart';
import 'package:quick_log/quick_log.dart';

import 'package:airframes_aggregation_server/common.dart';

class IngestServer {
  IngestServerConfig config;
  DatabaseConfig databaseConfig;
  Logger logger;
  final String name;
  NatsClient natsClient;
  Processor processor;
  Source source;

  var receiver;
  int packetCount = 0;

  IngestServer(this.name, this.config, this.databaseConfig) {
    Logger.writer =
        ConsolePrinter(minLevel: LogLevel.fine, enableInReleaseMode: true);
    this.logger = Logger('Ingest(${name})');
    this.natsClient = NatsClient(config.natsHost, config.natsPort);
    this.source = Source('unknown', 'unknown', 'unknown', 'unknown', 'unknown',
        'unknown', 'unknown');
    this.processor = Processor(source, logger);
  }

  Future start() async {
    logger.error(
        'Unable to setup ${name} ingest. Need to extend UDPIngestServer or TCPIngestServer.');
  }
}

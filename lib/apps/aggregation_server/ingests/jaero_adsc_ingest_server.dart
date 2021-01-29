import 'dart:io';

import 'package:nats/nats.dart';
import 'package:quick_log/quick_log.dart';

import 'package:airframes_aggregation_server/common.dart';
import 'package:airframes_aggregation_server/apps/aggregation_server/support.dart';

class JaeroADSCIngestServer extends TCPIngestServer {
  JaeroADSCIngestServer(String name, config, databaseConfig, natsConfig)
      : super(name, config, databaseConfig, natsConfig) {
    this.logger = Logger('Ingest(${name})');
    this.source = Source(name.substring(0, 10), 'JAERO', 'unknown', 'tcp',
        'ADS-C', 'sbs', 'text');
    this.natsClient = NatsClient(natsConfig['host'], natsConfig['port']);

    this.processor = JaeroADSCProcessor(
        source, databaseConfig.executor(), natsClient, logger);
  }

  Future start() async {
    await this.natsClient.connect();
    this.logger.info(
        'Connected to NATS server at ${config.natsHost} on port ${config.natsPort}.');

    this.receiver = ServerSocket.bind(InternetAddress.anyIPv4, config.port);
    receiver.then((ServerSocket server) {
      server.listen((Socket socket) {
        this.logger.debug(
            'New TCP connection from ${socket.remoteAddress.address}:${socket.remotePort}');
        socket.listen((List<int> data) {
          String result = new String.fromCharCodes(data);
          this.logger.debug(
              'Received TCP packet from ${socket.remoteAddress.address}:${socket.remotePort}: ${result}');
          processor.logger = logger;
          List<String> lines = result.trimRight().split('\n');
          lines.forEach((line) {
            print("line: " + line);
            if (line != null && line != '') {
              processor.process(line, socket.remoteAddress.address);
            }
          });
        });
      });
    });
  }
}

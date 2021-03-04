import 'dart:async';
import 'dart:io';

import 'package:quick_log/quick_log.dart';

import 'package:airframes_aggregation_server/common.dart';
import 'package:airframes_aggregation_server/apps/aggregation_server/support.dart';

class TCPIngestServer extends IngestServer {
  TCPIngestServer(name, config, databaseConfig, natsConfig, redisConfig)
      : super(name, config, databaseConfig, natsConfig, redisConfig) {
    this.logger = Logger('Ingest(${name})');
    this.source = Source(
        name, 'unknown', 'unknown', 'unknown', 'tcp', 'unknown', 'unknown');
    this.processor = Processor(source, logger);
    this.natsManager = NatsManager(natsConfig, logger);
    this.redisManager = RedisManager(redisConfig, logger);
  }

  Future start() async {
    await natsManager.start();
    await redisManager.start();

    redisManager.set('aggregator.ingests.tcp.connections.session', '0');
    redisManager.set('aggregator.ingests.tcp.packets.session', '0');

    this.receiver = ServerSocket.bind(InternetAddress.anyIPv4, config.port);
    receiver.then((ServerSocket server) {
      server.listen((Socket socket) {
        this.logger.debug(
            'New TCP connection from ${socket.remoteAddress.address}:${socket.remotePort}');
        redisManager.increment('aggregator.ingests.tcp.connections.session');
        redisManager.increment('aggregator.ingests.tcp.connections.all-time');
        socket.listen((List<int> data) {
          String result = new String.fromCharCodes(data);
          redisManager.increment('aggregator.ingests.tcp.packets.session');
          redisManager.increment('aggregator.ingests.tcp.packets.all-time');
          this.logger.debug(
              'Received TCP packet from ${socket.remoteAddress.address}:${socket.remotePort}: ${result}');
          processor.logger = logger;
          List<String> lines = result.split('\n');
          lines.forEach((line) {
            processor.process(line, socket.remoteAddress.address);
          });
        });
      });
    });
  }
}

import 'dart:io';

import 'package:quick_log/quick_log.dart';

import 'package:airframes_aggregation_server/common.dart';
import 'package:airframes_aggregation_server/apps/aggregation_server/support.dart';

class JaeroADSCIngestServer extends TCPIngestServer {
  JaeroADSCIngestServer(
      String name, config, databaseConfig, natsConfig, redisConfig)
      : super(name, config, databaseConfig, natsConfig, redisConfig) {
    logger = Logger('Ingest(${name})');
    source = Source(name.substring(0, 10), 'JAERO', 'unknown', 'tcp', 'ADS-C',
        'sbs', 'text');

    natsManager = NatsManager(natsConfig, logger);
    redisManager = RedisManager(redisConfig, logger);

    this.processor = JaeroADSCProcessor(
        source, databaseConfig.executor(), natsManager, redisManager, logger);
  }

  Future start() async {
    await natsManager.start();
    await redisManager.start();

    redisManager.set('aggregator.ingests.jaero-adsc.connections.session', '0');
    redisManager.set('aggregator.ingests.jaero-adsc.packets.session', '0');

    receiver = ServerSocket.bind(InternetAddress.anyIPv4, config.port);
    receiver.then((ServerSocket server) {
      server.listen((Socket socket) {
        redisManager
            .increment('aggregator.ingests.jaero-adsc.connections.session');
        redisManager
            .increment('aggregator.ingests.jaero-adsc.connections.all-time');
        logger.debug(
            'New TCP connection from ${socket.remoteAddress.address}:${socket.remotePort}');
        socket.listen((List<int> data) {
          String result = new String.fromCharCodes(data);
          redisManager
              .increment('aggregator.ingests.jaero-adsc.packets.session');
          redisManager
              .increment('aggregator.ingests.jaero-adsc.packets.all-time');
          logger.debug(
              'Received TCP packet from ${socket.remoteAddress.address}:${socket.remotePort}: ${result}');
          processor.logger = logger;
          List<String> lines = result.trimRight().split('\n');
          lines.forEach((line) {
            if (line != null && line != '') {
              processor.process(line, socket.remoteAddress.address);
            }
          });
        });
      });
    });
  }
}

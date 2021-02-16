import 'dart:async';
import 'dart:io';

import 'package:nats/nats.dart';
import 'package:quick_log/quick_log.dart';
import 'package:udp/udp.dart';

import 'package:airframes_aggregation_server/common.dart';
import 'package:airframes_aggregation_server/apps/aggregation_server/support.dart';

class UDPIngestServer extends IngestServer {
  UDPIngestServer(name, config, databaseConfig, natsConfig, redisConfig)
      : super(name, config, databaseConfig, natsConfig, redisConfig) {
    this.logger = Logger('Ingest(${name})');
    this.source = Source(
        name, 'unknown', 'unknown', 'udp', 'unknown', 'unknown', 'unknown');
    this.processor = Processor(source, logger);
    this.natsManager = NatsManager(natsConfig, logger);
  }

  Future start() async {
    await natsManager.start();
    await redisManager.start();

    this.receiver = await UDP.bind(
        Endpoint.unicast(InternetAddress.anyIPv4, port: Port(config.port)));

    this.logger.info(
        'Listening on ${config.transport} port ${config.port} for incoming messages from ${config.clientApplication} clients...');
    receiver.listen((datagram) {
      this.logger = Logger('Ingest(${name}) #${++packetCount}');
      var str = String.fromCharCodes(datagram.data).trim();
      this.logger.debug(
          'Received UDP from ${datagram.address.address}:${datagram.port}: ${str}');
      processor.logger = logger;
      processor.process(str, datagram.address.address);
    }, timeout: new Duration(days: 365));
  }
}

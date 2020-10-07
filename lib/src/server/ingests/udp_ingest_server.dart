import 'dart:async';
import 'dart:io';

import 'package:nats/nats.dart';
import 'package:quick_log/quick_log.dart';
import 'package:udp/udp.dart';

import 'package:airframes_aggregation_server/common.dart';

class UDPIngestServer extends IngestServer {
  UDPIngestServer(name, config, databaseConfig)
      : super(name, config, databaseConfig) {
    this.logger = Logger('Ingest(${name})');
    this.source = Source(
        name, 'unknown', 'unknown', 'udp', 'unknown', 'unknown', 'unknown');
    this.processor = Processor(source, logger);
    this.natsClient = NatsClient(config.natsHost, config.natsPort);
  }

  Future start() async {
    await this.natsClient.connect();
    this.logger.info(
        'Connected to NATS server at ${config.natsHost} on port ${config.natsPort}.');

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

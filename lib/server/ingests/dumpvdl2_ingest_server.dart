import 'dart:io';
import 'package:quick_log/quick_log.dart';
import 'package:udp/udp.dart';

import 'package:airframes_aggregation_server/common.dart';

class Dumpvdl2IngestServer extends UDPIngestServer {
  Dumpvdl2IngestServer(name, config, databaseConfig)
      : super(name, config, databaseConfig) {
    this.source = Source('dumpvdl2', 'dumpvdl2', 'unknown', 'udp', 'vdl',
        'PlanePlotter', 'text');
    this.processor = PlanePlotterProcessor(
        source, databaseConfig.executor(), natsClient, logger);
  }

  Future start() async {
    await this.natsClient.connect();
    this.logger.info(
        'Connected to NATS server at ${config.natsHost} on port ${config.natsPort}.');

    this.receiver = await UDP.bind(
        Endpoint.unicast(InternetAddress.anyIPv4, port: Port(config.port)));

    this.logger.info(
        'Listening on ${config.transport} port ${config.port} for incoming JSON messages from ${config.clientApplication} clients...');
    receiver.listen((datagram) {
      this.logger = Logger('Ingest(${name}) #${++packetCount}');
      var str = String.fromCharCodes(datagram.data);
      this.logger.debug(
          'Received UDP from ${datagram.address.address}:${datagram.port}: ${str}');
      processor.logger = logger;
      processor.process(str, datagram.address.address);
    }, timeout: new Duration(days: 365));
  }
}

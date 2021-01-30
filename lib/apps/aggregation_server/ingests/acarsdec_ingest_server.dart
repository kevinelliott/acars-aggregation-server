import 'dart:io';
import 'package:quick_log/quick_log.dart';
import 'package:udp/udp.dart';

import 'package:airframes_aggregation_server/common.dart';
import 'package:airframes_aggregation_server/apps/aggregation_server/support.dart';

class AcarsdecIngestServer extends UDPIngestServer {
  AcarsdecIngestServer(name, config, databaseConfig, natsConfig)
      : super(name, config, databaseConfig, natsConfig) {
    this.source = Source(
        'acarsdec', 'acarsdec', 'unknown', 'udp', 'ACARS', 'TLeconte', 'JSON');
    this.processor = TLeconteJsonProcessor(
        source, databaseConfig.executor(), natsManager, logger);
  }

  Future start() async {
    await natsManager.start();

    this.receiver = await UDP.bind(
        Endpoint.unicast(InternetAddress.anyIPv4, port: Port(config.port)));

    this.logger.info(
        'Listening on ${config.transport} port ${config.port} for incoming JSON messages from ${config.clientApplication} clients...');
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

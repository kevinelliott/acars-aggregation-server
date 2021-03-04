import 'dart:io';
import 'dart:convert';
import 'package:quick_log/quick_log.dart';
import 'package:udp/udp.dart';

import 'package:airframes_aggregation_server/common.dart';
import 'package:airframes_aggregation_server/apps/aggregation_server/support.dart';

class AcarsdecIngestServer extends UDPIngestServer {
  AcarsdecIngestServer(name, config, databaseConfig, natsConfig, redisConfig)
      : super(name, config, databaseConfig, natsConfig, redisConfig) {
    this.source = Source(
        'acarsdec', 'acarsdec', 'unknown', 'udp', 'ACARS', 'TLeconte', 'JSON');
    this.processor = TLeconteJsonProcessor(
        source, databaseConfig.executor(), natsManager, redisManager, logger);
  }

  Future start() async {
    await natsManager.start();
    await redisManager.start();

    redisManager.set('aggregator.ingests.acarsdec.packets.session', '0');

    receiver = await UDP.bind(
        Endpoint.unicast(InternetAddress.anyIPv4, port: Port(config.port)));

    logger.info(
        'Listening on ${config.transport} port ${config.port} for incoming JSON messages from ${config.clientApplication} clients...');
    receiver.listen((datagram) {
      logger = Logger('Ingest(${name}) #${++packetCount}');
      var str = String.fromCharCodes(datagram.data).trim();
      logger.debug(
          'Received UDP from ${datagram.address.address}:${datagram.port}: ${str}');
      redisManager.increment('aggregator.ingests.acarsdec.packets.session');
      redisManager.increment('aggregator.ingests.acarsdec.packets.all-time');
      Map<String, dynamic> message = {'source': source, 'str': str};
      natsManager.publish(JsonEncoder().convert(message), 'message.incoming',
          onSuccess: () =>
              {logger.fine('NATS: Published to message.incoming')});
      processor.logger = logger;
      processor.process(str, datagram.address.address);
    }, timeout: new Duration(days: 365));
  }
}

import 'package:nats/nats.dart';
import 'package:quick_log/quick_log.dart';

class NatsManager {
  var config = {};
  Logger logger;
  NatsClient client;
  bool connected = false;

  NatsManager(this.config, this.logger);

  publish(String message, String subject,
      {void onSuccess(), void onError(Exception ex), String replyTo}) {
    if (connected) {
      client.publish(message, subject,
          onSuccess: onSuccess, onError: onError, replyTo: replyTo);
    } else {
      logger
          .debug('NatsManager: Not publishing message because not connected.');
    }
  }

  start() async {
    try {
      logger.info('NatsManager: Connecting to NATS...');
      client = NatsClient(config['host'], config['port']);
      await client.connect(onConnect: () {
        logger.debug('NatsManager: Going to connect');
      }, onClusterupdate: (serverInfo) {
        logger.debug('NatsManager: Server info = ${serverInfo.toString()}');
      });
      logger.info(
          'NatsManager: Connected to NATS (host: ${config['host']}, port: ${config['port']}).');
      connected = true;
    } catch (e) {
      logger.error('NatsManager: Error: ${e.toString()}');
      logger.error(
          'NatsManager: Failure to connect to NATS server (${config['host']}, port: ${config['port']}). Messages will not be published.');
    }
  }

  stop() {
    connected = false;
    client = null;
  }
}

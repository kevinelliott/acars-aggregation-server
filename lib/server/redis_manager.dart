import 'package:dartis/dartis.dart' as redis;
import 'package:quick_log/quick_log.dart';

class RedisManager {
  var config = {};
  Logger logger;
  redis.Client client;
  bool connected = false;
  redis.Commands commands;

  RedisManager(this.config, this.logger);

  get(String key) async {
    var value;
    if (connected) {
      value = await commands.get(key);
      logger.debug('RedisManager: For key ${key} got value ${value}.');
    } else {
      logger.debug(
          'RedisManager: Not getting for key ${key} because not connected.');
    }
    return value;
  }

  set(String key, String value) async {
    if (connected) {
      await commands.set(key, value);
    } else {
      logger.debug(
          'RedisManager: Not setting for key ${key} because not connected.');
    }
  }

  increment(String key) async {
    var value;
    if (connected) {
      value = await commands.get(key);
      if (value) {
        value = value + 1;
      } else {
        value = 1;
      }
      await commands.set(key, value);
    } else {
      logger.debug('RedisManager: Incrementing key ${key} to ${value}.');
    }
    return value;
  }

  start() async {
    try {
      logger.info('RedisManager: Connecting to Redis at ${config['url']}...');
      client = await redis.Client.connect(config['url']);
      commands = client.asCommands<String, String>();
      logger.info('RedisManager: Connected to NATS (url: ${config['url']}).');
      connected = true;
    } catch (e) {
      logger.error('RedisManager: Error: ${e.toString()}');
      logger.error(
          'RedisManager: Failure to connect to Redis server (url: ${config['url']}). Messages will not be published.');
    }
  }

  stop() async {
    await client.disconnect();
    connected = false;
    commands = null;
    client = null;
  }
}

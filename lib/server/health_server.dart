import 'dart:io';

import 'package:dart_express/dart_express.dart';
import 'package:path/path.dart' as path;
import 'package:quick_log/quick_log.dart';

class HealthServer {
  App expressApp;
  int port;
  Logger logger;

  HealthServer({this.port, this.logger}) {
    Logger.writer =
        ConsolePrinter(minLevel: LogLevel.fine, enableInReleaseMode: true);
    logger = Logger('Health');

    expressApp = express();
    expressApp.use(BodyParser.json());
    // expressApp.use(LoggerMiddleware.use(includeImmediate: true));
    expressApp.set('print routes', false);

    expressApp.get('/', (req, res) {
      // logger.debug('health check request');
      res.json({
        'ping': 'ok',
      });
    });
  }

  Future start() async {
    this.expressApp.listen(
        address: InternetAddress('127.0.0.1'),
        port: port,
        cb: (int port) => print('Listening on port $port'));
  }
}

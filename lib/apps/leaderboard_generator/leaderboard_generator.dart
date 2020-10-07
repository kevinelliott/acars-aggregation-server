import 'dart:io';
import 'dart:async';

import 'package:args/args.dart';

import 'package:airframes_aggregation_server/common.dart';

var config = {};
var parsedArgs;

constructConfig(parsedArgs) {
  return {
    'database': {
      'type': 'postgres',
      'host': parsedArgs['database-host'],
      'port': int.parse(parsedArgs['database-port']),
      'user': parsedArgs['database-user'],
      'pass': parsedArgs['database-pass'],
      'name': parsedArgs['database-name'],
      'ssl': parsedArgs['database-ssl'],
    },
    'verbose': parsedArgs['verbose']
  };
}

parseArgs(arguments) {
  var parser = ArgParser()
    ..addOption('database-host',
        defaultsTo: Platform.environment['DATABASE_HOST'] ?? 'localhost')
    ..addOption('database-port',
        defaultsTo: Platform.environment['DATABASE_PORT'] ?? '5432')
    ..addOption('database-user',
        defaultsTo: Platform.environment['DATABASE_USER'] ??
            Platform.environment['USER'] ??
            Platform.environment['USERNAME'])
    ..addOption('database-pass',
        defaultsTo: Platform.environment['DATABASE_PASS'] ?? '')
    ..addOption('database-name',
        defaultsTo: Platform.environment['DATABASE_NAME'] ?? 'airframes')
    ..addFlag('database-ssl',
        defaultsTo: (Platform.environment['DATABASE_SSL'] != null
            ? Platform.environment['DATABASE_SSL'].toLowerCase() == 'true'
            : false))
    ..addFlag('verbose', abbr: 'v', defaultsTo: false);
  return parser.parse(arguments);
}

printSettings() {
  print('DATABASE');
  print('Host : ${parsedArgs['database-host']}');
  print('Port : ${parsedArgs['database-port']}');
  print('User : ${parsedArgs['database-user']}');
  print('Pass : *not displayed*');
  print('Name : ${parsedArgs['database-name']}');
  print('SSL  : ${parsedArgs['database-ssl']}');
  print('');
}

Future main(List<String> arguments) async {
  // Logger.writer = ConsolePrinter(minLevel: LogLevel.info);

  print('Airframes Leaderboard Generator');
  print('');

  parsedArgs = parseArgs(arguments);
  config = constructConfig(parsedArgs);
  printSettings();

  DatabaseConfig databaseConfig = DatabaseConfig(
      config['database']['type'],
      config['database']['host'],
      config['database']['port'],
      config['database']['user'],
      config['database']['pass'],
      config['database']['name'],
      config['database']['ssl']);

  print('');
}

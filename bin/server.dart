import 'dart:io';
import 'dart:async';

import 'package:args/args.dart';
import 'package:quick_log/quick_log.dart';

import 'package:acars_aggregation_server/aas.dart';

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
    'ingest-acarsdec': parsedArgs['ingest-acarsdec'],
    'ingest-acarsdec-port': int.parse(parsedArgs['ingest-acarsdec-port']),
    'ingest-acarsdeco2': parsedArgs['ingest-acarsdec'],
    'ingest-acarsdeco2-port': int.parse(parsedArgs['ingest-acarsdec-port']),
    'ingest-dumpvdl2': parsedArgs['ingest-dumpvdl2'],
    'ingest-dumpvdl2-port': int.parse(parsedArgs['ingest-dumpvdl2-port']),
    'ingest-jaero-c-acars': parsedArgs['ingest-jaero-c-acars'],
    'ingest-jaero-c-acars-port': int.parse(parsedArgs['ingest-jaero-c-acars-port']),
    'ingest-jaero-c-adsc': parsedArgs['ingest-jaero-c-acars'],
    'ingest-jaero-c-adsc-port': int.parse(parsedArgs['ingest-jaero-c-adsc-port']),
    'ingest-jaero-l-acars': parsedArgs['ingest-jaero-l-acars'],
    'ingest-jaero-l-acars-port': int.parse(parsedArgs['ingest-jaero-l-acars-port']),
    'ingest-vdlm2dec': parsedArgs['ingest-vdlm2dec'],
    'ingest-vdlm2dec-port': int.parse(parsedArgs['ingest-vdlm2dec-port']),
    'nats': {
      'host': parsedArgs['nats-host'],
      'port': int.parse(parsedArgs['nats-port'])
    }
  };
}

parseArgs(arguments) {
  var parser = ArgParser()
    ..addOption('database-host', defaultsTo: Platform.environment['DATABASE_HOST'] ?? 'localhost')
    ..addOption('database-port', defaultsTo: Platform.environment['DATABASE_PORT'] ?? '5432')
    ..addOption('database-user', defaultsTo: Platform.environment['DATABASE_USER'] ??
                                             Platform.environment['USER'] ??
                                             Platform.environment['USERNAME'])
    ..addOption('database-pass', defaultsTo: Platform.environment['DATABASE_PASS'] ?? '')
    ..addOption('database-name', defaultsTo: Platform.environment['DATABASE_NAME'] ?? 'airframes')
    ..addFlag('database-ssl', defaultsTo: (Platform.environment['DATABASE_SSL'] != null ? Platform.environment['DATABASE_SSL'].toLowerCase() == 'true' : false))
    ..addFlag('ingest-acarsdec', defaultsTo: true)
    ..addOption('ingest-acarsdec-port', defaultsTo: Platform.environment['INGEST_ACARSDEC_PORT'] ?? '5550')
    ..addFlag('ingest-acarsdeco2', defaultsTo: false)
    ..addOption('ingest-acarsdeco2-port', defaultsTo: Platform.environment['INGEST_ACARSDEC_PORT'] ?? '5551')
    ..addFlag('ingest-dumpvdl2', defaultsTo: true)
    ..addOption('ingest-dumpvdl2-port', defaultsTo: Platform.environment['INGEST_DUMPVDL2_PORT'] ?? '5552')
    ..addFlag('ingest-jaero-c-acars', defaultsTo: true)
    ..addOption('ingest-jaero-c-acars-port', defaultsTo: Platform.environment['INGEST_JAERO_C_ACARS_PORT'] ?? '5561')
    ..addFlag('ingest-jaero-c-adsc', defaultsTo: true)
    ..addOption('ingest-jaero-c-adsc-port', defaultsTo: Platform.environment['INGEST_JAERO_C_ADSC_PORT'] ?? '5562')
    ..addFlag('ingest-jaero-l-acars', defaultsTo: true)
    ..addOption('ingest-jaero-l-acars-port', defaultsTo: Platform.environment['INGEST_JAERO_L_ACARS_PORT'] ?? '5571')
    ..addFlag('ingest-vdlm2dec', defaultsTo: true)
    ..addOption('ingest-vdlm2dec-port', defaultsTo: Platform.environment['INGEST_VDLM2DEC_PORT'] ?? '5555')
    ..addOption('nats-host', defaultsTo: Platform.environment['NATS_HOST'] ?? 'localhost')
    ..addOption('nats-port', defaultsTo: Platform.environment['NATS_PORT'] ?? '4222')
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

  print('INGESTS');
  print('acarsdec (ACARS)     : ${parsedArgs['ingest-acarsdec'] ? "Enabled (Transport: UDP, Port: ${parsedArgs['ingest-acarsdec-port']}, Format: TLeconte JSON)" : 'Disabled'}');
  print('acarsdeco2 (ACARS)   : ${parsedArgs['ingest-acarsdeco2'] ? "Enabled (Transport: TCP, Port: ${parsedArgs['ingest-acarsdeco2-port']}, Format: SBS)" : 'Disabled'}');
  print('dumpvdl2 (VDL)       : ${parsedArgs['ingest-dumpvdl2'] ? "Enabled (Transport: UDP, Port: ${parsedArgs['ingest-dumpvdl2-port']}, Format: PlanePlotter)" : 'Disabled'}');
  print('JAERO C-Band (ACARS) : ${parsedArgs['ingest-jaero-c-acars'] ? "Enabled (Transport: UDP, Port: ${parsedArgs['ingest-jaero-c-acars-port']}, Format: Custom)" : 'Disabled'}');
  print('JAERO C-Band (ADS-C) : ${parsedArgs['ingest-jaero-c-adsc'] ? "Enabled (Transport: TCP, Port: ${parsedArgs['ingest-jaero-c-adsc-port']}, Format: SBS)" : 'Disabled'}');
  print('JAERO L-Band (ACARS) : ${parsedArgs['ingest-jaero-l-acars'] ? "Enabled (Transport: UDP, Port: ${parsedArgs['ingest-jaero-l-acars-port']}, Format: Custom)" : 'Disabled'}');
  print('vdlm2dec (VDL)       : ${parsedArgs['ingest-vdlm2dec'] ? "Enabled (Transport: UDP, Port: ${parsedArgs['ingest-vdlm2dec-port']}, Format: TLeconte JSON)" : 'Disabled'}');
  print('');
}

Future main(List<String> arguments) async {
  Logger.writer = ConsolePrinter(minLevel: LogLevel.info);

  print('Acars Aggregation Server v0.2.0');
  print('');

  parsedArgs = parseArgs(arguments);
  config = constructConfig(parsedArgs);
  printSettings();

  DatabaseConfig databaseConfig = DatabaseConfig(
    config['database']['type'], config['database']['host'], config['database']['port'],
    config['database']['user'], config['database']['pass'], config['database']['name'],
    config['database']['ssl']
  );

  IngestServerConfig acarsdecConfig = IngestServerConfig('UDP', config['ingest-acarsdec-port'], 'acarsdec', config['nats']['host'], config['nats']['port']);
  var acarsdecServer = AcarsdecIngestServer('acarsdec', acarsdecConfig, databaseConfig);
  acarsdecServer.start();

  IngestServerConfig dumpvdl2Config = IngestServerConfig('UDP', config['ingest-dumpvdl2-port'], 'dumpvdl2', config['nats']['host'], config['nats']['port']);
  var dumpvdl2Server = Dumpvdl2IngestServer('dumpvdl2', dumpvdl2Config, databaseConfig);
  dumpvdl2Server.start();

  IngestServerConfig vdlm2decConfig = IngestServerConfig('UDP', config['ingest-vdlm2dec-port'], 'vdlm2dec', config['nats']['host'], config['nats']['port']);
  var vdlm2decServer = AcarsdecIngestServer('vdlm2dec', vdlm2decConfig, databaseConfig);
  vdlm2decServer.start();

  // IngestServerConfig jaeroCAcarsConfig = IngestServerConfig('UDP', config['ingest-jaero-c-acars-port'], 'jaero-c-band-acars', config['nats']['host'], config['nats']['port']);
  // var jaeroCACARSServer = JaeroACARSIngestServer('jaero-c-band-acars', jaeroCAcarsConfig, databaseConfig);
  // jaeroCACARSServer.start();

  IngestServerConfig jaeroCADSCConfig = IngestServerConfig('TCP', config['ingest-jaero-c-adsc-port'], 'jaero-c-band-adsc', config['nats']['host'], config['nats']['port']);
  var jaeroCADSCServer = JaeroADSCIngestServer('jaero-c-adsc', jaeroCADSCConfig, databaseConfig);
  jaeroCADSCServer.start();

  // IngestServerConfig jaeroLAcarsConfig = IngestServerConfig('UDP', config['ingest-jaero-l-acars-port'], 'jaero-l-band-acars', config['nats']['host'], config['nats']['port']);
  // var jaeroLAcarsServer = UDPIngestServer('jaero-l-band-acars', jaeroLAcarsConfig, databaseConfig);
  // jaeroLAcarsServer.start();

  // var dumpvdl2Receiver = await UDP.bind(Endpoint.unicast(InternetAddress.anyIPv4, port: Port(config['ingest-dumpvdl2-port'])));
  // runZoned(() {
  //   print('Listening on UDP port ${config['ingest-dumpvdl2-port']} for incoming PlanePlotter messages from dumpvdl2 clients...');
  //   dumpvdl2Receiver.listen((datagram) {
  //     var str = String.fromCharCodes(datagram.data);
  //     print('[dumpvdl2] DEBUG: Received UDP from ${datagram.address.address}:${datagram.port}: ${str}');
  //   }, timeout: new Duration(days: 365));
  // },
  // onError: (e, stackTrace) => print('dumpvdl2: $e $stackTrace'));

  // var jaerolReceiver = await UDP.bind(Endpoint.unicast(InternetAddress.anyIPv4, port: Port(config['ingest-jaerol-port'])));
  // runZoned(() {
  //   print('Listening on UDP port ${config['ingest-jaerol-port']} for incoming PlanePlotter messages from JAERO L-Band clients...');
  //   jaerolReceiver.listen((datagram) {
  //     var str = String.fromCharCodes(datagram.data);
  //     print('[jaerol] DEBUG: Received UDP from ${datagram.address.address}:${datagram.port}: ${str}');
  //   }, timeout: new Duration(days: 365));
  // },
  // onError: (e, stackTrace) => print('jaerol: $e $stackTrace'));

  // var vdlm2decReceiver = await UDP.bind(Endpoint.unicast(InternetAddress.anyIPv4, port: Port(config['ingest-vdlm2dec-port'])));
  // runZoned(() {
  //   print('Listening on UDP port ${config['ingest-vdlm2dec-port']} for incoming JSON messages from vdlm2dec clients...');
  //   vdlm2decReceiver.listen((datagram) {
  //     var str = String.fromCharCodes(datagram.data);
  //     print('[vdlm2dec] DEBUG: Received UDP from ${datagram.address.address}:${datagram.port}: ${str}');
  //     processUDPString(str, executor);
  //   }, timeout: new Duration(days: 365));
  // },
  // onError: (e, stackTrace) => print('vdlm2dec: $e $stackTrace'));

  print('');
}

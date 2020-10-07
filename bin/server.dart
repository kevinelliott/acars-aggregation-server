import 'dart:io';
import 'dart:async';

// import 'package:acars_aggregation_server/src/server/health_server.dart';
import 'package:args/args.dart';
import 'package:quick_log/quick_log.dart';

import 'package:airframes_aggregation_server/common.dart';

var config = {};
var parsedArgs;

final VERSION = '0.2.2';

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
    'health-check-server': parsedArgs['health-check-server'],
    'health-check-server-port':
        int.parse(parsedArgs['health-check-server-port']),
    'ingest-acarsdec': parsedArgs['ingest-acarsdec'],
    'ingest-acarsdec-port': int.parse(parsedArgs['ingest-acarsdec-port']),
    'ingest-acarsdeco2': parsedArgs['ingest-acarsdec'],
    'ingest-acarsdeco2-port': int.parse(parsedArgs['ingest-acarsdec-port']),
    'ingest-airframes-grpc': parsedArgs['ingest-airframes-grpc'],
    'ingest-airframes-grpc-port':
        int.parse(parsedArgs['ingest-airframes-grpc-port']),
    'ingest-dumpvdl2': parsedArgs['ingest-dumpvdl2'],
    'ingest-dumpvdl2-port': int.parse(parsedArgs['ingest-dumpvdl2-port']),
    'ingest-jaero-c-acars': parsedArgs['ingest-jaero-c-acars'],
    'ingest-jaero-c-acars-port':
        int.parse(parsedArgs['ingest-jaero-c-acars-port']),
    'ingest-jaero-c-adsc': parsedArgs['ingest-jaero-c-acars'],
    'ingest-jaero-c-adsc-port':
        int.parse(parsedArgs['ingest-jaero-c-adsc-port']),
    'ingest-jaero-l-acars': parsedArgs['ingest-jaero-l-acars'],
    'ingest-jaero-l-acars-port':
        int.parse(parsedArgs['ingest-jaero-l-acars-port']),
    'ingest-vdlm2dec': parsedArgs['ingest-vdlm2dec'],
    'ingest-vdlm2dec-port': int.parse(parsedArgs['ingest-vdlm2dec-port']),
    'ingest-airframes-json': parsedArgs['ingest-airframes-json'],
    'ingest-airframes-json-port':
        int.parse(parsedArgs['ingest-airframes-json-port']),
    'nats': {
      'host': parsedArgs['nats-host'],
      'port': int.parse(parsedArgs['nats-port'])
    }
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
    ..addFlag('health-check-server', defaultsTo: true)
    ..addOption('health-check-server-port',
        defaultsTo: Platform.environment['HEALTH_CHECK_SERVER_PORT'] ?? '5678')
    ..addFlag('ingest-acarsdec', defaultsTo: true)
    ..addOption('ingest-acarsdec-port',
        defaultsTo: Platform.environment['INGEST_ACARSDEC_PORT'] ?? '5550')
    ..addFlag('ingest-airframes-grpc', defaultsTo: true)
    ..addOption('ingest-airframes-grpc-port',
        defaultsTo:
            Platform.environment['INGEST_AIRFRAMES_GRPC_PORT'] ?? '6001')
    ..addFlag('ingest-acarsdeco2', defaultsTo: false)
    ..addOption('ingest-acarsdeco2-port',
        defaultsTo: Platform.environment['INGEST_ACARSDEC_PORT'] ?? '5551')
    ..addFlag('ingest-dumpvdl2', defaultsTo: true)
    ..addOption('ingest-dumpvdl2-port',
        defaultsTo: Platform.environment['INGEST_DUMPVDL2_PORT'] ?? '5552')
    ..addFlag('ingest-jaero-c-acars', defaultsTo: true)
    ..addOption('ingest-jaero-c-acars-port',
        defaultsTo: Platform.environment['INGEST_JAERO_C_ACARS_PORT'] ?? '5561')
    ..addFlag('ingest-jaero-c-adsc', defaultsTo: true)
    ..addOption('ingest-jaero-c-adsc-port',
        defaultsTo: Platform.environment['INGEST_JAERO_C_ADSC_PORT'] ?? '5562')
    ..addFlag('ingest-jaero-l-acars', defaultsTo: true)
    ..addOption('ingest-jaero-l-acars-port',
        defaultsTo: Platform.environment['INGEST_JAERO_L_ACARS_PORT'] ?? '5571')
    ..addFlag('ingest-vdlm2dec', defaultsTo: true)
    ..addOption('ingest-vdlm2dec-port',
        defaultsTo: Platform.environment['INGEST_VDLM2DEC_PORT'] ?? '5555')
    ..addFlag('ingest-airframes-json', defaultsTo: true)
    ..addOption('ingest-airframes-json-port',
        defaultsTo:
            Platform.environment['INGEST_AIRFRAMES_JSON_PORT'] ?? '6000')
    ..addOption('nats-host',
        defaultsTo: Platform.environment['NATS_HOST'] ?? 'localhost')
    ..addOption('nats-port',
        defaultsTo: Platform.environment['NATS_PORT'] ?? '4222')
    ..addFlag('verbose', abbr: 'v', defaultsTo: false);
  return parser.parse(arguments);
}

printSettings() {
  print('HEALTH CHECK SERVER');
  print('Port : ${parsedArgs['health-check-server-port']}');
  print('');
  print('DATABASE');
  print('Host : ${parsedArgs['database-host']}');
  print('Port : ${parsedArgs['database-port']}');
  print('User : ${parsedArgs['database-user']}');
  print('Pass : *not displayed*');
  print('Name : ${parsedArgs['database-name']}');
  print('SSL  : ${parsedArgs['database-ssl']}');
  print('');

  print('INGESTS');
  print(
      'Airframes GRPC (Mixed) : ${parsedArgs['ingest-airframes-grpc'] ? "Enabled (Transport: GRPC, Port: ${parsedArgs['ingest-airframes-grpc-port']}, Format: af.protobuf.v1)" : 'Disabled'}');
  print(
      'Airframes JSON (Mixed) : ${parsedArgs['ingest-vdlm2dec'] ? "Enabled (Transport: UDP, Port: ${parsedArgs['ingest-airframes-json-port']}, Format: af.json.v1)" : 'Disabled'}');
  print(
      'acarsdec (ACARS)       : ${parsedArgs['ingest-acarsdec'] ? "Enabled (Transport: UDP, Port: ${parsedArgs['ingest-acarsdec-port']}, Format: TLeconte JSON)" : 'Disabled'}');
  print(
      'acarsdeco2 (ACARS)     : ${parsedArgs['ingest-acarsdeco2'] ? "Enabled (Transport: TCP, Port: ${parsedArgs['ingest-acarsdeco2-port']}, Format: SBS)" : 'Disabled'}');
  print(
      'dumpvdl2 (VDL)         : ${parsedArgs['ingest-dumpvdl2'] ? "Enabled (Transport: UDP, Port: ${parsedArgs['ingest-dumpvdl2-port']}, Format: PlanePlotter)" : 'Disabled'}');
  print(
      'JAERO C-Band (ACARS)   : ${parsedArgs['ingest-jaero-c-acars'] ? "Enabled (Transport: UDP, Port: ${parsedArgs['ingest-jaero-c-acars-port']}, Format: Custom)" : 'Disabled'}');
  print(
      'JAERO C-Band (ADS-C)   : ${parsedArgs['ingest-jaero-c-adsc'] ? "Enabled (Transport: TCP, Port: ${parsedArgs['ingest-jaero-c-adsc-port']}, Format: SBS)" : 'Disabled'}');
  print(
      'JAERO L-Band (ACARS)   : ${parsedArgs['ingest-jaero-l-acars'] ? "Enabled (Transport: UDP, Port: ${parsedArgs['ingest-jaero-l-acars-port']}, Format: Custom)" : 'Disabled'}');
  print(
      'vdlm2dec (VDL)         : ${parsedArgs['ingest-vdlm2dec'] ? "Enabled (Transport: UDP, Port: ${parsedArgs['ingest-vdlm2dec-port']}, Format: TLeconte JSON)" : 'Disabled'}');
  print('');
}

Future main(List<String> arguments) async {
  Logger.writer = ConsolePrinter(minLevel: LogLevel.info);

  print('Airframes Aggregation Server v${VERSION}');
  print('');

  parsedArgs = parseArgs(arguments);
  config = constructConfig(parsedArgs);
  printSettings();

  // HealthServer healthServer =
  //     HealthServer(port: int.parse(parsedArgs['health-check-server-port']));
  // healthServer.start();

  DatabaseConfig databaseConfig = DatabaseConfig(
      config['database']['type'],
      config['database']['host'],
      config['database']['port'],
      config['database']['user'],
      config['database']['pass'],
      config['database']['name'],
      config['database']['ssl']);

  IngestServerConfig acarsdecConfig = IngestServerConfig(
      'UDP',
      config['ingest-acarsdec-port'],
      'acarsdec',
      config['nats']['host'],
      config['nats']['port']);
  var acarsdecServer =
      AcarsdecIngestServer('acarsdec', acarsdecConfig, databaseConfig);
  acarsdecServer.start();

  // IngestServerConfig dumpvdl2Config = IngestServerConfig(
  //     'UDP',
  //     config['ingest-dumpvdl2-port'],
  //     'dumpvdl2',
  //     config['nats']['host'],
  //     config['nats']['port']);
  // var dumpvdl2Server =
  //     Dumpvdl2IngestServer('dumpvdl2', dumpvdl2Config, databaseConfig);
  // dumpvdl2Server.start();

  IngestServerConfig vdlm2decConfig = IngestServerConfig(
      'UDP',
      config['ingest-vdlm2dec-port'],
      'vdlm2dec',
      config['nats']['host'],
      config['nats']['port']);
  var vdlm2decServer =
      AcarsdecIngestServer('vdlm2dec', vdlm2decConfig, databaseConfig);
  vdlm2decServer.start();

  // IngestServerConfig jaeroCAcarsConfig = IngestServerConfig(
  //     'UDP',
  //     config['ingest-jaero-c-acars-port'],
  //     'jaero-c-band-acars',
  //     config['nats']['host'],
  //     config['nats']['port']);
  // var jaeroCACARSServer = JaeroACARSIngestServer(
  //     'jaero-c-band-acars', jaeroCAcarsConfig, databaseConfig);
  // jaeroCACARSServer.start();

  IngestServerConfig jaeroCADSCConfig = IngestServerConfig(
      'TCP',
      config['ingest-jaero-c-adsc-port'],
      'jaero-c-band-adsc',
      config['nats']['host'],
      config['nats']['port']);
  var jaeroCADSCServer =
      JaeroADSCIngestServer('jaero-c-adsc', jaeroCADSCConfig, databaseConfig);
  jaeroCADSCServer.start();

  // IngestServerConfig jaeroLAcarsConfig = IngestServerConfig('UDP', config['ingest-jaero-l-acars-port'], 'jaero-l-band-acars', config['nats']['host'], config['nats']['port']);
  // var jaeroLAcarsServer = UDPIngestServer('jaero-l-band-acars', jaeroLAcarsConfig, databaseConfig);
  // jaeroLAcarsServer.start();

  IngestServerConfig airframesJsonConfig = IngestServerConfig(
      'udp',
      config['ingest-airframes-json-port'],
      'airframes-json',
      config['nats']['host'],
      config['nats']['port']);
  var airframesJsonIngestServer = AirframesJsonIngestServer(
      'airframes-json', airframesJsonConfig, databaseConfig);
  airframesJsonIngestServer.start();

  IngestServerConfig grpcConfig = IngestServerConfig(
      'grpc',
      config['ingest-airframes-grpc-port'],
      'grpc',
      config['nats']['host'],
      config['nats']['port']);
  var grpcIngestServer =
      AirframesGrpcIngestServer('grpc', grpcConfig, databaseConfig);
  grpcIngestServer.start();

  print('');
}

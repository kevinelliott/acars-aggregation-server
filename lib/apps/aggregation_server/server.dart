import 'dart:async';

// import 'package:acars_aggregation_server/src/server/health_server.dart';
import 'package:quick_log/quick_log.dart';

import 'package:airframes_aggregation_server/common.dart';
import 'args.dart';
import 'config.dart';
import 'support.dart';

var config = {};
var args;

final VERSION = '0.2.3';

printSettings() {
  print('HEALTH CHECK SERVER');
  print('Port : ${args['health-check-server-port']}');
  print('');
  print('DATABASE');
  print('Host : ${args['database-host']}');
  print('Port : ${args['database-port']}');
  print('User : ${args['database-user']}');
  print('Pass : *not displayed*');
  print('Name : ${args['database-name']}');
  print('SSL  : ${args['database-ssl']}');
  print('');

  print('INGESTS');
  print(
      'Airframes GRPC (Mixed) : ${args['ingest-airframes-grpc'] ? "Enabled (Transport: GRPC, Port: ${args['ingest-airframes-grpc-port']}, Format: af.protobuf.v1)" : 'Disabled'}');
  print(
      'Airframes JSON (Mixed) : ${args['ingest-vdlm2dec'] ? "Enabled (Transport: UDP, Port: ${args['ingest-airframes-json-port']}, Format: af.json.v1)" : 'Disabled'}');
  print(
      'acarsdec (ACARS)       : ${args['ingest-acarsdec'] ? "Enabled (Transport: UDP, Port: ${args['ingest-acarsdec-port']}, Format: TLeconte JSON)" : 'Disabled'}');
  print(
      'acarsdeco2 (ACARS)     : ${args['ingest-acarsdeco2'] ? "Enabled (Transport: TCP, Port: ${args['ingest-acarsdeco2-port']}, Format: SBS)" : 'Disabled'}');
  print(
      'dumpvdl2 (VDL)         : ${args['ingest-dumpvdl2'] ? "Enabled (Transport: UDP, Port: ${args['ingest-dumpvdl2-port']}, Format: PlanePlotter)" : 'Disabled'}');
  print(
      'JAERO C-Band (ACARS)   : ${args['ingest-jaero-c-acars'] ? "Enabled (Transport: UDP, Port: ${args['ingest-jaero-c-acars-port']}, Format: Custom)" : 'Disabled'}');
  print(
      'JAERO C-Band (ADS-C)   : ${args['ingest-jaero-c-adsc'] ? "Enabled (Transport: TCP, Port: ${args['ingest-jaero-c-adsc-port']}, Format: SBS)" : 'Disabled'}');
  print(
      'JAERO L-Band (ACARS)   : ${args['ingest-jaero-l-acars'] ? "Enabled (Transport: UDP, Port: ${args['ingest-jaero-l-acars-port']}, Format: Custom)" : 'Disabled'}');
  print(
      'vdlm2dec (VDL)         : ${args['ingest-vdlm2dec'] ? "Enabled (Transport: UDP, Port: ${args['ingest-vdlm2dec-port']}, Format: TLeconte JSON)" : 'Disabled'}');
  print('');
}

Future main(List<String> arguments) async {
  Logger.writer = ConsolePrinter(minLevel: LogLevel.info);

  print('Airframes Aggregation Server v${VERSION}');
  print('');

  args = Args.parse(arguments);
  config = Config.fromArgs(args);
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

  if (args['ingest-acarsdec']) {
    IngestServerConfig acarsdecConfig = IngestServerConfig(
        'UDP',
        config['ingest-acarsdec-port'],
        'acarsdec',
        config['nats']['host'],
        config['nats']['port']);
    var acarsdecServer =
        AcarsdecIngestServer('acarsdec', acarsdecConfig, databaseConfig);
    acarsdecServer.start();
  }

  // IngestServerConfig dumpvdl2Config = IngestServerConfig(
  //     'UDP',
  //     config['ingest-dumpvdl2-port'],
  //     'dumpvdl2',
  //     config['nats']['host'],
  //     config['nats']['port']);
  // var dumpvdl2Server =
  //     Dumpvdl2IngestServer('dumpvdl2', dumpvdl2Config, databaseConfig);
  // dumpvdl2Server.start();

  if (args['ingest-vdlm2dec']) {
    IngestServerConfig vdlm2decConfig = IngestServerConfig(
        'UDP',
        config['ingest-vdlm2dec-port'],
        'vdlm2dec',
        config['nats']['host'],
        config['nats']['port']);
    var vdlm2decServer =
        AcarsdecIngestServer('vdlm2dec', vdlm2decConfig, databaseConfig);
    vdlm2decServer.start();
  }

  // IngestServerConfig jaeroCAcarsConfig = IngestServerConfig(
  //     'UDP',
  //     config['ingest-jaero-c-acars-port'],
  //     'jaero-c-band-acars',
  //     config['nats']['host'],
  //     config['nats']['port']);
  // var jaeroCACARSServer = JaeroACARSIngestServer(
  //     'jaero-c-band-acars', jaeroCAcarsConfig, databaseConfig);
  // jaeroCACARSServer.start();

  if (args['ingest-jaero-c-adsc']) {
    IngestServerConfig jaeroCADSCConfig = IngestServerConfig(
        'TCP',
        config['ingest-jaero-c-adsc-port'],
        'jaero-c-band-adsc',
        config['nats']['host'],
        config['nats']['port']);
    var jaeroCADSCServer =
        JaeroADSCIngestServer('jaero-c-adsc', jaeroCADSCConfig, databaseConfig);
    jaeroCADSCServer.start();
  }

  // IngestServerConfig jaeroLAcarsConfig = IngestServerConfig('UDP', config['ingest-jaero-l-acars-port'], 'jaero-l-band-acars', config['nats']['host'], config['nats']['port']);
  // var jaeroLAcarsServer = UDPIngestServer('jaero-l-band-acars', jaeroLAcarsConfig, databaseConfig);
  // jaeroLAcarsServer.start();

  if (args['ingest-airframes-json']) {
    IngestServerConfig airframesJsonConfig = IngestServerConfig(
        'udp',
        config['ingest-airframes-json-port'],
        'airframes-json',
        config['nats']['host'],
        config['nats']['port']);
    var airframesJsonIngestServer = AirframesJsonIngestServer(
        'airframes-json', airframesJsonConfig, databaseConfig);
    airframesJsonIngestServer.start();
  }

  // IngestServerConfig grpcConfig = IngestServerConfig(
  //     'grpc',
  //     config['ingest-airframes-grpc-port'],
  //     'grpc',
  //     config['nats']['host'],
  //     config['nats']['port']);
  // var grpcIngestServer =
  //     AirframesGrpcIngestServer('grpc', grpcConfig, databaseConfig);
  // grpcIngestServer.start();

  print('');
  print('Exiting...');
}

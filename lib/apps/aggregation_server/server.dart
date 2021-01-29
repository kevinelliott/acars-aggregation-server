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

Future main(List<String> arguments) async {
  Logger.writer = ConsolePrinter(minLevel: LogLevel.info);

  print('Airframes Aggregation Server v${VERSION}');
  print('');

  args = Args.parse(arguments);
  Args.printSettings(args);
  config = Config.fromArgs(args);

  // HealthServer healthServer =
  //     HealthServer(port: int.parse(parsedArgs['health-check-server-port']));
  // healthServer.start();

  DatabaseConfig databaseConfig = DatabaseConfig.fromMap(config['database']);

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

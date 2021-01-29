import 'dart:io';
import 'package:args/args.dart';

class Args {
  static parse(arguments) {
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
          defaultsTo:
              Platform.environment['HEALTH_CHECK_SERVER_PORT'] ?? '5678')
      ..addFlag('ingest-acarsdec', defaultsTo: false)
      ..addOption('ingest-acarsdec-port',
          defaultsTo: Platform.environment['INGEST_ACARSDEC_PORT'] ?? '5550')
      ..addFlag('ingest-airframes-grpc', defaultsTo: false)
      ..addOption('ingest-airframes-grpc-port',
          defaultsTo:
              Platform.environment['INGEST_AIRFRAMES_GRPC_PORT'] ?? '6001')
      ..addFlag('ingest-acarsdeco2', defaultsTo: false)
      ..addOption('ingest-acarsdeco2-port',
          defaultsTo: Platform.environment['INGEST_ACARSDEC_PORT'] ?? '5551')
      ..addFlag('ingest-dumpvdl2', defaultsTo: false)
      ..addOption('ingest-dumpvdl2-port',
          defaultsTo: Platform.environment['INGEST_DUMPVDL2_PORT'] ?? '5552')
      ..addFlag('ingest-jaero-c-acars', defaultsTo: false)
      ..addOption('ingest-jaero-c-acars-port',
          defaultsTo:
              Platform.environment['INGEST_JAERO_C_ACARS_PORT'] ?? '5561')
      ..addFlag('ingest-jaero-c-adsc', defaultsTo: false)
      ..addOption('ingest-jaero-c-adsc-port',
          defaultsTo:
              Platform.environment['INGEST_JAERO_C_ADSC_PORT'] ?? '5562')
      ..addFlag('ingest-jaero-l-acars', defaultsTo: false)
      ..addOption('ingest-jaero-l-acars-port',
          defaultsTo:
              Platform.environment['INGEST_JAERO_L_ACARS_PORT'] ?? '5571')
      ..addFlag('ingest-vdlm2dec', defaultsTo: false)
      ..addOption('ingest-vdlm2dec-port',
          defaultsTo: Platform.environment['INGEST_VDLM2DEC_PORT'] ?? '5555')
      ..addFlag('ingest-airframes-json', defaultsTo: false)
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

  static printSettings(args) {
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
}

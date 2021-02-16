import 'dart:core';

class Config {
  static fromArgs(args) {
    return {
      'database': {
        'type': 'postgres',
        'host': args['database-host'],
        'port': int.parse(args['database-port']),
        'user': args['database-user'],
        'pass': args['database-pass'],
        'name': args['database-name'],
        'ssl': args['database-ssl'],
      },
      'health-check-server': args['health-check-server'],
      'health-check-server-port': int.parse(args['health-check-server-port']),
      'ingest-acarsdec': args['ingest-acarsdec'],
      'ingest-acarsdec-port': int.parse(args['ingest-acarsdec-port']),
      'ingest-acarsdeco2': args['ingest-acarsdec'],
      'ingest-acarsdeco2-port': int.parse(args['ingest-acarsdec-port']),
      'ingest-airframes-grpc': args['ingest-airframes-grpc'],
      'ingest-airframes-grpc-port':
          int.parse(args['ingest-airframes-grpc-port']),
      'ingest-dumpvdl2': args['ingest-dumpvdl2'],
      'ingest-dumpvdl2-port': int.parse(args['ingest-dumpvdl2-port']),
      'ingest-jaero-c-acars': args['ingest-jaero-c-acars'],
      'ingest-jaero-c-acars-port': int.parse(args['ingest-jaero-c-acars-port']),
      'ingest-jaero-c-adsc': args['ingest-jaero-c-acars'],
      'ingest-jaero-c-adsc-port': int.parse(args['ingest-jaero-c-adsc-port']),
      'ingest-jaero-l-acars': args['ingest-jaero-l-acars'],
      'ingest-jaero-l-acars-port': int.parse(args['ingest-jaero-l-acars-port']),
      'ingest-vdlm2dec': args['ingest-vdlm2dec'],
      'ingest-vdlm2dec-port': int.parse(args['ingest-vdlm2dec-port']),
      'ingest-airframes-json': args['ingest-airframes-json'],
      'ingest-airframes-json-port':
          int.parse(args['ingest-airframes-json-port']),
      'nats': {'host': args['nats-host'], 'port': int.parse(args['nats-port'])},
      'redis': {'url': args['redis-url']}
    };
  }
}

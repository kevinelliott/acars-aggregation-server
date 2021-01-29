import 'dart:core';
import 'dart:io';

import 'package:angel_orm_postgres/angel_orm_postgres.dart';
import 'package:logging/logging.dart';
import 'package:postgres/postgres.dart';

class DatabaseConfig {
  DatabaseConfig(this.type, this.host, this.port, this.user, this.pass,
      this.name, this.ssl) {}

  DatabaseConfig.fromMap(config) {
    DatabaseConfig(config['type'], config['host'], config['port'],
        config['user'], config['pass'], config['name'], config['ssl']);
  }

  var type = 'postgres';
  var host;
  int port;
  var user;
  var pass;
  var name;
  bool ssl = false;

  executor() {
    var executor = new PostgreSqlExecutorPool(Platform.numberOfProcessors, () {
      return new PostgreSQLConnection(host, port, name,
          username: user,
          password: pass,
          timeZone: 'UTC',
          timeoutInSeconds: 30,
          useSSL: ssl);
    }, logger: new Logger('Database'));
    return executor;
  }
}

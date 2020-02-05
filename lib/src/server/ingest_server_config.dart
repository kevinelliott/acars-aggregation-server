import 'dart:async';
import 'dart:core';
import 'dart:io';

class IngestServerConfig {
  IngestServerConfig(this.transport, this.port, this.clientApplication, this.natsHost, this.natsPort) {

  }

  var transport;
  int port;
  var clientApplication;
  var natsHost;
  int natsPort;

}
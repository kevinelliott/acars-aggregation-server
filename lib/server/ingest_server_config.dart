import 'dart:core';

class IngestServerConfig {
  IngestServerConfig(this.transport, this.port, this.clientApplication,
      this.natsHost, this.natsPort) {}

  var transport;
  int port;
  var clientApplication;
  var natsHost;
  int natsPort;
}

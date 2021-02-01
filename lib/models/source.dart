class Source {
  // Name for the source (acarsdec, jaero-c-acars)
  String name;

  // Client application that captured and forwarded (based on ingest) (JAERO, acarsdec, vdlm2dec, dumpvdl2)
  String application;

  // Client application version
  String applicationVersion;

  // Protocol used on the network tier (TCP, UDP, HTTP)
  String networkProtocol;

  // Originating transmission type (ACARS, ADS-C, VDL)
  String transmissionType;

  // Protocol used between client and ingest (Beast, SBS, Human-readable, Custom)
  String dataProtocol;

  // Raw format that makes up source protocol (text, JSON, binary)
  String dataProtocolFormat;

  Source(
      this.name,
      this.application,
      this.applicationVersion,
      this.networkProtocol,
      this.transmissionType,
      this.dataProtocol,
      this.dataProtocolFormat);

  Map<String, dynamic> toJson() => {
        'name': name,
        'application': application,
        'applicationVersion': applicationVersion,
        'networkProtocol': networkProtocol,
        'transmissionType': transmissionType,
        'dataProtocol': dataProtocol,
        'dataProtocolFormat': dataProtocolFormat
      };
}

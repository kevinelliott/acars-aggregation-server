class Source {
  String name;            // Name for the source (acarsdec, jaero-c-acars)
  String application;     // Client application that captured and forwarded (based on ingest) (JAERO, acarsdec, vdlm2dec, dumpvdl2)
  String type;            // Originating transmission type (ACARS, ADS-C, VDL)
  String protocol;        // Protocol used between client and ingest (SBS, ACARS, Custom)
  String format;          // Format used by the source protocol (text, JSON, binary)
  String networkProtocol; // Protocol used on the network tier (TCP, UDP, HTTP)
  String remoteIp;        // IP address of the source

  Source(this.name, this.application, this.type, this.protocol, this.format, this.networkProtocol);
}

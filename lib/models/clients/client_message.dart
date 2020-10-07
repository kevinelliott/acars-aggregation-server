import 'package:airframes_aggregation_server/common.dart';

class ClientMessage {
  // Common
  String source;
  String sourceType;
  DateTime timestamp;
  String stationId;
  int channel;
  int level;
  int error;
  double frequency;
  String mode;
  String label;
  String blockId;
  String ack;
  String tail;
  String flightNumber;
  String messageNumber;
  String text;
  bool end;

  // Specific - vdlm2dec (others?)
  String fromIcao;
  String toIcao;
  String linkDirection;
  String departureAirport;
  String destinationAirport;
  String arrivalEta;
  String gateOut;
  String groundOff;
  String groundOn;
  String gateIn;

  // Extended - calculated from text decodings or extended info
  double latitude;
  double longitude;
  int altitude;

  ClientMessage();

  String sanitizedTail() {
    return Tail(tail).sanitize();
  }
}

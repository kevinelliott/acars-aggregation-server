import 'package:airframes_aggregation_server/common.dart';

class Vdlm2decClientMessage extends ClientMessage {
  Vdlm2decClientMessage();

  static Vdlm2decClientMessage fromAirframesClientFrame(
      AirframesClientFrame frame) {
    Vdlm2decClientMessage message = Vdlm2decClientMessage();
    message.source = 'vdlm2dec';
    message.sourceType = 'vdl';
    message.timestamp =
        DateTimeConversion.dateTimeFromEpochUs(frame.vdlm2decMessage.timestamp);
    message.stationId = frame.vdlm2decMessage.stationId;
    message.channel = frame.vdlm2decMessage.channel;
    message.frequency = frame.vdlm2decMessage.frequency;
    if (frame.vdlm2decMessage.level != 0) {
      message.level = frame.vdlm2decMessage.level;
    }
    message.error = frame.vdlm2decMessage.error;
    message.mode = frame.vdlm2decMessage.mode;
    message.label = frame.vdlm2decMessage.label;
    message.blockId = frame.vdlm2decMessage.blockId;
    message.ack = frame.vdlm2decMessage.ack;
    message.tail = frame.vdlm2decMessage.tail;
    message.flightNumber = frame.vdlm2decMessage.flight;
    message.messageNumber = frame.vdlm2decMessage.messageNumber;
    message.text = frame.vdlm2decMessage.text;
    message.end = frame.vdlm2decMessage.end;

    message.fromIcao = Icao.uintShiftAndHex(frame.vdlm2decMessage.fromIcao);
    message.toIcao = Icao.uintShiftAndHex(frame.vdlm2decMessage.toIcao);
    message.departureAirport = frame.vdlm2decMessage.departureAirport;
    message.destinationAirport = frame.vdlm2decMessage.destinationAirport;
    message.arrivalEta = frame.vdlm2decMessage.arrivalEta;
    message.gateOut = frame.vdlm2decMessage.gateOut;
    message.groundOff = frame.vdlm2decMessage.groundOff;
    message.groundOn = frame.vdlm2decMessage.groundOn;
    message.gateIn = frame.vdlm2decMessage.gateIn;
    return message;
  }
}

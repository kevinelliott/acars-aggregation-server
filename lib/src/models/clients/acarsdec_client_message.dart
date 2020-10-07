import 'package:airframes_aggregation_server/common.dart';

class AcarsdecClientMessage extends ClientMessage {
  AcarsdecClientMessage();

  static AcarsdecClientMessage fromAirframesClientFrame(
      AirframesClientFrame frame) {
    AcarsdecClientMessage message = AcarsdecClientMessage();
    message.source = 'acarsdec';
    message.sourceType = 'acars';
    message.timestamp =
        DateTimeConversion.dateTimeFromEpochUs(frame.acarsdecMessage.timestamp);
    message.stationId = frame.acarsdecMessage.stationId;
    message.channel = frame.acarsdecMessage.channel;
    message.frequency = frame.acarsdecMessage.frequency;
    if (frame.acarsdecMessage.level != 0) {
      message.level = frame.acarsdecMessage.level;
    }
    message.error = frame.acarsdecMessage.error;
    message.mode = frame.acarsdecMessage.mode;
    message.label = frame.acarsdecMessage.label;
    message.blockId = frame.acarsdecMessage.blockId;
    message.ack = frame.acarsdecMessage.ack;
    message.tail = frame.acarsdecMessage.tail;
    message.flightNumber = frame.acarsdecMessage.flight;
    message.messageNumber = frame.acarsdecMessage.messageNumber;
    message.text = frame.acarsdecMessage.text;
    message.end = frame.acarsdecMessage.end;
    return message;
  }
}

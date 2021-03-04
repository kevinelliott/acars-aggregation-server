import 'package:airframes_aggregation_server/common.dart';

class PcHfdlClientMessage extends ClientMessage {
  PcHfdlClientMessage();

  static PcHfdlClientMessage fromAirframesClientFrame(
      AirframesClientFrame frame) {
    PcHfdlClientMessage message = PcHfdlClientMessage();
    message.source = 'pc_hfdl';
    message.sourceType = 'hfdl';
    message.timestamp =
        DateTimeConversion.dateTimeFromEpochUs(frame.acarsdecMessage.timestamp);
    message.stationId = frame.acarsdecMessage.stationId;
    message.channel = frame.acarsdecMessage.channel;
    message.frequency = frame.acarsdecMessage.frequency;
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

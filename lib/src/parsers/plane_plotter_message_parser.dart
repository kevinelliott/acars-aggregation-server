import 'package:quick_log/quick_log.dart';

import 'package:acars_aggregation_server/aas.dart';

class PlanePlotterMessageParser {
  Logger logger;
  Source source;

  PlanePlotterMessageParser(this.source, this.logger) {
  }

  Future parse(String str) async {
    var parts = str.split(' ');
    logger.fine(parts.toString());
    return parseParts(parts);
  }

  PlanePlotterMessage parseParts(parts) {
    PlanePlotterMessage message;
    message = PlanePlotterMessage(
      this.source,
      parts[0][2],
      parts[1].replaceAll('.', ''),
      parts[2],
      parts[3],
      parts[4],
      parts[5],
      parts[6],
      parts.sublist(7).join(' ')
    );

    logger.fine('PLANEPLOTTER MESSAGE');
    logger.fine('Mode                    : ${message.mode}');
    logger.fine('Tail                    : ${message.tail}');
    logger.fine('ACK                     : ${message.ack}');
    logger.fine('Label                   : ${message.label}');
    logger.fine('Message Number          : ${message.messageNumber}');
    logger.fine('Flight Number           : ${message.flightNumber}');
    logger.fine('Text                    : ${message.text}');

    return message;
  }
}
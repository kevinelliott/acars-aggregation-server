import 'package:quick_log/quick_log.dart';

import 'package:airframes_aggregation_server/common.dart';

class SBSParser {
  Logger logger;
  Source source;

  SBSParser(this.source, this.logger) {}

  Future parse(String str) async {
    var parts = str.split(',');
    logger.fine('SBSParser: Parts = ${parts.toString()}');
    logger.fine('SBSParser: Parts length = ${parts.length}');

    if (parts.length >= 22) {
      switch (parts[0]) {
        case 'AIR':
          return parseAIR(parts);
        case 'ID':
          return parseAIR(parts);
        case 'MSG':
          return parseMSG(parts);
        case 'SEL':
          return parseSEL(parts);
        case 'STA':
          return parseSTA(parts);
        default:
      }
    } else {
      logger.error(
          'SBSParser: The number of parts of the SBS message is only ${parts.length} but should be 22 or greater. Skipping!');
    }
  }

  SBSMessage parseAIR(parts) {
    SBSMessage sbsMessage;

    logger.fine('SBSParser.parseAIR: New Aircraft Message');
    sbsMessage = SBSMessage(
        this.source,
        parts[0],
        parts[1],
        parts[2],
        parts[3],
        parts[4],
        parts[5],
        (parts[6] as String).replaceAll(new RegExp(r'/'), '-'),
        parts[7],
        (parts[8] as String).replaceAll(new RegExp(r'/'), '-'),
        parts[9],
        parts[10],
        parts[11] != '' ? int.parse(parts[11]) : null,
        parts[12] != '' ? double.parse(parts[12]) : null,
        parts[13] != '' ? double.parse(parts[13]) : null,
        parts[14] != '' ? double.parse(parts[14]) : null,
        parts[15] != '' ? double.parse(parts[15]) : null,
        parts[16] != '' ? int.parse(parts[16]) : null,
        parts[17],
        parts[18],
        parts[19],
        parts[20],
        parts[21]);

    logger.fine('SBSParser.parseAIR:   Hex Ident     : ${sbsMessage.hexIdent}');
    logger.fine(
        'SBSParser.parseAIR:   Flight        : ${sbsMessage.flightNumber}');
    if (sbsMessage.altitude != null)
      logger
          .fine('SBSParser.parseAIR:   Altitude      : ${sbsMessage.altitude}');
    if (sbsMessage.groundSpeed != null)
      logger.fine(
          'SBSParser.parseAIR:   Ground Speed  : ${sbsMessage.groundSpeed}');
    if (sbsMessage.track != null)
      logger.fine('SBSParser.parseAIR:   Track         : ${sbsMessage.track}');
    logger.fine(
        'SBSParser.parseAIR:   Coordinates   : ${sbsMessage.latitude}, ${sbsMessage.longitude}');
    if (sbsMessage.verticalRate != null)
      logger.fine(
          'SBSParser.parseAIR:   Vertical Rate : ${sbsMessage.verticalRate}');
    if (sbsMessage.squawk != null && sbsMessage.squawk != '')
      logger.fine('SBSParser.parseAIR:   Squawk        : ${sbsMessage.squawk}');

    return sbsMessage;
  }

  SBSMessage parseMSG(List parts) {
    SBSMessage sbsMessage;

    switch (parts[1]) {
      case '1':
        logger.fine('SBSParser.parseMSG: ES Identification and Category');
        break;
      case '2':
        logger.fine('SBSParser.parseMSG: ES Surface Position Message');
        break;
      case '3':
        logger.fine('SBSParser.parseMSG: ES Airborne Position Message');
        break;
      case '4':
        logger.fine('SBSParser.parseMSG: ES Airborne Velocity Message');
        break;
      case '5':
        logger.fine('SBSParser.parseMSG: Surveillance Alt Message');
        break;
      case '6':
        logger.fine('SBSParser.parseMSG: Surveillance ID Message');
        break;
      case '7':
        logger.fine('SBSParser.parseMSG: Air to Air Message');
        break;
      case '8':
        logger.fine('SBSParser.parseMSG: All Call Reply');
        break;
      default:
    }

    sbsMessage = SBSMessage(
        this.source,
        parts[0],
        parts[1],
        parts[2],
        parts[3],
        parts[4],
        parts[5],
        (parts[6] as String).replaceAll(new RegExp(r'/'), '-'),
        parts[7],
        (parts[8] as String).replaceAll(new RegExp(r'/'), '-'),
        parts[9],
        parts[10],
        parts[11] != '' ? int.parse(parts[11]) : null,
        parts[12] != '' ? double.parse(parts[12]) : null,
        parts[13] != '' ? double.parse(parts[13]) : null,
        parts[14] != '' ? double.parse(parts[14]) : null,
        parts[15] != '' ? double.parse(parts[15]) : null,
        parts[16] != '' ? int.parse(parts[16]) : null,
        parts[17],
        parts[18],
        parts[19],
        parts[20],
        parts[21]);

    logger.fine('SBSParser.parseMSG:   Hex Ident     : ${sbsMessage.hexIdent}');
    logger.fine(
        'SBSParser.parseMSG:   Flight        : ${sbsMessage.flightNumber}');
    if (sbsMessage.altitude != null)
      logger
          .fine('SBSParser.parseMSG:   Altitude      : ${sbsMessage.altitude}');
    if (sbsMessage.groundSpeed != null)
      logger.fine(
          'SBSParser.parseMSG:   Ground Speed  : ${sbsMessage.groundSpeed}');
    if (sbsMessage.track != null)
      logger.fine('SBSParser.parseMSG:   Track         : ${sbsMessage.track}');
    logger.fine(
        'SBSParser.parseMSG:   Coordinates   : ${sbsMessage.latitude}, ${sbsMessage.longitude}');
    if (sbsMessage.verticalRate != null)
      logger.fine(
          'SBSParser.parseMSG:   Vertical Rate : ${sbsMessage.verticalRate}');
    if (sbsMessage.squawk != null && sbsMessage.squawk != '')
      logger.fine('SBSParser.parseMSG:   Squawk        : ${sbsMessage.squawk}');

    return sbsMessage;
  }

  SBSMessage parseSEL(parts) {
    SBSMessage sbsMessage;

    logger.fine('SBSParser.parseSEL: Selection Change Message');
    sbsMessage = SBSMessage(
        this.source,
        parts[0],
        parts[1],
        parts[2],
        parts[3],
        parts[4],
        parts[5],
        (parts[6] as String).replaceAll(new RegExp(r'/'), '-'),
        parts[7],
        (parts[8] as String).replaceAll(new RegExp(r'/'), '-'),
        parts[9],
        parts[10],
        parts[11] != '' ? int.parse(parts[11]) : null,
        parts[12] != '' ? double.parse(parts[12]) : null,
        parts[13] != '' ? double.parse(parts[13]) : null,
        parts[14] != '' ? double.parse(parts[14]) : null,
        parts[15] != '' ? double.parse(parts[15]) : null,
        parts[16] != '' ? int.parse(parts[16]) : null,
        parts[17],
        parts[18],
        parts[19],
        parts[20],
        parts[21]);

    logger.fine('SBSParser.parseSEL:   Hex Ident     : ${sbsMessage.hexIdent}');
    logger.fine(
        'SBSParser.parseSEL:   Flight        : ${sbsMessage.flightNumber}');
    if (sbsMessage.altitude != null)
      logger
          .fine('SBSParser.parseSEL:   Altitude      : ${sbsMessage.altitude}');
    if (sbsMessage.groundSpeed != null)
      logger.fine(
          'SBSParser.parseSEL:   Ground Speed  : ${sbsMessage.groundSpeed}');
    if (sbsMessage.track != null)
      logger.fine('SBSParser.parseSEL:   Track         : ${sbsMessage.track}');
    logger.fine(
        'SBSParser.parseSEL:   Coordinates   : ${sbsMessage.latitude}, ${sbsMessage.longitude}');
    if (sbsMessage.verticalRate != null)
      logger.fine(
          'SBSParser.parseSEL:   Vertical Rate : ${sbsMessage.verticalRate}');
    if (sbsMessage.squawk != null && sbsMessage.squawk != '')
      logger.fine('SBSParser.parseSEL:   Squawk        : ${sbsMessage.squawk}');

    return sbsMessage;
  }

  SBSMessage parseSTA(parts) {
    SBSMessage sbsMessage;

    logger.fine('SBSParser.parseSTA: Status Change Message');
    sbsMessage = SBSMessage(
        this.source,
        parts[0],
        parts[1],
        parts[2],
        parts[3],
        parts[4],
        parts[5],
        (parts[6] as String).replaceAll(new RegExp(r'/'), '-'),
        parts[7],
        (parts[8] as String).replaceAll(new RegExp(r'/'), '-'),
        parts[9],
        parts[10],
        parts[11] != '' ? int.parse(parts[11]) : null,
        parts[12] != '' ? double.parse(parts[12]) : null,
        parts[13] != '' ? double.parse(parts[13]) : null,
        parts[14] != '' ? double.parse(parts[14]) : null,
        parts[15] != '' ? double.parse(parts[15]) : null,
        parts[16] != '' ? int.parse(parts[16]) : null,
        parts[17],
        parts[18],
        parts[19],
        parts[20],
        parts[21]);

    logger.fine('SBSParser.parseSTA:   Hex Ident     : ${sbsMessage.hexIdent}');
    logger.fine(
        'SBSParser.parseSTA:   Flight        : ${sbsMessage.flightNumber}');
    if (sbsMessage.altitude != null)
      logger
          .fine('SBSParser.parseSTA:   Altitude      : ${sbsMessage.altitude}');
    if (sbsMessage.groundSpeed != null)
      logger.fine(
          'SBSParser.parseSTA:   Ground Speed  : ${sbsMessage.groundSpeed}');
    if (sbsMessage.track != null)
      logger.fine('SBSParser.parseSTA:   Track         : ${sbsMessage.track}');
    logger.fine(
        'SBSParser.parseSTA:   Coordinates   : ${sbsMessage.latitude}, ${sbsMessage.longitude}');
    if (sbsMessage.verticalRate != null)
      logger.fine(
          'SBSParser.parseSTA:   Vertical Rate : ${sbsMessage.verticalRate}');
    if (sbsMessage.squawk != null && sbsMessage.squawk != '')
      logger.fine('SBSParser.parseSTA:   Squawk        : ${sbsMessage.squawk}');

    return sbsMessage;
  }
}

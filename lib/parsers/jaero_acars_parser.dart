import 'package:airframes_aggregation_server/models/arinc.dart';
import 'package:airframes_aggregation_server/models/jaero_acars_message.dart';
import 'package:convert/convert.dart';
import 'package:quick_log/quick_log.dart';

class JaeroACARSParser {
  Logger logger;

  JaeroACARSParser(this.logger) {}

  Future parse(String str) async {
    var lines = str.split('\n');
    logger.fine(lines.toString());

    var bits = parseHeaderLine(lines[0]);
    JaeroACARSMessage acarsMessage = JaeroACARSMessage(
        bits[0],
        bits[1],
        bits[2],
        bits[3],
        bits[4],
        bits[5],
        bits[6],
        bits[7],
        lines.sublist(1).join('\n'));

    logger.fine('ACARS');
    logger.fine('Timestamp  : ${acarsMessage.date} ${acarsMessage.time}');
    logger.fine('Hex Ident  : ${acarsMessage.hexIdent}');
    logger.fine('Mode       : ${acarsMessage.mode}');
    logger.fine('Tail       : ${acarsMessage.tail}');
    logger.fine('Flight     : ${acarsMessage.flightNumber}');
    logger.fine('Label      : ${acarsMessage.label}');
    logger.fine('Msg Number : ${acarsMessage.messageNumber}');
    logger.fine('');
    if (acarsMessage.label != 'H1')
      var arincParsed = parseARINCLine(lines[2].trim());
    logger.fine('Text       : ${acarsMessage.text}');
  }

  parseARINCHeader(String header) {
    var originator = header[0];
    var ok = int.parse(header.substring(1, 3));
    var blockSequenceChar = header[3];
    var flightNumber = header.substring(4, 10);
    // RegExp regExp = RegExp(r'^[A-Z]*(0*)');
    // flightNumber = regExp.stringMatch(flightNumber); // Remove the 0 padding in the flight number

    logger.fine('ARINC Header');
    logger.fine('Originator     : ${originator}');
    logger.fine('OK             : ${ok}');
    logger.fine('Block Seq Char : ${blockSequenceChar}');
    logger.fine('Flight Number  : ${flightNumber}');
    logger.fine('');
  }

  parseARINCLine(String line) {
    if (line.length < 10) return; // Too short to be an ARINC message

    List parts = line.split('/');
    if (parts.length != 2) return; // Not an ARINC message!

    var parsedHeader = parseARINCHeader(parts[0]);

    List<String> sections = parts[1].split('.');
    if (sections.length < 3) return;

    String mfiControlAddress = parts[1].split('.')[0];
    String chunk = parts[1].substring(parts[1].indexOf('.') + 1);
    logger.fine('chunk = ${chunk}');
    if (chunk.length < 14) return; // Too short to be an ARINC app message

    String imi = chunk.substring(0, 3);
    String tail = chunk.substring(3, 10);
    String appMessage = chunk.substring(10, chunk.length - 4);
    String crc = chunk.substring(chunk.length - 4);

    logger.fine('ARINC Application');
    logger.fine('MFI Control Address : ${mfiControlAddress}');
    logger.fine('IMI                 : ${imi}');
    logger.fine('Tail                : ${tail}');
    logger.fine('App Message         : ${appMessage}');
    logger.fine('CRC                 : ${crc}');

    switch (imi) {
      case 'ADS':
        var appMessageBytes = hex.decode(appMessage);
        logger.fine('App Message Bytes   : ${appMessageBytes}');
        bool fail = false;
        for (int i = 0; (i < appMessageBytes.length && !fail);) {
          var appDataType = appMessageBytes[i];
          switch (appDataType) {
            case ADSApplicationDataType.Acknowledgement:
              if (i + 2 > appMessageBytes.length) {
                fail = true;
                break;
              }
              logger.fine('Acknowledgement');
              var adsContractRequestNumber = appMessageBytes[i + 1];
              logger.fine(
                  'ADS Contract Request Number: ${adsContractRequestNumber}');
              i += 2;
              break;
            case ADSApplicationDataType.NegativeAcknowledgement:
              if (i + 4 > appMessageBytes.length) {
                fail = true;
                break;
              }
              logger.fine('Negative Acknowledgement');
              var adsContractRequestNumber = appMessageBytes[i + 1];
              var reason = String.fromCharCodes(
                  appMessageBytes.sublist(i + 2, i + 2 + 16));
              logger.fine(
                  'ADS Contract Request Number: ${adsContractRequestNumber}, Reason: ${reason}');
              i += 4;
              break;
            case ADSApplicationDataType.NoncomplianceNotification:
              if (i + 6 > appMessageBytes.length) {
                fail = true;
                break;
              }
              logger.fine('Noncompliance Notification');
              i += 6;
              break;
            case ADSApplicationDataType.CancelEmergencyMode:
              if (i + 1 > appMessageBytes.length) {
                fail = true;
                break;
              }
              logger.fine('Cancel Emergency Mode');
              i += 1;
              break;
            case ADSApplicationDataType.BasicReport:
            case ADSApplicationDataType.EmergencyBasicReport:
            case ADSApplicationDataType.LateralDeviationChangeEvent:
            case ADSApplicationDataType.VerticalRateChangeEvent:
            case ADSApplicationDataType.AltitudeRangeEvent:
            case ADSApplicationDataType.WaypointChangeEvent:
              if (i + 11 > appMessageBytes.length) {
                fail = true;
                break;
              }
              logger.fine(ADSApplicationDataType.value(appDataType));
              i += 11;
              break;
            case ADSApplicationDataType.FlightIdentificationGroup:
              if (i + 7 > appMessageBytes.length) {
                fail = true;
                break;
              }
              logger.fine('Flight Identification Group');
              i += 7;
              break;
            case ADSApplicationDataType.PredictedRouteGroup:
              if (i + 18 > appMessageBytes.length) {
                fail = true;
                break;
              }
              logger.fine('Predicted Route Group');
              i += 18;
              break;
            case ADSApplicationDataType.EarthReferenceGroup:
              if (i + 6 > appMessageBytes.length) {
                fail = true;
                break;
              }
              logger.fine('Earth Reference Group');
              i += 6;
              break;
            case ADSApplicationDataType.AirReferenceGroup:
              if (i + 6 > appMessageBytes.length) {
                fail = true;
                break;
              }
              logger.fine('Air Reference Group');
              i += 6;
              break;
            case ADSApplicationDataType.MeteorologicalGroup:
              if (i + 5 > appMessageBytes.length) {
                fail = true;
                break;
              }
              logger.fine('Meteorological Group');
              i += 5;
              break;
            case ADSApplicationDataType.AirframeIdentificationGroup:
              if (i + 4 > appMessageBytes.length) {
                fail = true;
                break;
              }
              logger.fine('Airframe Identification Group');
              i += 4;
              break;
            case ADSApplicationDataType.IntermediateProjectedIntentGroup:
              if (i + 9 > appMessageBytes.length) {
                fail = true;
                break;
              }
              logger.fine('Intermediate Projected Intent Group');
              i += 9;
              break;
            case ADSApplicationDataType.FixedProjectedIntentGroup:
              if (i + 10 > appMessageBytes.length) {
                fail = true;
                break;
              }
              logger.fine('Fixed Projected Intent Group');
              i += 10;
              break;
            default:
              break;
          }
        }
        break;
      default:
    }

    logger.fine('');
  }

  parseHeaderLine(String line) {
    var parts = line.split(' ');
    return [
      parts[1],
      parts[0],
      parts[2].split(':')[1],
      parts[4],
      parts[5],
      parts[7],
      parts[8],
      parts.length >= 11 ? parts.elementAt(10) : null
    ];
  }
}

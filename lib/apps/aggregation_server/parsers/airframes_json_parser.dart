import 'dart:convert';

import 'package:quick_log/quick_log.dart';

class AirframesJsonParser {
  Logger logger;

  AirframesJsonParser(this.logger) {}

  Future parse(String str) async {
    var json = jsonDecode(str);
    this.logger.fine('Parsed Airframes JSON: ' + json);
    return json;
  }
}

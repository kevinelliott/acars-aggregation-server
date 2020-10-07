import 'dart:convert';

import 'package:airframes_aggregation_server/common.dart';
import 'package:quick_log/quick_log.dart';

class JsonMessageParser {
  Logger logger;

  JsonMessageParser(this.logger) {}

  Future parse(String str) async {
    var jsonMessage = JsonMessage.fromJson(jsonDecode(str));
    this.logger.fine('Parsed JSON');
    return jsonMessage;
  }
}

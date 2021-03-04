import 'package:quick_log/quick_log.dart';

import 'package:airframes_aggregation_server/common.dart';

class Processor {
  Source source;
  Logger logger;

  Processor(Source this.source, Logger this.logger) {}

  Future process(String str, String ipAddress) async {}
}

import 'package:quick_log/quick_log.dart';

import 'package:acars_aggregation_server/aas.dart';

class Processor {
  Source source;
  Logger logger;

  Processor(Source this.source, Logger this.logger) {
  }

  Future process(String str, String ipAddress) async {
  }
}
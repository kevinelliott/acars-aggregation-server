import 'package:acars_aggregation_server/aas.dart';

class Tail {
  String sourceText;

  Tail(String this.sourceText) {
  }

  String sanitize() {
    return sourceText.replaceAll('-', '');
  }

  String formatted() {
    // Call country() to determine country
    // Then utilize format for specific country
    return sourceText;
  }

  String country() {
    // Harness the FAA Aircraft Nationality Assignments - Aircraft Registration Marks to determine country
  }
}

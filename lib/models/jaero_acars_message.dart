class JaeroACARSMessage {
  String date;
  String time;
  String hexIdent;
  String mode;
  String tail;
  String label;
  String messageNumber;
  String flightNumber;
  String text;

  JaeroACARSMessage(
    this.date,
    this.time,
    this.hexIdent,
    this.mode,
    this.tail,
    this.label,
    this.messageNumber,
    this.flightNumber,
    this.text
  ) {}
}

import 'basic_message.dart';

class SBSMessage extends BasicMessage {
  String type;
  String transmissionType;
  String sessionId; // Not used generally
  String aircraftId; // Not used generally
  String hexIdent; // Aircraft Mode S hexadecimal code
  String flightId; // Not used generally
  String dateGenerated;
  String timeGenerated;
  String dateLogged;
  String timeLogged;
  String flightNumber; // Flight Number
  String tail; // Tail / Registration
  String sanitizedTail; // Sanitized
  int altitude; // Mode C altitude. Height relative to 1013.2mb (Flight Level). Not height AMSL.
  double groundSpeed; // Speed over ground (not indicated airspeed).
  double
      track; // Track of aircraft (not heading). Derived from the velocity E/W and velocity N/S.
  double latitude; // North and East positive. South and West negative.
  double longitude; // North and East positive. South and West negative.
  int verticalRate; // 64ft resolution
  String squawk; // Assigned Mode A squawk code.
  String alert; // Flag to indicate squawk has changed.
  String emergency; // Flag to indicate emergency code has been set.
  String spi; // Flag to indicate transponder Ident has been activated.
  String isOnGround; // Flag to indicate ground squat switch is active.

  SBSMessage(
      source,
      this.type,
      this.transmissionType,
      this.sessionId,
      this.aircraftId,
      this.hexIdent,
      this.flightId,
      this.dateGenerated,
      this.timeGenerated,
      this.dateLogged,
      this.timeLogged,
      this.flightNumber,
      this.altitude,
      this.groundSpeed,
      this.track,
      this.latitude,
      this.longitude,
      this.verticalRate,
      this.squawk,
      this.alert,
      this.emergency,
      this.spi,
      this.isOnGround)
      : super(source) {}
}

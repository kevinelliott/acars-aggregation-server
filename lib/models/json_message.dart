import 'package:json_annotation/json_annotation.dart';

part 'json_message.g.dart';

@JsonSerializable(nullable: true, includeIfNull: true)
class JsonMessage {
  @JsonKey(nullable: false, fromJson: _dateTimeFromEpochUs)
  final DateTime timestamp;

  @JsonKey(name: 'station_id')
  final String stationIdent;

  String source;

  String sourceType;

  String linkDirection;

  @JsonKey(
      name: 'fromaddr',
      fromJson: _uintShiftAndHex,
      nullable: true,
      includeIfNull: false)
  String fromHex;

  @JsonKey(
      name: 'toaddr',
      fromJson: _uintShiftAndHex,
      nullable: true,
      includeIfNull: false)
  String toHex;

  @JsonKey(fromJson: _uintShiftAndHex)
  final String icao;

  final int channel;

  @JsonKey(name: 'freq', nullable: true)
  final double frequency;

  final int level;

  @JsonKey(name: 'error', defaultValue: 0)
  final int error;

  final String mode;

  final String label;

  @JsonKey(name: 'block_id', nullable: true)
  final String blockId;

  @JsonKey(fromJson: _stringFromOptionalBool, toJson: _optionalNullToString)
  final String ack;

  String tail;

  String sanitizedTail;

  @JsonKey(name: 'flight', nullable: true)
  final String flightNumber;

  @JsonKey(name: 'msgno', nullable: true)
  final String messageNumber;

  final String data;

  final String text;

  @JsonKey(name: 'depa', nullable: true)
  final String departingAirport;

  @JsonKey(name: 'dsta', nullable: true)
  final String destinationAirport;

  @JsonKey(name: 'lat', nullable: true, includeIfNull: true)
  final double latitude;

  @JsonKey(name: 'lon', nullable: true, includeIfNull: true)
  final double longitude;

  @JsonKey(name: 'alt', nullable: true, includeIfNull: true)
  final int altitude;

  @JsonKey(name: 'end', defaultValue: false)
  final bool blockEnd;

  JsonMessage(
      {this.timestamp,
      this.stationIdent,
      this.source,
      this.sourceType,
      this.linkDirection,
      this.fromHex,
      this.toHex,
      this.icao,
      this.channel,
      this.frequency,
      this.level,
      this.error,
      this.mode,
      this.label,
      this.blockId,
      this.ack,
      this.tail,
      this.flightNumber,
      this.messageNumber,
      this.data,
      this.text,
      this.departingAirport,
      this.destinationAirport,
      this.latitude,
      this.longitude,
      this.altitude,
      this.blockEnd});

  factory JsonMessage.fromJson(Map<String, dynamic> json) =>
      _$JsonMessageFromJson(json);

  Map<String, dynamic> toJson() => _$JsonMessageToJson(this);

  static DateTime _dateTimeFromEpochUs(double us) => us == null
      ? null
      : DateTime.fromMillisecondsSinceEpoch((us * 1000).toInt());

  static String _stringFromOptionalBool(item) =>
      item == false || item == null ? '!' : item;

  static String _optionalNullToString(item) =>
      item == 'null' || item == 'false' ? '!' : item;

  static String _uintShiftAndHex(value) =>
      value == null ? null : (value & 0xffffff).toRadixString(16);
}

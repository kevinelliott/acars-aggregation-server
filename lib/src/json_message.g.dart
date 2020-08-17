// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JsonMessage _$JsonMessageFromJson(Map<String, dynamic> json) {
  return JsonMessage(
    timestamp: JsonMessage._dateTimeFromEpochUs(json['timestamp'] as double),
    stationIdent: json['station_id'] as String,
    source: json['source'] as String,
    sourceType: json['sourceType'] as String,
    linkDirection: json['linkDirection'] as String,
    fromHex: JsonMessage._uintShiftAndHex(json['fromaddr']),
    toHex: JsonMessage._uintShiftAndHex(json['toaddr']),
    icao: JsonMessage._uintShiftAndHex(json['icao']),
    channel: json['channel'] as int,
    frequency: (json['freq'] as num)?.toDouble(),
    level: json['level'] as int,
    error: json['error'] as int,
    mode: json['mode'] as String,
    label: json['label'] as String,
    blockId: json['block_id'] as String,
    ack: JsonMessage._stringFromOptionalBool(json['ack']),
    tail: json['tail'] as String,
    flightNumber: json['flight'] as String,
    messageNumber: json['msgno'] as String,
    data: json['data'] as String,
    text: json['text'] as String,
    departingAirport: json['depa'] as String,
    destinationAirport: json['dsta'] as String,
    latitude: (json['lat'] as num)?.toDouble(),
    longitude: (json['lon'] as num)?.toDouble(),
    altitude: json['alt'] as int,
    blockEnd: json['end'] as bool,
  )..sanitizedTail = json['sanitizedTail'] as String;
}

Map<String, dynamic> _$JsonMessageToJson(JsonMessage instance) {
  final val = <String, dynamic>{
    'timestamp': instance.timestamp.toIso8601String(),
    'station_id': instance.stationIdent,
    'source': instance.source,
    'sourceType': instance.sourceType,
    'linkDirection': instance.linkDirection,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('fromaddr', instance.fromHex);
  writeNotNull('toaddr', instance.toHex);
  val['icao'] = instance.icao;
  val['channel'] = instance.channel;
  val['freq'] = instance.frequency;
  val['level'] = instance.level;
  val['error'] = instance.error;
  val['mode'] = instance.mode;
  val['label'] = instance.label;
  val['block_id'] = instance.blockId;
  val['ack'] = JsonMessage._optionalNullToString(instance.ack);
  val['tail'] = instance.tail;
  val['sanitizedTail'] = instance.sanitizedTail;
  val['flight'] = instance.flightNumber;
  val['msgno'] = instance.messageNumber;
  val['data'] = instance.data;
  val['text'] = instance.text;
  val['depa'] = instance.departingAirport;
  val['dsta'] = instance.destinationAirport;
  val['lat'] = instance.latitude;
  val['lon'] = instance.longitude;
  val['alt'] = instance.altitude;
  val['end'] = instance.blockEnd;
  return val;
}

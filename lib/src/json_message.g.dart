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
    frequency: (json['freq'] as num).toDouble(),
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

Map<String, dynamic> _$JsonMessageToJson(JsonMessage instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp.toIso8601String(),
      'station_id': instance.stationIdent,
      'source': instance.source,
      'sourceType': instance.sourceType,
      'linkDirection': instance.linkDirection,
      'fromaddr': instance.fromHex,
      'toaddr': instance.toHex,
      'icao': instance.icao,
      'channel': instance.channel,
      'freq': instance.frequency,
      'level': instance.level,
      'error': instance.error,
      'mode': instance.mode,
      'label': instance.label,
      'block_id': instance.blockId,
      'ack': JsonMessage._optionalNullToString(instance.ack),
      'tail': instance.tail,
      'sanitizedTail': instance.sanitizedTail,
      'flight': instance.flightNumber,
      'msgno': instance.messageNumber,
      'data': instance.data,
      'text': instance.text,
      'depa': instance.departingAirport,
      'dsta': instance.destinationAirport,
      'lat': instance.latitude,
      'lon': instance.longitude,
      'alt': instance.altitude,
      'end': instance.blockEnd,
    };

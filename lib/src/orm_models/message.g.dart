// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// OrmGenerator
// **************************************************************************

class MessageQuery extends Query<Message, MessageQueryWhere> {
  MessageQuery({Set<String> trampoline}) {
    trampoline ??= Set();
    trampoline.add(tableName);
    _where = MessageQueryWhere(this);
  }

  @override
  final MessageQueryValues values = MessageQueryValues();

  MessageQueryWhere _where;

  @override
  get casts {
    return {'frequency': 'text', 'latitude': 'text', 'longitude': 'text'};
  }

  @override
  get tableName {
    return 'messages';
  }

  @override
  get fields {
    return const [
      'id',
      'created_at',
      'updated_at',
      'timestamp',
      'station_id',
      'airframe_id',
      'flight_id',
      'source',
      'source_type',
      'link_direction',
      'from_hex',
      'to_hex',
      'channel',
      'frequency',
      'level',
      'error',
      'mode',
      'label',
      'block_id',
      'ack',
      'tail',
      'flight',
      'message_number',
      'data',
      'text',
      'departing_airport',
      'destination_airport',
      'latitude',
      'longitude',
      'altitude',
      'block_end'
    ];
  }

  @override
  MessageQueryWhere get where {
    return _where;
  }

  @override
  MessageQueryWhere newWhereClause() {
    return MessageQueryWhere(this);
  }

  static Message parseRow(List row) {
    if (row.every((x) => x == null)) return null;
    var model = Message(
        id: row[0].toString(),
        createdAt: (row[1] as DateTime),
        updatedAt: (row[2] as DateTime),
        timestamp: (row[3] as DateTime),
        stationId: (row[4] as int),
        airframeId: (row[5] as int),
        flightId: (row[6] as int),
        source: (row[7] as String),
        sourceType: (row[8] as String),
        linkDirection: (row[9] as String),
        fromHex: (row[10] as String),
        toHex: (row[11] as String),
        channel: (row[12] as int),
        frequency: double.tryParse(row[13].toString()),
        level: (row[14] as int),
        error: (row[15] as int),
        mode: (row[16] as String),
        label: (row[17] as String),
        blockId: (row[18] as String),
        ack: (row[19] as String),
        tail: (row[20] as String),
        flight: (row[21] as String),
        messageNumber: (row[22] as String),
        data: (row[23] as String),
        text: (row[24] as String),
        departingAirport: (row[25] as String),
        destinationAirport: (row[26] as String),
        latitude: double.tryParse(row[27].toString()),
        longitude: double.tryParse(row[28].toString()),
        altitude: (row[29] as int),
        blockEnd: (row[30] as bool));
    return model;
  }

  @override
  deserialize(List row) {
    return parseRow(row);
  }
}

class MessageQueryWhere extends QueryWhere {
  MessageQueryWhere(MessageQuery query)
      : id = NumericSqlExpressionBuilder<int>(query, 'id'),
        createdAt = DateTimeSqlExpressionBuilder(query, 'created_at'),
        updatedAt = DateTimeSqlExpressionBuilder(query, 'updated_at'),
        timestamp = DateTimeSqlExpressionBuilder(query, 'timestamp'),
        stationId = NumericSqlExpressionBuilder<int>(query, 'station_id'),
        airframeId = NumericSqlExpressionBuilder<int>(query, 'airframe_id'),
        flightId = NumericSqlExpressionBuilder<int>(query, 'flight_id'),
        source = StringSqlExpressionBuilder(query, 'source'),
        sourceType = StringSqlExpressionBuilder(query, 'source_type'),
        linkDirection = StringSqlExpressionBuilder(query, 'link_direction'),
        fromHex = StringSqlExpressionBuilder(query, 'from_hex'),
        toHex = StringSqlExpressionBuilder(query, 'to_hex'),
        channel = NumericSqlExpressionBuilder<int>(query, 'channel'),
        frequency = NumericSqlExpressionBuilder<double>(query, 'frequency'),
        level = NumericSqlExpressionBuilder<int>(query, 'level'),
        error = NumericSqlExpressionBuilder<int>(query, 'error'),
        mode = StringSqlExpressionBuilder(query, 'mode'),
        label = StringSqlExpressionBuilder(query, 'label'),
        blockId = StringSqlExpressionBuilder(query, 'block_id'),
        ack = StringSqlExpressionBuilder(query, 'ack'),
        tail = StringSqlExpressionBuilder(query, 'tail'),
        flight = StringSqlExpressionBuilder(query, 'flight'),
        messageNumber = StringSqlExpressionBuilder(query, 'message_number'),
        data = StringSqlExpressionBuilder(query, 'data'),
        text = StringSqlExpressionBuilder(query, 'text'),
        departingAirport =
            StringSqlExpressionBuilder(query, 'departing_airport'),
        destinationAirport =
            StringSqlExpressionBuilder(query, 'destination_airport'),
        latitude = NumericSqlExpressionBuilder<double>(query, 'latitude'),
        longitude = NumericSqlExpressionBuilder<double>(query, 'longitude'),
        altitude = NumericSqlExpressionBuilder<int>(query, 'altitude'),
        blockEnd = BooleanSqlExpressionBuilder(query, 'block_end');

  final NumericSqlExpressionBuilder<int> id;

  final DateTimeSqlExpressionBuilder createdAt;

  final DateTimeSqlExpressionBuilder updatedAt;

  final DateTimeSqlExpressionBuilder timestamp;

  final NumericSqlExpressionBuilder<int> stationId;

  final NumericSqlExpressionBuilder<int> airframeId;

  final NumericSqlExpressionBuilder<int> flightId;

  final StringSqlExpressionBuilder source;

  final StringSqlExpressionBuilder sourceType;

  final StringSqlExpressionBuilder linkDirection;

  final StringSqlExpressionBuilder fromHex;

  final StringSqlExpressionBuilder toHex;

  final NumericSqlExpressionBuilder<int> channel;

  final NumericSqlExpressionBuilder<double> frequency;

  final NumericSqlExpressionBuilder<int> level;

  final NumericSqlExpressionBuilder<int> error;

  final StringSqlExpressionBuilder mode;

  final StringSqlExpressionBuilder label;

  final StringSqlExpressionBuilder blockId;

  final StringSqlExpressionBuilder ack;

  final StringSqlExpressionBuilder tail;

  final StringSqlExpressionBuilder flight;

  final StringSqlExpressionBuilder messageNumber;

  final StringSqlExpressionBuilder data;

  final StringSqlExpressionBuilder text;

  final StringSqlExpressionBuilder departingAirport;

  final StringSqlExpressionBuilder destinationAirport;

  final NumericSqlExpressionBuilder<double> latitude;

  final NumericSqlExpressionBuilder<double> longitude;

  final NumericSqlExpressionBuilder<int> altitude;

  final BooleanSqlExpressionBuilder blockEnd;

  @override
  get expressionBuilders {
    return [
      id,
      createdAt,
      updatedAt,
      timestamp,
      stationId,
      airframeId,
      flightId,
      source,
      sourceType,
      linkDirection,
      fromHex,
      toHex,
      channel,
      frequency,
      level,
      error,
      mode,
      label,
      blockId,
      ack,
      tail,
      flight,
      messageNumber,
      data,
      text,
      departingAirport,
      destinationAirport,
      latitude,
      longitude,
      altitude,
      blockEnd
    ];
  }
}

class MessageQueryValues extends MapQueryValues {
  @override
  get casts {
    return {
      'frequency': 'decimal',
      'latitude': 'decimal',
      'longitude': 'decimal'
    };
  }

  String get id {
    return (values['id'] as String);
  }

  set id(String value) => values['id'] = value;
  DateTime get createdAt {
    return (values['created_at'] as DateTime);
  }

  set createdAt(DateTime value) => values['created_at'] = value;
  DateTime get updatedAt {
    return (values['updated_at'] as DateTime);
  }

  set updatedAt(DateTime value) => values['updated_at'] = value;
  DateTime get timestamp {
    return (values['timestamp'] as DateTime);
  }

  set timestamp(DateTime value) => values['timestamp'] = value;
  int get stationId {
    return (values['station_id'] as int);
  }

  set stationId(int value) => values['station_id'] = value;
  int get airframeId {
    return (values['airframe_id'] as int);
  }

  set airframeId(int value) => values['airframe_id'] = value;
  int get flightId {
    return (values['flight_id'] as int);
  }

  set flightId(int value) => values['flight_id'] = value;
  String get source {
    return (values['source'] as String);
  }

  set source(String value) => values['source'] = value;
  String get sourceType {
    return (values['source_type'] as String);
  }

  set sourceType(String value) => values['source_type'] = value;
  String get linkDirection {
    return (values['link_direction'] as String);
  }

  set linkDirection(String value) => values['link_direction'] = value;
  String get fromHex {
    return (values['from_hex'] as String);
  }

  set fromHex(String value) => values['from_hex'] = value;
  String get toHex {
    return (values['to_hex'] as String);
  }

  set toHex(String value) => values['to_hex'] = value;
  int get channel {
    return (values['channel'] as int);
  }

  set channel(int value) => values['channel'] = value;
  double get frequency {
    return double.tryParse((values['frequency'] as String));
  }

  set frequency(double value) => values['frequency'] = value.toString();
  int get level {
    return (values['level'] as int);
  }

  set level(int value) => values['level'] = value;
  int get error {
    return (values['error'] as int);
  }

  set error(int value) => values['error'] = value;
  String get mode {
    return (values['mode'] as String);
  }

  set mode(String value) => values['mode'] = value;
  String get label {
    return (values['label'] as String);
  }

  set label(String value) => values['label'] = value;
  String get blockId {
    return (values['block_id'] as String);
  }

  set blockId(String value) => values['block_id'] = value;
  String get ack {
    return (values['ack'] as String);
  }

  set ack(String value) => values['ack'] = value;
  String get tail {
    return (values['tail'] as String);
  }

  set tail(String value) => values['tail'] = value;
  String get flight {
    return (values['flight'] as String);
  }

  set flight(String value) => values['flight'] = value;
  String get messageNumber {
    return (values['message_number'] as String);
  }

  set messageNumber(String value) => values['message_number'] = value;
  String get data {
    return (values['data'] as String);
  }

  set data(String value) => values['data'] = value;
  String get text {
    return (values['text'] as String);
  }

  set text(String value) => values['text'] = value;
  String get departingAirport {
    return (values['departing_airport'] as String);
  }

  set departingAirport(String value) => values['departing_airport'] = value;
  String get destinationAirport {
    return (values['destination_airport'] as String);
  }

  set destinationAirport(String value) => values['destination_airport'] = value;
  double get latitude {
    return double.tryParse((values['latitude'] as String));
  }

  set latitude(double value) => values['latitude'] = value.toString();
  double get longitude {
    return double.tryParse((values['longitude'] as String));
  }

  set longitude(double value) => values['longitude'] = value.toString();
  int get altitude {
    return (values['altitude'] as int);
  }

  set altitude(int value) => values['altitude'] = value;
  bool get blockEnd {
    return (values['block_end'] as bool);
  }

  set blockEnd(bool value) => values['block_end'] = value;
  void copyFrom(Message model) {
    createdAt = model.createdAt;
    updatedAt = model.updatedAt;
    timestamp = model.timestamp;
    stationId = model.stationId;
    airframeId = model.airframeId;
    flightId = model.flightId;
    source = model.source;
    sourceType = model.sourceType;
    linkDirection = model.linkDirection;
    fromHex = model.fromHex;
    toHex = model.toHex;
    channel = model.channel;
    frequency = model.frequency;
    level = model.level;
    error = model.error;
    mode = model.mode;
    label = model.label;
    blockId = model.blockId;
    ack = model.ack;
    tail = model.tail;
    flight = model.flight;
    messageNumber = model.messageNumber;
    data = model.data;
    text = model.text;
    departingAirport = model.departingAirport;
    destinationAirport = model.destinationAirport;
    latitude = model.latitude;
    longitude = model.longitude;
    altitude = model.altitude;
    blockEnd = model.blockEnd;
  }
}

// **************************************************************************
// JsonModelGenerator
// **************************************************************************

@generatedSerializable
class Message extends _Message {
  Message(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.timestamp,
      this.stationId,
      this.airframeId,
      this.flightId,
      this.source,
      this.sourceType,
      this.linkDirection,
      this.fromHex,
      this.toHex,
      this.channel,
      this.frequency,
      this.level,
      this.error,
      this.mode,
      this.label,
      this.blockId,
      this.ack,
      this.tail,
      this.flight,
      this.messageNumber,
      this.data,
      this.text,
      this.departingAirport,
      this.destinationAirport,
      this.latitude,
      this.longitude,
      this.altitude,
      this.blockEnd});

  /// A unique identifier corresponding to this item.
  @override
  String id;

  /// The time at which this item was created.
  @override
  DateTime createdAt;

  /// The last time at which this item was updated.
  @override
  DateTime updatedAt;

  @override
  final DateTime timestamp;

  @override
  final int stationId;

  @override
  final int airframeId;

  @override
  final int flightId;

  @override
  final String source;

  @override
  final String sourceType;

  @override
  final String linkDirection;

  @override
  final String fromHex;

  @override
  final String toHex;

  @override
  final int channel;

  @override
  final double frequency;

  @override
  final int level;

  @override
  final int error;

  @override
  final String mode;

  @override
  final String label;

  @override
  final String blockId;

  @override
  final String ack;

  @override
  final String tail;

  @override
  final String flight;

  @override
  final String messageNumber;

  @override
  final String data;

  @override
  final String text;

  @override
  final String departingAirport;

  @override
  final String destinationAirport;

  @override
  final double latitude;

  @override
  final double longitude;

  @override
  final int altitude;

  @override
  final bool blockEnd;

  Message copyWith(
      {String id,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime timestamp,
      int stationId,
      int airframeId,
      int flightId,
      String source,
      String sourceType,
      String linkDirection,
      String fromHex,
      String toHex,
      int channel,
      double frequency,
      int level,
      int error,
      String mode,
      String label,
      String blockId,
      String ack,
      String tail,
      String flight,
      String messageNumber,
      String data,
      String text,
      String departingAirport,
      String destinationAirport,
      double latitude,
      double longitude,
      int altitude,
      bool blockEnd}) {
    return Message(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        timestamp: timestamp ?? this.timestamp,
        stationId: stationId ?? this.stationId,
        airframeId: airframeId ?? this.airframeId,
        flightId: flightId ?? this.flightId,
        source: source ?? this.source,
        sourceType: sourceType ?? this.sourceType,
        linkDirection: linkDirection ?? this.linkDirection,
        fromHex: fromHex ?? this.fromHex,
        toHex: toHex ?? this.toHex,
        channel: channel ?? this.channel,
        frequency: frequency ?? this.frequency,
        level: level ?? this.level,
        error: error ?? this.error,
        mode: mode ?? this.mode,
        label: label ?? this.label,
        blockId: blockId ?? this.blockId,
        ack: ack ?? this.ack,
        tail: tail ?? this.tail,
        flight: flight ?? this.flight,
        messageNumber: messageNumber ?? this.messageNumber,
        data: data ?? this.data,
        text: text ?? this.text,
        departingAirport: departingAirport ?? this.departingAirport,
        destinationAirport: destinationAirport ?? this.destinationAirport,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        altitude: altitude ?? this.altitude,
        blockEnd: blockEnd ?? this.blockEnd);
  }

  bool operator ==(other) {
    return other is _Message &&
        other.id == id &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.timestamp == timestamp &&
        other.stationId == stationId &&
        other.airframeId == airframeId &&
        other.flightId == flightId &&
        other.source == source &&
        other.sourceType == sourceType &&
        other.linkDirection == linkDirection &&
        other.fromHex == fromHex &&
        other.toHex == toHex &&
        other.channel == channel &&
        other.frequency == frequency &&
        other.level == level &&
        other.error == error &&
        other.mode == mode &&
        other.label == label &&
        other.blockId == blockId &&
        other.ack == ack &&
        other.tail == tail &&
        other.flight == flight &&
        other.messageNumber == messageNumber &&
        other.data == data &&
        other.text == text &&
        other.departingAirport == departingAirport &&
        other.destinationAirport == destinationAirport &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.altitude == altitude &&
        other.blockEnd == blockEnd;
  }

  @override
  int get hashCode {
    return hashObjects([
      id,
      createdAt,
      updatedAt,
      timestamp,
      stationId,
      airframeId,
      flightId,
      source,
      sourceType,
      linkDirection,
      fromHex,
      toHex,
      channel,
      frequency,
      level,
      error,
      mode,
      label,
      blockId,
      ack,
      tail,
      flight,
      messageNumber,
      data,
      text,
      departingAirport,
      destinationAirport,
      latitude,
      longitude,
      altitude,
      blockEnd
    ]);
  }

  @override
  String toString() {
    return "Message(id=$id, createdAt=$createdAt, updatedAt=$updatedAt, timestamp=$timestamp, stationId=$stationId, airframeId=$airframeId, flightId=$flightId, source=$source, sourceType=$sourceType, linkDirection=$linkDirection, fromHex=$fromHex, toHex=$toHex, channel=$channel, frequency=$frequency, level=$level, error=$error, mode=$mode, label=$label, blockId=$blockId, ack=$ack, tail=$tail, flight=$flight, messageNumber=$messageNumber, data=$data, text=$text, departingAirport=$departingAirport, destinationAirport=$destinationAirport, latitude=$latitude, longitude=$longitude, altitude=$altitude, blockEnd=$blockEnd)";
  }

  Map<String, dynamic> toJson() {
    return MessageSerializer.toMap(this);
  }
}

// **************************************************************************
// SerializerGenerator
// **************************************************************************

const MessageSerializer messageSerializer = MessageSerializer();

class MessageEncoder extends Converter<Message, Map> {
  const MessageEncoder();

  @override
  Map convert(Message model) => MessageSerializer.toMap(model);
}

class MessageDecoder extends Converter<Map, Message> {
  const MessageDecoder();

  @override
  Message convert(Map map) => MessageSerializer.fromMap(map);
}

class MessageSerializer extends Codec<Message, Map> {
  const MessageSerializer();

  @override
  get encoder => const MessageEncoder();
  @override
  get decoder => const MessageDecoder();
  static Message fromMap(Map map) {
    return Message(
        id: map['id'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null,
        timestamp: map['timestamp'] != null
            ? (map['timestamp'] is DateTime
                ? (map['timestamp'] as DateTime)
                : DateTime.parse(map['timestamp'].toString()))
            : null,
        stationId: map['station_id'] as int,
        airframeId: map['airframe_id'] as int,
        flightId: map['flight_id'] as int,
        source: map['source'] as String,
        sourceType: map['source_type'] as String,
        linkDirection: map['link_direction'] as String,
        fromHex: map['from_hex'] as String,
        toHex: map['to_hex'] as String,
        channel: map['channel'] as int,
        frequency: map['frequency'] as double,
        level: map['level'] as int,
        error: map['error'] as int,
        mode: map['mode'] as String,
        label: map['label'] as String,
        blockId: map['block_id'] as String,
        ack: map['ack'] as String,
        tail: map['tail'] as String,
        flight: map['flight'] as String,
        messageNumber: map['message_number'] as String,
        data: map['data'] as String,
        text: map['text'] as String,
        departingAirport: map['departing_airport'] as String,
        destinationAirport: map['destination_airport'] as String,
        latitude: map['latitude'] as double,
        longitude: map['longitude'] as double,
        altitude: map['altitude'] as int,
        blockEnd: map['block_end'] as bool);
  }

  static Map<String, dynamic> toMap(_Message model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String(),
      'timestamp': model.timestamp?.toIso8601String(),
      'station_id': model.stationId,
      'airframe_id': model.airframeId,
      'flight_id': model.flightId,
      'source': model.source,
      'source_type': model.sourceType,
      'link_direction': model.linkDirection,
      'from_hex': model.fromHex,
      'to_hex': model.toHex,
      'channel': model.channel,
      'frequency': model.frequency,
      'level': model.level,
      'error': model.error,
      'mode': model.mode,
      'label': model.label,
      'block_id': model.blockId,
      'ack': model.ack,
      'tail': model.tail,
      'flight': model.flight,
      'message_number': model.messageNumber,
      'data': model.data,
      'text': model.text,
      'departing_airport': model.departingAirport,
      'destination_airport': model.destinationAirport,
      'latitude': model.latitude,
      'longitude': model.longitude,
      'altitude': model.altitude,
      'block_end': model.blockEnd
    };
  }
}

abstract class MessageFields {
  static const List<String> allFields = <String>[
    id,
    createdAt,
    updatedAt,
    timestamp,
    stationId,
    airframeId,
    flightId,
    source,
    sourceType,
    linkDirection,
    fromHex,
    toHex,
    channel,
    frequency,
    level,
    error,
    mode,
    label,
    blockId,
    ack,
    tail,
    flight,
    messageNumber,
    data,
    text,
    departingAirport,
    destinationAirport,
    latitude,
    longitude,
    altitude,
    blockEnd
  ];

  static const String id = 'id';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';

  static const String timestamp = 'timestamp';

  static const String stationId = 'station_id';

  static const String airframeId = 'airframe_id';

  static const String flightId = 'flight_id';

  static const String source = 'source';

  static const String sourceType = 'source_type';

  static const String linkDirection = 'link_direction';

  static const String fromHex = 'from_hex';

  static const String toHex = 'to_hex';

  static const String channel = 'channel';

  static const String frequency = 'frequency';

  static const String level = 'level';

  static const String error = 'error';

  static const String mode = 'mode';

  static const String label = 'label';

  static const String blockId = 'block_id';

  static const String ack = 'ack';

  static const String tail = 'tail';

  static const String flight = 'flight';

  static const String messageNumber = 'message_number';

  static const String data = 'data';

  static const String text = 'text';

  static const String departingAirport = 'departing_airport';

  static const String destinationAirport = 'destination_airport';

  static const String latitude = 'latitude';

  static const String longitude = 'longitude';

  static const String altitude = 'altitude';

  static const String blockEnd = 'block_end';
}

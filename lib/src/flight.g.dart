// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight.dart';

// **************************************************************************
// OrmGenerator
// **************************************************************************

class FlightQuery extends Query<Flight, FlightQueryWhere> {
  FlightQuery({Set<String> trampoline}) {
    trampoline ??= Set();
    trampoline.add(tableName);
    _where = FlightQueryWhere(this);
  }

  @override
  final FlightQueryValues values = FlightQueryValues();

  FlightQueryWhere _where;

  @override
  get casts {
    return {'latitude': 'text', 'longitude': 'text'};
  }

  @override
  get tableName {
    return 'flights';
  }

  @override
  get fields {
    return const [
      'id',
      'created_at',
      'updated_at',
      'airframe_id',
      'flight',
      'departing_airport',
      'destination_airport',
      'latitude',
      'longitude',
      'altitude',
      'messages_count',
      'status'
    ];
  }

  @override
  FlightQueryWhere get where {
    return _where;
  }

  @override
  FlightQueryWhere newWhereClause() {
    return FlightQueryWhere(this);
  }

  static Flight parseRow(List row) {
    if (row.every((x) => x == null)) return null;
    var model = Flight(
        id: row[0].toString(),
        createdAt: (row[1] as DateTime),
        updatedAt: (row[2] as DateTime),
        airframeId: (row[3] as int),
        flight: (row[4] as String),
        departingAirport: (row[5] as String),
        destinationAirport: (row[6] as String),
        latitude: double.tryParse(row[7].toString()),
        longitude: double.tryParse(row[8].toString()),
        altitude: (row[9] as int),
        messagesCount: (row[10] as int),
        status: (row[11] as String));
    return model;
  }

  @override
  deserialize(List row) {
    return parseRow(row);
  }
}

class FlightQueryWhere extends QueryWhere {
  FlightQueryWhere(FlightQuery query)
      : id = NumericSqlExpressionBuilder<int>(query, 'id'),
        createdAt = DateTimeSqlExpressionBuilder(query, 'created_at'),
        updatedAt = DateTimeSqlExpressionBuilder(query, 'updated_at'),
        airframeId = NumericSqlExpressionBuilder<int>(query, 'airframe_id'),
        flight = StringSqlExpressionBuilder(query, 'flight'),
        departingAirport =
            StringSqlExpressionBuilder(query, 'departing_airport'),
        destinationAirport =
            StringSqlExpressionBuilder(query, 'destination_airport'),
        latitude = NumericSqlExpressionBuilder<double>(query, 'latitude'),
        longitude = NumericSqlExpressionBuilder<double>(query, 'longitude'),
        altitude = NumericSqlExpressionBuilder<int>(query, 'altitude'),
        messagesCount =
            NumericSqlExpressionBuilder<int>(query, 'messages_count'),
        status = StringSqlExpressionBuilder(query, 'status');

  final NumericSqlExpressionBuilder<int> id;

  final DateTimeSqlExpressionBuilder createdAt;

  final DateTimeSqlExpressionBuilder updatedAt;

  final NumericSqlExpressionBuilder<int> airframeId;

  final StringSqlExpressionBuilder flight;

  final StringSqlExpressionBuilder departingAirport;

  final StringSqlExpressionBuilder destinationAirport;

  final NumericSqlExpressionBuilder<double> latitude;

  final NumericSqlExpressionBuilder<double> longitude;

  final NumericSqlExpressionBuilder<int> altitude;

  final NumericSqlExpressionBuilder<int> messagesCount;

  final StringSqlExpressionBuilder status;

  @override
  get expressionBuilders {
    return [
      id,
      createdAt,
      updatedAt,
      airframeId,
      flight,
      departingAirport,
      destinationAirport,
      latitude,
      longitude,
      altitude,
      messagesCount,
      status
    ];
  }
}

class FlightQueryValues extends MapQueryValues {
  @override
  get casts {
    return {'latitude': 'decimal', 'longitude': 'decimal'};
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
  int get airframeId {
    return (values['airframe_id'] as int);
  }

  set airframeId(int value) => values['airframe_id'] = value;
  String get flight {
    return (values['flight'] as String);
  }

  set flight(String value) => values['flight'] = value;
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
  int get messagesCount {
    return (values['messages_count'] as int);
  }

  set messagesCount(int value) => values['messages_count'] = value;
  String get status {
    return (values['status'] as String);
  }

  set status(String value) => values['status'] = value;
  void copyFrom(Flight model) {
    createdAt = model.createdAt;
    updatedAt = model.updatedAt;
    airframeId = model.airframeId;
    flight = model.flight;
    departingAirport = model.departingAirport;
    destinationAirport = model.destinationAirport;
    latitude = model.latitude;
    longitude = model.longitude;
    altitude = model.altitude;
    messagesCount = model.messagesCount;
    status = model.status;
  }
}

// **************************************************************************
// JsonModelGenerator
// **************************************************************************

@generatedSerializable
class Flight extends _Flight {
  Flight(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.airframeId,
      this.flight,
      this.departingAirport,
      this.destinationAirport,
      this.latitude,
      this.longitude,
      this.altitude,
      this.messagesCount,
      this.status});

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
  final int airframeId;

  @override
  final String flight;

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
  final int messagesCount;

  @override
  final String status;

  Flight copyWith(
      {String id,
      DateTime createdAt,
      DateTime updatedAt,
      int airframeId,
      String flight,
      String departingAirport,
      String destinationAirport,
      double latitude,
      double longitude,
      int altitude,
      int messagesCount,
      String status}) {
    return Flight(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        airframeId: airframeId ?? this.airframeId,
        flight: flight ?? this.flight,
        departingAirport: departingAirport ?? this.departingAirport,
        destinationAirport: destinationAirport ?? this.destinationAirport,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        altitude: altitude ?? this.altitude,
        messagesCount: messagesCount ?? this.messagesCount,
        status: status ?? this.status);
  }

  bool operator ==(other) {
    return other is _Flight &&
        other.id == id &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.airframeId == airframeId &&
        other.flight == flight &&
        other.departingAirport == departingAirport &&
        other.destinationAirport == destinationAirport &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.altitude == altitude &&
        other.messagesCount == messagesCount &&
        other.status == status;
  }

  @override
  int get hashCode {
    return hashObjects([
      id,
      createdAt,
      updatedAt,
      airframeId,
      flight,
      departingAirport,
      destinationAirport,
      latitude,
      longitude,
      altitude,
      messagesCount,
      status
    ]);
  }

  @override
  String toString() {
    return "Flight(id=$id, createdAt=$createdAt, updatedAt=$updatedAt, airframeId=$airframeId, flight=$flight, departingAirport=$departingAirport, destinationAirport=$destinationAirport, latitude=$latitude, longitude=$longitude, altitude=$altitude, messagesCount=$messagesCount, status=$status)";
  }

  Map<String, dynamic> toJson() {
    return FlightSerializer.toMap(this);
  }
}

// **************************************************************************
// SerializerGenerator
// **************************************************************************

const FlightSerializer flightSerializer = FlightSerializer();

class FlightEncoder extends Converter<Flight, Map> {
  const FlightEncoder();

  @override
  Map convert(Flight model) => FlightSerializer.toMap(model);
}

class FlightDecoder extends Converter<Map, Flight> {
  const FlightDecoder();

  @override
  Flight convert(Map map) => FlightSerializer.fromMap(map);
}

class FlightSerializer extends Codec<Flight, Map> {
  const FlightSerializer();

  @override
  get encoder => const FlightEncoder();
  @override
  get decoder => const FlightDecoder();
  static Flight fromMap(Map map) {
    return Flight(
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
        airframeId: map['airframe_id'] as int,
        flight: map['flight'] as String,
        departingAirport: map['departing_airport'] as String,
        destinationAirport: map['destination_airport'] as String,
        latitude: map['latitude'] as double,
        longitude: map['longitude'] as double,
        altitude: map['altitude'] as int,
        messagesCount: map['messages_count'] as int,
        status: map['status'] as String);
  }

  static Map<String, dynamic> toMap(_Flight model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String(),
      'airframe_id': model.airframeId,
      'flight': model.flight,
      'departing_airport': model.departingAirport,
      'destination_airport': model.destinationAirport,
      'latitude': model.latitude,
      'longitude': model.longitude,
      'altitude': model.altitude,
      'messages_count': model.messagesCount,
      'status': model.status
    };
  }
}

abstract class FlightFields {
  static const List<String> allFields = <String>[
    id,
    createdAt,
    updatedAt,
    airframeId,
    flight,
    departingAirport,
    destinationAirport,
    latitude,
    longitude,
    altitude,
    messagesCount,
    status
  ];

  static const String id = 'id';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';

  static const String airframeId = 'airframe_id';

  static const String flight = 'flight';

  static const String departingAirport = 'departing_airport';

  static const String destinationAirport = 'destination_airport';

  static const String latitude = 'latitude';

  static const String longitude = 'longitude';

  static const String altitude = 'altitude';

  static const String messagesCount = 'messages_count';

  static const String status = 'status';
}

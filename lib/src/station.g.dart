// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station.dart';

// **************************************************************************
// OrmGenerator
// **************************************************************************

class StationQuery extends Query<Station, StationQueryWhere> {
  StationQuery({Set<String> trampoline}) {
    trampoline ??= Set();
    trampoline.add(tableName);
    _where = StationQueryWhere(this);
  }

  @override
  final StationQueryValues values = StationQueryValues();

  StationQueryWhere _where;

  @override
  get casts {
    return {'latitude': 'text', 'longitude': 'text'};
  }

  @override
  get tableName {
    return 'stations';
  }

  @override
  get fields {
    return const [
      'id',
      'created_at',
      'updated_at',
      'ident',
      'ip_address',
      'email',
      'latitude',
      'longitude',
      'source_application',
      'source_type',
      'source_protocol',
      'last_report_at',
      'messages_count'
    ];
  }

  @override
  StationQueryWhere get where {
    return _where;
  }

  @override
  StationQueryWhere newWhereClause() {
    return StationQueryWhere(this);
  }

  static Station parseRow(List row) {
    if (row.every((x) => x == null)) return null;
    var model = Station(
        id: row[0].toString(),
        createdAt: (row[1] as DateTime),
        updatedAt: (row[2] as DateTime),
        ident: (row[3] as String),
        ipAddress: (row[4] as String),
        email: (row[5] as String),
        latitude: double.tryParse(row[6].toString()),
        longitude: double.tryParse(row[7].toString()),
        sourceApplication: (row[8] as String),
        sourceType: (row[9] as String),
        sourceProtocol: (row[10] as String),
        lastReportAt: (row[11] as DateTime),
        messagesCount: (row[12] as int));
    return model;
  }

  @override
  deserialize(List row) {
    return parseRow(row);
  }
}

class StationQueryWhere extends QueryWhere {
  StationQueryWhere(StationQuery query)
      : id = NumericSqlExpressionBuilder<int>(query, 'id'),
        createdAt = DateTimeSqlExpressionBuilder(query, 'created_at'),
        updatedAt = DateTimeSqlExpressionBuilder(query, 'updated_at'),
        ident = StringSqlExpressionBuilder(query, 'ident'),
        ipAddress = StringSqlExpressionBuilder(query, 'ip_address'),
        email = StringSqlExpressionBuilder(query, 'email'),
        latitude = NumericSqlExpressionBuilder<double>(query, 'latitude'),
        longitude = NumericSqlExpressionBuilder<double>(query, 'longitude'),
        sourceApplication =
            StringSqlExpressionBuilder(query, 'source_application'),
        sourceType = StringSqlExpressionBuilder(query, 'source_type'),
        sourceProtocol = StringSqlExpressionBuilder(query, 'source_protocol'),
        lastReportAt = DateTimeSqlExpressionBuilder(query, 'last_report_at'),
        messagesCount =
            NumericSqlExpressionBuilder<int>(query, 'messages_count');

  final NumericSqlExpressionBuilder<int> id;

  final DateTimeSqlExpressionBuilder createdAt;

  final DateTimeSqlExpressionBuilder updatedAt;

  final StringSqlExpressionBuilder ident;

  final StringSqlExpressionBuilder ipAddress;

  final StringSqlExpressionBuilder email;

  final NumericSqlExpressionBuilder<double> latitude;

  final NumericSqlExpressionBuilder<double> longitude;

  final StringSqlExpressionBuilder sourceApplication;

  final StringSqlExpressionBuilder sourceType;

  final StringSqlExpressionBuilder sourceProtocol;

  final DateTimeSqlExpressionBuilder lastReportAt;

  final NumericSqlExpressionBuilder<int> messagesCount;

  @override
  get expressionBuilders {
    return [
      id,
      createdAt,
      updatedAt,
      ident,
      ipAddress,
      email,
      latitude,
      longitude,
      sourceApplication,
      sourceType,
      sourceProtocol,
      lastReportAt,
      messagesCount
    ];
  }
}

class StationQueryValues extends MapQueryValues {
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
  String get ident {
    return (values['ident'] as String);
  }

  set ident(String value) => values['ident'] = value;
  String get ipAddress {
    return (values['ip_address'] as String);
  }

  set ipAddress(String value) => values['ip_address'] = value;
  String get email {
    return (values['email'] as String);
  }

  set email(String value) => values['email'] = value;
  double get latitude {
    return double.tryParse((values['latitude'] as String));
  }

  set latitude(double value) => values['latitude'] = value.toString();
  double get longitude {
    return double.tryParse((values['longitude'] as String));
  }

  set longitude(double value) => values['longitude'] = value.toString();
  String get sourceApplication {
    return (values['source_application'] as String);
  }

  set sourceApplication(String value) => values['source_application'] = value;
  String get sourceType {
    return (values['source_type'] as String);
  }

  set sourceType(String value) => values['source_type'] = value;
  String get sourceProtocol {
    return (values['source_protocol'] as String);
  }

  set sourceProtocol(String value) => values['source_protocol'] = value;
  DateTime get lastReportAt {
    return (values['last_report_at'] as DateTime);
  }

  set lastReportAt(DateTime value) => values['last_report_at'] = value;
  int get messagesCount {
    return (values['messages_count'] as int);
  }

  set messagesCount(int value) => values['messages_count'] = value;
  void copyFrom(Station model) {
    createdAt = model.createdAt;
    updatedAt = model.updatedAt;
    ident = model.ident;
    ipAddress = model.ipAddress;
    email = model.email;
    latitude = model.latitude;
    longitude = model.longitude;
    sourceApplication = model.sourceApplication;
    sourceType = model.sourceType;
    sourceProtocol = model.sourceProtocol;
    lastReportAt = model.lastReportAt;
    messagesCount = model.messagesCount;
  }
}

// **************************************************************************
// JsonModelGenerator
// **************************************************************************

@generatedSerializable
class Station extends _Station {
  Station(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.ident,
      this.ipAddress,
      this.email,
      this.latitude,
      this.longitude,
      this.sourceApplication,
      this.sourceType,
      this.sourceProtocol,
      this.lastReportAt,
      this.messagesCount});

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
  final String ident;

  @override
  final String ipAddress;

  @override
  final String email;

  @override
  final double latitude;

  @override
  final double longitude;

  @override
  final String sourceApplication;

  @override
  final String sourceType;

  @override
  final String sourceProtocol;

  @override
  final DateTime lastReportAt;

  @override
  final int messagesCount;

  Station copyWith(
      {String id,
      DateTime createdAt,
      DateTime updatedAt,
      String ident,
      String ipAddress,
      String email,
      double latitude,
      double longitude,
      String sourceApplication,
      String sourceType,
      String sourceProtocol,
      DateTime lastReportAt,
      int messagesCount}) {
    return Station(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        ident: ident ?? this.ident,
        ipAddress: ipAddress ?? this.ipAddress,
        email: email ?? this.email,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        sourceApplication: sourceApplication ?? this.sourceApplication,
        sourceType: sourceType ?? this.sourceType,
        sourceProtocol: sourceProtocol ?? this.sourceProtocol,
        lastReportAt: lastReportAt ?? this.lastReportAt,
        messagesCount: messagesCount ?? this.messagesCount);
  }

  bool operator ==(other) {
    return other is _Station &&
        other.id == id &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.ident == ident &&
        other.ipAddress == ipAddress &&
        other.email == email &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.sourceApplication == sourceApplication &&
        other.sourceType == sourceType &&
        other.sourceProtocol == sourceProtocol &&
        other.lastReportAt == lastReportAt &&
        other.messagesCount == messagesCount;
  }

  @override
  int get hashCode {
    return hashObjects([
      id,
      createdAt,
      updatedAt,
      ident,
      ipAddress,
      email,
      latitude,
      longitude,
      sourceApplication,
      sourceType,
      sourceProtocol,
      lastReportAt,
      messagesCount
    ]);
  }

  @override
  String toString() {
    return "Station(id=$id, createdAt=$createdAt, updatedAt=$updatedAt, ident=$ident, ipAddress=$ipAddress, email=$email, latitude=$latitude, longitude=$longitude, sourceApplication=$sourceApplication, sourceType=$sourceType, sourceProtocol=$sourceProtocol, lastReportAt=$lastReportAt, messagesCount=$messagesCount)";
  }

  Map<String, dynamic> toJson() {
    return StationSerializer.toMap(this);
  }
}

// **************************************************************************
// SerializerGenerator
// **************************************************************************

const StationSerializer stationSerializer = StationSerializer();

class StationEncoder extends Converter<Station, Map> {
  const StationEncoder();

  @override
  Map convert(Station model) => StationSerializer.toMap(model);
}

class StationDecoder extends Converter<Map, Station> {
  const StationDecoder();

  @override
  Station convert(Map map) => StationSerializer.fromMap(map);
}

class StationSerializer extends Codec<Station, Map> {
  const StationSerializer();

  @override
  get encoder => const StationEncoder();
  @override
  get decoder => const StationDecoder();
  static Station fromMap(Map map) {
    return Station(
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
        ident: map['ident'] as String,
        ipAddress: map['ip_address'] as String,
        email: map['email'] as String,
        latitude: map['latitude'] as double,
        longitude: map['longitude'] as double,
        sourceApplication: map['source_application'] as String,
        sourceType: map['source_type'] as String,
        sourceProtocol: map['source_protocol'] as String,
        lastReportAt: map['last_report_at'] != null
            ? (map['last_report_at'] is DateTime
                ? (map['last_report_at'] as DateTime)
                : DateTime.parse(map['last_report_at'].toString()))
            : null,
        messagesCount: map['messages_count'] as int);
  }

  static Map<String, dynamic> toMap(_Station model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String(),
      'ident': model.ident,
      'ip_address': model.ipAddress,
      'email': model.email,
      'latitude': model.latitude,
      'longitude': model.longitude,
      'source_application': model.sourceApplication,
      'source_type': model.sourceType,
      'source_protocol': model.sourceProtocol,
      'last_report_at': model.lastReportAt?.toIso8601String(),
      'messages_count': model.messagesCount
    };
  }
}

abstract class StationFields {
  static const List<String> allFields = <String>[
    id,
    createdAt,
    updatedAt,
    ident,
    ipAddress,
    email,
    latitude,
    longitude,
    sourceApplication,
    sourceType,
    sourceProtocol,
    lastReportAt,
    messagesCount
  ];

  static const String id = 'id';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';

  static const String ident = 'ident';

  static const String ipAddress = 'ip_address';

  static const String email = 'email';

  static const String latitude = 'latitude';

  static const String longitude = 'longitude';

  static const String sourceApplication = 'source_application';

  static const String sourceType = 'source_type';

  static const String sourceProtocol = 'source_protocol';

  static const String lastReportAt = 'last_report_at';

  static const String messagesCount = 'messages_count';
}

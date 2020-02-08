// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station_message_count.dart';

// **************************************************************************
// OrmGenerator
// **************************************************************************

class StationMessageCountQuery
    extends Query<StationMessageCount, StationMessageCountQueryWhere> {
  StationMessageCountQuery({Set<String> trampoline}) {
    trampoline ??= Set();
    trampoline.add(tableName);
    _where = StationMessageCountQueryWhere(this);
  }

  @override
  final StationMessageCountQueryValues values =
      StationMessageCountQueryValues();

  StationMessageCountQueryWhere _where;

  @override
  get casts {
    return {};
  }

  @override
  get tableName {
    return 'station_message_counts';
  }

  @override
  get fields {
    return const [
      'id',
      'created_at',
      'updated_at',
      'station_id',
      'messages_count'
    ];
  }

  @override
  StationMessageCountQueryWhere get where {
    return _where;
  }

  @override
  StationMessageCountQueryWhere newWhereClause() {
    return StationMessageCountQueryWhere(this);
  }

  static StationMessageCount parseRow(List row) {
    if (row.every((x) => x == null)) return null;
    var model = StationMessageCount(
        id: row[0].toString(),
        createdAt: (row[1] as DateTime),
        updatedAt: (row[2] as DateTime),
        stationId: (row[3] as int),
        messagesCount: (row[4] as int));
    return model;
  }

  @override
  deserialize(List row) {
    return parseRow(row);
  }
}

class StationMessageCountQueryWhere extends QueryWhere {
  StationMessageCountQueryWhere(StationMessageCountQuery query)
      : id = NumericSqlExpressionBuilder<int>(query, 'id'),
        createdAt = DateTimeSqlExpressionBuilder(query, 'created_at'),
        updatedAt = DateTimeSqlExpressionBuilder(query, 'updated_at'),
        stationId = NumericSqlExpressionBuilder<int>(query, 'station_id'),
        messagesCount =
            NumericSqlExpressionBuilder<int>(query, 'messages_count');

  final NumericSqlExpressionBuilder<int> id;

  final DateTimeSqlExpressionBuilder createdAt;

  final DateTimeSqlExpressionBuilder updatedAt;

  final NumericSqlExpressionBuilder<int> stationId;

  final NumericSqlExpressionBuilder<int> messagesCount;

  @override
  get expressionBuilders {
    return [id, createdAt, updatedAt, stationId, messagesCount];
  }
}

class StationMessageCountQueryValues extends MapQueryValues {
  @override
  get casts {
    return {};
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
  int get stationId {
    return (values['station_id'] as int);
  }

  set stationId(int value) => values['station_id'] = value;
  int get messagesCount {
    return (values['messages_count'] as int);
  }

  set messagesCount(int value) => values['messages_count'] = value;
  void copyFrom(StationMessageCount model) {
    createdAt = model.createdAt;
    updatedAt = model.updatedAt;
    stationId = model.stationId;
    messagesCount = model.messagesCount;
  }
}

// **************************************************************************
// JsonModelGenerator
// **************************************************************************

@generatedSerializable
class StationMessageCount extends _StationMessageCount {
  StationMessageCount(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.stationId,
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
  final int stationId;

  @override
  final int messagesCount;

  StationMessageCount copyWith(
      {String id,
      DateTime createdAt,
      DateTime updatedAt,
      int stationId,
      int messagesCount}) {
    return StationMessageCount(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        stationId: stationId ?? this.stationId,
        messagesCount: messagesCount ?? this.messagesCount);
  }

  bool operator ==(other) {
    return other is _StationMessageCount &&
        other.id == id &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.stationId == stationId &&
        other.messagesCount == messagesCount;
  }

  @override
  int get hashCode {
    return hashObjects([id, createdAt, updatedAt, stationId, messagesCount]);
  }

  @override
  String toString() {
    return "StationMessageCount(id=$id, createdAt=$createdAt, updatedAt=$updatedAt, stationId=$stationId, messagesCount=$messagesCount)";
  }

  Map<String, dynamic> toJson() {
    return StationMessageCountSerializer.toMap(this);
  }
}

// **************************************************************************
// SerializerGenerator
// **************************************************************************

const StationMessageCountSerializer stationMessageCountSerializer =
    StationMessageCountSerializer();

class StationMessageCountEncoder extends Converter<StationMessageCount, Map> {
  const StationMessageCountEncoder();

  @override
  Map convert(StationMessageCount model) =>
      StationMessageCountSerializer.toMap(model);
}

class StationMessageCountDecoder extends Converter<Map, StationMessageCount> {
  const StationMessageCountDecoder();

  @override
  StationMessageCount convert(Map map) =>
      StationMessageCountSerializer.fromMap(map);
}

class StationMessageCountSerializer extends Codec<StationMessageCount, Map> {
  const StationMessageCountSerializer();

  @override
  get encoder => const StationMessageCountEncoder();
  @override
  get decoder => const StationMessageCountDecoder();
  static StationMessageCount fromMap(Map map) {
    return StationMessageCount(
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
        stationId: map['station_id'] as int,
        messagesCount: map['messages_count'] as int);
  }

  static Map<String, dynamic> toMap(_StationMessageCount model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String(),
      'station_id': model.stationId,
      'messages_count': model.messagesCount
    };
  }
}

abstract class StationMessageCountFields {
  static const List<String> allFields = <String>[
    id,
    createdAt,
    updatedAt,
    stationId,
    messagesCount
  ];

  static const String id = 'id';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';

  static const String stationId = 'station_id';

  static const String messagesCount = 'messages_count';
}

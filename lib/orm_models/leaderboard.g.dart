// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaderboard.dart';

// **************************************************************************
// OrmGenerator
// **************************************************************************

class LeaderboardQuery extends Query<Leaderboard, LeaderboardQueryWhere> {
  LeaderboardQuery({Set<String> trampoline}) {
    trampoline ??= Set();
    trampoline.add(tableName);
    _where = LeaderboardQueryWhere(this);
  }

  @override
  final LeaderboardQueryValues values = LeaderboardQueryValues();

  LeaderboardQueryWhere _where;

  @override
  get casts {
    return {};
  }

  @override
  get tableName {
    return 'leaderboards';
  }

  @override
  get fields {
    return const ['id', 'created_at', 'updated_at', 'date'];
  }

  @override
  LeaderboardQueryWhere get where {
    return _where;
  }

  @override
  LeaderboardQueryWhere newWhereClause() {
    return LeaderboardQueryWhere(this);
  }

  static Leaderboard parseRow(List row) {
    if (row.every((x) => x == null)) return null;
    var model = Leaderboard(
        id: row[0].toString(),
        createdAt: (row[1] as DateTime),
        updatedAt: (row[2] as DateTime),
        date: (row[3] as DateTime));
    return model;
  }

  @override
  deserialize(List row) {
    return parseRow(row);
  }
}

class LeaderboardQueryWhere extends QueryWhere {
  LeaderboardQueryWhere(LeaderboardQuery query)
      : id = NumericSqlExpressionBuilder<int>(query, 'id'),
        createdAt = DateTimeSqlExpressionBuilder(query, 'created_at'),
        updatedAt = DateTimeSqlExpressionBuilder(query, 'updated_at'),
        date = DateTimeSqlExpressionBuilder(query, 'date');

  final NumericSqlExpressionBuilder<int> id;

  final DateTimeSqlExpressionBuilder createdAt;

  final DateTimeSqlExpressionBuilder updatedAt;

  final DateTimeSqlExpressionBuilder date;

  @override
  get expressionBuilders {
    return [id, createdAt, updatedAt, date];
  }
}

class LeaderboardQueryValues extends MapQueryValues {
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
  DateTime get date {
    return (values['date'] as DateTime);
  }

  set date(DateTime value) => values['date'] = value;
  void copyFrom(Leaderboard model) {
    createdAt = model.createdAt;
    updatedAt = model.updatedAt;
    date = model.date;
  }
}

// **************************************************************************
// JsonModelGenerator
// **************************************************************************

@generatedSerializable
class Leaderboard extends _Leaderboard {
  Leaderboard({this.id, this.createdAt, this.updatedAt, this.date});

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
  final DateTime date;

  Leaderboard copyWith(
      {String id, DateTime createdAt, DateTime updatedAt, DateTime date}) {
    return Leaderboard(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        date: date ?? this.date);
  }

  bool operator ==(other) {
    return other is _Leaderboard &&
        other.id == id &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.date == date;
  }

  @override
  int get hashCode {
    return hashObjects([id, createdAt, updatedAt, date]);
  }

  @override
  String toString() {
    return "Leaderboard(id=$id, createdAt=$createdAt, updatedAt=$updatedAt, date=$date)";
  }

  Map<String, dynamic> toJson() {
    return LeaderboardSerializer.toMap(this);
  }
}

// **************************************************************************
// SerializerGenerator
// **************************************************************************

const LeaderboardSerializer leaderboardSerializer = LeaderboardSerializer();

class LeaderboardEncoder extends Converter<Leaderboard, Map> {
  const LeaderboardEncoder();

  @override
  Map convert(Leaderboard model) => LeaderboardSerializer.toMap(model);
}

class LeaderboardDecoder extends Converter<Map, Leaderboard> {
  const LeaderboardDecoder();

  @override
  Leaderboard convert(Map map) => LeaderboardSerializer.fromMap(map);
}

class LeaderboardSerializer extends Codec<Leaderboard, Map> {
  const LeaderboardSerializer();

  @override
  get encoder => const LeaderboardEncoder();
  @override
  get decoder => const LeaderboardDecoder();
  static Leaderboard fromMap(Map map) {
    return Leaderboard(
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
        date: map['date'] != null
            ? (map['date'] is DateTime
                ? (map['date'] as DateTime)
                : DateTime.parse(map['date'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_Leaderboard model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String(),
      'date': model.date?.toIso8601String()
    };
  }
}

abstract class LeaderboardFields {
  static const List<String> allFields = <String>[
    id,
    createdAt,
    updatedAt,
    date
  ];

  static const String id = 'id';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';

  static const String date = 'date';
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'airframe.dart';

// **************************************************************************
// OrmGenerator
// **************************************************************************

class AirframeQuery extends Query<Airframe, AirframeQueryWhere> {
  AirframeQuery({Set<String> trampoline}) {
    trampoline ??= Set();
    trampoline.add(tableName);
    _where = AirframeQueryWhere(this);
  }

  @override
  final AirframeQueryValues values = AirframeQueryValues();

  AirframeQueryWhere _where;

  @override
  get casts {
    return {};
  }

  @override
  get tableName {
    return 'airframes';
  }

  @override
  get fields {
    return const ['id', 'created_at', 'updated_at', 'tail'];
  }

  @override
  AirframeQueryWhere get where {
    return _where;
  }

  @override
  AirframeQueryWhere newWhereClause() {
    return AirframeQueryWhere(this);
  }

  static Airframe parseRow(List row) {
    if (row.every((x) => x == null)) return null;
    var model = Airframe(
        id: row[0].toString(),
        createdAt: (row[1] as DateTime),
        updatedAt: (row[2] as DateTime),
        tail: (row[3] as String));
    return model;
  }

  @override
  deserialize(List row) {
    return parseRow(row);
  }
}

class AirframeQueryWhere extends QueryWhere {
  AirframeQueryWhere(AirframeQuery query)
      : id = NumericSqlExpressionBuilder<int>(query, 'id'),
        createdAt = DateTimeSqlExpressionBuilder(query, 'created_at'),
        updatedAt = DateTimeSqlExpressionBuilder(query, 'updated_at'),
        tail = StringSqlExpressionBuilder(query, 'tail');

  final NumericSqlExpressionBuilder<int> id;

  final DateTimeSqlExpressionBuilder createdAt;

  final DateTimeSqlExpressionBuilder updatedAt;

  final StringSqlExpressionBuilder tail;

  @override
  get expressionBuilders {
    return [id, createdAt, updatedAt, tail];
  }
}

class AirframeQueryValues extends MapQueryValues {
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
  String get tail {
    return (values['tail'] as String);
  }

  set tail(String value) => values['tail'] = value;
  void copyFrom(Airframe model) {
    createdAt = model.createdAt;
    updatedAt = model.updatedAt;
    tail = model.tail;
  }
}

// **************************************************************************
// JsonModelGenerator
// **************************************************************************

@generatedSerializable
class Airframe extends _Airframe {
  Airframe({this.id, this.createdAt, this.updatedAt, this.tail});

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
  final String tail;

  Airframe copyWith(
      {String id, DateTime createdAt, DateTime updatedAt, String tail}) {
    return Airframe(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        tail: tail ?? this.tail);
  }

  bool operator ==(other) {
    return other is _Airframe &&
        other.id == id &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.tail == tail;
  }

  @override
  int get hashCode {
    return hashObjects([id, createdAt, updatedAt, tail]);
  }

  @override
  String toString() {
    return "Airframe(id=$id, createdAt=$createdAt, updatedAt=$updatedAt, tail=$tail)";
  }

  Map<String, dynamic> toJson() {
    return AirframeSerializer.toMap(this);
  }
}

// **************************************************************************
// SerializerGenerator
// **************************************************************************

const AirframeSerializer airframeSerializer = AirframeSerializer();

class AirframeEncoder extends Converter<Airframe, Map> {
  const AirframeEncoder();

  @override
  Map convert(Airframe model) => AirframeSerializer.toMap(model);
}

class AirframeDecoder extends Converter<Map, Airframe> {
  const AirframeDecoder();

  @override
  Airframe convert(Map map) => AirframeSerializer.fromMap(map);
}

class AirframeSerializer extends Codec<Airframe, Map> {
  const AirframeSerializer();

  @override
  get encoder => const AirframeEncoder();
  @override
  get decoder => const AirframeDecoder();
  static Airframe fromMap(Map map) {
    return Airframe(
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
        tail: map['tail'] as String);
  }

  static Map<String, dynamic> toMap(_Airframe model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String(),
      'tail': model.tail
    };
  }
}

abstract class AirframeFields {
  static const List<String> allFields = <String>[
    id,
    createdAt,
    updatedAt,
    tail
  ];

  static const String id = 'id';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';

  static const String tail = 'tail';
}

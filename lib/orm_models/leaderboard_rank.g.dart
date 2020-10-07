// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaderboard_rank.dart';

// **************************************************************************
// OrmGenerator
// **************************************************************************

class LeaderboardRankQuery
    extends Query<LeaderboardRank, LeaderboardRankQueryWhere> {
  LeaderboardRankQuery({Set<String> trampoline}) {
    trampoline ??= Set();
    trampoline.add(tableName);
    _where = LeaderboardRankQueryWhere(this);
  }

  @override
  final LeaderboardRankQueryValues values = LeaderboardRankQueryValues();

  LeaderboardRankQueryWhere _where;

  @override
  get casts {
    return {};
  }

  @override
  get tableName {
    return 'leaderboard_ranks';
  }

  @override
  get fields {
    return const [
      'id',
      'created_at',
      'updated_at',
      'leaderboard_id',
      'station_id',
      'points',
      'ranking',
      'airframe_all_time_count',
      'airframe_this_month_count',
      'airframe_last24_hours_count',
      'flight_all_time_count',
      'flight_this_month_count',
      'flight_last24_hours_count',
      'message_all_time_count',
      'message_this_month_count',
      'message_last24_hours_count'
    ];
  }

  @override
  LeaderboardRankQueryWhere get where {
    return _where;
  }

  @override
  LeaderboardRankQueryWhere newWhereClause() {
    return LeaderboardRankQueryWhere(this);
  }

  static LeaderboardRank parseRow(List row) {
    if (row.every((x) => x == null)) return null;
    var model = LeaderboardRank(
        id: row[0].toString(),
        createdAt: (row[1] as DateTime),
        updatedAt: (row[2] as DateTime),
        leaderboardId: (row[3] as int),
        stationId: (row[4] as int),
        points: (row[5] as int),
        ranking: (row[6] as int),
        airframeAllTimeCount: (row[7] as int),
        airframeThisMonthCount: (row[8] as int),
        airframeLast24HoursCount: (row[9] as int),
        flightAllTimeCount: (row[10] as int),
        flightThisMonthCount: (row[11] as int),
        flightLast24HoursCount: (row[12] as int),
        messageAllTimeCount: (row[13] as int),
        messageThisMonthCount: (row[14] as int),
        messageLast24HoursCount: (row[15] as int));
    return model;
  }

  @override
  deserialize(List row) {
    return parseRow(row);
  }
}

class LeaderboardRankQueryWhere extends QueryWhere {
  LeaderboardRankQueryWhere(LeaderboardRankQuery query)
      : id = NumericSqlExpressionBuilder<int>(query, 'id'),
        createdAt = DateTimeSqlExpressionBuilder(query, 'created_at'),
        updatedAt = DateTimeSqlExpressionBuilder(query, 'updated_at'),
        leaderboardId =
            NumericSqlExpressionBuilder<int>(query, 'leaderboard_id'),
        stationId = NumericSqlExpressionBuilder<int>(query, 'station_id'),
        points = NumericSqlExpressionBuilder<int>(query, 'points'),
        ranking = NumericSqlExpressionBuilder<int>(query, 'ranking'),
        airframeAllTimeCount =
            NumericSqlExpressionBuilder<int>(query, 'airframe_all_time_count'),
        airframeThisMonthCount = NumericSqlExpressionBuilder<int>(
            query, 'airframe_this_month_count'),
        airframeLast24HoursCount = NumericSqlExpressionBuilder<int>(
            query, 'airframe_last24_hours_count'),
        flightAllTimeCount =
            NumericSqlExpressionBuilder<int>(query, 'flight_all_time_count'),
        flightThisMonthCount =
            NumericSqlExpressionBuilder<int>(query, 'flight_this_month_count'),
        flightLast24HoursCount = NumericSqlExpressionBuilder<int>(
            query, 'flight_last24_hours_count'),
        messageAllTimeCount =
            NumericSqlExpressionBuilder<int>(query, 'message_all_time_count'),
        messageThisMonthCount =
            NumericSqlExpressionBuilder<int>(query, 'message_this_month_count'),
        messageLast24HoursCount = NumericSqlExpressionBuilder<int>(
            query, 'message_last24_hours_count');

  final NumericSqlExpressionBuilder<int> id;

  final DateTimeSqlExpressionBuilder createdAt;

  final DateTimeSqlExpressionBuilder updatedAt;

  final NumericSqlExpressionBuilder<int> leaderboardId;

  final NumericSqlExpressionBuilder<int> stationId;

  final NumericSqlExpressionBuilder<int> points;

  final NumericSqlExpressionBuilder<int> ranking;

  final NumericSqlExpressionBuilder<int> airframeAllTimeCount;

  final NumericSqlExpressionBuilder<int> airframeThisMonthCount;

  final NumericSqlExpressionBuilder<int> airframeLast24HoursCount;

  final NumericSqlExpressionBuilder<int> flightAllTimeCount;

  final NumericSqlExpressionBuilder<int> flightThisMonthCount;

  final NumericSqlExpressionBuilder<int> flightLast24HoursCount;

  final NumericSqlExpressionBuilder<int> messageAllTimeCount;

  final NumericSqlExpressionBuilder<int> messageThisMonthCount;

  final NumericSqlExpressionBuilder<int> messageLast24HoursCount;

  @override
  get expressionBuilders {
    return [
      id,
      createdAt,
      updatedAt,
      leaderboardId,
      stationId,
      points,
      ranking,
      airframeAllTimeCount,
      airframeThisMonthCount,
      airframeLast24HoursCount,
      flightAllTimeCount,
      flightThisMonthCount,
      flightLast24HoursCount,
      messageAllTimeCount,
      messageThisMonthCount,
      messageLast24HoursCount
    ];
  }
}

class LeaderboardRankQueryValues extends MapQueryValues {
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
  int get leaderboardId {
    return (values['leaderboard_id'] as int);
  }

  set leaderboardId(int value) => values['leaderboard_id'] = value;
  int get stationId {
    return (values['station_id'] as int);
  }

  set stationId(int value) => values['station_id'] = value;
  int get points {
    return (values['points'] as int);
  }

  set points(int value) => values['points'] = value;
  int get ranking {
    return (values['ranking'] as int);
  }

  set ranking(int value) => values['ranking'] = value;
  int get airframeAllTimeCount {
    return (values['airframe_all_time_count'] as int);
  }

  set airframeAllTimeCount(int value) =>
      values['airframe_all_time_count'] = value;
  int get airframeThisMonthCount {
    return (values['airframe_this_month_count'] as int);
  }

  set airframeThisMonthCount(int value) =>
      values['airframe_this_month_count'] = value;
  int get airframeLast24HoursCount {
    return (values['airframe_last24_hours_count'] as int);
  }

  set airframeLast24HoursCount(int value) =>
      values['airframe_last24_hours_count'] = value;
  int get flightAllTimeCount {
    return (values['flight_all_time_count'] as int);
  }

  set flightAllTimeCount(int value) => values['flight_all_time_count'] = value;
  int get flightThisMonthCount {
    return (values['flight_this_month_count'] as int);
  }

  set flightThisMonthCount(int value) =>
      values['flight_this_month_count'] = value;
  int get flightLast24HoursCount {
    return (values['flight_last24_hours_count'] as int);
  }

  set flightLast24HoursCount(int value) =>
      values['flight_last24_hours_count'] = value;
  int get messageAllTimeCount {
    return (values['message_all_time_count'] as int);
  }

  set messageAllTimeCount(int value) =>
      values['message_all_time_count'] = value;
  int get messageThisMonthCount {
    return (values['message_this_month_count'] as int);
  }

  set messageThisMonthCount(int value) =>
      values['message_this_month_count'] = value;
  int get messageLast24HoursCount {
    return (values['message_last24_hours_count'] as int);
  }

  set messageLast24HoursCount(int value) =>
      values['message_last24_hours_count'] = value;
  void copyFrom(LeaderboardRank model) {
    createdAt = model.createdAt;
    updatedAt = model.updatedAt;
    leaderboardId = model.leaderboardId;
    stationId = model.stationId;
    points = model.points;
    ranking = model.ranking;
    airframeAllTimeCount = model.airframeAllTimeCount;
    airframeThisMonthCount = model.airframeThisMonthCount;
    airframeLast24HoursCount = model.airframeLast24HoursCount;
    flightAllTimeCount = model.flightAllTimeCount;
    flightThisMonthCount = model.flightThisMonthCount;
    flightLast24HoursCount = model.flightLast24HoursCount;
    messageAllTimeCount = model.messageAllTimeCount;
    messageThisMonthCount = model.messageThisMonthCount;
    messageLast24HoursCount = model.messageLast24HoursCount;
  }
}

// **************************************************************************
// JsonModelGenerator
// **************************************************************************

@generatedSerializable
class LeaderboardRank extends _LeaderboardRank {
  LeaderboardRank(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.leaderboardId,
      this.stationId,
      this.points,
      this.ranking,
      this.airframeAllTimeCount,
      this.airframeThisMonthCount,
      this.airframeLast24HoursCount,
      this.flightAllTimeCount,
      this.flightThisMonthCount,
      this.flightLast24HoursCount,
      this.messageAllTimeCount,
      this.messageThisMonthCount,
      this.messageLast24HoursCount});

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
  final int leaderboardId;

  @override
  final int stationId;

  @override
  final int points;

  @override
  final int ranking;

  @override
  final int airframeAllTimeCount;

  @override
  final int airframeThisMonthCount;

  @override
  final int airframeLast24HoursCount;

  @override
  final int flightAllTimeCount;

  @override
  final int flightThisMonthCount;

  @override
  final int flightLast24HoursCount;

  @override
  final int messageAllTimeCount;

  @override
  final int messageThisMonthCount;

  @override
  final int messageLast24HoursCount;

  LeaderboardRank copyWith(
      {String id,
      DateTime createdAt,
      DateTime updatedAt,
      int leaderboardId,
      int stationId,
      int points,
      int ranking,
      int airframeAllTimeCount,
      int airframeThisMonthCount,
      int airframeLast24HoursCount,
      int flightAllTimeCount,
      int flightThisMonthCount,
      int flightLast24HoursCount,
      int messageAllTimeCount,
      int messageThisMonthCount,
      int messageLast24HoursCount}) {
    return LeaderboardRank(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        leaderboardId: leaderboardId ?? this.leaderboardId,
        stationId: stationId ?? this.stationId,
        points: points ?? this.points,
        ranking: ranking ?? this.ranking,
        airframeAllTimeCount: airframeAllTimeCount ?? this.airframeAllTimeCount,
        airframeThisMonthCount:
            airframeThisMonthCount ?? this.airframeThisMonthCount,
        airframeLast24HoursCount:
            airframeLast24HoursCount ?? this.airframeLast24HoursCount,
        flightAllTimeCount: flightAllTimeCount ?? this.flightAllTimeCount,
        flightThisMonthCount: flightThisMonthCount ?? this.flightThisMonthCount,
        flightLast24HoursCount:
            flightLast24HoursCount ?? this.flightLast24HoursCount,
        messageAllTimeCount: messageAllTimeCount ?? this.messageAllTimeCount,
        messageThisMonthCount:
            messageThisMonthCount ?? this.messageThisMonthCount,
        messageLast24HoursCount:
            messageLast24HoursCount ?? this.messageLast24HoursCount);
  }

  bool operator ==(other) {
    return other is _LeaderboardRank &&
        other.id == id &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.leaderboardId == leaderboardId &&
        other.stationId == stationId &&
        other.points == points &&
        other.ranking == ranking &&
        other.airframeAllTimeCount == airframeAllTimeCount &&
        other.airframeThisMonthCount == airframeThisMonthCount &&
        other.airframeLast24HoursCount == airframeLast24HoursCount &&
        other.flightAllTimeCount == flightAllTimeCount &&
        other.flightThisMonthCount == flightThisMonthCount &&
        other.flightLast24HoursCount == flightLast24HoursCount &&
        other.messageAllTimeCount == messageAllTimeCount &&
        other.messageThisMonthCount == messageThisMonthCount &&
        other.messageLast24HoursCount == messageLast24HoursCount;
  }

  @override
  int get hashCode {
    return hashObjects([
      id,
      createdAt,
      updatedAt,
      leaderboardId,
      stationId,
      points,
      ranking,
      airframeAllTimeCount,
      airframeThisMonthCount,
      airframeLast24HoursCount,
      flightAllTimeCount,
      flightThisMonthCount,
      flightLast24HoursCount,
      messageAllTimeCount,
      messageThisMonthCount,
      messageLast24HoursCount
    ]);
  }

  @override
  String toString() {
    return "LeaderboardRank(id=$id, createdAt=$createdAt, updatedAt=$updatedAt, leaderboardId=$leaderboardId, stationId=$stationId, points=$points, ranking=$ranking, airframeAllTimeCount=$airframeAllTimeCount, airframeThisMonthCount=$airframeThisMonthCount, airframeLast24HoursCount=$airframeLast24HoursCount, flightAllTimeCount=$flightAllTimeCount, flightThisMonthCount=$flightThisMonthCount, flightLast24HoursCount=$flightLast24HoursCount, messageAllTimeCount=$messageAllTimeCount, messageThisMonthCount=$messageThisMonthCount, messageLast24HoursCount=$messageLast24HoursCount)";
  }

  Map<String, dynamic> toJson() {
    return LeaderboardRankSerializer.toMap(this);
  }
}

// **************************************************************************
// SerializerGenerator
// **************************************************************************

const LeaderboardRankSerializer leaderboardRankSerializer =
    LeaderboardRankSerializer();

class LeaderboardRankEncoder extends Converter<LeaderboardRank, Map> {
  const LeaderboardRankEncoder();

  @override
  Map convert(LeaderboardRank model) => LeaderboardRankSerializer.toMap(model);
}

class LeaderboardRankDecoder extends Converter<Map, LeaderboardRank> {
  const LeaderboardRankDecoder();

  @override
  LeaderboardRank convert(Map map) => LeaderboardRankSerializer.fromMap(map);
}

class LeaderboardRankSerializer extends Codec<LeaderboardRank, Map> {
  const LeaderboardRankSerializer();

  @override
  get encoder => const LeaderboardRankEncoder();
  @override
  get decoder => const LeaderboardRankDecoder();
  static LeaderboardRank fromMap(Map map) {
    return LeaderboardRank(
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
        leaderboardId: map['leaderboard_id'] as int,
        stationId: map['station_id'] as int,
        points: map['points'] as int,
        ranking: map['ranking'] as int,
        airframeAllTimeCount: map['airframe_all_time_count'] as int,
        airframeThisMonthCount: map['airframe_this_month_count'] as int,
        airframeLast24HoursCount: map['airframe_last24_hours_count'] as int,
        flightAllTimeCount: map['flight_all_time_count'] as int,
        flightThisMonthCount: map['flight_this_month_count'] as int,
        flightLast24HoursCount: map['flight_last24_hours_count'] as int,
        messageAllTimeCount: map['message_all_time_count'] as int,
        messageThisMonthCount: map['message_this_month_count'] as int,
        messageLast24HoursCount: map['message_last24_hours_count'] as int);
  }

  static Map<String, dynamic> toMap(_LeaderboardRank model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String(),
      'leaderboard_id': model.leaderboardId,
      'station_id': model.stationId,
      'points': model.points,
      'ranking': model.ranking,
      'airframe_all_time_count': model.airframeAllTimeCount,
      'airframe_this_month_count': model.airframeThisMonthCount,
      'airframe_last24_hours_count': model.airframeLast24HoursCount,
      'flight_all_time_count': model.flightAllTimeCount,
      'flight_this_month_count': model.flightThisMonthCount,
      'flight_last24_hours_count': model.flightLast24HoursCount,
      'message_all_time_count': model.messageAllTimeCount,
      'message_this_month_count': model.messageThisMonthCount,
      'message_last24_hours_count': model.messageLast24HoursCount
    };
  }
}

abstract class LeaderboardRankFields {
  static const List<String> allFields = <String>[
    id,
    createdAt,
    updatedAt,
    leaderboardId,
    stationId,
    points,
    ranking,
    airframeAllTimeCount,
    airframeThisMonthCount,
    airframeLast24HoursCount,
    flightAllTimeCount,
    flightThisMonthCount,
    flightLast24HoursCount,
    messageAllTimeCount,
    messageThisMonthCount,
    messageLast24HoursCount
  ];

  static const String id = 'id';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';

  static const String leaderboardId = 'leaderboard_id';

  static const String stationId = 'station_id';

  static const String points = 'points';

  static const String ranking = 'ranking';

  static const String airframeAllTimeCount = 'airframe_all_time_count';

  static const String airframeThisMonthCount = 'airframe_this_month_count';

  static const String airframeLast24HoursCount = 'airframe_last24_hours_count';

  static const String flightAllTimeCount = 'flight_all_time_count';

  static const String flightThisMonthCount = 'flight_this_month_count';

  static const String flightLast24HoursCount = 'flight_last24_hours_count';

  static const String messageAllTimeCount = 'message_all_time_count';

  static const String messageThisMonthCount = 'message_this_month_count';

  static const String messageLast24HoursCount = 'message_last24_hours_count';
}

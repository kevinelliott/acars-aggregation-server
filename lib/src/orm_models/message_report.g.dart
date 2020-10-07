// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_report.dart';

// **************************************************************************
// OrmGenerator
// **************************************************************************

class MessageReportQuery extends Query<MessageReport, MessageReportQueryWhere> {
  MessageReportQuery({Set<String> trampoline}) {
    trampoline ??= Set();
    trampoline.add(tableName);
    _where = MessageReportQueryWhere(this);
  }

  @override
  final MessageReportQueryValues values = MessageReportQueryValues();

  MessageReportQueryWhere _where;

  @override
  get casts {
    return {'frequency': 'text'};
  }

  @override
  get tableName {
    return 'message_reports';
  }

  @override
  get fields {
    return const [
      'id',
      'created_at',
      'updated_at',
      'station_id',
      'message_id',
      'first_to_report',
      'source_name',
      'source_application',
      'source_type',
      'source_format',
      'source_protocol',
      'source_network_protocol',
      'source_remote_ip',
      'frequency',
      'channel'
    ];
  }

  @override
  MessageReportQueryWhere get where {
    return _where;
  }

  @override
  MessageReportQueryWhere newWhereClause() {
    return MessageReportQueryWhere(this);
  }

  static MessageReport parseRow(List row) {
    if (row.every((x) => x == null)) return null;
    var model = MessageReport(
        id: row[0].toString(),
        createdAt: (row[1] as DateTime),
        updatedAt: (row[2] as DateTime),
        stationId: (row[3] as int),
        messageId: (row[4] as int),
        firstToReport: (row[5] as bool),
        sourceName: (row[6] as String),
        sourceApplication: (row[7] as String),
        sourceType: (row[8] as String),
        sourceFormat: (row[9] as String),
        sourceProtocol: (row[10] as String),
        sourceNetworkProtocol: (row[11] as String),
        sourceRemoteIp: (row[12] as String),
        frequency: double.tryParse(row[13].toString()),
        channel: (row[14] as int));
    return model;
  }

  @override
  deserialize(List row) {
    return parseRow(row);
  }
}

class MessageReportQueryWhere extends QueryWhere {
  MessageReportQueryWhere(MessageReportQuery query)
      : id = NumericSqlExpressionBuilder<int>(query, 'id'),
        createdAt = DateTimeSqlExpressionBuilder(query, 'created_at'),
        updatedAt = DateTimeSqlExpressionBuilder(query, 'updated_at'),
        stationId = NumericSqlExpressionBuilder<int>(query, 'station_id'),
        messageId = NumericSqlExpressionBuilder<int>(query, 'message_id'),
        firstToReport = BooleanSqlExpressionBuilder(query, 'first_to_report'),
        sourceName = StringSqlExpressionBuilder(query, 'source_name'),
        sourceApplication =
            StringSqlExpressionBuilder(query, 'source_application'),
        sourceType = StringSqlExpressionBuilder(query, 'source_type'),
        sourceFormat = StringSqlExpressionBuilder(query, 'source_format'),
        sourceProtocol = StringSqlExpressionBuilder(query, 'source_protocol'),
        sourceNetworkProtocol =
            StringSqlExpressionBuilder(query, 'source_network_protocol'),
        sourceRemoteIp = StringSqlExpressionBuilder(query, 'source_remote_ip'),
        frequency = NumericSqlExpressionBuilder<double>(query, 'frequency'),
        channel = NumericSqlExpressionBuilder<int>(query, 'channel');

  final NumericSqlExpressionBuilder<int> id;

  final DateTimeSqlExpressionBuilder createdAt;

  final DateTimeSqlExpressionBuilder updatedAt;

  final NumericSqlExpressionBuilder<int> stationId;

  final NumericSqlExpressionBuilder<int> messageId;

  final BooleanSqlExpressionBuilder firstToReport;

  final StringSqlExpressionBuilder sourceName;

  final StringSqlExpressionBuilder sourceApplication;

  final StringSqlExpressionBuilder sourceType;

  final StringSqlExpressionBuilder sourceFormat;

  final StringSqlExpressionBuilder sourceProtocol;

  final StringSqlExpressionBuilder sourceNetworkProtocol;

  final StringSqlExpressionBuilder sourceRemoteIp;

  final NumericSqlExpressionBuilder<double> frequency;

  final NumericSqlExpressionBuilder<int> channel;

  @override
  get expressionBuilders {
    return [
      id,
      createdAt,
      updatedAt,
      stationId,
      messageId,
      firstToReport,
      sourceName,
      sourceApplication,
      sourceType,
      sourceFormat,
      sourceProtocol,
      sourceNetworkProtocol,
      sourceRemoteIp,
      frequency,
      channel
    ];
  }
}

class MessageReportQueryValues extends MapQueryValues {
  @override
  get casts {
    return {'frequency': 'decimal'};
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
  int get messageId {
    return (values['message_id'] as int);
  }

  set messageId(int value) => values['message_id'] = value;
  bool get firstToReport {
    return (values['first_to_report'] as bool);
  }

  set firstToReport(bool value) => values['first_to_report'] = value;
  String get sourceName {
    return (values['source_name'] as String);
  }

  set sourceName(String value) => values['source_name'] = value;
  String get sourceApplication {
    return (values['source_application'] as String);
  }

  set sourceApplication(String value) => values['source_application'] = value;
  String get sourceType {
    return (values['source_type'] as String);
  }

  set sourceType(String value) => values['source_type'] = value;
  String get sourceFormat {
    return (values['source_format'] as String);
  }

  set sourceFormat(String value) => values['source_format'] = value;
  String get sourceProtocol {
    return (values['source_protocol'] as String);
  }

  set sourceProtocol(String value) => values['source_protocol'] = value;
  String get sourceNetworkProtocol {
    return (values['source_network_protocol'] as String);
  }

  set sourceNetworkProtocol(String value) =>
      values['source_network_protocol'] = value;
  String get sourceRemoteIp {
    return (values['source_remote_ip'] as String);
  }

  set sourceRemoteIp(String value) => values['source_remote_ip'] = value;
  double get frequency {
    return double.tryParse((values['frequency'] as String));
  }

  set frequency(double value) => values['frequency'] = value.toString();
  int get channel {
    return (values['channel'] as int);
  }

  set channel(int value) => values['channel'] = value;
  void copyFrom(MessageReport model) {
    createdAt = model.createdAt;
    updatedAt = model.updatedAt;
    stationId = model.stationId;
    messageId = model.messageId;
    firstToReport = model.firstToReport;
    sourceName = model.sourceName;
    sourceApplication = model.sourceApplication;
    sourceType = model.sourceType;
    sourceFormat = model.sourceFormat;
    sourceProtocol = model.sourceProtocol;
    sourceNetworkProtocol = model.sourceNetworkProtocol;
    sourceRemoteIp = model.sourceRemoteIp;
    frequency = model.frequency;
    channel = model.channel;
  }
}

// **************************************************************************
// JsonModelGenerator
// **************************************************************************

@generatedSerializable
class MessageReport extends _MessageReport {
  MessageReport(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.stationId,
      this.messageId,
      this.firstToReport,
      this.sourceName,
      this.sourceApplication,
      this.sourceType,
      this.sourceFormat,
      this.sourceProtocol,
      this.sourceNetworkProtocol,
      this.sourceRemoteIp,
      this.frequency,
      this.channel});

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
  final int messageId;

  @override
  final bool firstToReport;

  @override
  final String sourceName;

  @override
  final String sourceApplication;

  @override
  final String sourceType;

  @override
  final String sourceFormat;

  @override
  final String sourceProtocol;

  @override
  final String sourceNetworkProtocol;

  @override
  final String sourceRemoteIp;

  @override
  final double frequency;

  @override
  final int channel;

  MessageReport copyWith(
      {String id,
      DateTime createdAt,
      DateTime updatedAt,
      int stationId,
      int messageId,
      bool firstToReport,
      String sourceName,
      String sourceApplication,
      String sourceType,
      String sourceFormat,
      String sourceProtocol,
      String sourceNetworkProtocol,
      String sourceRemoteIp,
      double frequency,
      int channel}) {
    return MessageReport(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        stationId: stationId ?? this.stationId,
        messageId: messageId ?? this.messageId,
        firstToReport: firstToReport ?? this.firstToReport,
        sourceName: sourceName ?? this.sourceName,
        sourceApplication: sourceApplication ?? this.sourceApplication,
        sourceType: sourceType ?? this.sourceType,
        sourceFormat: sourceFormat ?? this.sourceFormat,
        sourceProtocol: sourceProtocol ?? this.sourceProtocol,
        sourceNetworkProtocol:
            sourceNetworkProtocol ?? this.sourceNetworkProtocol,
        sourceRemoteIp: sourceRemoteIp ?? this.sourceRemoteIp,
        frequency: frequency ?? this.frequency,
        channel: channel ?? this.channel);
  }

  bool operator ==(other) {
    return other is _MessageReport &&
        other.id == id &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.stationId == stationId &&
        other.messageId == messageId &&
        other.firstToReport == firstToReport &&
        other.sourceName == sourceName &&
        other.sourceApplication == sourceApplication &&
        other.sourceType == sourceType &&
        other.sourceFormat == sourceFormat &&
        other.sourceProtocol == sourceProtocol &&
        other.sourceNetworkProtocol == sourceNetworkProtocol &&
        other.sourceRemoteIp == sourceRemoteIp &&
        other.frequency == frequency &&
        other.channel == channel;
  }

  @override
  int get hashCode {
    return hashObjects([
      id,
      createdAt,
      updatedAt,
      stationId,
      messageId,
      firstToReport,
      sourceName,
      sourceApplication,
      sourceType,
      sourceFormat,
      sourceProtocol,
      sourceNetworkProtocol,
      sourceRemoteIp,
      frequency,
      channel
    ]);
  }

  @override
  String toString() {
    return "MessageReport(id=$id, createdAt=$createdAt, updatedAt=$updatedAt, stationId=$stationId, messageId=$messageId, firstToReport=$firstToReport, sourceName=$sourceName, sourceApplication=$sourceApplication, sourceType=$sourceType, sourceFormat=$sourceFormat, sourceProtocol=$sourceProtocol, sourceNetworkProtocol=$sourceNetworkProtocol, sourceRemoteIp=$sourceRemoteIp, frequency=$frequency, channel=$channel)";
  }

  Map<String, dynamic> toJson() {
    return MessageReportSerializer.toMap(this);
  }
}

// **************************************************************************
// SerializerGenerator
// **************************************************************************

const MessageReportSerializer messageReportSerializer =
    MessageReportSerializer();

class MessageReportEncoder extends Converter<MessageReport, Map> {
  const MessageReportEncoder();

  @override
  Map convert(MessageReport model) => MessageReportSerializer.toMap(model);
}

class MessageReportDecoder extends Converter<Map, MessageReport> {
  const MessageReportDecoder();

  @override
  MessageReport convert(Map map) => MessageReportSerializer.fromMap(map);
}

class MessageReportSerializer extends Codec<MessageReport, Map> {
  const MessageReportSerializer();

  @override
  get encoder => const MessageReportEncoder();
  @override
  get decoder => const MessageReportDecoder();
  static MessageReport fromMap(Map map) {
    return MessageReport(
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
        messageId: map['message_id'] as int,
        firstToReport: map['first_to_report'] as bool,
        sourceName: map['source_name'] as String,
        sourceApplication: map['source_application'] as String,
        sourceType: map['source_type'] as String,
        sourceFormat: map['source_format'] as String,
        sourceProtocol: map['source_protocol'] as String,
        sourceNetworkProtocol: map['source_network_protocol'] as String,
        sourceRemoteIp: map['source_remote_ip'] as String,
        frequency: map['frequency'] as double,
        channel: map['channel'] as int);
  }

  static Map<String, dynamic> toMap(_MessageReport model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String(),
      'station_id': model.stationId,
      'message_id': model.messageId,
      'first_to_report': model.firstToReport,
      'source_name': model.sourceName,
      'source_application': model.sourceApplication,
      'source_type': model.sourceType,
      'source_format': model.sourceFormat,
      'source_protocol': model.sourceProtocol,
      'source_network_protocol': model.sourceNetworkProtocol,
      'source_remote_ip': model.sourceRemoteIp,
      'frequency': model.frequency,
      'channel': model.channel
    };
  }
}

abstract class MessageReportFields {
  static const List<String> allFields = <String>[
    id,
    createdAt,
    updatedAt,
    stationId,
    messageId,
    firstToReport,
    sourceName,
    sourceApplication,
    sourceType,
    sourceFormat,
    sourceProtocol,
    sourceNetworkProtocol,
    sourceRemoteIp,
    frequency,
    channel
  ];

  static const String id = 'id';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';

  static const String stationId = 'station_id';

  static const String messageId = 'message_id';

  static const String firstToReport = 'first_to_report';

  static const String sourceName = 'source_name';

  static const String sourceApplication = 'source_application';

  static const String sourceType = 'source_type';

  static const String sourceFormat = 'source_format';

  static const String sourceProtocol = 'source_protocol';

  static const String sourceNetworkProtocol = 'source_network_protocol';

  static const String sourceRemoteIp = 'source_remote_ip';

  static const String frequency = 'frequency';

  static const String channel = 'channel';
}

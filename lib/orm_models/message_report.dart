import 'package:angel_model/angel_model.dart';
import 'package:angel_orm/angel_orm.dart';
import 'package:angel_serialize/angel_serialize.dart';

part 'message_report.g.dart';

@serializable
@Orm(generateMigrations: false)
abstract class _MessageReport extends Model {
  @Column(isNullable: false)
  int get stationId;

  @Column(isNullable: false)
  int get messageId;

  @Column(isNullable: false)
  bool get firstToReport;

  @Column(isNullable: true)
  String get sourceName;

  @Column(isNullable: true)
  String get sourceApplication;

  @Column(isNullable: true)
  String get sourceType;

  @Column(isNullable: true)
  String get sourceFormat;

  @Column(isNullable: true)
  String get sourceProtocol;

  @Column(isNullable: true)
  String get sourceNetworkProtocol;

  @Column(isNullable: true)
  String get sourceRemoteIp;

  @Column(isNullable: true)
  double get frequency;

  @Column(isNullable: true)
  int get channel;
}

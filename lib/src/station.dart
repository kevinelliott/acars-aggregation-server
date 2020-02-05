import 'package:angel_model/angel_model.dart';
import 'package:angel_orm/angel_orm.dart';
import 'package:angel_serialize/angel_serialize.dart';

part 'station.g.dart';

@serializable
@Orm(generateMigrations: false)
abstract class _Station extends Model {
  @Column(isNullable: false)
  String get ident;
  String get ipAddress;
  String get email;
  @Column(isNullable: true)
  double get latitude;
  @Column(isNullable: true)
  double get longitude;
  // @Column(isNullable: true)
  // int get altitude;
  DateTime get lastReportAt;
  int get messagesCount;
}

import 'package:angel_model/angel_model.dart';
import 'package:angel_orm/angel_orm.dart';
import 'package:angel_serialize/angel_serialize.dart';

part 'airframe.g.dart';

@serializable
@Orm(generateMigrations: false)
abstract class _Airframe extends Model {
  @Column(isNullable: false)
  String get tail;
}

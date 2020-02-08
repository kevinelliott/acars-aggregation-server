import 'package:angel_model/angel_model.dart';
import 'package:angel_orm/angel_orm.dart';
import 'package:angel_serialize/angel_serialize.dart';

part 'station_message_count.g.dart';

@serializable
@Orm(generateMigrations: false)
abstract class _StationMessageCount extends Model {
  @Column(isNullable: false)
  int get stationId;

  @Column(isNullable: false)
  int get messagesCount;
}

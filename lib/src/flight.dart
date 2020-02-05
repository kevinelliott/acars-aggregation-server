import 'package:angel_model/angel_model.dart';
import 'package:angel_orm/angel_orm.dart';
import 'package:angel_serialize/angel_serialize.dart';

part 'flight.g.dart';

@serializable
@Orm(generateMigrations: false)
abstract class _Flight extends Model {
  @Column(isNullable: false)
  int get airframeId;
  String get flight;
  @Column(isNullable: true)
  String get departingAirport;
  @Column(isNullable: true)
  String get destinationAirport;
  @Column(isNullable: true)
  double get latitude;
  @Column(isNullable: true)
  double get longitude;
  @Column(isNullable: true)
  int get altitude;
  int get messagesCount;
  @Column(isNullable: false)
  String get status;
}

import 'package:angel_model/angel_model.dart';
import 'package:angel_orm/angel_orm.dart';
import 'package:angel_serialize/angel_serialize.dart';

part 'message.g.dart';

@serializable
@Orm(generateMigrations: false)
abstract class _Message extends Model {
  DateTime get timestamp;
  int get stationId;
  @Column(isNullable: true)
  int get airframeId;
  @Column(isNullable: true)
  int get flightId;
  String get source;
  String get sourceType;
  @Column(isNullable: true)
  String get linkDirection;
  @Column(isNullable: true)
  String get fromHex;
  @Column(isNullable: true)
  String get toHex;
  @Column(isNullable: true)
  int get channel;
  @Column(isNullable: true)
  double get frequency;
  @Column(isNullable: true)
  int get level;
  @Column(isNullable: true)
  int get error;
  String get mode;
  String get label;
  String get blockId;
  String get ack;
  String get tail;
  String get flight;
  String get messageNumber;
  String get data;
  String get text;
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
  bool get blockEnd;
}

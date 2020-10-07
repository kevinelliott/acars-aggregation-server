import 'package:angel_model/angel_model.dart';
import 'package:angel_orm/angel_orm.dart';
import 'package:angel_serialize/angel_serialize.dart';

part 'faa_aircraft_registration.g.dart';

@serializable
@Orm(generateMigrations: false, tableName: 'faa_aircraft_registration_master')
abstract class _FaaAircraftRegistration extends Model {
  String get uniqueId;
  String get nNumber;
  int get modeSCode;
  String get modeSCodeHex;
  String get statusCode;
  String get aircraftComboCode;
  String get aircraftTypeCode;
  int get engineTypeCode;
  String get engineComboCode;
  String get kitManufacturerName;
  String get kitManufacturerModel;
  String get yearManufactured;
  int get registrantTypeCode;
  String get registrantName;
  String get registrantAddressLine1;
  String get registrantAddressLine2;
  String get registrantCity;
  String get registrantStateCode;
  String get registrantRegionCode;
  String get registrantCountyCode;
  String get registrantPostalCode;
  String get registrantCountryCode;
  String get certificationCode;
  String get fractionalOwner;
  String get otherName1;
  String get otherName2;
  String get otherName3;
  String get otherName4;
  String get otherName5;
  DateTime get airworthinessDate;
  DateTime get certIssueDate;
  DateTime get expirationDate;
  DateTime get lastActionDate;
}

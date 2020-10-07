// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faa_aircraft_registration.dart';

// **************************************************************************
// OrmGenerator
// **************************************************************************

class FaaAircraftRegistrationQuery
    extends Query<FaaAircraftRegistration, FaaAircraftRegistrationQueryWhere> {
  FaaAircraftRegistrationQuery({Set<String> trampoline}) {
    trampoline ??= Set();
    trampoline.add(tableName);
    _where = FaaAircraftRegistrationQueryWhere(this);
  }

  @override
  final FaaAircraftRegistrationQueryValues values =
      FaaAircraftRegistrationQueryValues();

  FaaAircraftRegistrationQueryWhere _where;

  @override
  get casts {
    return {};
  }

  @override
  get tableName {
    return 'faa_aircraft_registration_master';
  }

  @override
  get fields {
    return const [
      'id',
      'created_at',
      'updated_at',
      'unique_id',
      'n_number',
      'mode_s_code',
      'mode_s_code_hex',
      'status_code',
      'aircraft_combo_code',
      'aircraft_type_code',
      'engine_type_code',
      'engine_combo_code',
      'kit_manufacturer_name',
      'kit_manufacturer_model',
      'year_manufactured',
      'registrant_type_code',
      'registrant_name',
      'registrant_address_line1',
      'registrant_address_line2',
      'registrant_city',
      'registrant_state_code',
      'registrant_region_code',
      'registrant_county_code',
      'registrant_postal_code',
      'registrant_country_code',
      'certification_code',
      'fractional_owner',
      'other_name1',
      'other_name2',
      'other_name3',
      'other_name4',
      'other_name5',
      'airworthiness_date',
      'cert_issue_date',
      'expiration_date',
      'last_action_date'
    ];
  }

  @override
  FaaAircraftRegistrationQueryWhere get where {
    return _where;
  }

  @override
  FaaAircraftRegistrationQueryWhere newWhereClause() {
    return FaaAircraftRegistrationQueryWhere(this);
  }

  static FaaAircraftRegistration parseRow(List row) {
    if (row.every((x) => x == null)) return null;
    var model = FaaAircraftRegistration(
        id: row[0].toString(),
        createdAt: (row[1] as DateTime),
        updatedAt: (row[2] as DateTime),
        uniqueId: (row[3] as String),
        nNumber: (row[4] as String),
        modeSCode: (row[5] as int),
        modeSCodeHex: (row[6] as String),
        statusCode: (row[7] as String),
        aircraftComboCode: (row[8] as String),
        aircraftTypeCode: (row[9] as String),
        engineTypeCode: (row[10] as int),
        engineComboCode: (row[11] as String),
        kitManufacturerName: (row[12] as String),
        kitManufacturerModel: (row[13] as String),
        yearManufactured: (row[14] as String),
        registrantTypeCode: (row[15] as int),
        registrantName: (row[16] as String),
        registrantAddressLine1: (row[17] as String),
        registrantAddressLine2: (row[18] as String),
        registrantCity: (row[19] as String),
        registrantStateCode: (row[20] as String),
        registrantRegionCode: (row[21] as String),
        registrantCountyCode: (row[22] as String),
        registrantPostalCode: (row[23] as String),
        registrantCountryCode: (row[24] as String),
        certificationCode: (row[25] as String),
        fractionalOwner: (row[26] as String),
        otherName1: (row[27] as String),
        otherName2: (row[28] as String),
        otherName3: (row[29] as String),
        otherName4: (row[30] as String),
        otherName5: (row[31] as String),
        airworthinessDate: (row[32] as DateTime),
        certIssueDate: (row[33] as DateTime),
        expirationDate: (row[34] as DateTime),
        lastActionDate: (row[35] as DateTime));
    return model;
  }

  @override
  deserialize(List row) {
    return parseRow(row);
  }
}

class FaaAircraftRegistrationQueryWhere extends QueryWhere {
  FaaAircraftRegistrationQueryWhere(FaaAircraftRegistrationQuery query)
      : id = NumericSqlExpressionBuilder<int>(query, 'id'),
        createdAt = DateTimeSqlExpressionBuilder(query, 'created_at'),
        updatedAt = DateTimeSqlExpressionBuilder(query, 'updated_at'),
        uniqueId = StringSqlExpressionBuilder(query, 'unique_id'),
        nNumber = StringSqlExpressionBuilder(query, 'n_number'),
        modeSCode = NumericSqlExpressionBuilder<int>(query, 'mode_s_code'),
        modeSCodeHex = StringSqlExpressionBuilder(query, 'mode_s_code_hex'),
        statusCode = StringSqlExpressionBuilder(query, 'status_code'),
        aircraftComboCode =
            StringSqlExpressionBuilder(query, 'aircraft_combo_code'),
        aircraftTypeCode =
            StringSqlExpressionBuilder(query, 'aircraft_type_code'),
        engineTypeCode =
            NumericSqlExpressionBuilder<int>(query, 'engine_type_code'),
        engineComboCode =
            StringSqlExpressionBuilder(query, 'engine_combo_code'),
        kitManufacturerName =
            StringSqlExpressionBuilder(query, 'kit_manufacturer_name'),
        kitManufacturerModel =
            StringSqlExpressionBuilder(query, 'kit_manufacturer_model'),
        yearManufactured =
            StringSqlExpressionBuilder(query, 'year_manufactured'),
        registrantTypeCode =
            NumericSqlExpressionBuilder<int>(query, 'registrant_type_code'),
        registrantName = StringSqlExpressionBuilder(query, 'registrant_name'),
        registrantAddressLine1 =
            StringSqlExpressionBuilder(query, 'registrant_address_line1'),
        registrantAddressLine2 =
            StringSqlExpressionBuilder(query, 'registrant_address_line2'),
        registrantCity = StringSqlExpressionBuilder(query, 'registrant_city'),
        registrantStateCode =
            StringSqlExpressionBuilder(query, 'registrant_state_code'),
        registrantRegionCode =
            StringSqlExpressionBuilder(query, 'registrant_region_code'),
        registrantCountyCode =
            StringSqlExpressionBuilder(query, 'registrant_county_code'),
        registrantPostalCode =
            StringSqlExpressionBuilder(query, 'registrant_postal_code'),
        registrantCountryCode =
            StringSqlExpressionBuilder(query, 'registrant_country_code'),
        certificationCode =
            StringSqlExpressionBuilder(query, 'certification_code'),
        fractionalOwner = StringSqlExpressionBuilder(query, 'fractional_owner'),
        otherName1 = StringSqlExpressionBuilder(query, 'other_name1'),
        otherName2 = StringSqlExpressionBuilder(query, 'other_name2'),
        otherName3 = StringSqlExpressionBuilder(query, 'other_name3'),
        otherName4 = StringSqlExpressionBuilder(query, 'other_name4'),
        otherName5 = StringSqlExpressionBuilder(query, 'other_name5'),
        airworthinessDate =
            DateTimeSqlExpressionBuilder(query, 'airworthiness_date'),
        certIssueDate = DateTimeSqlExpressionBuilder(query, 'cert_issue_date'),
        expirationDate = DateTimeSqlExpressionBuilder(query, 'expiration_date'),
        lastActionDate =
            DateTimeSqlExpressionBuilder(query, 'last_action_date');

  final NumericSqlExpressionBuilder<int> id;

  final DateTimeSqlExpressionBuilder createdAt;

  final DateTimeSqlExpressionBuilder updatedAt;

  final StringSqlExpressionBuilder uniqueId;

  final StringSqlExpressionBuilder nNumber;

  final NumericSqlExpressionBuilder<int> modeSCode;

  final StringSqlExpressionBuilder modeSCodeHex;

  final StringSqlExpressionBuilder statusCode;

  final StringSqlExpressionBuilder aircraftComboCode;

  final StringSqlExpressionBuilder aircraftTypeCode;

  final NumericSqlExpressionBuilder<int> engineTypeCode;

  final StringSqlExpressionBuilder engineComboCode;

  final StringSqlExpressionBuilder kitManufacturerName;

  final StringSqlExpressionBuilder kitManufacturerModel;

  final StringSqlExpressionBuilder yearManufactured;

  final NumericSqlExpressionBuilder<int> registrantTypeCode;

  final StringSqlExpressionBuilder registrantName;

  final StringSqlExpressionBuilder registrantAddressLine1;

  final StringSqlExpressionBuilder registrantAddressLine2;

  final StringSqlExpressionBuilder registrantCity;

  final StringSqlExpressionBuilder registrantStateCode;

  final StringSqlExpressionBuilder registrantRegionCode;

  final StringSqlExpressionBuilder registrantCountyCode;

  final StringSqlExpressionBuilder registrantPostalCode;

  final StringSqlExpressionBuilder registrantCountryCode;

  final StringSqlExpressionBuilder certificationCode;

  final StringSqlExpressionBuilder fractionalOwner;

  final StringSqlExpressionBuilder otherName1;

  final StringSqlExpressionBuilder otherName2;

  final StringSqlExpressionBuilder otherName3;

  final StringSqlExpressionBuilder otherName4;

  final StringSqlExpressionBuilder otherName5;

  final DateTimeSqlExpressionBuilder airworthinessDate;

  final DateTimeSqlExpressionBuilder certIssueDate;

  final DateTimeSqlExpressionBuilder expirationDate;

  final DateTimeSqlExpressionBuilder lastActionDate;

  @override
  get expressionBuilders {
    return [
      id,
      createdAt,
      updatedAt,
      uniqueId,
      nNumber,
      modeSCode,
      modeSCodeHex,
      statusCode,
      aircraftComboCode,
      aircraftTypeCode,
      engineTypeCode,
      engineComboCode,
      kitManufacturerName,
      kitManufacturerModel,
      yearManufactured,
      registrantTypeCode,
      registrantName,
      registrantAddressLine1,
      registrantAddressLine2,
      registrantCity,
      registrantStateCode,
      registrantRegionCode,
      registrantCountyCode,
      registrantPostalCode,
      registrantCountryCode,
      certificationCode,
      fractionalOwner,
      otherName1,
      otherName2,
      otherName3,
      otherName4,
      otherName5,
      airworthinessDate,
      certIssueDate,
      expirationDate,
      lastActionDate
    ];
  }
}

class FaaAircraftRegistrationQueryValues extends MapQueryValues {
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
  String get uniqueId {
    return (values['unique_id'] as String);
  }

  set uniqueId(String value) => values['unique_id'] = value;
  String get nNumber {
    return (values['n_number'] as String);
  }

  set nNumber(String value) => values['n_number'] = value;
  int get modeSCode {
    return (values['mode_s_code'] as int);
  }

  set modeSCode(int value) => values['mode_s_code'] = value;
  String get modeSCodeHex {
    return (values['mode_s_code_hex'] as String);
  }

  set modeSCodeHex(String value) => values['mode_s_code_hex'] = value;
  String get statusCode {
    return (values['status_code'] as String);
  }

  set statusCode(String value) => values['status_code'] = value;
  String get aircraftComboCode {
    return (values['aircraft_combo_code'] as String);
  }

  set aircraftComboCode(String value) => values['aircraft_combo_code'] = value;
  String get aircraftTypeCode {
    return (values['aircraft_type_code'] as String);
  }

  set aircraftTypeCode(String value) => values['aircraft_type_code'] = value;
  int get engineTypeCode {
    return (values['engine_type_code'] as int);
  }

  set engineTypeCode(int value) => values['engine_type_code'] = value;
  String get engineComboCode {
    return (values['engine_combo_code'] as String);
  }

  set engineComboCode(String value) => values['engine_combo_code'] = value;
  String get kitManufacturerName {
    return (values['kit_manufacturer_name'] as String);
  }

  set kitManufacturerName(String value) =>
      values['kit_manufacturer_name'] = value;
  String get kitManufacturerModel {
    return (values['kit_manufacturer_model'] as String);
  }

  set kitManufacturerModel(String value) =>
      values['kit_manufacturer_model'] = value;
  String get yearManufactured {
    return (values['year_manufactured'] as String);
  }

  set yearManufactured(String value) => values['year_manufactured'] = value;
  int get registrantTypeCode {
    return (values['registrant_type_code'] as int);
  }

  set registrantTypeCode(int value) => values['registrant_type_code'] = value;
  String get registrantName {
    return (values['registrant_name'] as String);
  }

  set registrantName(String value) => values['registrant_name'] = value;
  String get registrantAddressLine1 {
    return (values['registrant_address_line1'] as String);
  }

  set registrantAddressLine1(String value) =>
      values['registrant_address_line1'] = value;
  String get registrantAddressLine2 {
    return (values['registrant_address_line2'] as String);
  }

  set registrantAddressLine2(String value) =>
      values['registrant_address_line2'] = value;
  String get registrantCity {
    return (values['registrant_city'] as String);
  }

  set registrantCity(String value) => values['registrant_city'] = value;
  String get registrantStateCode {
    return (values['registrant_state_code'] as String);
  }

  set registrantStateCode(String value) =>
      values['registrant_state_code'] = value;
  String get registrantRegionCode {
    return (values['registrant_region_code'] as String);
  }

  set registrantRegionCode(String value) =>
      values['registrant_region_code'] = value;
  String get registrantCountyCode {
    return (values['registrant_county_code'] as String);
  }

  set registrantCountyCode(String value) =>
      values['registrant_county_code'] = value;
  String get registrantPostalCode {
    return (values['registrant_postal_code'] as String);
  }

  set registrantPostalCode(String value) =>
      values['registrant_postal_code'] = value;
  String get registrantCountryCode {
    return (values['registrant_country_code'] as String);
  }

  set registrantCountryCode(String value) =>
      values['registrant_country_code'] = value;
  String get certificationCode {
    return (values['certification_code'] as String);
  }

  set certificationCode(String value) => values['certification_code'] = value;
  String get fractionalOwner {
    return (values['fractional_owner'] as String);
  }

  set fractionalOwner(String value) => values['fractional_owner'] = value;
  String get otherName1 {
    return (values['other_name1'] as String);
  }

  set otherName1(String value) => values['other_name1'] = value;
  String get otherName2 {
    return (values['other_name2'] as String);
  }

  set otherName2(String value) => values['other_name2'] = value;
  String get otherName3 {
    return (values['other_name3'] as String);
  }

  set otherName3(String value) => values['other_name3'] = value;
  String get otherName4 {
    return (values['other_name4'] as String);
  }

  set otherName4(String value) => values['other_name4'] = value;
  String get otherName5 {
    return (values['other_name5'] as String);
  }

  set otherName5(String value) => values['other_name5'] = value;
  DateTime get airworthinessDate {
    return (values['airworthiness_date'] as DateTime);
  }

  set airworthinessDate(DateTime value) => values['airworthiness_date'] = value;
  DateTime get certIssueDate {
    return (values['cert_issue_date'] as DateTime);
  }

  set certIssueDate(DateTime value) => values['cert_issue_date'] = value;
  DateTime get expirationDate {
    return (values['expiration_date'] as DateTime);
  }

  set expirationDate(DateTime value) => values['expiration_date'] = value;
  DateTime get lastActionDate {
    return (values['last_action_date'] as DateTime);
  }

  set lastActionDate(DateTime value) => values['last_action_date'] = value;
  void copyFrom(FaaAircraftRegistration model) {
    createdAt = model.createdAt;
    updatedAt = model.updatedAt;
    uniqueId = model.uniqueId;
    nNumber = model.nNumber;
    modeSCode = model.modeSCode;
    modeSCodeHex = model.modeSCodeHex;
    statusCode = model.statusCode;
    aircraftComboCode = model.aircraftComboCode;
    aircraftTypeCode = model.aircraftTypeCode;
    engineTypeCode = model.engineTypeCode;
    engineComboCode = model.engineComboCode;
    kitManufacturerName = model.kitManufacturerName;
    kitManufacturerModel = model.kitManufacturerModel;
    yearManufactured = model.yearManufactured;
    registrantTypeCode = model.registrantTypeCode;
    registrantName = model.registrantName;
    registrantAddressLine1 = model.registrantAddressLine1;
    registrantAddressLine2 = model.registrantAddressLine2;
    registrantCity = model.registrantCity;
    registrantStateCode = model.registrantStateCode;
    registrantRegionCode = model.registrantRegionCode;
    registrantCountyCode = model.registrantCountyCode;
    registrantPostalCode = model.registrantPostalCode;
    registrantCountryCode = model.registrantCountryCode;
    certificationCode = model.certificationCode;
    fractionalOwner = model.fractionalOwner;
    otherName1 = model.otherName1;
    otherName2 = model.otherName2;
    otherName3 = model.otherName3;
    otherName4 = model.otherName4;
    otherName5 = model.otherName5;
    airworthinessDate = model.airworthinessDate;
    certIssueDate = model.certIssueDate;
    expirationDate = model.expirationDate;
    lastActionDate = model.lastActionDate;
  }
}

// **************************************************************************
// JsonModelGenerator
// **************************************************************************

@generatedSerializable
class FaaAircraftRegistration extends _FaaAircraftRegistration {
  FaaAircraftRegistration(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.uniqueId,
      this.nNumber,
      this.modeSCode,
      this.modeSCodeHex,
      this.statusCode,
      this.aircraftComboCode,
      this.aircraftTypeCode,
      this.engineTypeCode,
      this.engineComboCode,
      this.kitManufacturerName,
      this.kitManufacturerModel,
      this.yearManufactured,
      this.registrantTypeCode,
      this.registrantName,
      this.registrantAddressLine1,
      this.registrantAddressLine2,
      this.registrantCity,
      this.registrantStateCode,
      this.registrantRegionCode,
      this.registrantCountyCode,
      this.registrantPostalCode,
      this.registrantCountryCode,
      this.certificationCode,
      this.fractionalOwner,
      this.otherName1,
      this.otherName2,
      this.otherName3,
      this.otherName4,
      this.otherName5,
      this.airworthinessDate,
      this.certIssueDate,
      this.expirationDate,
      this.lastActionDate});

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
  final String uniqueId;

  @override
  final String nNumber;

  @override
  final int modeSCode;

  @override
  final String modeSCodeHex;

  @override
  final String statusCode;

  @override
  final String aircraftComboCode;

  @override
  final String aircraftTypeCode;

  @override
  final int engineTypeCode;

  @override
  final String engineComboCode;

  @override
  final String kitManufacturerName;

  @override
  final String kitManufacturerModel;

  @override
  final String yearManufactured;

  @override
  final int registrantTypeCode;

  @override
  final String registrantName;

  @override
  final String registrantAddressLine1;

  @override
  final String registrantAddressLine2;

  @override
  final String registrantCity;

  @override
  final String registrantStateCode;

  @override
  final String registrantRegionCode;

  @override
  final String registrantCountyCode;

  @override
  final String registrantPostalCode;

  @override
  final String registrantCountryCode;

  @override
  final String certificationCode;

  @override
  final String fractionalOwner;

  @override
  final String otherName1;

  @override
  final String otherName2;

  @override
  final String otherName3;

  @override
  final String otherName4;

  @override
  final String otherName5;

  @override
  final DateTime airworthinessDate;

  @override
  final DateTime certIssueDate;

  @override
  final DateTime expirationDate;

  @override
  final DateTime lastActionDate;

  FaaAircraftRegistration copyWith(
      {String id,
      DateTime createdAt,
      DateTime updatedAt,
      String uniqueId,
      String nNumber,
      int modeSCode,
      String modeSCodeHex,
      String statusCode,
      String aircraftComboCode,
      String aircraftTypeCode,
      int engineTypeCode,
      String engineComboCode,
      String kitManufacturerName,
      String kitManufacturerModel,
      String yearManufactured,
      int registrantTypeCode,
      String registrantName,
      String registrantAddressLine1,
      String registrantAddressLine2,
      String registrantCity,
      String registrantStateCode,
      String registrantRegionCode,
      String registrantCountyCode,
      String registrantPostalCode,
      String registrantCountryCode,
      String certificationCode,
      String fractionalOwner,
      String otherName1,
      String otherName2,
      String otherName3,
      String otherName4,
      String otherName5,
      DateTime airworthinessDate,
      DateTime certIssueDate,
      DateTime expirationDate,
      DateTime lastActionDate}) {
    return FaaAircraftRegistration(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        uniqueId: uniqueId ?? this.uniqueId,
        nNumber: nNumber ?? this.nNumber,
        modeSCode: modeSCode ?? this.modeSCode,
        modeSCodeHex: modeSCodeHex ?? this.modeSCodeHex,
        statusCode: statusCode ?? this.statusCode,
        aircraftComboCode: aircraftComboCode ?? this.aircraftComboCode,
        aircraftTypeCode: aircraftTypeCode ?? this.aircraftTypeCode,
        engineTypeCode: engineTypeCode ?? this.engineTypeCode,
        engineComboCode: engineComboCode ?? this.engineComboCode,
        kitManufacturerName: kitManufacturerName ?? this.kitManufacturerName,
        kitManufacturerModel: kitManufacturerModel ?? this.kitManufacturerModel,
        yearManufactured: yearManufactured ?? this.yearManufactured,
        registrantTypeCode: registrantTypeCode ?? this.registrantTypeCode,
        registrantName: registrantName ?? this.registrantName,
        registrantAddressLine1:
            registrantAddressLine1 ?? this.registrantAddressLine1,
        registrantAddressLine2:
            registrantAddressLine2 ?? this.registrantAddressLine2,
        registrantCity: registrantCity ?? this.registrantCity,
        registrantStateCode: registrantStateCode ?? this.registrantStateCode,
        registrantRegionCode: registrantRegionCode ?? this.registrantRegionCode,
        registrantCountyCode: registrantCountyCode ?? this.registrantCountyCode,
        registrantPostalCode: registrantPostalCode ?? this.registrantPostalCode,
        registrantCountryCode:
            registrantCountryCode ?? this.registrantCountryCode,
        certificationCode: certificationCode ?? this.certificationCode,
        fractionalOwner: fractionalOwner ?? this.fractionalOwner,
        otherName1: otherName1 ?? this.otherName1,
        otherName2: otherName2 ?? this.otherName2,
        otherName3: otherName3 ?? this.otherName3,
        otherName4: otherName4 ?? this.otherName4,
        otherName5: otherName5 ?? this.otherName5,
        airworthinessDate: airworthinessDate ?? this.airworthinessDate,
        certIssueDate: certIssueDate ?? this.certIssueDate,
        expirationDate: expirationDate ?? this.expirationDate,
        lastActionDate: lastActionDate ?? this.lastActionDate);
  }

  bool operator ==(other) {
    return other is _FaaAircraftRegistration &&
        other.id == id &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.uniqueId == uniqueId &&
        other.nNumber == nNumber &&
        other.modeSCode == modeSCode &&
        other.modeSCodeHex == modeSCodeHex &&
        other.statusCode == statusCode &&
        other.aircraftComboCode == aircraftComboCode &&
        other.aircraftTypeCode == aircraftTypeCode &&
        other.engineTypeCode == engineTypeCode &&
        other.engineComboCode == engineComboCode &&
        other.kitManufacturerName == kitManufacturerName &&
        other.kitManufacturerModel == kitManufacturerModel &&
        other.yearManufactured == yearManufactured &&
        other.registrantTypeCode == registrantTypeCode &&
        other.registrantName == registrantName &&
        other.registrantAddressLine1 == registrantAddressLine1 &&
        other.registrantAddressLine2 == registrantAddressLine2 &&
        other.registrantCity == registrantCity &&
        other.registrantStateCode == registrantStateCode &&
        other.registrantRegionCode == registrantRegionCode &&
        other.registrantCountyCode == registrantCountyCode &&
        other.registrantPostalCode == registrantPostalCode &&
        other.registrantCountryCode == registrantCountryCode &&
        other.certificationCode == certificationCode &&
        other.fractionalOwner == fractionalOwner &&
        other.otherName1 == otherName1 &&
        other.otherName2 == otherName2 &&
        other.otherName3 == otherName3 &&
        other.otherName4 == otherName4 &&
        other.otherName5 == otherName5 &&
        other.airworthinessDate == airworthinessDate &&
        other.certIssueDate == certIssueDate &&
        other.expirationDate == expirationDate &&
        other.lastActionDate == lastActionDate;
  }

  @override
  int get hashCode {
    return hashObjects([
      id,
      createdAt,
      updatedAt,
      uniqueId,
      nNumber,
      modeSCode,
      modeSCodeHex,
      statusCode,
      aircraftComboCode,
      aircraftTypeCode,
      engineTypeCode,
      engineComboCode,
      kitManufacturerName,
      kitManufacturerModel,
      yearManufactured,
      registrantTypeCode,
      registrantName,
      registrantAddressLine1,
      registrantAddressLine2,
      registrantCity,
      registrantStateCode,
      registrantRegionCode,
      registrantCountyCode,
      registrantPostalCode,
      registrantCountryCode,
      certificationCode,
      fractionalOwner,
      otherName1,
      otherName2,
      otherName3,
      otherName4,
      otherName5,
      airworthinessDate,
      certIssueDate,
      expirationDate,
      lastActionDate
    ]);
  }

  @override
  String toString() {
    return "FaaAircraftRegistration(id=$id, createdAt=$createdAt, updatedAt=$updatedAt, uniqueId=$uniqueId, nNumber=$nNumber, modeSCode=$modeSCode, modeSCodeHex=$modeSCodeHex, statusCode=$statusCode, aircraftComboCode=$aircraftComboCode, aircraftTypeCode=$aircraftTypeCode, engineTypeCode=$engineTypeCode, engineComboCode=$engineComboCode, kitManufacturerName=$kitManufacturerName, kitManufacturerModel=$kitManufacturerModel, yearManufactured=$yearManufactured, registrantTypeCode=$registrantTypeCode, registrantName=$registrantName, registrantAddressLine1=$registrantAddressLine1, registrantAddressLine2=$registrantAddressLine2, registrantCity=$registrantCity, registrantStateCode=$registrantStateCode, registrantRegionCode=$registrantRegionCode, registrantCountyCode=$registrantCountyCode, registrantPostalCode=$registrantPostalCode, registrantCountryCode=$registrantCountryCode, certificationCode=$certificationCode, fractionalOwner=$fractionalOwner, otherName1=$otherName1, otherName2=$otherName2, otherName3=$otherName3, otherName4=$otherName4, otherName5=$otherName5, airworthinessDate=$airworthinessDate, certIssueDate=$certIssueDate, expirationDate=$expirationDate, lastActionDate=$lastActionDate)";
  }

  Map<String, dynamic> toJson() {
    return FaaAircraftRegistrationSerializer.toMap(this);
  }
}

// **************************************************************************
// SerializerGenerator
// **************************************************************************

const FaaAircraftRegistrationSerializer faaAircraftRegistrationSerializer =
    FaaAircraftRegistrationSerializer();

class FaaAircraftRegistrationEncoder
    extends Converter<FaaAircraftRegistration, Map> {
  const FaaAircraftRegistrationEncoder();

  @override
  Map convert(FaaAircraftRegistration model) =>
      FaaAircraftRegistrationSerializer.toMap(model);
}

class FaaAircraftRegistrationDecoder
    extends Converter<Map, FaaAircraftRegistration> {
  const FaaAircraftRegistrationDecoder();

  @override
  FaaAircraftRegistration convert(Map map) =>
      FaaAircraftRegistrationSerializer.fromMap(map);
}

class FaaAircraftRegistrationSerializer
    extends Codec<FaaAircraftRegistration, Map> {
  const FaaAircraftRegistrationSerializer();

  @override
  get encoder => const FaaAircraftRegistrationEncoder();
  @override
  get decoder => const FaaAircraftRegistrationDecoder();
  static FaaAircraftRegistration fromMap(Map map) {
    return FaaAircraftRegistration(
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
        uniqueId: map['unique_id'] as String,
        nNumber: map['n_number'] as String,
        modeSCode: map['mode_s_code'] as int,
        modeSCodeHex: map['mode_s_code_hex'] as String,
        statusCode: map['status_code'] as String,
        aircraftComboCode: map['aircraft_combo_code'] as String,
        aircraftTypeCode: map['aircraft_type_code'] as String,
        engineTypeCode: map['engine_type_code'] as int,
        engineComboCode: map['engine_combo_code'] as String,
        kitManufacturerName: map['kit_manufacturer_name'] as String,
        kitManufacturerModel: map['kit_manufacturer_model'] as String,
        yearManufactured: map['year_manufactured'] as String,
        registrantTypeCode: map['registrant_type_code'] as int,
        registrantName: map['registrant_name'] as String,
        registrantAddressLine1: map['registrant_address_line1'] as String,
        registrantAddressLine2: map['registrant_address_line2'] as String,
        registrantCity: map['registrant_city'] as String,
        registrantStateCode: map['registrant_state_code'] as String,
        registrantRegionCode: map['registrant_region_code'] as String,
        registrantCountyCode: map['registrant_county_code'] as String,
        registrantPostalCode: map['registrant_postal_code'] as String,
        registrantCountryCode: map['registrant_country_code'] as String,
        certificationCode: map['certification_code'] as String,
        fractionalOwner: map['fractional_owner'] as String,
        otherName1: map['other_name1'] as String,
        otherName2: map['other_name2'] as String,
        otherName3: map['other_name3'] as String,
        otherName4: map['other_name4'] as String,
        otherName5: map['other_name5'] as String,
        airworthinessDate: map['airworthiness_date'] != null
            ? (map['airworthiness_date'] is DateTime
                ? (map['airworthiness_date'] as DateTime)
                : DateTime.parse(map['airworthiness_date'].toString()))
            : null,
        certIssueDate: map['cert_issue_date'] != null
            ? (map['cert_issue_date'] is DateTime
                ? (map['cert_issue_date'] as DateTime)
                : DateTime.parse(map['cert_issue_date'].toString()))
            : null,
        expirationDate: map['expiration_date'] != null
            ? (map['expiration_date'] is DateTime
                ? (map['expiration_date'] as DateTime)
                : DateTime.parse(map['expiration_date'].toString()))
            : null,
        lastActionDate: map['last_action_date'] != null
            ? (map['last_action_date'] is DateTime
                ? (map['last_action_date'] as DateTime)
                : DateTime.parse(map['last_action_date'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_FaaAircraftRegistration model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String(),
      'unique_id': model.uniqueId,
      'n_number': model.nNumber,
      'mode_s_code': model.modeSCode,
      'mode_s_code_hex': model.modeSCodeHex,
      'status_code': model.statusCode,
      'aircraft_combo_code': model.aircraftComboCode,
      'aircraft_type_code': model.aircraftTypeCode,
      'engine_type_code': model.engineTypeCode,
      'engine_combo_code': model.engineComboCode,
      'kit_manufacturer_name': model.kitManufacturerName,
      'kit_manufacturer_model': model.kitManufacturerModel,
      'year_manufactured': model.yearManufactured,
      'registrant_type_code': model.registrantTypeCode,
      'registrant_name': model.registrantName,
      'registrant_address_line1': model.registrantAddressLine1,
      'registrant_address_line2': model.registrantAddressLine2,
      'registrant_city': model.registrantCity,
      'registrant_state_code': model.registrantStateCode,
      'registrant_region_code': model.registrantRegionCode,
      'registrant_county_code': model.registrantCountyCode,
      'registrant_postal_code': model.registrantPostalCode,
      'registrant_country_code': model.registrantCountryCode,
      'certification_code': model.certificationCode,
      'fractional_owner': model.fractionalOwner,
      'other_name1': model.otherName1,
      'other_name2': model.otherName2,
      'other_name3': model.otherName3,
      'other_name4': model.otherName4,
      'other_name5': model.otherName5,
      'airworthiness_date': model.airworthinessDate?.toIso8601String(),
      'cert_issue_date': model.certIssueDate?.toIso8601String(),
      'expiration_date': model.expirationDate?.toIso8601String(),
      'last_action_date': model.lastActionDate?.toIso8601String()
    };
  }
}

abstract class FaaAircraftRegistrationFields {
  static const List<String> allFields = <String>[
    id,
    createdAt,
    updatedAt,
    uniqueId,
    nNumber,
    modeSCode,
    modeSCodeHex,
    statusCode,
    aircraftComboCode,
    aircraftTypeCode,
    engineTypeCode,
    engineComboCode,
    kitManufacturerName,
    kitManufacturerModel,
    yearManufactured,
    registrantTypeCode,
    registrantName,
    registrantAddressLine1,
    registrantAddressLine2,
    registrantCity,
    registrantStateCode,
    registrantRegionCode,
    registrantCountyCode,
    registrantPostalCode,
    registrantCountryCode,
    certificationCode,
    fractionalOwner,
    otherName1,
    otherName2,
    otherName3,
    otherName4,
    otherName5,
    airworthinessDate,
    certIssueDate,
    expirationDate,
    lastActionDate
  ];

  static const String id = 'id';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';

  static const String uniqueId = 'unique_id';

  static const String nNumber = 'n_number';

  static const String modeSCode = 'mode_s_code';

  static const String modeSCodeHex = 'mode_s_code_hex';

  static const String statusCode = 'status_code';

  static const String aircraftComboCode = 'aircraft_combo_code';

  static const String aircraftTypeCode = 'aircraft_type_code';

  static const String engineTypeCode = 'engine_type_code';

  static const String engineComboCode = 'engine_combo_code';

  static const String kitManufacturerName = 'kit_manufacturer_name';

  static const String kitManufacturerModel = 'kit_manufacturer_model';

  static const String yearManufactured = 'year_manufactured';

  static const String registrantTypeCode = 'registrant_type_code';

  static const String registrantName = 'registrant_name';

  static const String registrantAddressLine1 = 'registrant_address_line1';

  static const String registrantAddressLine2 = 'registrant_address_line2';

  static const String registrantCity = 'registrant_city';

  static const String registrantStateCode = 'registrant_state_code';

  static const String registrantRegionCode = 'registrant_region_code';

  static const String registrantCountyCode = 'registrant_county_code';

  static const String registrantPostalCode = 'registrant_postal_code';

  static const String registrantCountryCode = 'registrant_country_code';

  static const String certificationCode = 'certification_code';

  static const String fractionalOwner = 'fractional_owner';

  static const String otherName1 = 'other_name1';

  static const String otherName2 = 'other_name2';

  static const String otherName3 = 'other_name3';

  static const String otherName4 = 'other_name4';

  static const String otherName5 = 'other_name5';

  static const String airworthinessDate = 'airworthiness_date';

  static const String certIssueDate = 'cert_issue_date';

  static const String expirationDate = 'expiration_date';

  static const String lastActionDate = 'last_action_date';
}

///
//  Generated code. Do not modify.
//  source: airframes.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class AirframesClientFrame_Source_SourceType extends $pb.ProtobufEnum {
  static const AirframesClientFrame_Source_SourceType ACARS = AirframesClientFrame_Source_SourceType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ACARS');
  static const AirframesClientFrame_Source_SourceType VDL = AirframesClientFrame_Source_SourceType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VDL');
  static const AirframesClientFrame_Source_SourceType HFDL = AirframesClientFrame_Source_SourceType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'HFDL');
  static const AirframesClientFrame_Source_SourceType AERO = AirframesClientFrame_Source_SourceType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AERO');

  static const $core.List<AirframesClientFrame_Source_SourceType> values = <AirframesClientFrame_Source_SourceType> [
    ACARS,
    VDL,
    HFDL,
    AERO,
  ];

  static final $core.Map<$core.int, AirframesClientFrame_Source_SourceType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AirframesClientFrame_Source_SourceType valueOf($core.int value) => _byValue[value];

  const AirframesClientFrame_Source_SourceType._($core.int v, $core.String n) : super(v, n);
}

class AirframesClientFrame_Source_SourceFormat extends $pb.ProtobufEnum {
  static const AirframesClientFrame_Source_SourceFormat HUMAN_READABLE_TEXT = AirframesClientFrame_Source_SourceFormat._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'HUMAN_READABLE_TEXT');
  static const AirframesClientFrame_Source_SourceFormat BEAST = AirframesClientFrame_Source_SourceFormat._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BEAST');
  static const AirframesClientFrame_Source_SourceFormat SBS3 = AirframesClientFrame_Source_SourceFormat._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SBS3');
  static const AirframesClientFrame_Source_SourceFormat PLANE_PLOTTER = AirframesClientFrame_Source_SourceFormat._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PLANE_PLOTTER');
  static const AirframesClientFrame_Source_SourceFormat JSON_GENERIC = AirframesClientFrame_Source_SourceFormat._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'JSON_GENERIC');
  static const AirframesClientFrame_Source_SourceFormat JSON_ACARSDEC = AirframesClientFrame_Source_SourceFormat._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'JSON_ACARSDEC');
  static const AirframesClientFrame_Source_SourceFormat JSON_VDLM2DEC = AirframesClientFrame_Source_SourceFormat._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'JSON_VDLM2DEC');

  static const $core.List<AirframesClientFrame_Source_SourceFormat> values = <AirframesClientFrame_Source_SourceFormat> [
    HUMAN_READABLE_TEXT,
    BEAST,
    SBS3,
    PLANE_PLOTTER,
    JSON_GENERIC,
    JSON_ACARSDEC,
    JSON_VDLM2DEC,
  ];

  static final $core.Map<$core.int, AirframesClientFrame_Source_SourceFormat> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AirframesClientFrame_Source_SourceFormat valueOf($core.int value) => _byValue[value];

  const AirframesClientFrame_Source_SourceFormat._($core.int v, $core.String n) : super(v, n);
}

class AirframesClientFrame_Source_App_AppType extends $pb.ProtobufEnum {
  static const AirframesClientFrame_Source_App_AppType UNKNOWN_APP_TYPE = AirframesClientFrame_Source_App_AppType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN_APP_TYPE');
  static const AirframesClientFrame_Source_App_AppType ACARSDEC = AirframesClientFrame_Source_App_AppType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ACARSDEC');
  static const AirframesClientFrame_Source_App_AppType ACARSDECO2 = AirframesClientFrame_Source_App_AppType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ACARSDECO2');
  static const AirframesClientFrame_Source_App_AppType VDLM2DEC = AirframesClientFrame_Source_App_AppType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VDLM2DEC');
  static const AirframesClientFrame_Source_App_AppType DUMPVDL2 = AirframesClientFrame_Source_App_AppType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DUMPVDL2');
  static const AirframesClientFrame_Source_App_AppType JAERO = AirframesClientFrame_Source_App_AppType._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'JAERO');
  static const AirframesClientFrame_Source_App_AppType PC_HFDL = AirframesClientFrame_Source_App_AppType._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PC_HFDL');
  static const AirframesClientFrame_Source_App_AppType SORCERER = AirframesClientFrame_Source_App_AppType._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SORCERER');

  static const $core.List<AirframesClientFrame_Source_App_AppType> values = <AirframesClientFrame_Source_App_AppType> [
    UNKNOWN_APP_TYPE,
    ACARSDEC,
    ACARSDECO2,
    VDLM2DEC,
    DUMPVDL2,
    JAERO,
    PC_HFDL,
    SORCERER,
  ];

  static final $core.Map<$core.int, AirframesClientFrame_Source_App_AppType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AirframesClientFrame_Source_App_AppType valueOf($core.int value) => _byValue[value];

  const AirframesClientFrame_Source_App_AppType._($core.int v, $core.String n) : super(v, n);
}

class AirframesClientFrame_Source_Host_Platform extends $pb.ProtobufEnum {
  static const AirframesClientFrame_Source_Host_Platform UNKNOWN_PLATFORM = AirframesClientFrame_Source_Host_Platform._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN_PLATFORM');
  static const AirframesClientFrame_Source_Host_Platform X86_32 = AirframesClientFrame_Source_Host_Platform._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'X86_32');
  static const AirframesClientFrame_Source_Host_Platform X86_64 = AirframesClientFrame_Source_Host_Platform._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'X86_64');
  static const AirframesClientFrame_Source_Host_Platform ARM_V6 = AirframesClientFrame_Source_Host_Platform._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ARM_V6');
  static const AirframesClientFrame_Source_Host_Platform ARM_V7 = AirframesClientFrame_Source_Host_Platform._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ARM_V7');
  static const AirframesClientFrame_Source_Host_Platform ARM_64 = AirframesClientFrame_Source_Host_Platform._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ARM_64');

  static const $core.List<AirframesClientFrame_Source_Host_Platform> values = <AirframesClientFrame_Source_Host_Platform> [
    UNKNOWN_PLATFORM,
    X86_32,
    X86_64,
    ARM_V6,
    ARM_V7,
    ARM_64,
  ];

  static final $core.Map<$core.int, AirframesClientFrame_Source_Host_Platform> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AirframesClientFrame_Source_Host_Platform valueOf($core.int value) => _byValue[value];

  const AirframesClientFrame_Source_Host_Platform._($core.int v, $core.String n) : super(v, n);
}

class AirframesClientFrame_Source_Host_OperatingSystem extends $pb.ProtobufEnum {
  static const AirframesClientFrame_Source_Host_OperatingSystem UNKNOWN_OPERATING_SYSTEM = AirframesClientFrame_Source_Host_OperatingSystem._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN_OPERATING_SYSTEM');
  static const AirframesClientFrame_Source_Host_OperatingSystem LINUX = AirframesClientFrame_Source_Host_OperatingSystem._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'LINUX');
  static const AirframesClientFrame_Source_Host_OperatingSystem MACOS = AirframesClientFrame_Source_Host_OperatingSystem._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MACOS');
  static const AirframesClientFrame_Source_Host_OperatingSystem WINDOWS = AirframesClientFrame_Source_Host_OperatingSystem._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WINDOWS');

  static const $core.List<AirframesClientFrame_Source_Host_OperatingSystem> values = <AirframesClientFrame_Source_Host_OperatingSystem> [
    UNKNOWN_OPERATING_SYSTEM,
    LINUX,
    MACOS,
    WINDOWS,
  ];

  static final $core.Map<$core.int, AirframesClientFrame_Source_Host_OperatingSystem> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AirframesClientFrame_Source_Host_OperatingSystem valueOf($core.int value) => _byValue[value];

  const AirframesClientFrame_Source_Host_OperatingSystem._($core.int v, $core.String n) : super(v, n);
}


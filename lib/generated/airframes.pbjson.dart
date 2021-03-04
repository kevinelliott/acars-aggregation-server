///
//  Generated code. Do not modify.
//  source: airframes.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use acarsdecMessageDescriptor instead')
const AcarsdecMessage$json = const {
  '1': 'AcarsdecMessage',
  '2': const [
    const {'1': 'timestamp', '3': 1, '4': 1, '5': 1, '10': 'timestamp'},
    const {'1': 'station_id', '3': 2, '4': 1, '5': 9, '10': 'stationId'},
    const {'1': 'channel', '3': 3, '4': 1, '5': 13, '10': 'channel'},
    const {'1': 'frequency', '3': 4, '4': 1, '5': 1, '10': 'frequency'},
    const {'1': 'level', '3': 5, '4': 1, '5': 17, '10': 'level'},
    const {'1': 'error', '3': 6, '4': 1, '5': 13, '10': 'error'},
    const {'1': 'mode', '3': 7, '4': 1, '5': 9, '10': 'mode'},
    const {'1': 'label', '3': 8, '4': 1, '5': 9, '10': 'label'},
    const {'1': 'block_id', '3': 9, '4': 1, '5': 9, '10': 'blockId'},
    const {'1': 'ack', '3': 10, '4': 1, '5': 9, '10': 'ack'},
    const {'1': 'tail', '3': 11, '4': 1, '5': 9, '10': 'tail'},
    const {'1': 'flight', '3': 12, '4': 1, '5': 9, '10': 'flight'},
    const {'1': 'message_number', '3': 13, '4': 1, '5': 9, '10': 'messageNumber'},
    const {'1': 'text', '3': 14, '4': 1, '5': 9, '10': 'text'},
    const {'1': 'end', '3': 15, '4': 1, '5': 8, '10': 'end'},
  ],
};

/// Descriptor for `AcarsdecMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List acarsdecMessageDescriptor = $convert.base64Decode('Cg9BY2Fyc2RlY01lc3NhZ2USHAoJdGltZXN0YW1wGAEgASgBUgl0aW1lc3RhbXASHQoKc3RhdGlvbl9pZBgCIAEoCVIJc3RhdGlvbklkEhgKB2NoYW5uZWwYAyABKA1SB2NoYW5uZWwSHAoJZnJlcXVlbmN5GAQgASgBUglmcmVxdWVuY3kSFAoFbGV2ZWwYBSABKBFSBWxldmVsEhQKBWVycm9yGAYgASgNUgVlcnJvchISCgRtb2RlGAcgASgJUgRtb2RlEhQKBWxhYmVsGAggASgJUgVsYWJlbBIZCghibG9ja19pZBgJIAEoCVIHYmxvY2tJZBIQCgNhY2sYCiABKAlSA2FjaxISCgR0YWlsGAsgASgJUgR0YWlsEhYKBmZsaWdodBgMIAEoCVIGZmxpZ2h0EiUKDm1lc3NhZ2VfbnVtYmVyGA0gASgJUg1tZXNzYWdlTnVtYmVyEhIKBHRleHQYDiABKAlSBHRleHQSEAoDZW5kGA8gASgIUgNlbmQ=');
@$core.Deprecated('Use vdlm2decMessageDescriptor instead')
const Vdlm2decMessage$json = const {
  '1': 'Vdlm2decMessage',
  '2': const [
    const {'1': 'timestamp', '3': 1, '4': 1, '5': 1, '10': 'timestamp'},
    const {'1': 'station_id', '3': 2, '4': 1, '5': 9, '10': 'stationId'},
    const {'1': 'channel', '3': 3, '4': 1, '5': 13, '10': 'channel'},
    const {'1': 'frequency', '3': 4, '4': 1, '5': 1, '10': 'frequency'},
    const {'1': 'from_icao', '3': 5, '4': 1, '5': 13, '10': 'fromIcao'},
    const {'1': 'to_icao', '3': 6, '4': 1, '5': 13, '10': 'toIcao'},
    const {'1': 'level', '3': 7, '4': 1, '5': 17, '10': 'level'},
    const {'1': 'error', '3': 8, '4': 1, '5': 13, '10': 'error'},
    const {'1': 'mode', '3': 9, '4': 1, '5': 9, '10': 'mode'},
    const {'1': 'label', '3': 10, '4': 1, '5': 9, '10': 'label'},
    const {'1': 'block_id', '3': 11, '4': 1, '5': 9, '10': 'blockId'},
    const {'1': 'ack', '3': 12, '4': 1, '5': 9, '10': 'ack'},
    const {'1': 'tail', '3': 13, '4': 1, '5': 9, '10': 'tail'},
    const {'1': 'flight', '3': 14, '4': 1, '5': 9, '10': 'flight'},
    const {'1': 'message_number', '3': 15, '4': 1, '5': 9, '10': 'messageNumber'},
    const {'1': 'text', '3': 16, '4': 1, '5': 9, '10': 'text'},
    const {'1': 'end', '3': 17, '4': 1, '5': 8, '10': 'end'},
    const {'1': 'departure_airport', '3': 18, '4': 1, '5': 9, '10': 'departureAirport'},
    const {'1': 'destination_airport', '3': 19, '4': 1, '5': 9, '10': 'destinationAirport'},
    const {'1': 'arrival_eta', '3': 20, '4': 1, '5': 9, '10': 'arrivalEta'},
    const {'1': 'gate_out', '3': 21, '4': 1, '5': 9, '10': 'gateOut'},
    const {'1': 'ground_off', '3': 22, '4': 1, '5': 9, '10': 'groundOff'},
    const {'1': 'ground_on', '3': 23, '4': 1, '5': 9, '10': 'groundOn'},
    const {'1': 'gate_in', '3': 24, '4': 1, '5': 9, '10': 'gateIn'},
  ],
};

/// Descriptor for `Vdlm2decMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List vdlm2decMessageDescriptor = $convert.base64Decode('Cg9WZGxtMmRlY01lc3NhZ2USHAoJdGltZXN0YW1wGAEgASgBUgl0aW1lc3RhbXASHQoKc3RhdGlvbl9pZBgCIAEoCVIJc3RhdGlvbklkEhgKB2NoYW5uZWwYAyABKA1SB2NoYW5uZWwSHAoJZnJlcXVlbmN5GAQgASgBUglmcmVxdWVuY3kSGwoJZnJvbV9pY2FvGAUgASgNUghmcm9tSWNhbxIXCgd0b19pY2FvGAYgASgNUgZ0b0ljYW8SFAoFbGV2ZWwYByABKBFSBWxldmVsEhQKBWVycm9yGAggASgNUgVlcnJvchISCgRtb2RlGAkgASgJUgRtb2RlEhQKBWxhYmVsGAogASgJUgVsYWJlbBIZCghibG9ja19pZBgLIAEoCVIHYmxvY2tJZBIQCgNhY2sYDCABKAlSA2FjaxISCgR0YWlsGA0gASgJUgR0YWlsEhYKBmZsaWdodBgOIAEoCVIGZmxpZ2h0EiUKDm1lc3NhZ2VfbnVtYmVyGA8gASgJUg1tZXNzYWdlTnVtYmVyEhIKBHRleHQYECABKAlSBHRleHQSEAoDZW5kGBEgASgIUgNlbmQSKwoRZGVwYXJ0dXJlX2FpcnBvcnQYEiABKAlSEGRlcGFydHVyZUFpcnBvcnQSLwoTZGVzdGluYXRpb25fYWlycG9ydBgTIAEoCVISZGVzdGluYXRpb25BaXJwb3J0Eh8KC2Fycml2YWxfZXRhGBQgASgJUgphcnJpdmFsRXRhEhkKCGdhdGVfb3V0GBUgASgJUgdnYXRlT3V0Eh0KCmdyb3VuZF9vZmYYFiABKAlSCWdyb3VuZE9mZhIbCglncm91bmRfb24YFyABKAlSCGdyb3VuZE9uEhcKB2dhdGVfaW4YGCABKAlSBmdhdGVJbg==');
@$core.Deprecated('Use frameRequestDescriptor instead')
const FrameRequest$json = const {
  '1': 'FrameRequest',
};

/// Descriptor for `FrameRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List frameRequestDescriptor = $convert.base64Decode('CgxGcmFtZVJlcXVlc3Q=');
@$core.Deprecated('Use airframesClientFrameDescriptor instead')
const AirframesClientFrame$json = const {
  '1': 'AirframesClientFrame',
  '2': const [
    const {'1': 'source', '3': 1, '4': 1, '5': 11, '6': '.airframes.AirframesClientFrame.Source', '10': 'source'},
    const {'1': 'airframes', '3': 2, '4': 1, '5': 11, '6': '.airframes.AirframesClientFrame.AirframesConfig', '10': 'airframes'},
    const {'1': 'acarsdec_message', '3': 3, '4': 1, '5': 11, '6': '.airframes.AcarsdecMessage', '9': 0, '10': 'acarsdecMessage'},
    const {'1': 'vdlm2dec_message', '3': 4, '4': 1, '5': 11, '6': '.airframes.Vdlm2decMessage', '9': 0, '10': 'vdlm2decMessage'},
  ],
  '3': const [AirframesClientFrame_Source$json, AirframesClientFrame_AirframesConfig$json],
  '8': const [
    const {'1': 'message'},
  ],
};

@$core.Deprecated('Use airframesClientFrameDescriptor instead')
const AirframesClientFrame_Source$json = const {
  '1': 'Source',
  '2': const [
    const {'1': 'app', '3': 1, '4': 1, '5': 11, '6': '.airframes.AirframesClientFrame.Source.App', '10': 'app'},
    const {'1': 'host', '3': 2, '4': 1, '5': 11, '6': '.airframes.AirframesClientFrame.Source.Host', '10': 'host'},
    const {'1': 'type', '3': 3, '4': 1, '5': 14, '6': '.airframes.AirframesClientFrame.Source.SourceType', '10': 'type'},
    const {'1': 'format', '3': 4, '4': 1, '5': 14, '6': '.airframes.AirframesClientFrame.Source.SourceFormat', '10': 'format'},
  ],
  '3': const [AirframesClientFrame_Source_App$json, AirframesClientFrame_Source_Host$json],
  '4': const [AirframesClientFrame_Source_SourceType$json, AirframesClientFrame_Source_SourceFormat$json],
};

@$core.Deprecated('Use airframesClientFrameDescriptor instead')
const AirframesClientFrame_Source_App$json = const {
  '1': 'App',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.airframes.AirframesClientFrame.Source.App.AppType', '10': 'type'},
    const {'1': 'version', '3': 2, '4': 1, '5': 9, '10': 'version'},
  ],
  '4': const [AirframesClientFrame_Source_App_AppType$json],
};

@$core.Deprecated('Use airframesClientFrameDescriptor instead')
const AirframesClientFrame_Source_App_AppType$json = const {
  '1': 'AppType',
  '2': const [
    const {'1': 'UNKNOWN_APP_TYPE', '2': 0},
    const {'1': 'ACARSDEC', '2': 1},
    const {'1': 'ACARSDECO2', '2': 2},
    const {'1': 'VDLM2DEC', '2': 3},
    const {'1': 'DUMPVDL2', '2': 4},
    const {'1': 'JAERO', '2': 5},
    const {'1': 'PC_HFDL', '2': 6},
    const {'1': 'SORCERER', '2': 7},
  ],
};

@$core.Deprecated('Use airframesClientFrameDescriptor instead')
const AirframesClientFrame_Source_Host$json = const {
  '1': 'Host',
  '2': const [
    const {'1': 'platform', '3': 1, '4': 1, '5': 14, '6': '.airframes.AirframesClientFrame.Source.Host.Platform', '10': 'platform'},
    const {'1': 'os', '3': 2, '4': 1, '5': 14, '6': '.airframes.AirframesClientFrame.Source.Host.OperatingSystem', '10': 'os'},
    const {'1': 'version', '3': 3, '4': 1, '5': 9, '10': 'version'},
    const {'1': 'node_name', '3': 4, '4': 1, '5': 9, '10': 'nodeName'},
    const {'1': 'node_ip', '3': 5, '4': 1, '5': 9, '10': 'nodeIp'},
  ],
  '4': const [AirframesClientFrame_Source_Host_Platform$json, AirframesClientFrame_Source_Host_OperatingSystem$json],
};

@$core.Deprecated('Use airframesClientFrameDescriptor instead')
const AirframesClientFrame_Source_Host_Platform$json = const {
  '1': 'Platform',
  '2': const [
    const {'1': 'UNKNOWN_PLATFORM', '2': 0},
    const {'1': 'X86_32', '2': 1},
    const {'1': 'X86_64', '2': 2},
    const {'1': 'ARM_V6', '2': 3},
    const {'1': 'ARM_V7', '2': 4},
    const {'1': 'ARM_64', '2': 5},
  ],
};

@$core.Deprecated('Use airframesClientFrameDescriptor instead')
const AirframesClientFrame_Source_Host_OperatingSystem$json = const {
  '1': 'OperatingSystem',
  '2': const [
    const {'1': 'UNKNOWN_OPERATING_SYSTEM', '2': 0},
    const {'1': 'LINUX', '2': 1},
    const {'1': 'MACOS', '2': 2},
    const {'1': 'WINDOWS', '2': 3},
  ],
};

@$core.Deprecated('Use airframesClientFrameDescriptor instead')
const AirframesClientFrame_Source_SourceType$json = const {
  '1': 'SourceType',
  '2': const [
    const {'1': 'ACARS', '2': 0},
    const {'1': 'VDL', '2': 1},
    const {'1': 'HFDL', '2': 2},
    const {'1': 'AERO', '2': 3},
  ],
};

@$core.Deprecated('Use airframesClientFrameDescriptor instead')
const AirframesClientFrame_Source_SourceFormat$json = const {
  '1': 'SourceFormat',
  '2': const [
    const {'1': 'HUMAN_READABLE_TEXT', '2': 0},
    const {'1': 'BEAST', '2': 1},
    const {'1': 'SBS3', '2': 2},
    const {'1': 'PLANE_PLOTTER', '2': 3},
    const {'1': 'JSON_GENERIC', '2': 4},
    const {'1': 'JSON_ACARSDEC', '2': 5},
    const {'1': 'JSON_VDLM2DEC', '2': 6},
  ],
};

@$core.Deprecated('Use airframesClientFrameDescriptor instead')
const AirframesClientFrame_AirframesConfig$json = const {
  '1': 'AirframesConfig',
  '2': const [
    const {'1': 'feed', '3': 1, '4': 1, '5': 11, '6': '.airframes.AirframesClientFrame.AirframesConfig.Feed', '10': 'feed'},
  ],
  '3': const [AirframesClientFrame_AirframesConfig_Feed$json],
};

@$core.Deprecated('Use airframesClientFrameDescriptor instead')
const AirframesClientFrame_AirframesConfig_Feed$json = const {
  '1': 'Feed',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `AirframesClientFrame`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List airframesClientFrameDescriptor = $convert.base64Decode('ChRBaXJmcmFtZXNDbGllbnRGcmFtZRI+CgZzb3VyY2UYASABKAsyJi5haXJmcmFtZXMuQWlyZnJhbWVzQ2xpZW50RnJhbWUuU291cmNlUgZzb3VyY2USTQoJYWlyZnJhbWVzGAIgASgLMi8uYWlyZnJhbWVzLkFpcmZyYW1lc0NsaWVudEZyYW1lLkFpcmZyYW1lc0NvbmZpZ1IJYWlyZnJhbWVzEkcKEGFjYXJzZGVjX21lc3NhZ2UYAyABKAsyGi5haXJmcmFtZXMuQWNhcnNkZWNNZXNzYWdlSABSD2FjYXJzZGVjTWVzc2FnZRJHChB2ZGxtMmRlY19tZXNzYWdlGAQgASgLMhouYWlyZnJhbWVzLlZkbG0yZGVjTWVzc2FnZUgAUg92ZGxtMmRlY01lc3NhZ2Ua8AgKBlNvdXJjZRI8CgNhcHAYASABKAsyKi5haXJmcmFtZXMuQWlyZnJhbWVzQ2xpZW50RnJhbWUuU291cmNlLkFwcFIDYXBwEj8KBGhvc3QYAiABKAsyKy5haXJmcmFtZXMuQWlyZnJhbWVzQ2xpZW50RnJhbWUuU291cmNlLkhvc3RSBGhvc3QSRQoEdHlwZRgDIAEoDjIxLmFpcmZyYW1lcy5BaXJmcmFtZXNDbGllbnRGcmFtZS5Tb3VyY2UuU291cmNlVHlwZVIEdHlwZRJLCgZmb3JtYXQYBCABKA4yMy5haXJmcmFtZXMuQWlyZnJhbWVzQ2xpZW50RnJhbWUuU291cmNlLlNvdXJjZUZvcm1hdFIGZm9ybWF0GugBCgNBcHASRgoEdHlwZRgBIAEoDjIyLmFpcmZyYW1lcy5BaXJmcmFtZXNDbGllbnRGcmFtZS5Tb3VyY2UuQXBwLkFwcFR5cGVSBHR5cGUSGAoHdmVyc2lvbhgCIAEoCVIHdmVyc2lvbiJ/CgdBcHBUeXBlEhQKEFVOS05PV05fQVBQX1RZUEUQABIMCghBQ0FSU0RFQxABEg4KCkFDQVJTREVDTzIQAhIMCghWRExNMkRFQxADEgwKCERVTVBWREwyEAQSCQoFSkFFUk8QBRILCgdQQ19IRkRMEAYSDAoIU09SQ0VSRVIQBxqnAwoESG9zdBJQCghwbGF0Zm9ybRgBIAEoDjI0LmFpcmZyYW1lcy5BaXJmcmFtZXNDbGllbnRGcmFtZS5Tb3VyY2UuSG9zdC5QbGF0Zm9ybVIIcGxhdGZvcm0SSwoCb3MYAiABKA4yOy5haXJmcmFtZXMuQWlyZnJhbWVzQ2xpZW50RnJhbWUuU291cmNlLkhvc3QuT3BlcmF0aW5nU3lzdGVtUgJvcxIYCgd2ZXJzaW9uGAMgASgJUgd2ZXJzaW9uEhsKCW5vZGVfbmFtZRgEIAEoCVIIbm9kZU5hbWUSFwoHbm9kZV9pcBgFIAEoCVIGbm9kZUlwIlwKCFBsYXRmb3JtEhQKEFVOS05PV05fUExBVEZPUk0QABIKCgZYODZfMzIQARIKCgZYODZfNjQQAhIKCgZBUk1fVjYQAxIKCgZBUk1fVjcQBBIKCgZBUk1fNjQQBSJSCg9PcGVyYXRpbmdTeXN0ZW0SHAoYVU5LTk9XTl9PUEVSQVRJTkdfU1lTVEVNEAASCQoFTElOVVgQARIJCgVNQUNPUxACEgsKB1dJTkRPV1MQAyI0CgpTb3VyY2VUeXBlEgkKBUFDQVJTEAASBwoDVkRMEAESCAoESEZETBACEggKBEFFUk8QAyKHAQoMU291cmNlRm9ybWF0EhcKE0hVTUFOX1JFQURBQkxFX1RFWFQQABIJCgVCRUFTVBABEggKBFNCUzMQAhIRCg1QTEFORV9QTE9UVEVSEAMSEAoMSlNPTl9HRU5FUklDEAQSEQoNSlNPTl9BQ0FSU0RFQxAFEhEKDUpTT05fVkRMTTJERUMQBhpzCg9BaXJmcmFtZXNDb25maWcSSAoEZmVlZBgBIAEoCzI0LmFpcmZyYW1lcy5BaXJmcmFtZXNDbGllbnRGcmFtZS5BaXJmcmFtZXNDb25maWcuRmVlZFIEZmVlZBoWCgRGZWVkEg4KAmlkGAEgASgJUgJpZEIJCgdtZXNzYWdl');

// import 'package:json_annotation/json_annotation.dart';

// part 'airframes_json_message.g.dart';

// @JsonSerializable(nullable: true, includeIfNull: true, createToJson: false)
// class AirframesJsonMessage<T> {
//   final AirframesJsonSource source;
//   final String payloadType;

//   @JsonKey(fromJson: _dataFromJson)
//   final T payload;

//   factory AirframesJsonMessage.fromJson(Map<String, dynamic> json) =>
//       _$AirframesJsonMessageFromJson(json);

//   /// Decodes [json] by "inspecting" its contents.
//   static T _dataFromJson<T>(Object json) {
//     if (json is Map<String, dynamic>) {
//       if (json.containsKey('payload')) {
//         return AirframesSource.fromJson(json) as T;
//       }

//       if (json.containsKey('title')) {
//         return Article.fromJson(json) as T;
//       }
//     } else if (json is List) {
//       // NOTE: this logic assumes the ONLY valid value for a `List` in this case
//       // is a List<Author>. If that assumption changes, then it will be
//       // necessary to "peak" into non-empty lists to determine the type!

//       return json
//           .map((e) => Article.fromJson(e as Map<String, dynamic>))
//           .toList() as T;
//     }

//     throw ArgumentError.value(
//       json,
//       'json',
//       'Cannot convert the provided data.',
//     );
//   }
// }

// @JsonSerializable(createToJson: false)
// class AirframesJsonSource<T> {
//   final T data;
// }

// @JsonSerializable(createToJson: false)
// class AirframesSourceApp {
//   final String name;
//   final String version;

//   const AirframesSourceApp({
//     this.name,
//     this.version,
//   });

//   factory AirframesSourceApp.fromJson(Map<String, dynamic> json) =>
//       _$AirframesSourceAppFromJson(json);
// }

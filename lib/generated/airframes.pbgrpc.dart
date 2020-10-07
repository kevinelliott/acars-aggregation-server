///
//  Generated code. Do not modify.
//  source: airframes.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'airframes.pb.dart' as $0;
export 'airframes.pb.dart';

class AirframesClient extends $grpc.Client {
  static final _$sendFrame =
      $grpc.ClientMethod<$0.AirframesClientFrame, $0.AirframesClientFrame>(
          '/airframes.Airframes/SendFrame',
          ($0.AirframesClientFrame value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.AirframesClientFrame.fromBuffer(value));
  static final _$getFrame =
      $grpc.ClientMethod<$0.FrameRequest, $0.AirframesClientFrame>(
          '/airframes.Airframes/GetFrame',
          ($0.FrameRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.AirframesClientFrame.fromBuffer(value));
  static final _$getFrames =
      $grpc.ClientMethod<$0.FrameRequest, $0.AirframesClientFrame>(
          '/airframes.Airframes/GetFrames',
          ($0.FrameRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.AirframesClientFrame.fromBuffer(value));

  AirframesClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.AirframesClientFrame> sendFrame(
      $0.AirframesClientFrame request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$sendFrame, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.AirframesClientFrame> getFrame(
      $0.FrameRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$getFrame, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseStream<$0.AirframesClientFrame> getFrames(
      $0.FrameRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$getFrames, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseStream(call);
  }
}

abstract class AirframesServiceBase extends $grpc.Service {
  $core.String get $name => 'airframes.Airframes';

  AirframesServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.AirframesClientFrame, $0.AirframesClientFrame>(
            'SendFrame',
            sendFrame_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.AirframesClientFrame.fromBuffer(value),
            ($0.AirframesClientFrame value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FrameRequest, $0.AirframesClientFrame>(
        'GetFrame',
        getFrame_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.FrameRequest.fromBuffer(value),
        ($0.AirframesClientFrame value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FrameRequest, $0.AirframesClientFrame>(
        'GetFrames',
        getFrames_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.FrameRequest.fromBuffer(value),
        ($0.AirframesClientFrame value) => value.writeToBuffer()));
  }

  $async.Future<$0.AirframesClientFrame> sendFrame_Pre($grpc.ServiceCall call,
      $async.Future<$0.AirframesClientFrame> request) async {
    return sendFrame(call, await request);
  }

  $async.Future<$0.AirframesClientFrame> getFrame_Pre(
      $grpc.ServiceCall call, $async.Future<$0.FrameRequest> request) async {
    return getFrame(call, await request);
  }

  $async.Stream<$0.AirframesClientFrame> getFrames_Pre(
      $grpc.ServiceCall call, $async.Future<$0.FrameRequest> request) async* {
    yield* getFrames(call, await request);
  }

  $async.Future<$0.AirframesClientFrame> sendFrame(
      $grpc.ServiceCall call, $0.AirframesClientFrame request);
  $async.Future<$0.AirframesClientFrame> getFrame(
      $grpc.ServiceCall call, $0.FrameRequest request);
  $async.Stream<$0.AirframesClientFrame> getFrames(
      $grpc.ServiceCall call, $0.FrameRequest request);
}

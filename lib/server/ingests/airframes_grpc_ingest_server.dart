import 'dart:async';
import 'dart:io';

import 'package:grpc/grpc.dart' as grpc;
import 'package:nats/nats.dart';
import 'package:quick_log/quick_log.dart';

import 'package:airframes_aggregation_server/common.dart';

class AirframesService extends AirframesServiceBase {
  IngestServer ingestServer;
  AirframesGrpcProcessor processor;

  @override
  Future<AirframesClientFrame> getFrame(
      grpc.ServiceCall call, FrameRequest request) async {
    ingestServer.logger.fine('Client GetFrame()');
  }

  @override
  Stream<AirframesClientFrame> getFrames(
      grpc.ServiceCall call, FrameRequest request) async* {
    final metadata = call.clientMetadata;
    ingestServer.logger.fine('Client GetFrames() ${metadata}');
  }

  @override
  Future<AirframesClientFrame> sendFrame(
      grpc.ServiceCall call, AirframesClientFrame request) async {
    ingestServer.logger.fine(
        'Client SendFrame(): ${call.clientMetadata} ${request.toProto3Json()}');
    processor.logger = ingestServer.logger;
    processor.source.transmissionType = sourceFromFrame(request);
    processor.process(call, request);
    return request;
  }

  String sourceFromFrame(AirframesClientFrame frame) {
    String transmissionType;

    switch (frame.source.app.type) {
      case AirframesClientFrame_Source_App_AppType.ACARSDEC:
        transmissionType = 'acars';
        break;
      case AirframesClientFrame_Source_App_AppType.ACARSDECO2:
        transmissionType = 'acars';
        break;
      case AirframesClientFrame_Source_App_AppType.DUMPVDL2:
        transmissionType = 'vdl';
        break;
      case AirframesClientFrame_Source_App_AppType.JAERO:
        transmissionType = 'acars';
        break;
      case AirframesClientFrame_Source_App_AppType.PC_HFDL:
        transmissionType = 'hfdl';
        break;
      case AirframesClientFrame_Source_App_AppType.SORCERER:
        transmissionType = 'acars';
        break;
      case AirframesClientFrame_Source_App_AppType.VDLM2DEC:
        transmissionType = 'vdl';
        break;
      default:
        transmissionType = 'unknown';
    }

    return transmissionType;
  }
}

class AirframesGrpcIngestServer extends IngestServer {
  AirframesGrpcIngestServer(name, config, databaseConfig)
      : super(name, config, databaseConfig) {
    Logger.writer = ConsolePrinter(minLevel: LogLevel.fine);
    this.logger = Logger('Ingest(${name})');
    this.source = Source(
        name, 'afc', '1.0.0', 'grpc', 'unknown', 'protobuf', 'af.protobuf.v1');
    this.natsClient = NatsClient(config.natsHost, config.natsPort);
  }

  Future start() async {
    await this.natsClient.connect();
    this.logger.info(
        'Connected to NATS server at ${config.natsHost} on port ${config.natsPort}.');

    final service = AirframesService();
    service.processor = AirframesGrpcProcessor(
        source, databaseConfig.executor(), natsClient, logger);
    service.ingestServer = this;
    this.receiver = grpc.Server([service]);
    await receiver.serve(port: config.port);
    this.logger.info('GRPC Server listening on port ${config.port}...');

    this.logger.info(
        'Listening on ${config.transport} port ${config.port} for incoming messages from ${config.clientApplication} clients...');
  }
}

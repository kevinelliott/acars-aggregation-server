#!/bin/sh

echo Getting dependencies
pub get
echo

echo Building protos
protoc --dart_out=grpc:lib/src/generated -Ilib/src/protos lib/src/protos/airframes.proto

echo Building
pub run build_runner build --delete-conflicting-outputs
echo

echo Building native executable
ls -la
dart2native bin/server.dart -o bin/server.exe -v
echo

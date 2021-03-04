#!/bin/sh

echo Getting dependencies
pub get
pub global activate protoc_plugin
echo

echo Building protos
export PATH="$PATH":"$HOME/.pub-cache/bin"
protoc --dart_out=grpc:lib/generated -Ilib/protos lib/protos/airframes.proto
echo

echo Generating code
pub run build_runner build --delete-conflicting-outputs
echo

echo Building native executables
dart2native lib/apps/aggregation_server/server.dart -o bin/server.exe -v
#dart2native lib/apps/leaderboard_generator/leaderboard_generator.dart -o bin/leaderboard_generator.exe -v
echo

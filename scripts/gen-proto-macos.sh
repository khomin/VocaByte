#!/bin/bash
PROJECT_DIR=$(git rev-parse --show-toplevel 2>/dev/null)
if [ -z $PROJECT_DIR ]; then
    PROJECT_DIR=$PWD
fi

# export PATH=$PATH:$PWD/.lib_pack/macos/protobuf/swift-protobuf/
export PATH=$PATH:$PWD/.lib_pack/apple/protobuf/macos_universal/bin/
# chmod +x ./.lib_pack/macos/protobuf/swift-protobuf/protoc-gen-swift

mkdir -p ./lib/native-api/protobuf/
mkdir -p ./cpp/protobuf/generated
set -x
set -e
protoc  -I=./protobuf --cpp_out=./cpp/protobuf/generated --dart_out=./lib/native-api/protobuf  ./protobuf/app.proto
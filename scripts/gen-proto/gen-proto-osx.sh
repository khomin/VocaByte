#!/bin/bash
SCRIPT_PATH=$(dirname $(readlink -f $0))
cd $SCRIPT_PATH/../../

export PATH=$PATH:$PWD/lib_pack/macos/protobuf/swift-protobuf/
chmod +x ./lib_pack/macos/protobuf/swift-protobuf/protoc-gen-swift

mkdir -p ./lib/services/protobuf
mkdir -p ./cpp/protobuf
set -x
set -e
./lib_pack/macos/protobuf/protoc -I=./protobuf --cpp_out=./cpp/protobuf/generated --dart_out=./lib/services/protobuf ./protobuf/app.proto
#!/bin/bash
SCRIPT_PATH=$(dirname $(readlink -f $0))
cd $SCRIPT_PATH
## Example of use:
##     source env_prj.sh
##     gen-proto.sh

## Run following command if dart plugin is missed in protobuf (this may happen as result of something likes "flutter pub clean")
## 	dart pub global activate protoc_plugin

#source env_prj.sh

echo "Using protobuf compiler:" `which protoc`

if [ -z "$PROJECT_PATH" ]; then
    cd "../../"
else
    cd "$PROJECT_PATH"
fi

## Generate cpp,dart,swift code (needs dart,swift.. plugins installed into protobuf)
#TODO: --swift-out=ios
mkdir -p ./lib/native-api/protobuf/
set -x
protoc -I=./protobuf --cpp_out=./cpp/protobuf/generated --dart_out=./lib/services/protobuf ./protobuf/proto.proto
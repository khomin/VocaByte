#!/bin/bash

# use from the top directory

SCRIPT_PATH=$(dirname $(readlink -f $0))
SCRIPT_PATH="$SCRIPT_PATH/../../cpp"

echo "SCRIPT_PATH=${SCRIPT_PATH}"

rm -rf ${SCRIPT_PATH}/build_ios

mkdir ${SCRIPT_PATH}/build_ios

cd ${SCRIPT_PATH}/build_ios
cmake ../ -G Xcode -DCMAKE_TOOLCHAIN_FILE=../submodule/ios-cmake/ios.toolchain.cmake -DPLATFORM=OS64COMBINED -DDEPLOYMENT_TARGET="14.0"

echo "DONE"
echo "Result in:"
echo ${SCRIPT_PATH}/build_ios

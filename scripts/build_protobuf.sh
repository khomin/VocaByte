#!/bin/bash
set -e

PROJECT_DIR=$(git rev-parse --show-toplevel 2>/dev/null)
if [ -z $PROJECT_DIR ]; then
    PROJECT_DIR=$PWD
fi
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PLATFORM_ARG=$1
SOURCE_DIR="$SCRIPT_DIR/.protobuf"
CHECKOUT_TAG="v4.30.0"
TEMP_DIR=".build-$PLATFORM_ARG"

if [[ ! "$PLATFORM_ARG" =~ ^(macos|android|linux|ios)$ ]]; then
    echo "Usage: $0 {macos|android|linux|ios}"
    exit 1
fi

echo "SCRIPT_DIR=$SCRIPT_DIR"
echo "PROJECT_DIR=$PROJECT_DIR"

if [ ! -d "$SOURCE_DIR/.git" ]; then
    echo "Cloning protobuf... $CHECKOUT_TAG"
    git clone https://github.com/protocolbuffers/protobuf.git --branch $CHECKOUT_TAG --depth 1 --recurse-submodule "$SOURCE_DIR"
else
    echo "Protobuf source already exists in $SOURCE_DIR. Skipping clone."
fi
cd "$SOURCE_DIR"
mkdir -p $TEMP_DIR
cd $TEMP_DIR

build() {
    local PLATFORM_NAME=$1
    local ARCH=$2
    local EXTRA_ARGS=$3
    local BUILD_DIR=${ARCH:-"default_build"}
    echo "Building $PLATFORM_NAME, build in $BUILD_DIR, arguments=$EXTRA_ARGS (this may take a minute)..."
    if [ -z "$ARCH" ]; then
        INSTALL_DIR="$PROJECT_DIR/.lib_pack/$PLATFORM_NAME/protobuf"
    else
        INSTALL_DIR="$PROJECT_DIR/.lib_pack/$PLATFORM_NAME/protobuf/$ARCH"
    fi
    cmake -S ../ -B "$BUILD_DIR" \
        -DCMAKE_BUILD_TYPE=Release \
        -Dprotobuf_BUILD_TESTS=OFF \
        -DCMAKE_CXX_STANDARD=17 \
        -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
        $EXTRA_ARGS
    cmake --build $BUILD_DIR --config Release
    cmake --install $BUILD_DIR --config Release --prefix ${INSTALL_DIR}
}

case $PLATFORM_ARG in
    macos)
        build "apple" "macos_universal" \
            "-G Xcode \
            -DPLATFORM=MAC_UNIVERSAL \
            -DDEPLOYMENT_TARGET=11.0 \
            -DCMAKE_MACOSX_BUNDLE=OFF \
            -Dprotobuf_BUILD_PROTOC_BINARIES=YES \
            -DCMAKE_TOOLCHAIN_FILE=$PROJECT_DIR/cpp/submodule/ios-cmake/ios.toolchain.cmake"
        ;;
    ios)
        build "apple" "ios_combined" \
            "-G Xcode \
            -DPLATFORM=OS64COMBINED \   
            -DDEPLOYMENT_TARGET=14.0 \
            -DCMAKE_MACOSX_BUNDLE=OFF \
            -Dprotobuf_BUILD_PROTOC_BINARIES=NO \
            -DCMAKE_TOOLCHAIN_FILE=$PROJECT_DIR/cpp/submodule/ios-cmake/ios.toolchain.cmake"
        # swift protobuf
        INSTALL_DIR="$PROJECT_DIR/.lib_pack/apple/protobuf/swift-protobuf"
        SOURCE_DIR="$SCRIPT_DIR/.swift-protobuf"
        mkdir -p "${INSTALL_DIR}"

        echo "Cloning swift-protobuf..."
        git clone https://github.com/apple/swift-protobuf.git --branch 1.20.0 "$SOURCE_DIR"
        cd "$SOURCE_DIR"

        echo "Building (this may take a minute)..."
        swift build -c release

        cp .build/release/protoc-gen-swift $INSTALL_DIR
        cp .build/release/protoc-gen-swift-tool $INSTALL_DIR
        ;;
    android)
        if [[ "$OSTYPE" == "darwin"* ]]; then
            export ANDROID_HOME="$HOME/Library/Android/sdk"
        else
            export ANDROID_HOME="$HOME/Android/Sdk"
        fi
        export NDK=$(ls -d $ANDROID_HOME/ndk/* 2>/dev/null | sort -V | tail -n 1)
        export CMAKE_SYSROOT=${NDK}/toolchains/llvm/prebuilt/darwin-x86_64/sysroot/
        export TOOLCHAIN=${NDK}/build/cmake/android.toolchain.cmake
        if [ -z "$NDK" ]; then
            echo "NDK not defined"
            exit 1
        fi
        if [ -z "$CMAKE_SYSROOT" ]; then
            echo "CMAKE_SYSROOT not defined"
            exit 1
        fi
        if [ -z "$TOOLCHAIN" ]; then
            echo "TOOLCHAIN not defined"
            exit 1
        fi
        echo "USING-NDK: ${NDK}"
        echo "USING-CMAKE_SYSROOT: ${CMAKE_SYSROOT}"
        echo "USING-TOOLCHAIN: ${TOOLCHAIN}"
        build "android" "arm64-v8a" "-DCMAKE_TOOLCHAIN_FILE=$TOOLCHAIN
            -DANDROID_ABI=arm64-v8a \
            -DCMAKE_ANDROID_NDK=${NDK} \
            -DANDROID_PLATFORM=android-29 \
            -Dprotobuf_BUILD_SHARED_LIBS=OFF \
            -Dprotobuf_BUILD_PROTOC_BINARIES=NO"
            
        build "android" "x86_64" "-DCMAKE_TOOLCHAIN_FILE=$TOOLCHAIN
            -DANDROID_ABI=x86_64 \
            -DANDROID_PLATFORM=android-29 \
            -Dprotobuf_BUILD_SHARED_LIBS=OFF \
            -DCMAKE_ANDROID_NDK=${NDK} \
            -Dprotobuf_BUILD_PROTOC_BINARIES=NO"
        ;;
    linux)
        build "linux" "" "-Dprotobuf_BUILD_SHARED_LIBS=OFF -Dprotobuf_BUILD_PROTOC_BINARIES=NO"
        ;;
    *)
        echo "Usage: $0 {macos|android}"
        exit 1
        ;;
esac

cd ../..
# rm -rf $SOURCE_DIR

echo "------------------"
echo "COMPLETED"
echo "------------------"
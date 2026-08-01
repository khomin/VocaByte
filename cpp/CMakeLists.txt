cmake_minimum_required(VERSION 3.10)

set(CMAKE_VERBOSE_MAKEFILE ON)
set(CMAKE_CXX_STANDARD 17)

set(CMAKE_CXX_FLAGS_DEBUG "-g -O0" CACHE STRING "Build flag" FORCE)
set(CMAKE_C_FLAGS_DEBUG "-g -O0" CACHE STRING "Build c flag" FORCE)
set(CMAKE_CXX_FLAGS_RELEASE "-DNDEBUG -O3 -s" CACHE STRING "Build flag" FORCE)
set(CMAKE_C_FLAGS_RELEASE "-DNDEBUG -O3 -s" CACHE STRING "Build c flag" FORCE)

set(PROJECT VocaByte)
set(TARGET_NAME ${PROJECT})
set(DESTDIR ${CMAKE_CURRENT_BINARY_DIR})
set(PROJECT_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/..)
project(${PROJECT} VERSION 0.1.0)

if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Debug)
endif()

if(WIN32)
 add_link_options(-static -static-libgcc -static-libstdc++ -m64)  
endif()

add_compile_options(-Wall -fPIC -fexceptions -g -fPIC -Wformat)

if(${CMAKE_BUILD_TYPE} STREQUAL "Release")
    message("Build: Release")
    add_compile_options(-O)
else()
    message("Build: Debug")
    set(CMAKE_CXX_FLAGS_DEBUG           "-O0")
    set(CMAKE_C_FLAGS_DEBUG             "-O0")
    set(CMAKE_CXX_FLAGS_DEBUG           "-gdwarf-2")
endif()

# should be set before ‘project’ statement, otherwise it may not work.
if(APPLE)
    if(NOT IOS)
        set(CMAKE_OSX_DEPLOYMENT_TARGET "11.0" CACHE STRING "Minimum OS X deployment version" FORCE)
        set(DEPLOYMENT_TARGET "11.0" CACHE STRING "Minimum OS X deployment version")
    else()
        set(CMAKE_OSX_DEPLOYMENT_TARGET "14.0" CACHE STRING "Minimum OS X deployment version" FORCE)
        set(DEPLOYMENT_TARGET "14.0" CACHE STRING "Minimum OS X deployment version")
    endif()
endif()

add_subdirectory(ThirdParty/loguru)

if(NOT DEFINED FLUTTER_SDK_PATH)
    if(IS_DIRECTORY "$ENV{FLUTTER_ROOT}")
        set(FLUTTER_SDK_PATH "$ENV{FLUTTER_ROOT}")
    else()
        # Fallback to your PATH search, but use CMake's find_program
        find_program(DART_EXE dart)
        if(DART_EXE)
            get_filename_component(FLUTTER_BIN_DIR "${DART_EXE}" DIRECTORY)
            set(FLUTTER_SDK_PATH "${FLUTTER_BIN_DIR}")
        endif()
    endif()
    message(STATUS "FLUTTER_SDK_PATH is ${FLUTTER_SDK_PATH}")
endif()

set(DART_API_DL_C "${FLUTTER_SDK_PATH}/bin/cache/dart-sdk/include/dart_api_dl.c")
set(DART_INCLUDE_DIR "${FLUTTER_SDK_PATH}/bin/cache/dart-sdk/include")
if(NOT EXISTS "${DART_API_DL_C}")
    message(STATUS "Dart API source: Flutter SDK (${DART_API_DL_C})")
endif()

set(DART_API_DL_C "${FLUTTER_SDK_PATH}/bin/cache/dart-sdk/include/dart_api_dl.c")
set(DART_INCLUDE_DIR "${FLUTTER_SDK_PATH}/bin/cache/dart-sdk/include")
if(NOT EXISTS "${DART_API_DL_C}")
    message(STATUS "Dart API source: Flutter SDK (${DART_API_DL_C})")
endif()

set(SOURCES
    ${DART_API_DL_C}
    ./api_lib.cpp
    ./api_lib.h
    ./db/misc_db.cpp
    ./db/misc_db.h
    ./utils/converter.h
    ./ThirdParty/Sqlite/sqlite3.c
    ./ThirdParty/Sqlite/sqlite3.h
    # protobuf
    ./protobuf/generated/app.pb.cc
    ./protobuf/generated/app.pb.h
)

if(APPLE)
    if(IOS)
        file(GLOB PROTO_ABSL_LIBS
            ${CMAKE_SOURCE_DIR}/../.lib_pack/apple/protobuf/ios_combined/lib/libabsl_*.a
        )
        set(INCLUDE_DIRS ${INCLUDE_DIRS}
            ${CMAKE_SOURCE_DIR}/../.lib_pack/apple/protobuf/ios_combined/include/
        )
        set(LIBRARIES ${LIBRARIES}
            -Wl,--start-group
            ${CMAKE_SOURCE_DIR}/../.lib_pack/apple/protobuf/ios_combined/lib/libprotobuf.a
            ${PROTO_ABSL_LIBS}
            -Wl,--end-group
            ${CMAKE_SOURCE_DIR}/../.lib_pack/apple/protobuf/ios_combined/lib/libutf8_validity.a
            ${CMAKE_SOURCE_DIR}/../.lib_pack/apple/protobuf/ios_combined/lib/libutf8_range.a
            loguru::loguru
        )
        add_library(
            ${PROJECT} STATIC
            ${SOURCES}
        )
    endif()
elseif (ANDROID OR __ANDROID__)
    message("BTEST CMAKE_SYSTEM_PROCESSOR: ${CMAKE_SYSTEM_PROCESSOR}")
    message("ANDROID_ABI: ${ANDROID_ABI}")
    message("CMAKE_ANDROID_ARCH_ABI: ${CMAKE_ANDROID_ARCH_ABI}")
    message("CMAKE_ANDROID_FLUTTER_SDK_PATH: ${FLUTTER_SDK_PATH}")
    message("ANDROID_ABI: ${ANDROID_ABI}")
    file(GLOB PROTO_ABSL_LIBS
        ${CMAKE_SOURCE_DIR}/../.lib_pack/android/protobuf/${CMAKE_ANDROID_ARCH_ABI}/lib/libabsl_*.a
    )
    set(INCLUDE_DIRS ${INCLUDE_DIRS}
      ${CMAKE_SOURCE_DIR}/../.lib_pack/android/protobuf/${CMAKE_ANDROID_ARCH_ABI}/include/
    )
    set(LIBRARIES ${LIBRARIES}
        -Wl,--start-group
        ${CMAKE_SOURCE_DIR}/../.lib_pack/android/protobuf/${CMAKE_ANDROID_ARCH_ABI}/lib/libprotobuf.a
        ${PROTO_ABSL_LIBS}
        -Wl,--end-group
        ${CMAKE_SOURCE_DIR}/../.lib_pack/android/protobuf/${CMAKE_ANDROID_ARCH_ABI}/lib/libutf8_validity.a
        ${CMAKE_SOURCE_DIR}/../.lib_pack/android/protobuf/${CMAKE_ANDROID_ARCH_ABI}/lib/libutf8_range.a
        loguru::loguru
        android
    )
    add_library(
        ${PROJECT} SHARED
        ${SOURCES}
    )
elseif(UNIX AND NOT APPLE)
    # not supported
elseif(WIN32)
    # not supported
endif()

set_target_properties(loguru
    PROPERTIES
    DEBUG_POSTFIX ""
)

target_include_directories(${PROJECT} PUBLIC
    ${DART_INCLUDE_DIR}
    ${INCLUDE_DIRS}
    ./
    ./api/
    ./misc/
    ./protobuf/generated
)

if (ANDROID OR __ANDROID__)
    target_link_options(
        ${PROJECT} PRIVATE
        "-Wl,-z,max-page-size=16384"
    )
endif()

target_link_libraries(${PROJECT} PUBLIC
    ${LIBRARIES}
)

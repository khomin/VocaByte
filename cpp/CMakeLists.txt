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
        set(CMAKE_OSX_DEPLOYMENT_TARGET "13.0" CACHE STRING "Minimum OS X deployment version" FORCE)
        set(DEPLOYMENT_TARGET "13.0" CACHE STRING "Minimum OS X deployment version")
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

set(SOURCES
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

set(INCLUDE_DIRS ${INCLUDE_DIRS}
    ${FLUTTER_SDK_PATH}/cache/dart-sdk/include
    ./protobuf/generated/
)

set(SOURCES ${SOURCES}
    ${FLUTTER_SDK_PATH}/cache/dart-sdk/include/dart_api_dl.c
)

if(APPLE)
    if(IOS)
        set(INCLUDE_DIRS ${INCLUDE_DIRS}
            ${CMAKE_CURRENT_SOURCE_DIR}/../.lib_pack/ios/protobuf/include
        )
        set(LIBRARIES ${LIBRARIES}
            ${CMAKE_CURRENT_SOURCE_DIR}/../.lib_pack/ios/protobuf/ios_universal/libprotobuf.a
            loguru::loguru
        )
    else()
        set(INCLUDE_DIRS ${INCLUDE_DIRS}
            ${CMAKE_CURRENT_SOURCE_DIR}/../.lib_pack/macos/protobuf/include
        )
        set(LIBRARIES$ ${LIBRARIES}
            ${CMAKE_CURRENT_SOURCE_DIR}/../.lib_pack/macos/protobuf/macos_universal/libprotobuf.a
            loguru::loguru
            "-framework Cocoa"
            "-framework Security"
            "-framework Foundation"
            "-framework ServiceManagement"
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
    )
elseif(UNIX AND NOT APPLE)
    set(INCLUDE_DIRS ${INCLUDE_DIRS}
        ${CMAKE_CURRENT_SOURCE_DIR}/../.lib_pack/linux/protobuf/include
    )
    set(LIBRARIES ${LIBRARIES}
        ${CMAKE_CURRENT_SOURCE_DIR}/../.lib_pack/linux/protobuf/lib/libprotobuf.a
        -ldl -lpthread -lxcb -lz
        loguru::loguru
    )
elseif(WIN32)
    # not supported
endif()

if(IOS)
    add_library(
        ${PROJECT} STATIC
        ${SOURCES}
    )
    set_property(TARGET ${PROJECT} PROPERTY XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY "iPhone Developer")
    set_property(TARGET ${PROJECT} PROPERTY XCODE_ATTRIBUTE_DEVELOPMENT_TEAM "BKKJDH248G")
    set_property(TARGET ${PROJECT} PROPERTY XCODE_ATTRIBUTE_ENABLE_BITCODE "NO")
else()
    add_library(
        ${PROJECT} SHARED
        ${SOURCES}
    )
    if(APPLE) # set xcode attributes to all target 
        function(get_all_targets var)
            set(targets)
            get_all_targets_recursive(targets ${CMAKE_CURRENT_SOURCE_DIR})
            set(${var} ${targets} PARENT_SCOPE)
        endfunction()
        macro(get_all_targets_recursive targets dir)
            get_property(subdirectories DIRECTORY ${dir} PROPERTY SUBDIRECTORIES)
            foreach(subdir ${subdirectories})
                get_all_targets_recursive(${targets} ${subdir})
            endforeach()
            get_property(current_targets DIRECTORY ${dir} PROPERTY BUILDSYSTEM_TARGETS)
            list(APPEND ${targets} ${current_targets})
        endmacro()
        
        get_all_targets(all_targets)
        message("All targets: ${all_targets}")

        set_property(TARGET ${all_targets} PROPERTY
            XCODE_ATTRIBUTE_ONLY_ACTIVE_ARCH[variant=Debug] "YES"
        )
        set_property(TARGET ${all_targets} PROPERTY
            XCODE_ATTRIBUTE_SKIP_INSTALL "YES"
        )
    endif()
endif()

set_target_properties(loguru
    PROPERTIES
    DEBUG_POSTFIX ""
)

target_include_directories(${PROJECT} PUBLIC
    ./
    ./api/
    ./misc/
    ./protobuf/generated
    ${FLUTTER_SDK_PATH}/cache/dart-sdk/include
    ${INCLUDE_DIRS}
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

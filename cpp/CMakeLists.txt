
# Cmake min version
cmake_minimum_required(VERSION 3.0)

set(PROJECT                         VocaByte)
set(CMAKE_CXX_STANDARD              20)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY  ${CMAKE_BINARY_DIR})
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY  ${CMAKE_BINARY_DIR})
set(CMAKE_PDB_OUTPUT_DIRECTORY      ${CMAKE_BINARY_DIR})
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY  ${CMAKE_BINARY_DIR})
set(CMAKE_VERBOSE_MAKEFILE          ON)
set(BUILD_TESTING                   false   CACHE INTERNAL "")
set(TARGET_NAME                     ${PROJECT})

if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Debug)
endif()

if(WIN32)
 add_link_options(-static -static-libgcc -static-libstdc++ -m64)  
endif()

add_compile_options(-Wall -fPIC -fexceptions -g -fPIC -Wformat)

add_subdirectory(ThirdParty/loguru)

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

project(${PROJECT} VERSION 0.1.0)

if (DEFINED ENV{FLUTTER_SDK_PATH})
    message(STATUS "FLUTTER_SDK_PATH environment variable defined")
    file(TO_CMAKE_PATH $ENV{FLUTTER_SDK_PATH} FLUTTER_SDK_PATH)
else ()
    # find flutter sdk location
    set(PATH $ENV{PATH})
    if (NOT WIN32)
        string(REPLACE ":" "\n " PATH ${PATH})
    endif ()
    separate_arguments(PATH)
    foreach (PATH_ITEM ${PATH})
        string(REPLACE "\n" "" PATH_ITEM ${PATH_ITEM})
        if (EXISTS "${PATH_ITEM}/flutter")
            message("flutter is found: ${PATH_ITEM}")
            set(FLUTTER_SDK_PATH ${PATH_ITEM})
        endif ()
    endforeach ()
endif ()

set(SOURCES
    ./api_lib.cpp
    ./api_lib.h
    ./db/misc_db.cpp
    ./db/misc_db.h
    ./utils/converter.h
    ./ThirdParty/Sqlite/sqlite3.c
    ./ThirdParty/Sqlite/sqlite3.h
    # protobuf
    ./protobuf/proto.pb.cc
    ./protobuf/proto.pb.h
)

set(INCLUDE_DIRS ${INCLUDE_DIRS}
    ${FLUTTER_SDK_PATH}/cache/dart-sdk/include
)

if (WIN32)
  # dart engine (wix r\n\)
  string(REPLACE "\\" "/" DART_SKD_PATH_WIN_FIX ${FLUTTER_SDK_PATH}/cache/dart-sdk/include/dart_api_dl.c)
  set(SOURCES ${SOURCES}
    ${DART_SKD_PATH_WIN_FIX}
  )
else()
  set(SOURCES ${SOURCES}
    ${FLUTTER_SDK_PATH}/cache/dart-sdk/include/dart_api_dl.c
  )
endif()

# libraries
if(APPLE)
    if(IOS)
        # protobuf
        set(INCLUDE_DIRS ${INCLUDE_DIRS}
            ${CMAKE_CURRENT_SOURCE_DIR}/../lib_pack/macos/protobuf/include
        )
        set(LIBRARIES ${LIBRARIES}
            ${CMAKE_CURRENT_SOURCE_DIR}/../lib_pack/macos/protobuf/ios_universal/libprotobuf.a
            loguru::loguru
        )
    else()
        set(INCLUDE_DIRS ${INCLUDE_DIRS}
            ${CMAKE_CURRENT_SOURCE_DIR}/../lib_pack/macos/protobuf/include
        )
        set(LIBRARIES$ ${LIBRARIES}
            ${CMAKE_CURRENT_SOURCE_DIR}/../lib_pack/macos/protobuf/macos_universal/libprotobuf.a
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
    set(ARCH_NAME ${CMAKE_ANDROID_ARCH_ABI})

    message("ARCH_NAME: ${ARCH_NAME}")
    message("ANDROID_ABI: ${ANDROID_ABI}")
    if (${CMAKE_ANDROID_ARCH_ABI} STREQUAL "armeabi-v7a")
        set(ARCH_NAME "armv7")
    elseif (${CMAKE_ANDROID_ARCH_ABI} STREQUAL "arm64-v8a")
        set(ARCH_NAME "arm64")
    endif ()
    set(INCLUDE_DIRS ${INCLUDE_DIRS}
      ${CMAKE_CURRENT_SOURCE_DIR}/../lib_pack/android/protobuf/${ARCH_NAME}/include/
    )
    set(LIBRARIES ${LIBRARIES}
      ${CMAKE_CURRENT_SOURCE_DIR}/../lib_pack/android/protobuf/${ARCH_NAME}/lib/libprotobuf.a
      -landroid
      c++_shared
      loguru::loguru
    )
elseif(UNIX AND NOT APPLE)
    set(INCLUDE_DIRS ${INCLUDE_DIRS}
        ${CMAKE_CURRENT_SOURCE_DIR}/../lib_pack/linux/protobuf/linux/include
    )
    set(LIBRARIES ${LIBRARIES}
        ${CMAKE_CURRENT_SOURCE_DIR}/../lib_pack/linux/protobuf/linux/lib/libprotobuf.a
        -ldl -lpthread -lxcb -lz
        loguru::loguru
    )
elseif(WIN32)
    set(INCLUDE_DIRS ${INCLUDE_DIRS}
        ${CMAKE_CURRENT_SOURCE_DIR}/../lib_pack/windows/protobuf/platform/windows/include
    )
    set(LIBRARIES ${LIBRARIES}
        ${CMAKE_CURRENT_SOURCE_DIR}/../lib_pack/windows/protobuf/platform/windows/lib/libprotobuf.a
        loguru::loguru
    )
endif()

if(IOS)
    add_library(
        ${PROJECT} STATIC
        ${SOURCES}
    )
    set_property(TARGET ${PROJECT} PROPERTY XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY "iPhone Developer")
    set_property(TARGET ${PROJECT} PROPERTY XCODE_ATTRIBUTE_DEVELOPMENT_TEAM "BKKJDH248G")
    set_property(TARGET ${PROJECT} PROPERTY XCODE_ATTRIBUTE_ENABLE_BITCODE "NO")
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
        XCODE_ATTRIBUTE_OTHER_CFLAGS[arch=arm64] "-march=armv8.1-a+crypto"
    )
    set_property(TARGET ${all_targets} PROPERTY
        XCODE_ATTRIBUTE_OTHER_CFLAGS[arch=x86_64] "-D__AESNI -maes -mpclmul -msse4"
    )
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

target_include_directories(${PROJECT} PUBLIC
    ./
    ./api/
    ./misc/
    ./protobuf
    $ENV{FLUTTER_SDK_PATH}/cache/dart-sdk/include
    ${INCLUDE_DIRS}
)

target_link_libraries(${PROJECT} PUBLIC
    ${LIBRARIES}
)

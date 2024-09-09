# VocaByte

A flashcard app with a text to speech feature and number exercises

It's built on Flutter, uses protobuf and c++

### Previews
![1](/sceenshots/1.png)

Download from [GooglePlay](https://play.google.com/store/apps/details?id=com.vocabyte.app)

### Installation
- ``git clone https://github.com/khomin/VocaByte.git --recurse-submodules``
- Download [vocabyte_database.zip](https://drive.google.com/file/d/1wrj2WB0nyim_vNM6Ui_7sgEldKpbLxdM/view?usp=sharing)
- Add flutter sdk directory in your PATH. There are 2 options:
    1) Set FLUTTER_SDK_PATH explicitly to bin folder<br>
    ``export FLUTTER_SDK_PATH=~/sdk/flutter/bin``<br>
    So that the whole path would be like:
    ``${FLUTTER_SDK_PATH}/cache/dart-sdk/include``
    2) Let ``cpp/CMakeLists.txt`` find the directory from your $PATH, see ``CMakeLists.txt`` line 62 
- Unzip in <code>./assets/</code>
- Specific steps for Android
    1) You need NDK
    2) Download [protobuf_static_android.zip](https://drive.google.com/file/d/1fFBxQSi3GS8vyZz-RpwgJuuJ3ZcIdsWS/view?usp=sharing)
    3) Unzip in <code>./lib_pack/</code><br>
    The folder must be <code>./lib_pack/android/protobuf/${YOUR_ARCH}/lib/libprotobuf.a</code>
- Specific steps for Linux & MacOs
    > **_NOTE:_**  Currently only android fully supported<br>
        Linux and MacOS can run too but TTS won't work and additional steps are required<br>
    1) You need ``libprotoc.a`` (version 4.0.0) for your platform<br>
    2) Then you have to build ``libVocaByte.so`` for linux or ``libVocaByte.dylib`` for macos, manually, using cmake ``cpp/CMakeLists.txt``<br>
        ```
        cd ./cpp/
        mkdir build
        cd ./build/
        cmake ../
        make -j16
        ```
- ``flutter pub get``
- ``flutter run``

#### Features, how to use
 - Find a word in the search
 - Listen and see its meaning and examples
 - Add the word to the study list where the spaced repetition algorithm will keep track on it

#### Third-party
https://github.com/emilk/loguru.git<br>
https://github.com/bshoshany/thread-pool.git<br>
https://github.com/wordset/wordset-dictionary.git
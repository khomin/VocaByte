# VocaByte

A flashcard app with a text to speech feature and number exercises

Flashcards and exercises are generated using ollama3

It's built on Flutter, uses protobuf and c++

<a href="https://play.google.com/store/apps/details?id=com.vocabyte.app">
  <img src="https://play.google.com/intl/en_us/badges/static/images/badges/en_badge_web_generic.png" height="60">
</a>

### Previews
![1](/sceenshots/1.png)

### Installation
```
    git clone https://github.com/khomin/VocaByte.git --recurse-submodules
    cd ./VocaByte
    chmod +x ./scripts/build_protobuf.sh
    # for android
    ./scripts/build_protobuf.sh android

    # use macos if your host is macos
    ./scripts/build_protobuf.sh macos
    # or use linux
    ./scripts/build_protobuf.sh linux
```
- Download [vocabyte_database.zip](https://drive.google.com/file/d/1wrj2WB0nyim_vNM6Ui_7sgEldKpbLxdM/view?usp=sharing)
- Unzip in <code>./assets/</code>
- Specific steps for Android
    - NDK is required  
- ``flutter pub get``
- ``flutter run``

### To rebuild protobuf files
```
# for macos
./scripts/gen-proto-macos.sh
# for linux
./scripts/gen-proto-linux.sh
```
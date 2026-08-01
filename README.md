# VocaByte

A flashcard app with a text to speech feature and number exercises

Flashcards and exercises are generated using ollama3

It's built on Flutter, uses protobuf and c++

<a href="https://play.google.com/store/apps/details?id=com.vocabyte.app">
  <img src="https://play.google.com/intl/en_us/badges/static/images/badges/en_badge_web_generic.png" height="60">
</a>

### Previews
![1](/resources/1.png)

### Prerequirements
- Android: NDK is required  
```sh
git clone https://github.com/khomin/VocaByte.git --recurse-submodules
cd ./VocaByte

chmod +x ./scripts/build_protobuf.sh

# build protobuf for android (may skip)
./scripts/build_protobuf.sh android

# build protobuf for ios
./scripts/build_protobuf.sh ios
```

### Build for android
```sh
# rebuild protobuf files (may skip)
chmod +x ./scripts/gen-proto-macos.sh
./scripts/gen-proto-macos.sh

flutter pub get
flutter run
```

### Build for ios
```sh
# generate xcode subproject from cmake
chmod +x ./scripts/apple/make_build_subprojects.sh
./scripts/apple/make_build_subprojects.sh

# rebuild protobuf files
chmod +x ./scripts/gen-proto-macos.sh
./scripts/gen-proto-macos.sh

flutter pub get
flutter run
```
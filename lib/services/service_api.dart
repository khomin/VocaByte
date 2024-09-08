import 'dart:async';
import 'dart:ffi';
import 'dart:io';
import 'dart:isolate';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:loggy/loggy.dart';
import 'package:protobuf/protobuf.dart';
import 'package:ffi/ffi.dart';
import 'package:vocabyte/app/file_utils.dart';
import 'package:vocabyte/services/protobuf/app.pbserver.dart';
import 'package:vocabyte/services/protobuf/proto.pb.dart';

class LibPath {
  static String get path {
    var libraryPath = '';
    if (kReleaseMode) {
      var dir = Directory(Platform.resolvedExecutable);
      libraryPath = '${dir.parent.path}/../Frameworks/libVocaByte.dylib';
    } else {
      libraryPath = './cpp/build/libVocaByte.dylib';
    }
    if (Platform.isLinux) {
      if (kReleaseMode) {
        var dir = Directory(Platform.resolvedExecutable);
        libraryPath = '${dir.parent.path}/lib/libVocaByte.so';
      } else {
        libraryPath = './cpp/build/libVocaByte.so';
      }
    }
    if (Platform.isWindows) {
      if (kReleaseMode) {
        var dir = Directory(Platform.resolvedExecutable);
        libraryPath = '${dir.parent.path}/lib/libVocaByte.dll';
      } else {
        libraryPath = './cpp/build/libVocaByte.dll';
      }
    }
    if (Platform.isAndroid) {
      if (kReleaseMode) {
        libraryPath = 'libVocaByte.so';
      } else {
        libraryPath = 'libVocaByte.so';
      }
    }
    return libraryPath;
  }
}

// status cb
typedef NativeEventPtr = Void Function(Pointer<CallDataStruct>);
typedef NativeEventCbType = Void Function(
    Int64 sendPort, Pointer<NativeFunction<NativeEventPtr>>);
typedef StatusCbType = void Function(
    int sendPort, Pointer<NativeFunction<NativeEventPtr>>);

final class CallDataStruct extends Struct {
  @Int32()
  external int protoLen;
  external Pointer<Uint8> protoBuf;
  @Int32()
  external int taskId;
}

class ProtoOut {
  ProtoOut({required this.taskId, required this.data, required this.len});
  int taskId;
  Pointer<Uint8>? data;
  int len;
}

class TaskIsolate {
  TaskIsolate(
      {required this.callback,
      required this.allocatedData,
      required this.description});
  Function(Pointer<CallDataStruct> data)? callback;
  Pointer<Uint8>? allocatedData;
  String description;
}

extension Uint8ListBlobConversion on Uint8List {
  /// Allocates a pointer filled with the Uint8List data.
  Pointer<Uint8> allocatePointer() {
    final blob = malloc<Uint8>(length);
    final blobBytes = blob.asTypedList(length);
    blobBytes.setAll(0, this);
    return blob;
  }
}

class ServiceApi {
  static late Function _initializeApi;
  static late Function _init;
  static late Function _getRecentWords;
  static late Function _putRecentWord;
  static late Function _searchWords;
  static late Function _randWords;
  static late Function _getWordInReview;
  static late Function _addWordInReview;
  static late Function _deleteProfile;
  static late Function _removeWordInReview;
  static late Function _updateWordInReview;
  static late Function _getReviewForToday;
  static late Function _searchInReviewList;
  static late Function _getSentences;
  static late Function _executeCallback;
  static late DynamicLibrary _dylib;
  //
  final _player = AudioPlayer();
  //
  static late Pointer<NativeFunction<NativeEventPtr>> cbPtr;
  static final Map<int, TaskIsolate> _isolateMap = {};
  static int _isolateUniqueCnt = 0;
  static const tag = 'ServiceAPI';

  static ServiceApi? _instance;
  factory ServiceApi() {
    _instance ??= ServiceApi._internal();
    return _instance!;
  }

  ServiceApi._internal();

  Future<String?> initLib({required String libraryPath}) async {
    Completer<String?> completer = Completer();
    logInfo('$tag: -init');
    try {
      if (Platform.isIOS) {
        logInfo('$tag: -init [about to open lib]');
        _dylib = DynamicLibrary.executable();
        logInfo('$tag: -init [lib opened]');
      } else {
        logInfo('$tag: -init [about to open lib] $libraryPath');
        _dylib = DynamicLibrary.open(libraryPath);
        logInfo('$tag: -init [lib opened]');
      }

      _init = _dylib.lookupFunction<
          Int Function(Uint32, Pointer<Uint8>, Uint32),
          int Function(int, Pointer<Uint8>, int)>("init");

      _initializeApi = _dylib.lookupFunction<IntPtr Function(Pointer<Void>),
          int Function(Pointer<Void>)>("initDartApiDL");

      _searchWords = _dylib.lookupFunction<
          Int Function(Uint32, Pointer<Uint8>, Uint32),
          int Function(int, Pointer<Uint8>, int)>("getSearchWords");

      _randWords = _dylib.lookupFunction<
          Int Function(Uint32, Pointer<Uint8>, Uint32),
          int Function(int, Pointer<Uint8>, int)>("getRandomWords");

      _getRecentWords = _dylib.lookupFunction<
          Int Function(Uint32, Pointer<Uint8>, Uint32),
          int Function(int, Pointer<Uint8>, int)>("getRecentWords");

      _putRecentWord = _dylib.lookupFunction<
          Int Function(Uint32, Pointer<Uint8>, Uint32),
          int Function(int, Pointer<Uint8>, int)>("putRecentWord");

      _getWordInReview = _dylib.lookupFunction<
          Int Function(Uint32, Pointer<Uint8>, Uint32),
          int Function(int, Pointer<Uint8>, int)>("getWordInReview");

      _addWordInReview = _dylib.lookupFunction<
          Int Function(Uint32, Pointer<Uint8>, Uint32),
          int Function(int, Pointer<Uint8>, int)>("addWordInReview");

      _deleteProfile = _dylib.lookupFunction<
          Int Function(Uint32, Pointer<Uint8>, Uint32),
          int Function(int, Pointer<Uint8>, int)>("deleteProfile");

      _removeWordInReview = _dylib.lookupFunction<
          Int Function(Uint32, Pointer<Uint8>, Uint32),
          int Function(int, Pointer<Uint8>, int)>("removeWordInReview");

      _updateWordInReview = _dylib.lookupFunction<
          Int Function(Uint32, Pointer<Uint8>, Uint32),
          int Function(int, Pointer<Uint8>, int)>("updateWordInReview");

      _getReviewForToday = _dylib.lookupFunction<
          Int Function(Uint32, Pointer<Uint8>, Uint32),
          int Function(int, Pointer<Uint8>, int)>("getReviewForToday");

      _searchInReviewList = _dylib.lookupFunction<
          Int Function(Uint32, Pointer<Uint8>, Uint32),
          int Function(int, Pointer<Uint8>, int)>("searchInReviewList");

      _getSentences = _dylib.lookupFunction<
          Int Function(Uint32, Pointer<Uint8>, Uint32),
          int Function(int, Pointer<Uint8>, int)>("getSentences");

      //
      // service callback
      _executeCallback = _dylib.lookupFunction<Void Function(Pointer<Work>),
          void Function(Pointer<Work>)>('dartExecuteCallback');
      //
      // callback
      final interactiveCppRequests = ReceivePort()
        ..listen(requestExecuteCallback);
      //
      // event bus
      {
        Pointer<NativeFunction<NativeEventCbType>> cbRef =
            _dylib.lookup("onEventCb");
        cbPtr = Pointer.fromFunction(_eventCb);
        StatusCbType cb = cbRef.asFunction();
        final int nativePort = interactiveCppRequests.sendPort.nativePort;
        cb(nativePort, cbPtr);
      }
      _initializeApi(NativeApi.initializeApiDLData);
      await init();
      completer.complete(null);
      logInfo('$tag: -init success');
    } catch (ex) {
      logInfo('$tag: -init failed: ${ex.toString()}');
      completer.complete("Error while starting:\n${ex.toString()}");
    }
    return completer.future;
  }

  Future init() async {
    Completer completer = Completer();
    var initParam = InitParams();
    initParam.localDir = FileUtils.homeDir;
    var out = registerCall(
        proto: initParam,
        cb: (data) {
          completer.complete(true);
        },
        description: 'startLib');
    _init(out.taskId, out.data, out.len);
  }

  Future<RespRecentWords> getRecentWords() async {
    Completer<RespRecentWords> completer = Completer();
    var req = ReqRecentWords();
    var out = registerCall(
        proto: req,
        cb: (p) {
          var buf = p.ref.protoBuf.asTypedList(p.ref.protoLen);
          var res = RespRecentWords.fromBuffer(buf);
          completer.complete(res);
        },
        description: 'getRecentWords');
    _getRecentWords(out.taskId, out.data, out.len);
    return completer.future;
  }

  Future putRecentWord(String word) async {
    Completer completer = Completer();
    var req = Word();
    req.value = word;
    var out = registerCall(
        proto: req,
        cb: (p) {
          completer.complete();
        },
        description: 'putRecentWord');
    _putRecentWord(out.taskId, out.data, out.len);
    return completer.future;
  }

  Future<RespSearchWords> searchWords(
      {required String word, bool useLike = true}) async {
    Completer<RespSearchWords> completer = Completer();
    var req = ReqSearchWords();
    req.word = word;
    req.useLike = useLike;
    var out = registerCall(
        proto: req,
        cb: (p) {
          var buf = p.ref.protoBuf.asTypedList(p.ref.protoLen);
          var res = RespSearchWords.fromBuffer(buf);
          completer.complete(res);
        },
        description: 'searchWords');
    _searchWords(out.taskId, out.data, out.len);
    return completer.future;
  }

  Future<RespRandWords> randWords(int count) async {
    Completer<RespRandWords> completer = Completer();
    var req = ReqRandWords();
    req.count = count;
    var out = registerCall(
        proto: req,
        cb: (p) {
          var buf = p.ref.protoBuf.asTypedList(p.ref.protoLen);
          var res = RespRandWords.fromBuffer(buf);
          completer.complete(res);
        },
        description: 'randWords');
    _randWords(out.taskId, out.data, out.len);
    return completer.future;
  }

  Future<WordInReview?> getWordReviewStatus({required String word}) async {
    Completer<WordInReview?> completer = Completer();
    var req = ReqWordInReview();
    req.word = word;
    var out = registerCall(
        proto: req,
        cb: (p) {
          var buf = p.ref.protoBuf.asTypedList(p.ref.protoLen);
          var res = WordInReview.fromBuffer(buf);
          if (res.word.isEmpty) {
            completer.complete(null);
          } else {
            completer.complete(res);
          }
        },
        description: 'getWordReviewStatus');
    _getWordInReview(out.taskId, out.data, out.len);
    return completer.future;
  }

  Future<bool> addWordInReview({required ReqAddWordInReview req}) async {
    Completer<bool> completer = Completer();
    var out = registerCall(
        proto: req,
        cb: (p) {
          completer.complete(true);
        },
        description: 'addWordInReview');
    _addWordInReview(out.taskId, out.data, out.len);
    return completer.future;
  }

  Future<RespDeleteProfile> deleteProfile() async {
    Completer<RespDeleteProfile> completer = Completer();
    var req = ReqDeleteProfile();
    var out = registerCall(
        proto: req,
        cb: (p) {
          var buf = p.ref.protoBuf.asTypedList(p.ref.protoLen);
          var res = RespDeleteProfile.fromBuffer(buf);
          completer.complete(res);
        },
        description: 'deleteProfile');
    _deleteProfile(out.taskId, out.data, out.len);
    return completer.future;
  }

  Future<bool> removeWordFromCurrent({required String word}) async {
    Completer<bool> completer = Completer();
    var req = ReqRemoveWordFromCurrent();
    req.word = word;
    var out = registerCall(
        proto: req,
        cb: (p) {
          completer.complete(true);
        },
        description: 'removeWordFromCurrent');
    // TODO: uptimise, takes ocationaly ~1 sec
    _removeWordInReview(out.taskId, out.data, out.len);
    return completer.future;
  }

  Future<RespUpdateWordInCurrent> updateWordInCurrent(
      {required ReqUpdateWordInCurrent req}) async {
    Completer<RespUpdateWordInCurrent> completer = Completer();
    var out = registerCall(
        proto: req,
        cb: (p) {
          var buf = p.ref.protoBuf.asTypedList(p.ref.protoLen);
          var res = RespUpdateWordInCurrent.fromBuffer(buf);
          completer.complete(res);
        },
        description: 'updateWordInCurrent');
    _updateWordInReview(out.taskId, out.data, out.len);
    return completer.future;
  }

  Future<RespReviewForToday> getReviewForToday() async {
    Completer<RespReviewForToday> completer = Completer();
    var req = ReqUpdateWordInCurrent();
    var out = registerCall(
        proto: req,
        cb: (p) {
          var buf = p.ref.protoBuf.asTypedList(p.ref.protoLen);
          var res = RespReviewForToday.fromBuffer(buf);
          completer.complete(res);
        },
        description: 'getReviewForToday');
    _getReviewForToday(out.taskId, out.data, out.len);
    return completer.future;
  }

  Future<RespSearchInReviewList> searchInReviewList(
      {required int limit,
      required int offset,
      required int? useSuccessCount}) async {
    Completer<RespSearchInReviewList> completer = Completer();
    var req = ReqSearchInReviewList();
    req.limit = limit;
    req.offset = offset;
    req.useSuccessCount = useSuccessCount ?? 0;
    var out = registerCall(
        proto: req,
        cb: (p) {
          var buf = p.ref.protoBuf.asTypedList(p.ref.protoLen);
          var res = RespSearchInReviewList.fromBuffer(buf);
          completer.complete(res);
        },
        description: 'searchInReviewList');
    _searchInReviewList(out.taskId, out.data, out.len);
    return completer.future;
  }

  Future<RespSentences> getSentences(
      {required String word, required int limit, required int offset}) async {
    Completer<RespSentences> completer = Completer();
    var req = ReqSentences();
    req.word = word;
    req.limit = limit;
    req.offset = offset;
    var out = registerCall(
        proto: req,
        cb: (p) {
          var buf = p.ref.protoBuf.asTypedList(p.ref.protoLen);
          var res = RespSentences.fromBuffer(buf);
          completer.complete(res);
        },
        description: 'getSentences');
    _getSentences(out.taskId, out.data, out.len);
    return completer.future;
  }

  void playAsset(String asset) {
    _player.play(AssetSource(asset), volume: 0.5);
    _player.setReleaseMode(ReleaseMode.release);
  }

  static void _eventCb(Pointer<CallDataStruct> p) async {
    var taskId = p.ref.taskId;
    try {
      if (taskId != ServiceTypes.ignoreTaskId.value) {
        // a result from isolate -> find the map and call result
        var task = _isolateMap[taskId];
        if (task != null && task.allocatedData != null) {
          malloc.free(task.allocatedData!);
        }
        task?.callback?.call(p);
        _isolateMap.remove(taskId);
      } else {
        // common events
        // var buf = p.ref.protoBuf.asTypedList(p.ref.protoLen);
        // var ev = EventMsgWrapper.fromBuffer(buf);
        // switch (ev.type) {
        //   case ApiEvent.OnlineChanged:
        //     break;
        // }
      }
    } catch (ex) {
      logError('$tag: eventCb exception: $ex');
    }
  }

  static ProtoOut registerCall(
      {GeneratedMessage? proto,
      Function(Pointer<CallDataStruct> data)? cb,
      required String description,
      bool skipMap = false}) {
    if (_isolateUniqueCnt == ServiceTypes.ignoreTaskId.value) {
      _isolateUniqueCnt = 2;
    } else {
      _isolateUniqueCnt++;
    }
    // with proto and task id
    if (proto != null) {
      // logDebug('$tag: registerCall=${proto.runtimeType.toString()}');
      var protoBuf = proto.writeToBuffer();
      var pointer = protoBuf.allocatePointer();
      if (!skipMap) {
        _isolateMap[_isolateUniqueCnt] = TaskIsolate(
            callback: cb, allocatedData: pointer, description: description);
      }
      return ProtoOut(
          taskId: _isolateUniqueCnt,
          data: pointer,
          len: protoBuf.lengthInBytes);
    }
    // just task id
    if (!skipMap) {
      _isolateMap[_isolateUniqueCnt] = TaskIsolate(
          callback: cb, allocatedData: null, description: description);
    }
    return ProtoOut(taskId: _isolateUniqueCnt, data: null, len: 0);
  }

  static int getTaskCount() {
    return _isolateMap.length;
  }

  static void printTasks() {
    var i = _isolateMap;
    logDebug('$tag: tasks: ${i.length} START |||||||||||||||||||||||||||');
    i.forEach((key, value) {
      logDebug('$tag: task: key=$key, description=${value.description}');
    });
    logDebug('$tag: tasks: ${i.length} END |||||||||||||||||||||||||||');
  }

  void requestExecuteCallback(dynamic message) {
    final int workAddress = message;
    final work = Pointer<Work>.fromAddress(workAddress);
    _executeCallback(work);
  }
}

final class Work extends Opaque {}

import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:isolate';
import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:loggy/loggy.dart';
import 'package:protobuf/protobuf.dart';
import 'package:ffi/ffi.dart';
import 'package:vocabyte/app/file_utils.dart';
import 'package:vocabyte/app/ui_helper.dart';
import 'package:vocabyte/services/protobuf/proto.pb.dart';
import 'package:fixnum/fixnum.dart' as fixnum;

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
  static late Function _getRecent;
  static late Function _putRecent;
  static late Function _getDictionary;
  static late Function _getDictionaryRand;
  static late Function _getCurrentExact;
  static late Function _addCurrent;
  static late Function _deleteProfile;
  static late Function _deleteCurrentExact;
  static late Function _updateCurrent;
  static late Function _getCurrentToStudy;
  static late Function _getMetaData;
  static late Function _getCurrentLimit;
  static late Function _executeCallback;
  static late Function _testMethod;
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
        _dylib = DynamicLibrary.process();
        logInfo('$tag: -init [lib opened]');
      } else {
        logInfo('$tag: -init [about to open lib] $libraryPath');
        _dylib = DynamicLibrary.open(libraryPath);
        logInfo('$tag: -init [lib opened]');
      }

      _testMethod =
          _dylib.lookupFunction<Void Function(Uint32), void Function(int)>(
              "testMethod");

      _init = _dylib.lookupFunction<
          Int Function(Uint32, Pointer<Uint8>, Uint32),
          int Function(int, Pointer<Uint8>, int)>("init");

      _initializeApi = _dylib.lookupFunction<IntPtr Function(Pointer<Void>),
          int Function(Pointer<Void>)>("initDartApiDL");

      _getDictionary = _dylib.lookupFunction<
          Int Function(Uint32, Pointer<Uint8>, Uint32),
          int Function(int, Pointer<Uint8>, int)>("getDictionary");
      _getDictionaryRand = _dylib.lookupFunction<
          Int Function(Uint32, Pointer<Uint8>, Uint32),
          int Function(int, Pointer<Uint8>, int)>("getDictionaryRand");

      _getRecent = _dylib.lookupFunction<
          Int Function(Uint32, Pointer<Uint8>, Uint32),
          int Function(int, Pointer<Uint8>, int)>("getRecent");

      _putRecent = _dylib.lookupFunction<
          Int Function(Uint32, Pointer<Uint8>, Uint32),
          int Function(int, Pointer<Uint8>, int)>("putRecent");

      _getCurrentExact = _dylib.lookupFunction<
          Int Function(Uint32, Pointer<Uint8>, Uint32),
          int Function(int, Pointer<Uint8>, int)>("getCurrentExact");

      _addCurrent = _dylib.lookupFunction<
          Int Function(Uint32, Pointer<Uint8>, Uint32),
          int Function(int, Pointer<Uint8>, int)>("addCurrent");

      _deleteProfile = _dylib.lookupFunction<
          Int Function(Uint32, Pointer<Uint8>, Uint32),
          int Function(int, Pointer<Uint8>, int)>("deleteProfile");

      _deleteCurrentExact = _dylib.lookupFunction<
          Int Function(Uint32, Pointer<Uint8>, Uint32),
          int Function(int, Pointer<Uint8>, int)>("deleteCurrentExact");

      _updateCurrent = _dylib.lookupFunction<
          Int Function(Uint32, Pointer<Uint8>, Uint32),
          int Function(int, Pointer<Uint8>, int)>("updateCurrent");

      _getCurrentToStudy = _dylib.lookupFunction<
          Int Function(Uint32, Pointer<Uint8>, Uint32),
          int Function(int, Pointer<Uint8>, int)>("getCurrentToStudy");

      _getMetaData = _dylib.lookupFunction<
          Int Function(Uint32, Pointer<Uint8>, Uint32),
          int Function(int, Pointer<Uint8>, int)>("getMetadata");

      _getCurrentLimit = _dylib.lookupFunction<
          Int Function(Uint32, Pointer<Uint8>, Uint32),
          int Function(int, Pointer<Uint8>, int)>("getCurrentLimit");
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

  void testMethod() {
    _testMethod();
  }

  Future<RespRecentWords> getRecent() async {
    Completer<RespRecentWords> completer = Completer();
    var req = ReqRecentWords();
    var out = registerCall(
        proto: req,
        cb: (p) {
          var buf = p.ref.protoBuf.asTypedList(p.ref.protoLen);
          var res = RespRecentWords.fromBuffer(buf);
          completer.complete(res);
        },
        description: 'getRecent');
    _getRecent(out.taskId, out.data, out.len);
    return completer.future;
  }

  Future putRecent(String word) async {
    Completer completer = Completer();
    var req = Word();
    req.value = word;
    var out = registerCall(
        proto: req,
        cb: (p) {
          completer.complete();
        },
        description: 'putRecent');
    _putRecent(out.taskId, out.data, out.len);
    return completer.future;
  }

  Future<RespSearchWords> getDictionary(
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
        description: 'getDictionary');
    _getDictionary(out.taskId, out.data, out.len);
    return completer.future;
  }

  Future<RespRandWords> getDictionaryRand(int count) async {
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
        description: 'getDictionaryRand');
    _getDictionaryRand(out.taskId, out.data, out.len);
    return completer.future;
  }

  Future<WordInReview?> getCurrentExact({required String word}) async {
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
        description: 'getCurrentExact');
    _getCurrentExact(out.taskId, out.data, out.len);
    return completer.future;
  }

  Future<bool> addCurrent({required ReqAddWordInReview req}) async {
    Completer<bool> completer = Completer();
    var out = registerCall(
        proto: req,
        cb: (p) {
          completer.complete(true);
        },
        description: 'addCurrent');
    _addCurrent(out.taskId, out.data, out.len);
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

  Future<bool> deleteCurrentExact({required String word}) async {
    Completer<bool> completer = Completer();
    var req = ReqRemoveWordFromCurrent();
    req.word = word;
    var out = registerCall(
        proto: req,
        cb: (p) {
          completer.complete(true);
        },
        description: 'deleteCurrentExact');
    _deleteCurrentExact(out.taskId, out.data, out.len);
    return completer.future;
  }

  Future<RespUpdateWordInCurrent> updateCurrent(
      {required ReqUpdateWordInCurrent req}) async {
    Completer<RespUpdateWordInCurrent> completer = Completer();
    var out = registerCall(
        proto: req,
        cb: (p) {
          var buf = p.ref.protoBuf.asTypedList(p.ref.protoLen);
          var res = RespUpdateWordInCurrent.fromBuffer(buf);
          completer.complete(res);
        },
        description: 'updateCurrent');
    _updateCurrent(out.taskId, out.data, out.len);
    return completer.future;
  }

  Future<RespReviewForToday> getCurrentToStudy() async {
    Completer<RespReviewForToday> completer = Completer();
    var req = ReqUpdateWordInCurrent();
    var out = registerCall(
        proto: req,
        cb: (p) {
          var buf = p.ref.protoBuf.asTypedList(p.ref.protoLen);
          var res = RespReviewForToday.fromBuffer(buf);
          completer.complete(res);
        },
        description: 'getCurrentToStudy');
    _getCurrentToStudy(out.taskId, out.data, out.len);
    return completer.future;
  }

  Future<GetMetaDataOut> getMedataData() async {
    Completer<GetMetaDataOut> completer = Completer();
    var req = GetMetaDataIn();
    var out = registerCall(
        proto: req,
        cb: (p) {
          var buf = p.ref.protoBuf.asTypedList(p.ref.protoLen);
          var res = GetMetaDataOut.fromBuffer(buf);
          completer.complete(res);
        },
        description: 'getMedataData');
    _getMetaData(out.taskId, out.data, out.len);
    return completer.future;
  }

  Future<bool> shouldMigrateDatabase() async {
    return true;
  }

  Future<bool> exportProfile({String? explicitDir}) async {
    var list = <dynamic>[];
    var hasData = true;
    var offset = 0;
    const limit = 5;
    while (hasData) {
      var r = await ServiceApi().searchInReviewList(
          limit: limit, offset: offset, useSuccessCount: null);
      if (r.word.length >= limit) {
        offset += limit;
      } else {
        hasData = false;
      }
      for (var it in r.word) {
        list.add({
          'word': it.word,
          'success_count': it.successCount.toInt(),
          'fail_count': it.failCount.toInt(),
          'last_tm_success': it.lastTmSuccess.toInt(),
          'last_tm_fail': it.lastTmFail.toInt(),
          'next_review_tm_ms': it.nextReviewTmMs.toInt()
        });
      }
    }
    try {
      var encoder = const JsonEncoder.withIndent('  ');
      var jsonStr = encoder.convert({'review': list});
      var formatted = jsonStr.codeUnits;
      if (explicitDir == null) {
        var path = await FilePicker.platform.saveFile(
            fileName: 'profile.json',
            allowedExtensions: ['txt'],
            dialogTitle: 'Export',
            type: FileType.custom,
            bytes: Uint8List.fromList(formatted));
        if (UiHelper.isDesktop() && path != null) {
          await FileUtils.saveBufToFile(formatted, path);
        }
        return true;
      } else {
        await FileUtils.saveBufToFile(formatted, explicitDir);
        return true;
      }
    } catch (ex) {
      logWarning('$ex: export words ex [$ex]');
    }
    return false;
  }

  Future<bool> importProfile({String? explicitDir}) async {
    String? path;
    if (explicitDir == null) {
      var res = await FilePicker.platform.pickFiles(
          allowMultiple: false,
          type: FileType.custom,
          allowedExtensions: ['json']);
      if (res == null || res.files.isEmpty) {
        return false;
      }
      path = res.files.first.path;
      if (path == null) {
        return false;
      }
    } else {
      path = explicitDir;
    }
    try {
      var data = await FileUtils.readFileToStringLine(path);
      var json = jsonDecode(data.join());
      var review = json['review'];
      if (review != null) {
        for (var it in review) {
          await ServiceApi().addCurrent(
              req: ReqAddWordInReview(
                  word: it['word'],
                  successCount: it['success_count'],
                  failCount: it['fail_count'],
                  lastTmSuccess: fixnum.Int64(it['last_tm_success']),
                  lastTmFail: fixnum.Int64(it['last_tm_fail']),
                  nextReviewTmMs: fixnum.Int64(it['next_review_tm_ms']),
                  useExtraFields: true));
        }
      }
      return true;
    } catch (ex) {
      logError('$tag: ex=$ex');
    }
    return false;
  }

  Future<int> importWords({String? explicitDir}) async {
    try {
      String? path;
      if (explicitDir == null) {
        var res = await FilePicker.platform.pickFiles(allowMultiple: false);
        if (res == null || res.files.isEmpty) {
          return 0;
        }
        path = res.files.first.path;
        if (path == null) {
          return 0;
        }
      } else {
        path = explicitDir;
      }
      var addedCnt = 0;
      var data = await FileUtils.readFileToStringLine(path);
      for (var it2 in data) {
        if (await ServiceApi().addCurrent(
            req: ReqAddWordInReview(word: it2, useExtraFields: false))) {
          addedCnt++;
        }
      }
      return addedCnt;
    } catch (ex) {
      logWarning('$ex');
    }
    return 0;
  }

  Future<bool> exportWords({String? explicitDir}) async {
    var offset = 0;
    const limit = 5;
    final list = <String>[];
    var hasData = true;
    while (hasData) {
      var r = await ServiceApi().searchInReviewList(
          limit: limit, offset: offset, useSuccessCount: null);
      if (r.word.length >= limit) {
        offset += limit;
      } else {
        hasData = false;
      }
      for (var it in r.word) {
        list.add(it.word);
      }
    }
    if (list.isEmpty) {
      return false;
    }
    try {
      final List<int> codeUnits = list.join('\n').codeUnits;
      var path = await FilePicker.platform.saveFile(
          fileName: 'export.txt',
          allowedExtensions: ['txt'],
          dialogTitle: 'Export',
          type: FileType.custom,
          bytes: Uint8List.fromList(codeUnits));
      if (UiHelper.isDesktop() && path != null) {
        await FileUtils.saveBufToFile(codeUnits, path);
      }
      return true;
    } catch (ex) {
      logWarning('$ex: export words ex [$ex]');
    }
    return false;
  }

  Future<bool> migrateDatabase() async {
    var res = await ServiceApi().getMedataData();
    if (res.version == 0) {
      return true;
    }
    return false;
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
    _getCurrentLimit(out.taskId, out.data, out.len);
    return completer.future;
  }

  void playAsset(String asset) {
    _player.play(AssetSource(asset), volume: 0.5);
    _player.setReleaseMode(ReleaseMode.release);
  }

  static void _eventCb(Pointer<CallDataStruct> p) async {
    var taskId = p.ref.taskId;
    try {
      // if (taskId != ServiceTypes.ignoreTaskId.value) {
      // a result from isolate -> find the map and call result
      var task = _isolateMap[taskId];
      if (task != null && task.allocatedData != null) {
        malloc.free(task.allocatedData!);
      }
      task?.callback?.call(p);
      _isolateMap.remove(taskId);
      // } else {
      // common events
      // var buf = p.ref.protoBuf.asTypedList(p.ref.protoLen);
      // var ev = EventMsgWrapper.fromBuffer(buf);
      // switch (ev.type) {
      //   case ApiEvent.OnlineChanged:
      //     break;
      // }
      // }
    } catch (ex) {
      logError('$tag: eventCb exception: $ex');
    }
  }

  static ProtoOut registerCall(
      {GeneratedMessage? proto,
      Function(Pointer<CallDataStruct> data)? cb,
      required String description,
      bool skipMap = false}) {
    // if (_isolateUniqueCnt == ServiceTypes.ignoreTaskId.value) {
    //   _isolateUniqueCnt = 2;
    // } else {
    _isolateUniqueCnt++;
    // }
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

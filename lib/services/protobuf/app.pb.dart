//
//  Generated code. Do not modify.
//  source: app.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'app.pbenum.dart';
import 'message.pb.dart' as $1;
import 'netlib.pb.dart' as $0;
import 'netlib.pbenum.dart' as $0;
import 'registration.pb.dart' as $2;

export 'app.pbenum.dart';

class StartLibParam extends $pb.GeneratedMessage {
  factory StartLibParam({
    $core.String? cacheDirPath,
    $core.String? regServAddr,
    $core.int? regServPort,
    $core.String? netServAddr,
    $core.int? netServPort,
    $core.String? fcm,
    $core.String? nativeLogPath,
    $core.bool? useMirrorCppLog,
    $fixnum.Int64? startTime,
    $core.bool? notificationShowData,
  }) {
    final $result = create();
    if (cacheDirPath != null) {
      $result.cacheDirPath = cacheDirPath;
    }
    if (regServAddr != null) {
      $result.regServAddr = regServAddr;
    }
    if (regServPort != null) {
      $result.regServPort = regServPort;
    }
    if (netServAddr != null) {
      $result.netServAddr = netServAddr;
    }
    if (netServPort != null) {
      $result.netServPort = netServPort;
    }
    if (fcm != null) {
      $result.fcm = fcm;
    }
    if (nativeLogPath != null) {
      $result.nativeLogPath = nativeLogPath;
    }
    if (useMirrorCppLog != null) {
      $result.useMirrorCppLog = useMirrorCppLog;
    }
    if (startTime != null) {
      $result.startTime = startTime;
    }
    if (notificationShowData != null) {
      $result.notificationShowData = notificationShowData;
    }
    return $result;
  }
  StartLibParam._() : super();
  factory StartLibParam.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StartLibParam.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StartLibParam', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'cacheDirPath')
    ..aOS(2, _omitFieldNames ? '' : 'regServAddr')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'regServPort', $pb.PbFieldType.O3)
    ..aOS(4, _omitFieldNames ? '' : 'netServAddr')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'netServPort', $pb.PbFieldType.O3)
    ..aOS(6, _omitFieldNames ? '' : 'fcm')
    ..aOS(7, _omitFieldNames ? '' : 'nativeLogPath')
    ..aOB(8, _omitFieldNames ? '' : 'useMirrorCppLog')
    ..a<$fixnum.Int64>(9, _omitFieldNames ? '' : 'startTime', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.bool>(10, _omitFieldNames ? '' : 'notificationShowData', $pb.PbFieldType.QB)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StartLibParam clone() => StartLibParam()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StartLibParam copyWith(void Function(StartLibParam) updates) => super.copyWith((message) => updates(message as StartLibParam)) as StartLibParam;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StartLibParam create() => StartLibParam._();
  StartLibParam createEmptyInstance() => create();
  static $pb.PbList<StartLibParam> createRepeated() => $pb.PbList<StartLibParam>();
  @$core.pragma('dart2js:noInline')
  static StartLibParam getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StartLibParam>(create);
  static StartLibParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get cacheDirPath => $_getSZ(0);
  @$pb.TagNumber(1)
  set cacheDirPath($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCacheDirPath() => $_has(0);
  @$pb.TagNumber(1)
  void clearCacheDirPath() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get regServAddr => $_getSZ(1);
  @$pb.TagNumber(2)
  set regServAddr($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRegServAddr() => $_has(1);
  @$pb.TagNumber(2)
  void clearRegServAddr() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get regServPort => $_getIZ(2);
  @$pb.TagNumber(3)
  set regServPort($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRegServPort() => $_has(2);
  @$pb.TagNumber(3)
  void clearRegServPort() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get netServAddr => $_getSZ(3);
  @$pb.TagNumber(4)
  set netServAddr($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasNetServAddr() => $_has(3);
  @$pb.TagNumber(4)
  void clearNetServAddr() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get netServPort => $_getIZ(4);
  @$pb.TagNumber(5)
  set netServPort($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasNetServPort() => $_has(4);
  @$pb.TagNumber(5)
  void clearNetServPort() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get fcm => $_getSZ(5);
  @$pb.TagNumber(6)
  set fcm($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasFcm() => $_has(5);
  @$pb.TagNumber(6)
  void clearFcm() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get nativeLogPath => $_getSZ(6);
  @$pb.TagNumber(7)
  set nativeLogPath($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasNativeLogPath() => $_has(6);
  @$pb.TagNumber(7)
  void clearNativeLogPath() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get useMirrorCppLog => $_getBF(7);
  @$pb.TagNumber(8)
  set useMirrorCppLog($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasUseMirrorCppLog() => $_has(7);
  @$pb.TagNumber(8)
  void clearUseMirrorCppLog() => clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get startTime => $_getI64(8);
  @$pb.TagNumber(9)
  set startTime($fixnum.Int64 v) { $_setInt64(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasStartTime() => $_has(8);
  @$pb.TagNumber(9)
  void clearStartTime() => clearField(9);

  @$pb.TagNumber(10)
  $core.bool get notificationShowData => $_getBF(9);
  @$pb.TagNumber(10)
  set notificationShowData($core.bool v) { $_setBool(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasNotificationShowData() => $_has(9);
  @$pb.TagNumber(10)
  void clearNotificationShowData() => clearField(10);
}

class CallList extends $pb.GeneratedMessage {
  factory CallList({
    $core.Iterable<$0.CALL_LIST_REC>? callListChanged,
  }) {
    final $result = create();
    if (callListChanged != null) {
      $result.callListChanged.addAll(callListChanged);
    }
    return $result;
  }
  CallList._() : super();
  factory CallList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CallList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CallList', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..pc<$0.CALL_LIST_REC>(1, _omitFieldNames ? '' : 'callListChanged', $pb.PbFieldType.PM, subBuilder: $0.CALL_LIST_REC.create)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CallList clone() => CallList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CallList copyWith(void Function(CallList) updates) => super.copyWith((message) => updates(message as CallList)) as CallList;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CallList create() => CallList._();
  CallList createEmptyInstance() => create();
  static $pb.PbList<CallList> createRepeated() => $pb.PbList<CallList>();
  @$core.pragma('dart2js:noInline')
  static CallList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CallList>(create);
  static CallList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$0.CALL_LIST_REC> get callListChanged => $_getList(0);
}

class ActiveCallList extends $pb.GeneratedMessage {
  factory ActiveCallList({
    $core.Iterable<$0.CALL_INFO>? calls,
  }) {
    final $result = create();
    if (calls != null) {
      $result.calls.addAll(calls);
    }
    return $result;
  }
  ActiveCallList._() : super();
  factory ActiveCallList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ActiveCallList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ActiveCallList', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..pc<$0.CALL_INFO>(1, _omitFieldNames ? '' : 'calls', $pb.PbFieldType.PM, subBuilder: $0.CALL_INFO.create)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ActiveCallList clone() => ActiveCallList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ActiveCallList copyWith(void Function(ActiveCallList) updates) => super.copyWith((message) => updates(message as ActiveCallList)) as ActiveCallList;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ActiveCallList create() => ActiveCallList._();
  ActiveCallList createEmptyInstance() => create();
  static $pb.PbList<ActiveCallList> createRepeated() => $pb.PbList<ActiveCallList>();
  @$core.pragma('dart2js:noInline')
  static ActiveCallList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ActiveCallList>(create);
  static ActiveCallList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$0.CALL_INFO> get calls => $_getList(0);
}

class ActiveCallHardware extends $pb.GeneratedMessage {
  factory ActiveCallHardware({
    $core.bool? deviceChanged,
    $core.bool? speakerOn,
    $core.bool? isMuted,
    $core.bool? useVideo,
    $core.int? audioCodec,
    ActiveCallVideoType? videoType,
  }) {
    final $result = create();
    if (deviceChanged != null) {
      $result.deviceChanged = deviceChanged;
    }
    if (speakerOn != null) {
      $result.speakerOn = speakerOn;
    }
    if (isMuted != null) {
      $result.isMuted = isMuted;
    }
    if (useVideo != null) {
      $result.useVideo = useVideo;
    }
    if (audioCodec != null) {
      $result.audioCodec = audioCodec;
    }
    if (videoType != null) {
      $result.videoType = videoType;
    }
    return $result;
  }
  ActiveCallHardware._() : super();
  factory ActiveCallHardware.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ActiveCallHardware.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ActiveCallHardware', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..a<$core.bool>(1, _omitFieldNames ? '' : 'deviceChanged', $pb.PbFieldType.QB)
    ..a<$core.bool>(2, _omitFieldNames ? '' : 'speakerOn', $pb.PbFieldType.QB)
    ..a<$core.bool>(3, _omitFieldNames ? '' : 'isMuted', $pb.PbFieldType.QB)
    ..a<$core.bool>(4, _omitFieldNames ? '' : 'useVideo', $pb.PbFieldType.QB)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'audioCodec', $pb.PbFieldType.QU3)
    ..e<ActiveCallVideoType>(6, _omitFieldNames ? '' : 'videoType', $pb.PbFieldType.OE, defaultOrMaker: ActiveCallVideoType.Idle, valueOf: ActiveCallVideoType.valueOf, enumValues: ActiveCallVideoType.values)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ActiveCallHardware clone() => ActiveCallHardware()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ActiveCallHardware copyWith(void Function(ActiveCallHardware) updates) => super.copyWith((message) => updates(message as ActiveCallHardware)) as ActiveCallHardware;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ActiveCallHardware create() => ActiveCallHardware._();
  ActiveCallHardware createEmptyInstance() => create();
  static $pb.PbList<ActiveCallHardware> createRepeated() => $pb.PbList<ActiveCallHardware>();
  @$core.pragma('dart2js:noInline')
  static ActiveCallHardware getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ActiveCallHardware>(create);
  static ActiveCallHardware? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get deviceChanged => $_getBF(0);
  @$pb.TagNumber(1)
  set deviceChanged($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeviceChanged() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceChanged() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get speakerOn => $_getBF(1);
  @$pb.TagNumber(2)
  set speakerOn($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSpeakerOn() => $_has(1);
  @$pb.TagNumber(2)
  void clearSpeakerOn() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isMuted => $_getBF(2);
  @$pb.TagNumber(3)
  set isMuted($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIsMuted() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsMuted() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get useVideo => $_getBF(3);
  @$pb.TagNumber(4)
  set useVideo($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasUseVideo() => $_has(3);
  @$pb.TagNumber(4)
  void clearUseVideo() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get audioCodec => $_getIZ(4);
  @$pb.TagNumber(5)
  set audioCodec($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasAudioCodec() => $_has(4);
  @$pb.TagNumber(5)
  void clearAudioCodec() => clearField(5);

  @$pb.TagNumber(6)
  ActiveCallVideoType get videoType => $_getN(5);
  @$pb.TagNumber(6)
  set videoType(ActiveCallVideoType v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasVideoType() => $_has(5);
  @$pb.TagNumber(6)
  void clearVideoType() => clearField(6);
}

class VideoConfigResp extends $pb.GeneratedMessage {
  factory VideoConfigResp({
    $core.int? widthPrimar,
    $core.int? heightPrimar,
    $fixnum.Int64? pointerPrimar,
    $core.int? lenPrimar,
    $core.int? widthSecond,
    $core.int? heightSecond,
    $fixnum.Int64? pointerSecond,
    $core.int? lenSecond,
    $core.int? rotateSend,
    $core.int? rotateReceive,
  }) {
    final $result = create();
    if (widthPrimar != null) {
      $result.widthPrimar = widthPrimar;
    }
    if (heightPrimar != null) {
      $result.heightPrimar = heightPrimar;
    }
    if (pointerPrimar != null) {
      $result.pointerPrimar = pointerPrimar;
    }
    if (lenPrimar != null) {
      $result.lenPrimar = lenPrimar;
    }
    if (widthSecond != null) {
      $result.widthSecond = widthSecond;
    }
    if (heightSecond != null) {
      $result.heightSecond = heightSecond;
    }
    if (pointerSecond != null) {
      $result.pointerSecond = pointerSecond;
    }
    if (lenSecond != null) {
      $result.lenSecond = lenSecond;
    }
    if (rotateSend != null) {
      $result.rotateSend = rotateSend;
    }
    if (rotateReceive != null) {
      $result.rotateReceive = rotateReceive;
    }
    return $result;
  }
  VideoConfigResp._() : super();
  factory VideoConfigResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VideoConfigResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'VideoConfigResp', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'widthPrimar', $pb.PbFieldType.QU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'heightPrimar', $pb.PbFieldType.QU3)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'pointerPrimar', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'lenPrimar', $pb.PbFieldType.QU3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'widthSecond', $pb.PbFieldType.QU3)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'heightSecond', $pb.PbFieldType.QU3)
    ..a<$fixnum.Int64>(7, _omitFieldNames ? '' : 'pointerSecond', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(8, _omitFieldNames ? '' : 'lenSecond', $pb.PbFieldType.QU3)
    ..a<$core.int>(9, _omitFieldNames ? '' : 'rotateSend', $pb.PbFieldType.QU3)
    ..a<$core.int>(10, _omitFieldNames ? '' : 'rotateReceive', $pb.PbFieldType.QU3)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VideoConfigResp clone() => VideoConfigResp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VideoConfigResp copyWith(void Function(VideoConfigResp) updates) => super.copyWith((message) => updates(message as VideoConfigResp)) as VideoConfigResp;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VideoConfigResp create() => VideoConfigResp._();
  VideoConfigResp createEmptyInstance() => create();
  static $pb.PbList<VideoConfigResp> createRepeated() => $pb.PbList<VideoConfigResp>();
  @$core.pragma('dart2js:noInline')
  static VideoConfigResp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VideoConfigResp>(create);
  static VideoConfigResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get widthPrimar => $_getIZ(0);
  @$pb.TagNumber(1)
  set widthPrimar($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasWidthPrimar() => $_has(0);
  @$pb.TagNumber(1)
  void clearWidthPrimar() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get heightPrimar => $_getIZ(1);
  @$pb.TagNumber(2)
  set heightPrimar($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasHeightPrimar() => $_has(1);
  @$pb.TagNumber(2)
  void clearHeightPrimar() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get pointerPrimar => $_getI64(2);
  @$pb.TagNumber(3)
  set pointerPrimar($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPointerPrimar() => $_has(2);
  @$pb.TagNumber(3)
  void clearPointerPrimar() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get lenPrimar => $_getIZ(3);
  @$pb.TagNumber(4)
  set lenPrimar($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLenPrimar() => $_has(3);
  @$pb.TagNumber(4)
  void clearLenPrimar() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get widthSecond => $_getIZ(4);
  @$pb.TagNumber(5)
  set widthSecond($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasWidthSecond() => $_has(4);
  @$pb.TagNumber(5)
  void clearWidthSecond() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get heightSecond => $_getIZ(5);
  @$pb.TagNumber(6)
  set heightSecond($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasHeightSecond() => $_has(5);
  @$pb.TagNumber(6)
  void clearHeightSecond() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get pointerSecond => $_getI64(6);
  @$pb.TagNumber(7)
  set pointerSecond($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasPointerSecond() => $_has(6);
  @$pb.TagNumber(7)
  void clearPointerSecond() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get lenSecond => $_getIZ(7);
  @$pb.TagNumber(8)
  set lenSecond($core.int v) { $_setUnsignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasLenSecond() => $_has(7);
  @$pb.TagNumber(8)
  void clearLenSecond() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get rotateSend => $_getIZ(8);
  @$pb.TagNumber(9)
  set rotateSend($core.int v) { $_setUnsignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasRotateSend() => $_has(8);
  @$pb.TagNumber(9)
  void clearRotateSend() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get rotateReceive => $_getIZ(9);
  @$pb.TagNumber(10)
  set rotateReceive($core.int v) { $_setUnsignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasRotateReceive() => $_has(9);
  @$pb.TagNumber(10)
  void clearRotateReceive() => clearField(10);
}

class SourceVideo extends $pb.GeneratedMessage {
  factory SourceVideo({
    $core.int? width,
    $core.int? height,
    $core.String? description,
  }) {
    final $result = create();
    if (width != null) {
      $result.width = width;
    }
    if (height != null) {
      $result.height = height;
    }
    if (description != null) {
      $result.description = description;
    }
    return $result;
  }
  SourceVideo._() : super();
  factory SourceVideo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SourceVideo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SourceVideo', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'width', $pb.PbFieldType.QU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'height', $pb.PbFieldType.QU3)
    ..aQS(3, _omitFieldNames ? '' : 'description')
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SourceVideo clone() => SourceVideo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SourceVideo copyWith(void Function(SourceVideo) updates) => super.copyWith((message) => updates(message as SourceVideo)) as SourceVideo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SourceVideo create() => SourceVideo._();
  SourceVideo createEmptyInstance() => create();
  static $pb.PbList<SourceVideo> createRepeated() => $pb.PbList<SourceVideo>();
  @$core.pragma('dart2js:noInline')
  static SourceVideo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SourceVideo>(create);
  static SourceVideo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get width => $_getIZ(0);
  @$pb.TagNumber(1)
  set width($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasWidth() => $_has(0);
  @$pb.TagNumber(1)
  void clearWidth() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get height => $_getIZ(1);
  @$pb.TagNumber(2)
  set height($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasHeight() => $_has(1);
  @$pb.TagNumber(2)
  void clearHeight() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);
}

class MakeCallReq extends $pb.GeneratedMessage {
  factory MakeCallReq({
    $core.String? number,
    $core.bool? useVideo,
  }) {
    final $result = create();
    if (number != null) {
      $result.number = number;
    }
    if (useVideo != null) {
      $result.useVideo = useVideo;
    }
    return $result;
  }
  MakeCallReq._() : super();
  factory MakeCallReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MakeCallReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MakeCallReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..aQS(1, _omitFieldNames ? '' : 'number')
    ..a<$core.bool>(2, _omitFieldNames ? '' : 'useVideo', $pb.PbFieldType.QB)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MakeCallReq clone() => MakeCallReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MakeCallReq copyWith(void Function(MakeCallReq) updates) => super.copyWith((message) => updates(message as MakeCallReq)) as MakeCallReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MakeCallReq create() => MakeCallReq._();
  MakeCallReq createEmptyInstance() => create();
  static $pb.PbList<MakeCallReq> createRepeated() => $pb.PbList<MakeCallReq>();
  @$core.pragma('dart2js:noInline')
  static MakeCallReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MakeCallReq>(create);
  static MakeCallReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get number => $_getSZ(0);
  @$pb.TagNumber(1)
  set number($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNumber() => $_has(0);
  @$pb.TagNumber(1)
  void clearNumber() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get useVideo => $_getBF(1);
  @$pb.TagNumber(2)
  set useVideo($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUseVideo() => $_has(1);
  @$pb.TagNumber(2)
  void clearUseVideo() => clearField(2);
}

class MakeCallResp extends $pb.GeneratedMessage {
  factory MakeCallResp({
    $core.bool? success,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  MakeCallResp._() : super();
  factory MakeCallResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MakeCallResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MakeCallResp', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..a<$core.bool>(1, _omitFieldNames ? '' : 'success', $pb.PbFieldType.QB)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MakeCallResp clone() => MakeCallResp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MakeCallResp copyWith(void Function(MakeCallResp) updates) => super.copyWith((message) => updates(message as MakeCallResp)) as MakeCallResp;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MakeCallResp create() => MakeCallResp._();
  MakeCallResp createEmptyInstance() => create();
  static $pb.PbList<MakeCallResp> createRepeated() => $pb.PbList<MakeCallResp>();
  @$core.pragma('dart2js:noInline')
  static MakeCallResp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MakeCallResp>(create);
  static MakeCallResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class AnswerCallReq extends $pb.GeneratedMessage {
  factory AnswerCallReq({
    $fixnum.Int64? callId,
    $core.bool? useVideo,
  }) {
    final $result = create();
    if (callId != null) {
      $result.callId = callId;
    }
    if (useVideo != null) {
      $result.useVideo = useVideo;
    }
    return $result;
  }
  AnswerCallReq._() : super();
  factory AnswerCallReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AnswerCallReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AnswerCallReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'callId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(2, _omitFieldNames ? '' : 'useVideo')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AnswerCallReq clone() => AnswerCallReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AnswerCallReq copyWith(void Function(AnswerCallReq) updates) => super.copyWith((message) => updates(message as AnswerCallReq)) as AnswerCallReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AnswerCallReq create() => AnswerCallReq._();
  AnswerCallReq createEmptyInstance() => create();
  static $pb.PbList<AnswerCallReq> createRepeated() => $pb.PbList<AnswerCallReq>();
  @$core.pragma('dart2js:noInline')
  static AnswerCallReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AnswerCallReq>(create);
  static AnswerCallReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get callId => $_getI64(0);
  @$pb.TagNumber(1)
  set callId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCallId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCallId() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get useVideo => $_getBF(1);
  @$pb.TagNumber(2)
  set useVideo($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUseVideo() => $_has(1);
  @$pb.TagNumber(2)
  void clearUseVideo() => clearField(2);
}

class AnswerCallResp extends $pb.GeneratedMessage {
  factory AnswerCallResp({
    $core.bool? success,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  AnswerCallResp._() : super();
  factory AnswerCallResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AnswerCallResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AnswerCallResp', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..a<$core.bool>(1, _omitFieldNames ? '' : 'success', $pb.PbFieldType.QB)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AnswerCallResp clone() => AnswerCallResp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AnswerCallResp copyWith(void Function(AnswerCallResp) updates) => super.copyWith((message) => updates(message as AnswerCallResp)) as AnswerCallResp;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AnswerCallResp create() => AnswerCallResp._();
  AnswerCallResp createEmptyInstance() => create();
  static $pb.PbList<AnswerCallResp> createRepeated() => $pb.PbList<AnswerCallResp>();
  @$core.pragma('dart2js:noInline')
  static AnswerCallResp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AnswerCallResp>(create);
  static AnswerCallResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class CloseCallResp extends $pb.GeneratedMessage {
  factory CloseCallResp({
    $core.bool? success,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  CloseCallResp._() : super();
  factory CloseCallResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CloseCallResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CloseCallResp', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..a<$core.bool>(1, _omitFieldNames ? '' : 'success', $pb.PbFieldType.QB)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CloseCallResp clone() => CloseCallResp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CloseCallResp copyWith(void Function(CloseCallResp) updates) => super.copyWith((message) => updates(message as CloseCallResp)) as CloseCallResp;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CloseCallResp create() => CloseCallResp._();
  CloseCallResp createEmptyInstance() => create();
  static $pb.PbList<CloseCallResp> createRepeated() => $pb.PbList<CloseCallResp>();
  @$core.pragma('dart2js:noInline')
  static CloseCallResp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CloseCallResp>(create);
  static CloseCallResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class CallHoldOnOffResp extends $pb.GeneratedMessage {
  factory CallHoldOnOffResp({
    $core.bool? success,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  CallHoldOnOffResp._() : super();
  factory CallHoldOnOffResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CallHoldOnOffResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CallHoldOnOffResp', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..a<$core.bool>(1, _omitFieldNames ? '' : 'success', $pb.PbFieldType.QB)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CallHoldOnOffResp clone() => CallHoldOnOffResp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CallHoldOnOffResp copyWith(void Function(CallHoldOnOffResp) updates) => super.copyWith((message) => updates(message as CallHoldOnOffResp)) as CallHoldOnOffResp;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CallHoldOnOffResp create() => CallHoldOnOffResp._();
  CallHoldOnOffResp createEmptyInstance() => create();
  static $pb.PbList<CallHoldOnOffResp> createRepeated() => $pb.PbList<CallHoldOnOffResp>();
  @$core.pragma('dart2js:noInline')
  static CallHoldOnOffResp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CallHoldOnOffResp>(create);
  static CallHoldOnOffResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class CallSwitchResp extends $pb.GeneratedMessage {
  factory CallSwitchResp({
    $core.int? result,
  }) {
    final $result = create();
    if (result != null) {
      $result.result = result;
    }
    return $result;
  }
  CallSwitchResp._() : super();
  factory CallSwitchResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CallSwitchResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CallSwitchResp', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'result', $pb.PbFieldType.QU3)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CallSwitchResp clone() => CallSwitchResp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CallSwitchResp copyWith(void Function(CallSwitchResp) updates) => super.copyWith((message) => updates(message as CallSwitchResp)) as CallSwitchResp;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CallSwitchResp create() => CallSwitchResp._();
  CallSwitchResp createEmptyInstance() => create();
  static $pb.PbList<CallSwitchResp> createRepeated() => $pb.PbList<CallSwitchResp>();
  @$core.pragma('dart2js:noInline')
  static CallSwitchResp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CallSwitchResp>(create);
  static CallSwitchResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get result => $_getIZ(0);
  @$pb.TagNumber(1)
  set result($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => clearField(1);
}

///
///  conference call
class ConfCallUserActionReq extends $pb.GeneratedMessage {
  factory ConfCallUserActionReq({
    $fixnum.Int64? destId,
  }) {
    final $result = create();
    if (destId != null) {
      $result.destId = destId;
    }
    return $result;
  }
  ConfCallUserActionReq._() : super();
  factory ConfCallUserActionReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConfCallUserActionReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ConfCallUserActionReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'destId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConfCallUserActionReq clone() => ConfCallUserActionReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConfCallUserActionReq copyWith(void Function(ConfCallUserActionReq) updates) => super.copyWith((message) => updates(message as ConfCallUserActionReq)) as ConfCallUserActionReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConfCallUserActionReq create() => ConfCallUserActionReq._();
  ConfCallUserActionReq createEmptyInstance() => create();
  static $pb.PbList<ConfCallUserActionReq> createRepeated() => $pb.PbList<ConfCallUserActionReq>();
  @$core.pragma('dart2js:noInline')
  static ConfCallUserActionReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConfCallUserActionReq>(create);
  static ConfCallUserActionReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get destId => $_getI64(0);
  @$pb.TagNumber(1)
  set destId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDestId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDestId() => clearField(1);
}

class ConfCallUserActionResp extends $pb.GeneratedMessage {
  factory ConfCallUserActionResp({
    $core.bool? success,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  ConfCallUserActionResp._() : super();
  factory ConfCallUserActionResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConfCallUserActionResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ConfCallUserActionResp', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConfCallUserActionResp clone() => ConfCallUserActionResp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConfCallUserActionResp copyWith(void Function(ConfCallUserActionResp) updates) => super.copyWith((message) => updates(message as ConfCallUserActionResp)) as ConfCallUserActionResp;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConfCallUserActionResp create() => ConfCallUserActionResp._();
  ConfCallUserActionResp createEmptyInstance() => create();
  static $pb.PbList<ConfCallUserActionResp> createRepeated() => $pb.PbList<ConfCallUserActionResp>();
  @$core.pragma('dart2js:noInline')
  static ConfCallUserActionResp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConfCallUserActionResp>(create);
  static ConfCallUserActionResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class ConfCallGetUserListReq extends $pb.GeneratedMessage {
  factory ConfCallGetUserListReq({
    $fixnum.Int64? destId,
  }) {
    final $result = create();
    if (destId != null) {
      $result.destId = destId;
    }
    return $result;
  }
  ConfCallGetUserListReq._() : super();
  factory ConfCallGetUserListReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConfCallGetUserListReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ConfCallGetUserListReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'destId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConfCallGetUserListReq clone() => ConfCallGetUserListReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConfCallGetUserListReq copyWith(void Function(ConfCallGetUserListReq) updates) => super.copyWith((message) => updates(message as ConfCallGetUserListReq)) as ConfCallGetUserListReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConfCallGetUserListReq create() => ConfCallGetUserListReq._();
  ConfCallGetUserListReq createEmptyInstance() => create();
  static $pb.PbList<ConfCallGetUserListReq> createRepeated() => $pb.PbList<ConfCallGetUserListReq>();
  @$core.pragma('dart2js:noInline')
  static ConfCallGetUserListReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConfCallGetUserListReq>(create);
  static ConfCallGetUserListReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get destId => $_getI64(0);
  @$pb.TagNumber(1)
  set destId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDestId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDestId() => clearField(1);
}

class ConfCallGetUserListResp extends $pb.GeneratedMessage {
  factory ConfCallGetUserListResp({
    $core.bool? success,
    $core.Iterable<ConfMemberRec>? list,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    if (list != null) {
      $result.list.addAll(list);
    }
    return $result;
  }
  ConfCallGetUserListResp._() : super();
  factory ConfCallGetUserListResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConfCallGetUserListResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ConfCallGetUserListResp', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..pc<ConfMemberRec>(2, _omitFieldNames ? '' : 'list', $pb.PbFieldType.PM, subBuilder: ConfMemberRec.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConfCallGetUserListResp clone() => ConfCallGetUserListResp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConfCallGetUserListResp copyWith(void Function(ConfCallGetUserListResp) updates) => super.copyWith((message) => updates(message as ConfCallGetUserListResp)) as ConfCallGetUserListResp;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConfCallGetUserListResp create() => ConfCallGetUserListResp._();
  ConfCallGetUserListResp createEmptyInstance() => create();
  static $pb.PbList<ConfCallGetUserListResp> createRepeated() => $pb.PbList<ConfCallGetUserListResp>();
  @$core.pragma('dart2js:noInline')
  static ConfCallGetUserListResp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConfCallGetUserListResp>(create);
  static ConfCallGetUserListResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<ConfMemberRec> get list => $_getList(1);
}

class ConfMemberRec extends $pb.GeneratedMessage {
  factory ConfMemberRec({
    $fixnum.Int64? userId,
    $fixnum.Int64? deviceId,
    $core.int? state,
    $core.int? rights,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (deviceId != null) {
      $result.deviceId = deviceId;
    }
    if (state != null) {
      $result.state = state;
    }
    if (rights != null) {
      $result.rights = rights;
    }
    return $result;
  }
  ConfMemberRec._() : super();
  factory ConfMemberRec.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConfMemberRec.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ConfMemberRec', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'deviceId', $pb.PbFieldType.OU6, protoName: 'device_Id', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'state', $pb.PbFieldType.OU3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'rights', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConfMemberRec clone() => ConfMemberRec()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConfMemberRec copyWith(void Function(ConfMemberRec) updates) => super.copyWith((message) => updates(message as ConfMemberRec)) as ConfMemberRec;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConfMemberRec create() => ConfMemberRec._();
  ConfMemberRec createEmptyInstance() => create();
  static $pb.PbList<ConfMemberRec> createRepeated() => $pb.PbList<ConfMemberRec>();
  @$core.pragma('dart2js:noInline')
  static ConfMemberRec getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConfMemberRec>(create);
  static ConfMemberRec? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get userId => $_getI64(0);
  @$pb.TagNumber(1)
  set userId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get deviceId => $_getI64(1);
  @$pb.TagNumber(2)
  set deviceId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDeviceId() => $_has(1);
  @$pb.TagNumber(2)
  void clearDeviceId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get state => $_getIZ(2);
  @$pb.TagNumber(3)
  set state($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasState() => $_has(2);
  @$pb.TagNumber(3)
  void clearState() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get rights => $_getIZ(3);
  @$pb.TagNumber(4)
  set rights($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRights() => $_has(3);
  @$pb.TagNumber(4)
  void clearRights() => clearField(4);
}

class AudioCommandIn extends $pb.GeneratedMessage {
  factory AudioCommandIn({
    AudioCommandType? command,
    $core.String? number,
    $core.int? codecType,
    ActiveCallVideoType? videoType,
    VideoCodecType? videoCodecType,
    $core.bool? useTestLoop,
    $core.String? recordToFile,
    $core.int? width,
    $core.int? height,
    $core.int? frameRate,
  }) {
    final $result = create();
    if (command != null) {
      $result.command = command;
    }
    if (number != null) {
      $result.number = number;
    }
    if (codecType != null) {
      $result.codecType = codecType;
    }
    if (videoType != null) {
      $result.videoType = videoType;
    }
    if (videoCodecType != null) {
      $result.videoCodecType = videoCodecType;
    }
    if (useTestLoop != null) {
      $result.useTestLoop = useTestLoop;
    }
    if (recordToFile != null) {
      $result.recordToFile = recordToFile;
    }
    if (width != null) {
      $result.width = width;
    }
    if (height != null) {
      $result.height = height;
    }
    if (frameRate != null) {
      $result.frameRate = frameRate;
    }
    return $result;
  }
  AudioCommandIn._() : super();
  factory AudioCommandIn.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AudioCommandIn.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AudioCommandIn', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..e<AudioCommandType>(1, _omitFieldNames ? '' : 'command', $pb.PbFieldType.QE, defaultOrMaker: AudioCommandType.START_CALL_MONITOR, valueOf: AudioCommandType.valueOf, enumValues: AudioCommandType.values)
    ..aOS(2, _omitFieldNames ? '' : 'number')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'codecType', $pb.PbFieldType.OU3)
    ..e<ActiveCallVideoType>(4, _omitFieldNames ? '' : 'videoType', $pb.PbFieldType.OE, defaultOrMaker: ActiveCallVideoType.Idle, valueOf: ActiveCallVideoType.valueOf, enumValues: ActiveCallVideoType.values)
    ..e<VideoCodecType>(5, _omitFieldNames ? '' : 'videoCodecType', $pb.PbFieldType.OE, defaultOrMaker: VideoCodecType.Codec3gp, valueOf: VideoCodecType.valueOf, enumValues: VideoCodecType.values)
    ..aOB(6, _omitFieldNames ? '' : 'useTestLoop')
    ..aOS(7, _omitFieldNames ? '' : 'recordToFile')
    ..a<$core.int>(8, _omitFieldNames ? '' : 'width', $pb.PbFieldType.OU3)
    ..a<$core.int>(9, _omitFieldNames ? '' : 'height', $pb.PbFieldType.OU3)
    ..a<$core.int>(10, _omitFieldNames ? '' : 'frameRate', $pb.PbFieldType.OU3)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AudioCommandIn clone() => AudioCommandIn()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AudioCommandIn copyWith(void Function(AudioCommandIn) updates) => super.copyWith((message) => updates(message as AudioCommandIn)) as AudioCommandIn;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AudioCommandIn create() => AudioCommandIn._();
  AudioCommandIn createEmptyInstance() => create();
  static $pb.PbList<AudioCommandIn> createRepeated() => $pb.PbList<AudioCommandIn>();
  @$core.pragma('dart2js:noInline')
  static AudioCommandIn getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AudioCommandIn>(create);
  static AudioCommandIn? _defaultInstance;

  @$pb.TagNumber(1)
  AudioCommandType get command => $_getN(0);
  @$pb.TagNumber(1)
  set command(AudioCommandType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCommand() => $_has(0);
  @$pb.TagNumber(1)
  void clearCommand() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get number => $_getSZ(1);
  @$pb.TagNumber(2)
  set number($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearNumber() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get codecType => $_getIZ(2);
  @$pb.TagNumber(3)
  set codecType($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCodecType() => $_has(2);
  @$pb.TagNumber(3)
  void clearCodecType() => clearField(3);

  @$pb.TagNumber(4)
  ActiveCallVideoType get videoType => $_getN(3);
  @$pb.TagNumber(4)
  set videoType(ActiveCallVideoType v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasVideoType() => $_has(3);
  @$pb.TagNumber(4)
  void clearVideoType() => clearField(4);

  @$pb.TagNumber(5)
  VideoCodecType get videoCodecType => $_getN(4);
  @$pb.TagNumber(5)
  set videoCodecType(VideoCodecType v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasVideoCodecType() => $_has(4);
  @$pb.TagNumber(5)
  void clearVideoCodecType() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get useTestLoop => $_getBF(5);
  @$pb.TagNumber(6)
  set useTestLoop($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasUseTestLoop() => $_has(5);
  @$pb.TagNumber(6)
  void clearUseTestLoop() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get recordToFile => $_getSZ(6);
  @$pb.TagNumber(7)
  set recordToFile($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasRecordToFile() => $_has(6);
  @$pb.TagNumber(7)
  void clearRecordToFile() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get width => $_getIZ(7);
  @$pb.TagNumber(8)
  set width($core.int v) { $_setUnsignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasWidth() => $_has(7);
  @$pb.TagNumber(8)
  void clearWidth() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get height => $_getIZ(8);
  @$pb.TagNumber(9)
  set height($core.int v) { $_setUnsignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasHeight() => $_has(8);
  @$pb.TagNumber(9)
  void clearHeight() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get frameRate => $_getIZ(9);
  @$pb.TagNumber(10)
  set frameRate($core.int v) { $_setUnsignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasFrameRate() => $_has(9);
  @$pb.TagNumber(10)
  void clearFrameRate() => clearField(10);
}

class AudioCommandOut extends $pb.GeneratedMessage {
  factory AudioCommandOut({
    $core.bool? success,
    VideoConfigResp? videoConfig,
    $core.Iterable<SourceVideo>? sources,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    if (videoConfig != null) {
      $result.videoConfig = videoConfig;
    }
    if (sources != null) {
      $result.sources.addAll(sources);
    }
    return $result;
  }
  AudioCommandOut._() : super();
  factory AudioCommandOut.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AudioCommandOut.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AudioCommandOut', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..a<$core.bool>(1, _omitFieldNames ? '' : 'success', $pb.PbFieldType.QB)
    ..aOM<VideoConfigResp>(2, _omitFieldNames ? '' : 'videoConfig', subBuilder: VideoConfigResp.create)
    ..pc<SourceVideo>(3, _omitFieldNames ? '' : 'sources', $pb.PbFieldType.PM, subBuilder: SourceVideo.create)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AudioCommandOut clone() => AudioCommandOut()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AudioCommandOut copyWith(void Function(AudioCommandOut) updates) => super.copyWith((message) => updates(message as AudioCommandOut)) as AudioCommandOut;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AudioCommandOut create() => AudioCommandOut._();
  AudioCommandOut createEmptyInstance() => create();
  static $pb.PbList<AudioCommandOut> createRepeated() => $pb.PbList<AudioCommandOut>();
  @$core.pragma('dart2js:noInline')
  static AudioCommandOut getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AudioCommandOut>(create);
  static AudioCommandOut? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  VideoConfigResp get videoConfig => $_getN(1);
  @$pb.TagNumber(2)
  set videoConfig(VideoConfigResp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasVideoConfig() => $_has(1);
  @$pb.TagNumber(2)
  void clearVideoConfig() => clearField(2);
  @$pb.TagNumber(2)
  VideoConfigResp ensureVideoConfig() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.List<SourceVideo> get sources => $_getList(2);
}

class GetAudioCodeRes extends $pb.GeneratedMessage {
  factory GetAudioCodeRes({
    $core.int? codecType,
  }) {
    final $result = create();
    if (codecType != null) {
      $result.codecType = codecType;
    }
    return $result;
  }
  GetAudioCodeRes._() : super();
  factory GetAudioCodeRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAudioCodeRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetAudioCodeRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'codecType', $pb.PbFieldType.QU3, protoName: 'codecType')
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAudioCodeRes clone() => GetAudioCodeRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAudioCodeRes copyWith(void Function(GetAudioCodeRes) updates) => super.copyWith((message) => updates(message as GetAudioCodeRes)) as GetAudioCodeRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAudioCodeRes create() => GetAudioCodeRes._();
  GetAudioCodeRes createEmptyInstance() => create();
  static $pb.PbList<GetAudioCodeRes> createRepeated() => $pb.PbList<GetAudioCodeRes>();
  @$core.pragma('dart2js:noInline')
  static GetAudioCodeRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAudioCodeRes>(create);
  static GetAudioCodeRes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get codecType => $_getIZ(0);
  @$pb.TagNumber(1)
  set codecType($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCodecType() => $_has(0);
  @$pb.TagNumber(1)
  void clearCodecType() => clearField(1);
}

class EventMessage extends $pb.GeneratedMessage {
  factory EventMessage({
    $fixnum.Int64? id,
    $fixnum.Int64? destId,
    $0.DEST_TYPE? destType,
    $fixnum.Int64? fromAbonentId,
    $fixnum.Int64? fromDeviceId,
    $fixnum.Int64? sendId,
    $fixnum.Int64? cTime,
    $fixnum.Int64? eTime,
    $0.MSG_STATE? state,
    $0.MSG_TYPE? msgType,
    $core.int? len,
    $core.bool? isNew,
    $1.T_MessageRec? message,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (destId != null) {
      $result.destId = destId;
    }
    if (destType != null) {
      $result.destType = destType;
    }
    if (fromAbonentId != null) {
      $result.fromAbonentId = fromAbonentId;
    }
    if (fromDeviceId != null) {
      $result.fromDeviceId = fromDeviceId;
    }
    if (sendId != null) {
      $result.sendId = sendId;
    }
    if (cTime != null) {
      $result.cTime = cTime;
    }
    if (eTime != null) {
      $result.eTime = eTime;
    }
    if (state != null) {
      $result.state = state;
    }
    if (msgType != null) {
      $result.msgType = msgType;
    }
    if (len != null) {
      $result.len = len;
    }
    if (isNew != null) {
      $result.isNew = isNew;
    }
    if (message != null) {
      $result.message = message;
    }
    return $result;
  }
  EventMessage._() : super();
  factory EventMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EventMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EventMessage', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'Id', $pb.PbFieldType.QU6, protoName: 'Id', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'DestId', $pb.PbFieldType.QU6, protoName: 'DestId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..e<$0.DEST_TYPE>(3, _omitFieldNames ? '' : 'DestType', $pb.PbFieldType.QE, protoName: 'DestType', defaultOrMaker: $0.DEST_TYPE.ABONENT, valueOf: $0.DEST_TYPE.valueOf, enumValues: $0.DEST_TYPE.values)
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : 'FromAbonentId', $pb.PbFieldType.QU6, protoName: 'FromAbonentId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(5, _omitFieldNames ? '' : 'FromDeviceId', $pb.PbFieldType.QU6, protoName: 'FromDeviceId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(6, _omitFieldNames ? '' : 'SendId', $pb.PbFieldType.QU6, protoName: 'SendId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(7, _omitFieldNames ? '' : 'CTime', $pb.PbFieldType.QU6, protoName: 'CTime', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(8, _omitFieldNames ? '' : 'ETime', $pb.PbFieldType.QU6, protoName: 'ETime', defaultOrMaker: $fixnum.Int64.ZERO)
    ..e<$0.MSG_STATE>(9, _omitFieldNames ? '' : 'State', $pb.PbFieldType.QE, protoName: 'State', defaultOrMaker: $0.MSG_STATE.MSG_UNSENT, valueOf: $0.MSG_STATE.valueOf, enumValues: $0.MSG_STATE.values)
    ..e<$0.MSG_TYPE>(10, _omitFieldNames ? '' : 'MsgType', $pb.PbFieldType.QE, protoName: 'MsgType', defaultOrMaker: $0.MSG_TYPE.MSG_ANY, valueOf: $0.MSG_TYPE.valueOf, enumValues: $0.MSG_TYPE.values)
    ..a<$core.int>(11, _omitFieldNames ? '' : 'Len', $pb.PbFieldType.Q3, protoName: 'Len')
    ..a<$core.bool>(12, _omitFieldNames ? '' : 'isNew', $pb.PbFieldType.QB)
    ..aOM<$1.T_MessageRec>(13, _omitFieldNames ? '' : 'message', subBuilder: $1.T_MessageRec.create)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EventMessage clone() => EventMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EventMessage copyWith(void Function(EventMessage) updates) => super.copyWith((message) => updates(message as EventMessage)) as EventMessage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EventMessage create() => EventMessage._();
  EventMessage createEmptyInstance() => create();
  static $pb.PbList<EventMessage> createRepeated() => $pb.PbList<EventMessage>();
  @$core.pragma('dart2js:noInline')
  static EventMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EventMessage>(create);
  static EventMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get destId => $_getI64(1);
  @$pb.TagNumber(2)
  set destId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDestId() => $_has(1);
  @$pb.TagNumber(2)
  void clearDestId() => clearField(2);

  @$pb.TagNumber(3)
  $0.DEST_TYPE get destType => $_getN(2);
  @$pb.TagNumber(3)
  set destType($0.DEST_TYPE v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasDestType() => $_has(2);
  @$pb.TagNumber(3)
  void clearDestType() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get fromAbonentId => $_getI64(3);
  @$pb.TagNumber(4)
  set fromAbonentId($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFromAbonentId() => $_has(3);
  @$pb.TagNumber(4)
  void clearFromAbonentId() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get fromDeviceId => $_getI64(4);
  @$pb.TagNumber(5)
  set fromDeviceId($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasFromDeviceId() => $_has(4);
  @$pb.TagNumber(5)
  void clearFromDeviceId() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get sendId => $_getI64(5);
  @$pb.TagNumber(6)
  set sendId($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasSendId() => $_has(5);
  @$pb.TagNumber(6)
  void clearSendId() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get cTime => $_getI64(6);
  @$pb.TagNumber(7)
  set cTime($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasCTime() => $_has(6);
  @$pb.TagNumber(7)
  void clearCTime() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get eTime => $_getI64(7);
  @$pb.TagNumber(8)
  set eTime($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasETime() => $_has(7);
  @$pb.TagNumber(8)
  void clearETime() => clearField(8);

  @$pb.TagNumber(9)
  $0.MSG_STATE get state => $_getN(8);
  @$pb.TagNumber(9)
  set state($0.MSG_STATE v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasState() => $_has(8);
  @$pb.TagNumber(9)
  void clearState() => clearField(9);

  @$pb.TagNumber(10)
  $0.MSG_TYPE get msgType => $_getN(9);
  @$pb.TagNumber(10)
  set msgType($0.MSG_TYPE v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasMsgType() => $_has(9);
  @$pb.TagNumber(10)
  void clearMsgType() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get len => $_getIZ(10);
  @$pb.TagNumber(11)
  set len($core.int v) { $_setSignedInt32(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasLen() => $_has(10);
  @$pb.TagNumber(11)
  void clearLen() => clearField(11);

  @$pb.TagNumber(12)
  $core.bool get isNew => $_getBF(11);
  @$pb.TagNumber(12)
  set isNew($core.bool v) { $_setBool(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasIsNew() => $_has(11);
  @$pb.TagNumber(12)
  void clearIsNew() => clearField(12);

  @$pb.TagNumber(13)
  $1.T_MessageRec get message => $_getN(12);
  @$pb.TagNumber(13)
  set message($1.T_MessageRec v) { setField(13, v); }
  @$pb.TagNumber(13)
  $core.bool hasMessage() => $_has(12);
  @$pb.TagNumber(13)
  void clearMessage() => clearField(13);
  @$pb.TagNumber(13)
  $1.T_MessageRec ensureMessage() => $_ensure(12);
}

class ChatsList extends $pb.GeneratedMessage {
  factory ChatsList({
    $core.Iterable<$0.CHAT_LIST_REC>? chatList,
  }) {
    final $result = create();
    if (chatList != null) {
      $result.chatList.addAll(chatList);
    }
    return $result;
  }
  ChatsList._() : super();
  factory ChatsList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatsList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChatsList', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..pc<$0.CHAT_LIST_REC>(1, _omitFieldNames ? '' : 'chatList', $pb.PbFieldType.PM, subBuilder: $0.CHAT_LIST_REC.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatsList clone() => ChatsList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatsList copyWith(void Function(ChatsList) updates) => super.copyWith((message) => updates(message as ChatsList)) as ChatsList;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatsList create() => ChatsList._();
  ChatsList createEmptyInstance() => create();
  static $pb.PbList<ChatsList> createRepeated() => $pb.PbList<ChatsList>();
  @$core.pragma('dart2js:noInline')
  static ChatsList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatsList>(create);
  static ChatsList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$0.CHAT_LIST_REC> get chatList => $_getList(0);
}

class ContactList extends $pb.GeneratedMessage {
  factory ContactList({
    $core.Iterable<$0.CONTACT_LIST_REC>? contactList,
  }) {
    final $result = create();
    if (contactList != null) {
      $result.contactList.addAll(contactList);
    }
    return $result;
  }
  ContactList._() : super();
  factory ContactList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ContactList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ContactList', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..pc<$0.CONTACT_LIST_REC>(1, _omitFieldNames ? '' : 'contactList', $pb.PbFieldType.PM, subBuilder: $0.CONTACT_LIST_REC.create)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ContactList clone() => ContactList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ContactList copyWith(void Function(ContactList) updates) => super.copyWith((message) => updates(message as ContactList)) as ContactList;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ContactList create() => ContactList._();
  ContactList createEmptyInstance() => create();
  static $pb.PbList<ContactList> createRepeated() => $pb.PbList<ContactList>();
  @$core.pragma('dart2js:noInline')
  static ContactList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ContactList>(create);
  static ContactList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$0.CONTACT_LIST_REC> get contactList => $_getList(0);
}

class CONTACT_LIST_MSG extends $pb.GeneratedMessage {
  factory CONTACT_LIST_MSG({
    $core.Iterable<$0.CONTACT_LIST_REC>? mTime,
  }) {
    final $result = create();
    if (mTime != null) {
      $result.mTime.addAll(mTime);
    }
    return $result;
  }
  CONTACT_LIST_MSG._() : super();
  factory CONTACT_LIST_MSG.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CONTACT_LIST_MSG.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CONTACT_LIST_MSG', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..pc<$0.CONTACT_LIST_REC>(1, _omitFieldNames ? '' : 'MTime', $pb.PbFieldType.PM, protoName: 'MTime', subBuilder: $0.CONTACT_LIST_REC.create)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CONTACT_LIST_MSG clone() => CONTACT_LIST_MSG()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CONTACT_LIST_MSG copyWith(void Function(CONTACT_LIST_MSG) updates) => super.copyWith((message) => updates(message as CONTACT_LIST_MSG)) as CONTACT_LIST_MSG;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CONTACT_LIST_MSG create() => CONTACT_LIST_MSG._();
  CONTACT_LIST_MSG createEmptyInstance() => create();
  static $pb.PbList<CONTACT_LIST_MSG> createRepeated() => $pb.PbList<CONTACT_LIST_MSG>();
  @$core.pragma('dart2js:noInline')
  static CONTACT_LIST_MSG getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CONTACT_LIST_MSG>(create);
  static CONTACT_LIST_MSG? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$0.CONTACT_LIST_REC> get mTime => $_getList(0);
}

class T_GetMsgRes extends $pb.GeneratedMessage {
  factory T_GetMsgRes({
    $0.ERROR_CODE? code,
    $core.Iterable<$1.T_MessageRec>? data,
  }) {
    final $result = create();
    if (code != null) {
      $result.code = code;
    }
    if (data != null) {
      $result.data.addAll(data);
    }
    return $result;
  }
  T_GetMsgRes._() : super();
  factory T_GetMsgRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory T_GetMsgRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'T_GetMsgRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..e<$0.ERROR_CODE>(1, _omitFieldNames ? '' : 'code', $pb.PbFieldType.QE, defaultOrMaker: $0.ERROR_CODE.ERR_OK, valueOf: $0.ERROR_CODE.valueOf, enumValues: $0.ERROR_CODE.values)
    ..pc<$1.T_MessageRec>(2, _omitFieldNames ? '' : 'data', $pb.PbFieldType.PM, subBuilder: $1.T_MessageRec.create)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  T_GetMsgRes clone() => T_GetMsgRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  T_GetMsgRes copyWith(void Function(T_GetMsgRes) updates) => super.copyWith((message) => updates(message as T_GetMsgRes)) as T_GetMsgRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static T_GetMsgRes create() => T_GetMsgRes._();
  T_GetMsgRes createEmptyInstance() => create();
  static $pb.PbList<T_GetMsgRes> createRepeated() => $pb.PbList<T_GetMsgRes>();
  @$core.pragma('dart2js:noInline')
  static T_GetMsgRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<T_GetMsgRes>(create);
  static T_GetMsgRes? _defaultInstance;

  @$pb.TagNumber(1)
  $0.ERROR_CODE get code => $_getN(0);
  @$pb.TagNumber(1)
  set code($0.ERROR_CODE v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$1.T_MessageRec> get data => $_getList(1);
}

class TestMemoryInOut extends $pb.GeneratedMessage {
  factory TestMemoryInOut({
    $core.bool? useIn,
    $core.bool? useOut,
    $core.Iterable<$core.int>? testBuf,
  }) {
    final $result = create();
    if (useIn != null) {
      $result.useIn = useIn;
    }
    if (useOut != null) {
      $result.useOut = useOut;
    }
    if (testBuf != null) {
      $result.testBuf.addAll(testBuf);
    }
    return $result;
  }
  TestMemoryInOut._() : super();
  factory TestMemoryInOut.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TestMemoryInOut.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TestMemoryInOut', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..a<$core.bool>(1, _omitFieldNames ? '' : 'useIn', $pb.PbFieldType.QB, protoName: 'useIn')
    ..a<$core.bool>(2, _omitFieldNames ? '' : 'useOut', $pb.PbFieldType.QB, protoName: 'useOut')
    ..p<$core.int>(3, _omitFieldNames ? '' : 'testBuf', $pb.PbFieldType.PU3, protoName: 'testBuf')
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TestMemoryInOut clone() => TestMemoryInOut()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TestMemoryInOut copyWith(void Function(TestMemoryInOut) updates) => super.copyWith((message) => updates(message as TestMemoryInOut)) as TestMemoryInOut;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TestMemoryInOut create() => TestMemoryInOut._();
  TestMemoryInOut createEmptyInstance() => create();
  static $pb.PbList<TestMemoryInOut> createRepeated() => $pb.PbList<TestMemoryInOut>();
  @$core.pragma('dart2js:noInline')
  static TestMemoryInOut getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TestMemoryInOut>(create);
  static TestMemoryInOut? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get useIn => $_getBF(0);
  @$pb.TagNumber(1)
  set useIn($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUseIn() => $_has(0);
  @$pb.TagNumber(1)
  void clearUseIn() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get useOut => $_getBF(1);
  @$pb.TagNumber(2)
  set useOut($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUseOut() => $_has(1);
  @$pb.TagNumber(2)
  void clearUseOut() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get testBuf => $_getList(2);
}

class OnlineEvent extends $pb.GeneratedMessage {
  factory OnlineEvent({
    $0.ClientState? state,
  }) {
    final $result = create();
    if (state != null) {
      $result.state = state;
    }
    return $result;
  }
  OnlineEvent._() : super();
  factory OnlineEvent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OnlineEvent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'OnlineEvent', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..e<$0.ClientState>(2, _omitFieldNames ? '' : 'state', $pb.PbFieldType.QE, defaultOrMaker: $0.ClientState.CLIENT_OFF, valueOf: $0.ClientState.valueOf, enumValues: $0.ClientState.values)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  OnlineEvent clone() => OnlineEvent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  OnlineEvent copyWith(void Function(OnlineEvent) updates) => super.copyWith((message) => updates(message as OnlineEvent)) as OnlineEvent;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OnlineEvent create() => OnlineEvent._();
  OnlineEvent createEmptyInstance() => create();
  static $pb.PbList<OnlineEvent> createRepeated() => $pb.PbList<OnlineEvent>();
  @$core.pragma('dart2js:noInline')
  static OnlineEvent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OnlineEvent>(create);
  static OnlineEvent? _defaultInstance;

  @$pb.TagNumber(2)
  $0.ClientState get state => $_getN(0);
  @$pb.TagNumber(2)
  set state($0.ClientState v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasState() => $_has(0);
  @$pb.TagNumber(2)
  void clearState() => clearField(2);
}

enum EventMsgWrapper_Msg {
  onlineEvent, 
  netErrCode, 
  eventMsg, 
  eventListRec, 
  eventCall, 
  eventChatTime, 
  eventOnlineStatus, 
  eventChatList, 
  progress, 
  regStatusChanged, 
  regProfileListChanged, 
  regNetErrorChanged, 
  eventContactList, 
  eventCallList, 
  log, 
  iconChanged, 
  activeCall, 
  activeCallHardware, 
  debugVideoFrame, 
  localMsgNotification, 
  localCallNotification, 
  filePart, 
  debugCount, 
  missedCallCount, 
  notSet
}

class EventMsgWrapper extends $pb.GeneratedMessage {
  factory EventMsgWrapper({
    ApiEvent? type,
    OnlineEvent? onlineEvent,
    $core.int? netErrCode,
    EventMessage? eventMsg,
    $0.EventListRec? eventListRec,
    $0.EventCall? eventCall,
    $0.EventChatTime? eventChatTime,
    OnlineStatus? eventOnlineStatus,
    ChatsList? eventChatList,
    $1.FileProgress? progress,
    $2.RegStatusChangedRes? regStatusChanged,
    $2.RegProfileListChangedData? regProfileListChanged,
    $2.RegNetErrorChangedData? regNetErrorChanged,
    ContactList? eventContactList,
    CallList? eventCallList,
    $core.String? log,
    Id? iconChanged,
    $0.ActiveCallStatus? activeCall,
    ActiveCallHardware? activeCallHardware,
    DebugVideoFrame? debugVideoFrame,
    NotificationReq? localMsgNotification,
    NotificationCallStatusReq? localCallNotification,
    $1.FilePart? filePart,
    $fixnum.Int64? debugCount,
    $core.int? missedCallCount,
  }) {
    final $result = create();
    if (type != null) {
      $result.type = type;
    }
    if (onlineEvent != null) {
      $result.onlineEvent = onlineEvent;
    }
    if (netErrCode != null) {
      $result.netErrCode = netErrCode;
    }
    if (eventMsg != null) {
      $result.eventMsg = eventMsg;
    }
    if (eventListRec != null) {
      $result.eventListRec = eventListRec;
    }
    if (eventCall != null) {
      $result.eventCall = eventCall;
    }
    if (eventChatTime != null) {
      $result.eventChatTime = eventChatTime;
    }
    if (eventOnlineStatus != null) {
      $result.eventOnlineStatus = eventOnlineStatus;
    }
    if (eventChatList != null) {
      $result.eventChatList = eventChatList;
    }
    if (progress != null) {
      $result.progress = progress;
    }
    if (regStatusChanged != null) {
      $result.regStatusChanged = regStatusChanged;
    }
    if (regProfileListChanged != null) {
      $result.regProfileListChanged = regProfileListChanged;
    }
    if (regNetErrorChanged != null) {
      $result.regNetErrorChanged = regNetErrorChanged;
    }
    if (eventContactList != null) {
      $result.eventContactList = eventContactList;
    }
    if (eventCallList != null) {
      $result.eventCallList = eventCallList;
    }
    if (log != null) {
      $result.log = log;
    }
    if (iconChanged != null) {
      $result.iconChanged = iconChanged;
    }
    if (activeCall != null) {
      $result.activeCall = activeCall;
    }
    if (activeCallHardware != null) {
      $result.activeCallHardware = activeCallHardware;
    }
    if (debugVideoFrame != null) {
      $result.debugVideoFrame = debugVideoFrame;
    }
    if (localMsgNotification != null) {
      $result.localMsgNotification = localMsgNotification;
    }
    if (localCallNotification != null) {
      $result.localCallNotification = localCallNotification;
    }
    if (filePart != null) {
      $result.filePart = filePart;
    }
    if (debugCount != null) {
      $result.debugCount = debugCount;
    }
    if (missedCallCount != null) {
      $result.missedCallCount = missedCallCount;
    }
    return $result;
  }
  EventMsgWrapper._() : super();
  factory EventMsgWrapper.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EventMsgWrapper.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, EventMsgWrapper_Msg> _EventMsgWrapper_MsgByTag = {
    2 : EventMsgWrapper_Msg.onlineEvent,
    3 : EventMsgWrapper_Msg.netErrCode,
    4 : EventMsgWrapper_Msg.eventMsg,
    5 : EventMsgWrapper_Msg.eventListRec,
    6 : EventMsgWrapper_Msg.eventCall,
    7 : EventMsgWrapper_Msg.eventChatTime,
    8 : EventMsgWrapper_Msg.eventOnlineStatus,
    10 : EventMsgWrapper_Msg.eventChatList,
    11 : EventMsgWrapper_Msg.progress,
    12 : EventMsgWrapper_Msg.regStatusChanged,
    13 : EventMsgWrapper_Msg.regProfileListChanged,
    15 : EventMsgWrapper_Msg.regNetErrorChanged,
    17 : EventMsgWrapper_Msg.eventContactList,
    18 : EventMsgWrapper_Msg.eventCallList,
    19 : EventMsgWrapper_Msg.log,
    20 : EventMsgWrapper_Msg.iconChanged,
    21 : EventMsgWrapper_Msg.activeCall,
    22 : EventMsgWrapper_Msg.activeCallHardware,
    23 : EventMsgWrapper_Msg.debugVideoFrame,
    24 : EventMsgWrapper_Msg.localMsgNotification,
    25 : EventMsgWrapper_Msg.localCallNotification,
    27 : EventMsgWrapper_Msg.filePart,
    29 : EventMsgWrapper_Msg.debugCount,
    30 : EventMsgWrapper_Msg.missedCallCount,
    0 : EventMsgWrapper_Msg.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EventMsgWrapper', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..oo(0, [2, 3, 4, 5, 6, 7, 8, 10, 11, 12, 13, 15, 17, 18, 19, 20, 21, 22, 23, 24, 25, 27, 29, 30])
    ..e<ApiEvent>(1, _omitFieldNames ? '' : 'type', $pb.PbFieldType.QE, defaultOrMaker: ApiEvent.AllMessagesReady, valueOf: ApiEvent.valueOf, enumValues: ApiEvent.values)
    ..aOM<OnlineEvent>(2, _omitFieldNames ? '' : 'onlineEvent', subBuilder: OnlineEvent.create)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'netErrCode', $pb.PbFieldType.O3)
    ..aOM<EventMessage>(4, _omitFieldNames ? '' : 'eventMsg', subBuilder: EventMessage.create)
    ..aOM<$0.EventListRec>(5, _omitFieldNames ? '' : 'eventListRec', subBuilder: $0.EventListRec.create)
    ..aOM<$0.EventCall>(6, _omitFieldNames ? '' : 'eventCall', subBuilder: $0.EventCall.create)
    ..aOM<$0.EventChatTime>(7, _omitFieldNames ? '' : 'eventChatTime', subBuilder: $0.EventChatTime.create)
    ..e<OnlineStatus>(8, _omitFieldNames ? '' : 'eventOnlineStatus', $pb.PbFieldType.OE, defaultOrMaker: OnlineStatus.Connecting, valueOf: OnlineStatus.valueOf, enumValues: OnlineStatus.values)
    ..aOM<ChatsList>(10, _omitFieldNames ? '' : 'eventChatList', subBuilder: ChatsList.create)
    ..aOM<$1.FileProgress>(11, _omitFieldNames ? '' : 'progress', subBuilder: $1.FileProgress.create)
    ..aOM<$2.RegStatusChangedRes>(12, _omitFieldNames ? '' : 'regStatusChanged', subBuilder: $2.RegStatusChangedRes.create)
    ..aOM<$2.RegProfileListChangedData>(13, _omitFieldNames ? '' : 'regProfileListChanged', subBuilder: $2.RegProfileListChangedData.create)
    ..aOM<$2.RegNetErrorChangedData>(15, _omitFieldNames ? '' : 'regNetErrorChanged', subBuilder: $2.RegNetErrorChangedData.create)
    ..aOM<ContactList>(17, _omitFieldNames ? '' : 'eventContactList', subBuilder: ContactList.create)
    ..aOM<CallList>(18, _omitFieldNames ? '' : 'eventCallList', subBuilder: CallList.create)
    ..aOS(19, _omitFieldNames ? '' : 'log')
    ..aOM<Id>(20, _omitFieldNames ? '' : 'iconChanged', protoName: 'iconChanged', subBuilder: Id.create)
    ..aOM<$0.ActiveCallStatus>(21, _omitFieldNames ? '' : 'activeCall', subBuilder: $0.ActiveCallStatus.create)
    ..aOM<ActiveCallHardware>(22, _omitFieldNames ? '' : 'activeCallHardware', subBuilder: ActiveCallHardware.create)
    ..aOM<DebugVideoFrame>(23, _omitFieldNames ? '' : 'debugVideoFrame', subBuilder: DebugVideoFrame.create)
    ..aOM<NotificationReq>(24, _omitFieldNames ? '' : 'localMsgNotification', subBuilder: NotificationReq.create)
    ..aOM<NotificationCallStatusReq>(25, _omitFieldNames ? '' : 'localCallNotification', subBuilder: NotificationCallStatusReq.create)
    ..aOM<$1.FilePart>(27, _omitFieldNames ? '' : 'filePart', subBuilder: $1.FilePart.create)
    ..a<$fixnum.Int64>(29, _omitFieldNames ? '' : 'debugCount', $pb.PbFieldType.OU6, protoName: 'debugCount', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(30, _omitFieldNames ? '' : 'missedCallCount', $pb.PbFieldType.OU3)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EventMsgWrapper clone() => EventMsgWrapper()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EventMsgWrapper copyWith(void Function(EventMsgWrapper) updates) => super.copyWith((message) => updates(message as EventMsgWrapper)) as EventMsgWrapper;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EventMsgWrapper create() => EventMsgWrapper._();
  EventMsgWrapper createEmptyInstance() => create();
  static $pb.PbList<EventMsgWrapper> createRepeated() => $pb.PbList<EventMsgWrapper>();
  @$core.pragma('dart2js:noInline')
  static EventMsgWrapper getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EventMsgWrapper>(create);
  static EventMsgWrapper? _defaultInstance;

  EventMsgWrapper_Msg whichMsg() => _EventMsgWrapper_MsgByTag[$_whichOneof(0)]!;
  void clearMsg() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  ApiEvent get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(ApiEvent v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  OnlineEvent get onlineEvent => $_getN(1);
  @$pb.TagNumber(2)
  set onlineEvent(OnlineEvent v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasOnlineEvent() => $_has(1);
  @$pb.TagNumber(2)
  void clearOnlineEvent() => clearField(2);
  @$pb.TagNumber(2)
  OnlineEvent ensureOnlineEvent() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get netErrCode => $_getIZ(2);
  @$pb.TagNumber(3)
  set netErrCode($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNetErrCode() => $_has(2);
  @$pb.TagNumber(3)
  void clearNetErrCode() => clearField(3);

  @$pb.TagNumber(4)
  EventMessage get eventMsg => $_getN(3);
  @$pb.TagNumber(4)
  set eventMsg(EventMessage v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasEventMsg() => $_has(3);
  @$pb.TagNumber(4)
  void clearEventMsg() => clearField(4);
  @$pb.TagNumber(4)
  EventMessage ensureEventMsg() => $_ensure(3);

  @$pb.TagNumber(5)
  $0.EventListRec get eventListRec => $_getN(4);
  @$pb.TagNumber(5)
  set eventListRec($0.EventListRec v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasEventListRec() => $_has(4);
  @$pb.TagNumber(5)
  void clearEventListRec() => clearField(5);
  @$pb.TagNumber(5)
  $0.EventListRec ensureEventListRec() => $_ensure(4);

  /// current call status
  @$pb.TagNumber(6)
  $0.EventCall get eventCall => $_getN(5);
  @$pb.TagNumber(6)
  set eventCall($0.EventCall v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasEventCall() => $_has(5);
  @$pb.TagNumber(6)
  void clearEventCall() => clearField(6);
  @$pb.TagNumber(6)
  $0.EventCall ensureEventCall() => $_ensure(5);

  @$pb.TagNumber(7)
  $0.EventChatTime get eventChatTime => $_getN(6);
  @$pb.TagNumber(7)
  set eventChatTime($0.EventChatTime v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasEventChatTime() => $_has(6);
  @$pb.TagNumber(7)
  void clearEventChatTime() => clearField(7);
  @$pb.TagNumber(7)
  $0.EventChatTime ensureEventChatTime() => $_ensure(6);

  @$pb.TagNumber(8)
  OnlineStatus get eventOnlineStatus => $_getN(7);
  @$pb.TagNumber(8)
  set eventOnlineStatus(OnlineStatus v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasEventOnlineStatus() => $_has(7);
  @$pb.TagNumber(8)
  void clearEventOnlineStatus() => clearField(8);

  @$pb.TagNumber(10)
  ChatsList get eventChatList => $_getN(8);
  @$pb.TagNumber(10)
  set eventChatList(ChatsList v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasEventChatList() => $_has(8);
  @$pb.TagNumber(10)
  void clearEventChatList() => clearField(10);
  @$pb.TagNumber(10)
  ChatsList ensureEventChatList() => $_ensure(8);

  @$pb.TagNumber(11)
  $1.FileProgress get progress => $_getN(9);
  @$pb.TagNumber(11)
  set progress($1.FileProgress v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasProgress() => $_has(9);
  @$pb.TagNumber(11)
  void clearProgress() => clearField(11);
  @$pb.TagNumber(11)
  $1.FileProgress ensureProgress() => $_ensure(9);

  @$pb.TagNumber(12)
  $2.RegStatusChangedRes get regStatusChanged => $_getN(10);
  @$pb.TagNumber(12)
  set regStatusChanged($2.RegStatusChangedRes v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasRegStatusChanged() => $_has(10);
  @$pb.TagNumber(12)
  void clearRegStatusChanged() => clearField(12);
  @$pb.TagNumber(12)
  $2.RegStatusChangedRes ensureRegStatusChanged() => $_ensure(10);

  @$pb.TagNumber(13)
  $2.RegProfileListChangedData get regProfileListChanged => $_getN(11);
  @$pb.TagNumber(13)
  set regProfileListChanged($2.RegProfileListChangedData v) { setField(13, v); }
  @$pb.TagNumber(13)
  $core.bool hasRegProfileListChanged() => $_has(11);
  @$pb.TagNumber(13)
  void clearRegProfileListChanged() => clearField(13);
  @$pb.TagNumber(13)
  $2.RegProfileListChangedData ensureRegProfileListChanged() => $_ensure(11);

  @$pb.TagNumber(15)
  $2.RegNetErrorChangedData get regNetErrorChanged => $_getN(12);
  @$pb.TagNumber(15)
  set regNetErrorChanged($2.RegNetErrorChangedData v) { setField(15, v); }
  @$pb.TagNumber(15)
  $core.bool hasRegNetErrorChanged() => $_has(12);
  @$pb.TagNumber(15)
  void clearRegNetErrorChanged() => clearField(15);
  @$pb.TagNumber(15)
  $2.RegNetErrorChangedData ensureRegNetErrorChanged() => $_ensure(12);

  @$pb.TagNumber(17)
  ContactList get eventContactList => $_getN(13);
  @$pb.TagNumber(17)
  set eventContactList(ContactList v) { setField(17, v); }
  @$pb.TagNumber(17)
  $core.bool hasEventContactList() => $_has(13);
  @$pb.TagNumber(17)
  void clearEventContactList() => clearField(17);
  @$pb.TagNumber(17)
  ContactList ensureEventContactList() => $_ensure(13);

  @$pb.TagNumber(18)
  CallList get eventCallList => $_getN(14);
  @$pb.TagNumber(18)
  set eventCallList(CallList v) { setField(18, v); }
  @$pb.TagNumber(18)
  $core.bool hasEventCallList() => $_has(14);
  @$pb.TagNumber(18)
  void clearEventCallList() => clearField(18);
  @$pb.TagNumber(18)
  CallList ensureEventCallList() => $_ensure(14);

  @$pb.TagNumber(19)
  $core.String get log => $_getSZ(15);
  @$pb.TagNumber(19)
  set log($core.String v) { $_setString(15, v); }
  @$pb.TagNumber(19)
  $core.bool hasLog() => $_has(15);
  @$pb.TagNumber(19)
  void clearLog() => clearField(19);

  @$pb.TagNumber(20)
  Id get iconChanged => $_getN(16);
  @$pb.TagNumber(20)
  set iconChanged(Id v) { setField(20, v); }
  @$pb.TagNumber(20)
  $core.bool hasIconChanged() => $_has(16);
  @$pb.TagNumber(20)
  void clearIconChanged() => clearField(20);
  @$pb.TagNumber(20)
  Id ensureIconChanged() => $_ensure(16);

  /// active call info
  @$pb.TagNumber(21)
  $0.ActiveCallStatus get activeCall => $_getN(17);
  @$pb.TagNumber(21)
  set activeCall($0.ActiveCallStatus v) { setField(21, v); }
  @$pb.TagNumber(21)
  $core.bool hasActiveCall() => $_has(17);
  @$pb.TagNumber(21)
  void clearActiveCall() => clearField(21);
  @$pb.TagNumber(21)
  $0.ActiveCallStatus ensureActiveCall() => $_ensure(17);

  /// active call (mute, speaker etc) info
  @$pb.TagNumber(22)
  ActiveCallHardware get activeCallHardware => $_getN(18);
  @$pb.TagNumber(22)
  set activeCallHardware(ActiveCallHardware v) { setField(22, v); }
  @$pb.TagNumber(22)
  $core.bool hasActiveCallHardware() => $_has(18);
  @$pb.TagNumber(22)
  void clearActiveCallHardware() => clearField(22);
  @$pb.TagNumber(22)
  ActiveCallHardware ensureActiveCallHardware() => $_ensure(18);

  @$pb.TagNumber(23)
  DebugVideoFrame get debugVideoFrame => $_getN(19);
  @$pb.TagNumber(23)
  set debugVideoFrame(DebugVideoFrame v) { setField(23, v); }
  @$pb.TagNumber(23)
  $core.bool hasDebugVideoFrame() => $_has(19);
  @$pb.TagNumber(23)
  void clearDebugVideoFrame() => clearField(23);
  @$pb.TagNumber(23)
  DebugVideoFrame ensureDebugVideoFrame() => $_ensure(19);

  @$pb.TagNumber(24)
  NotificationReq get localMsgNotification => $_getN(20);
  @$pb.TagNumber(24)
  set localMsgNotification(NotificationReq v) { setField(24, v); }
  @$pb.TagNumber(24)
  $core.bool hasLocalMsgNotification() => $_has(20);
  @$pb.TagNumber(24)
  void clearLocalMsgNotification() => clearField(24);
  @$pb.TagNumber(24)
  NotificationReq ensureLocalMsgNotification() => $_ensure(20);

  @$pb.TagNumber(25)
  NotificationCallStatusReq get localCallNotification => $_getN(21);
  @$pb.TagNumber(25)
  set localCallNotification(NotificationCallStatusReq v) { setField(25, v); }
  @$pb.TagNumber(25)
  $core.bool hasLocalCallNotification() => $_has(21);
  @$pb.TagNumber(25)
  void clearLocalCallNotification() => clearField(25);
  @$pb.TagNumber(25)
  NotificationCallStatusReq ensureLocalCallNotification() => $_ensure(21);

  @$pb.TagNumber(27)
  $1.FilePart get filePart => $_getN(22);
  @$pb.TagNumber(27)
  set filePart($1.FilePart v) { setField(27, v); }
  @$pb.TagNumber(27)
  $core.bool hasFilePart() => $_has(22);
  @$pb.TagNumber(27)
  void clearFilePart() => clearField(27);
  @$pb.TagNumber(27)
  $1.FilePart ensureFilePart() => $_ensure(22);

  @$pb.TagNumber(29)
  $fixnum.Int64 get debugCount => $_getI64(23);
  @$pb.TagNumber(29)
  set debugCount($fixnum.Int64 v) { $_setInt64(23, v); }
  @$pb.TagNumber(29)
  $core.bool hasDebugCount() => $_has(23);
  @$pb.TagNumber(29)
  void clearDebugCount() => clearField(29);

  @$pb.TagNumber(30)
  $core.int get missedCallCount => $_getIZ(24);
  @$pb.TagNumber(30)
  set missedCallCount($core.int v) { $_setUnsignedInt32(24, v); }
  @$pb.TagNumber(30)
  $core.bool hasMissedCallCount() => $_has(24);
  @$pb.TagNumber(30)
  void clearMissedCallCount() => clearField(30);
}

class MemberList extends $pb.GeneratedMessage {
  factory MemberList({
    $core.Iterable<$0.MEMBER_LIST_REC>? members,
    $0.ERROR_CODE? code,
  }) {
    final $result = create();
    if (members != null) {
      $result.members.addAll(members);
    }
    if (code != null) {
      $result.code = code;
    }
    return $result;
  }
  MemberList._() : super();
  factory MemberList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MemberList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MemberList', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..pc<$0.MEMBER_LIST_REC>(1, _omitFieldNames ? '' : 'members', $pb.PbFieldType.PM, subBuilder: $0.MEMBER_LIST_REC.create)
    ..e<$0.ERROR_CODE>(2, _omitFieldNames ? '' : 'code', $pb.PbFieldType.OE, defaultOrMaker: $0.ERROR_CODE.ERR_OK, valueOf: $0.ERROR_CODE.valueOf, enumValues: $0.ERROR_CODE.values)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MemberList clone() => MemberList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MemberList copyWith(void Function(MemberList) updates) => super.copyWith((message) => updates(message as MemberList)) as MemberList;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MemberList create() => MemberList._();
  MemberList createEmptyInstance() => create();
  static $pb.PbList<MemberList> createRepeated() => $pb.PbList<MemberList>();
  @$core.pragma('dart2js:noInline')
  static MemberList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MemberList>(create);
  static MemberList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$0.MEMBER_LIST_REC> get members => $_getList(0);

  @$pb.TagNumber(2)
  $0.ERROR_CODE get code => $_getN(1);
  @$pb.TagNumber(2)
  set code($0.ERROR_CODE v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => clearField(2);
}

class MemberListReq extends $pb.GeneratedMessage {
  factory MemberListReq({
    $fixnum.Int64? gid,
    $0.GMEMBER_LTYPE? gmask,
  }) {
    final $result = create();
    if (gid != null) {
      $result.gid = gid;
    }
    if (gmask != null) {
      $result.gmask = gmask;
    }
    return $result;
  }
  MemberListReq._() : super();
  factory MemberListReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MemberListReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MemberListReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'gid', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..e<$0.GMEMBER_LTYPE>(2, _omitFieldNames ? '' : 'gmask', $pb.PbFieldType.QE, defaultOrMaker: $0.GMEMBER_LTYPE.GM_OWNER, valueOf: $0.GMEMBER_LTYPE.valueOf, enumValues: $0.GMEMBER_LTYPE.values)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MemberListReq clone() => MemberListReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MemberListReq copyWith(void Function(MemberListReq) updates) => super.copyWith((message) => updates(message as MemberListReq)) as MemberListReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MemberListReq create() => MemberListReq._();
  MemberListReq createEmptyInstance() => create();
  static $pb.PbList<MemberListReq> createRepeated() => $pb.PbList<MemberListReq>();
  @$core.pragma('dart2js:noInline')
  static MemberListReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MemberListReq>(create);
  static MemberListReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get gid => $_getI64(0);
  @$pb.TagNumber(1)
  set gid($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGid() => $_has(0);
  @$pb.TagNumber(1)
  void clearGid() => clearField(1);

  @$pb.TagNumber(2)
  $0.GMEMBER_LTYPE get gmask => $_getN(1);
  @$pb.TagNumber(2)
  set gmask($0.GMEMBER_LTYPE v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasGmask() => $_has(1);
  @$pb.TagNumber(2)
  void clearGmask() => clearField(2);
}

class AddContactReq extends $pb.GeneratedMessage {
  factory AddContactReq({
    $fixnum.Int64? id,
    $core.String? name,
    $core.String? extNumber,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (name != null) {
      $result.name = name;
    }
    if (extNumber != null) {
      $result.extNumber = extNumber;
    }
    return $result;
  }
  AddContactReq._() : super();
  factory AddContactReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddContactReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddContactReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aQS(2, _omitFieldNames ? '' : 'name')
    ..aQS(3, _omitFieldNames ? '' : 'extNumber')
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddContactReq clone() => AddContactReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddContactReq copyWith(void Function(AddContactReq) updates) => super.copyWith((message) => updates(message as AddContactReq)) as AddContactReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddContactReq create() => AddContactReq._();
  AddContactReq createEmptyInstance() => create();
  static $pb.PbList<AddContactReq> createRepeated() => $pb.PbList<AddContactReq>();
  @$core.pragma('dart2js:noInline')
  static AddContactReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddContactReq>(create);
  static AddContactReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get extNumber => $_getSZ(2);
  @$pb.TagNumber(3)
  set extNumber($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasExtNumber() => $_has(2);
  @$pb.TagNumber(3)
  void clearExtNumber() => clearField(3);
}

class AddContactRes extends $pb.GeneratedMessage {
  factory AddContactRes({
    $fixnum.Int64? id,
    $core.bool? success,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  AddContactRes._() : super();
  factory AddContactRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddContactRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddContactRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.bool>(2, _omitFieldNames ? '' : 'success', $pb.PbFieldType.QB)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddContactRes clone() => AddContactRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddContactRes copyWith(void Function(AddContactRes) updates) => super.copyWith((message) => updates(message as AddContactRes)) as AddContactRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddContactRes create() => AddContactRes._();
  AddContactRes createEmptyInstance() => create();
  static $pb.PbList<AddContactRes> createRepeated() => $pb.PbList<AddContactRes>();
  @$core.pragma('dart2js:noInline')
  static AddContactRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddContactRes>(create);
  static AddContactRes? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get success => $_getBF(1);
  @$pb.TagNumber(2)
  set success($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSuccess() => $_has(1);
  @$pb.TagNumber(2)
  void clearSuccess() => clearField(2);
}

class DeleteContactRes extends $pb.GeneratedMessage {
  factory DeleteContactRes({
    $fixnum.Int64? id,
    $core.bool? success,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  DeleteContactRes._() : super();
  factory DeleteContactRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteContactRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteContactRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.bool>(2, _omitFieldNames ? '' : 'success', $pb.PbFieldType.QB)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteContactRes clone() => DeleteContactRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteContactRes copyWith(void Function(DeleteContactRes) updates) => super.copyWith((message) => updates(message as DeleteContactRes)) as DeleteContactRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteContactRes create() => DeleteContactRes._();
  DeleteContactRes createEmptyInstance() => create();
  static $pb.PbList<DeleteContactRes> createRepeated() => $pb.PbList<DeleteContactRes>();
  @$core.pragma('dart2js:noInline')
  static DeleteContactRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteContactRes>(create);
  static DeleteContactRes? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get success => $_getBF(1);
  @$pb.TagNumber(2)
  set success($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSuccess() => $_has(1);
  @$pb.TagNumber(2)
  void clearSuccess() => clearField(2);
}

class DeleteContactReq extends $pb.GeneratedMessage {
  factory DeleteContactReq({
    $fixnum.Int64? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  DeleteContactReq._() : super();
  factory DeleteContactReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteContactReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteContactReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteContactReq clone() => DeleteContactReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteContactReq copyWith(void Function(DeleteContactReq) updates) => super.copyWith((message) => updates(message as DeleteContactReq)) as DeleteContactReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteContactReq create() => DeleteContactReq._();
  DeleteContactReq createEmptyInstance() => create();
  static $pb.PbList<DeleteContactReq> createRepeated() => $pb.PbList<DeleteContactReq>();
  @$core.pragma('dart2js:noInline')
  static DeleteContactReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteContactReq>(create);
  static DeleteContactReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class UpdateContactReq extends $pb.GeneratedMessage {
  factory UpdateContactReq({
    $fixnum.Int64? id,
    $core.String? name,
    $core.String? phoneNumber,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (name != null) {
      $result.name = name;
    }
    if (phoneNumber != null) {
      $result.phoneNumber = phoneNumber;
    }
    return $result;
  }
  UpdateContactReq._() : super();
  factory UpdateContactReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateContactReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateContactReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aQS(2, _omitFieldNames ? '' : 'name')
    ..aQS(3, _omitFieldNames ? '' : 'phoneNumber', protoName: 'phoneNumber')
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateContactReq clone() => UpdateContactReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateContactReq copyWith(void Function(UpdateContactReq) updates) => super.copyWith((message) => updates(message as UpdateContactReq)) as UpdateContactReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateContactReq create() => UpdateContactReq._();
  UpdateContactReq createEmptyInstance() => create();
  static $pb.PbList<UpdateContactReq> createRepeated() => $pb.PbList<UpdateContactReq>();
  @$core.pragma('dart2js:noInline')
  static UpdateContactReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateContactReq>(create);
  static UpdateContactReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get phoneNumber => $_getSZ(2);
  @$pb.TagNumber(3)
  set phoneNumber($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPhoneNumber() => $_has(2);
  @$pb.TagNumber(3)
  void clearPhoneNumber() => clearField(3);
}

class UpdateContactRes extends $pb.GeneratedMessage {
  factory UpdateContactRes({
    $fixnum.Int64? id,
    $core.bool? success,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  UpdateContactRes._() : super();
  factory UpdateContactRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateContactRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateContactRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.bool>(2, _omitFieldNames ? '' : 'success', $pb.PbFieldType.QB)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateContactRes clone() => UpdateContactRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateContactRes copyWith(void Function(UpdateContactRes) updates) => super.copyWith((message) => updates(message as UpdateContactRes)) as UpdateContactRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateContactRes create() => UpdateContactRes._();
  UpdateContactRes createEmptyInstance() => create();
  static $pb.PbList<UpdateContactRes> createRepeated() => $pb.PbList<UpdateContactRes>();
  @$core.pragma('dart2js:noInline')
  static UpdateContactRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateContactRes>(create);
  static UpdateContactRes? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get success => $_getBF(1);
  @$pb.TagNumber(2)
  set success($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSuccess() => $_has(1);
  @$pb.TagNumber(2)
  void clearSuccess() => clearField(2);
}

class CreateGroupReq extends $pb.GeneratedMessage {
  factory CreateGroupReq({
    $core.String? name,
    $core.String? description,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (description != null) {
      $result.description = description;
    }
    return $result;
  }
  CreateGroupReq._() : super();
  factory CreateGroupReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateGroupReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateGroupReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..aQS(1, _omitFieldNames ? '' : 'name')
    ..aQS(2, _omitFieldNames ? '' : 'description')
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateGroupReq clone() => CreateGroupReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateGroupReq copyWith(void Function(CreateGroupReq) updates) => super.copyWith((message) => updates(message as CreateGroupReq)) as CreateGroupReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateGroupReq create() => CreateGroupReq._();
  CreateGroupReq createEmptyInstance() => create();
  static $pb.PbList<CreateGroupReq> createRepeated() => $pb.PbList<CreateGroupReq>();
  @$core.pragma('dart2js:noInline')
  static CreateGroupReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateGroupReq>(create);
  static CreateGroupReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(2)
  set description($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => clearField(2);
}

class CreateGroupRes extends $pb.GeneratedMessage {
  factory CreateGroupRes({
    $fixnum.Int64? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  CreateGroupRes._() : super();
  factory CreateGroupRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateGroupRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateGroupRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateGroupRes clone() => CreateGroupRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateGroupRes copyWith(void Function(CreateGroupRes) updates) => super.copyWith((message) => updates(message as CreateGroupRes)) as CreateGroupRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateGroupRes create() => CreateGroupRes._();
  CreateGroupRes createEmptyInstance() => create();
  static $pb.PbList<CreateGroupRes> createRepeated() => $pb.PbList<CreateGroupRes>();
  @$core.pragma('dart2js:noInline')
  static CreateGroupRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateGroupRes>(create);
  static CreateGroupRes? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class DeleteGroupReq extends $pb.GeneratedMessage {
  factory DeleteGroupReq({
    $fixnum.Int64? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  DeleteGroupReq._() : super();
  factory DeleteGroupReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteGroupReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteGroupReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteGroupReq clone() => DeleteGroupReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteGroupReq copyWith(void Function(DeleteGroupReq) updates) => super.copyWith((message) => updates(message as DeleteGroupReq)) as DeleteGroupReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteGroupReq create() => DeleteGroupReq._();
  DeleteGroupReq createEmptyInstance() => create();
  static $pb.PbList<DeleteGroupReq> createRepeated() => $pb.PbList<DeleteGroupReq>();
  @$core.pragma('dart2js:noInline')
  static DeleteGroupReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteGroupReq>(create);
  static DeleteGroupReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class DeleteGroupRes extends $pb.GeneratedMessage {
  factory DeleteGroupRes({
    $fixnum.Int64? id,
    $core.bool? success,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  DeleteGroupRes._() : super();
  factory DeleteGroupRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteGroupRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteGroupRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.bool>(2, _omitFieldNames ? '' : 'success', $pb.PbFieldType.QB)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteGroupRes clone() => DeleteGroupRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteGroupRes copyWith(void Function(DeleteGroupRes) updates) => super.copyWith((message) => updates(message as DeleteGroupRes)) as DeleteGroupRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteGroupRes create() => DeleteGroupRes._();
  DeleteGroupRes createEmptyInstance() => create();
  static $pb.PbList<DeleteGroupRes> createRepeated() => $pb.PbList<DeleteGroupRes>();
  @$core.pragma('dart2js:noInline')
  static DeleteGroupRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteGroupRes>(create);
  static DeleteGroupRes? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get success => $_getBF(1);
  @$pb.TagNumber(2)
  set success($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSuccess() => $_has(1);
  @$pb.TagNumber(2)
  void clearSuccess() => clearField(2);
}

class EditGroupReq extends $pb.GeneratedMessage {
  factory EditGroupReq({
    $fixnum.Int64? id,
    $core.String? name,
    $core.String? description,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (name != null) {
      $result.name = name;
    }
    if (description != null) {
      $result.description = description;
    }
    return $result;
  }
  EditGroupReq._() : super();
  factory EditGroupReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EditGroupReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EditGroupReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aQS(2, _omitFieldNames ? '' : 'name')
    ..aQS(3, _omitFieldNames ? '' : 'description')
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EditGroupReq clone() => EditGroupReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EditGroupReq copyWith(void Function(EditGroupReq) updates) => super.copyWith((message) => updates(message as EditGroupReq)) as EditGroupReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EditGroupReq create() => EditGroupReq._();
  EditGroupReq createEmptyInstance() => create();
  static $pb.PbList<EditGroupReq> createRepeated() => $pb.PbList<EditGroupReq>();
  @$core.pragma('dart2js:noInline')
  static EditGroupReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EditGroupReq>(create);
  static EditGroupReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);
}

class EditGroupRes extends $pb.GeneratedMessage {
  factory EditGroupRes({
    $fixnum.Int64? id,
    $core.bool? success,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  EditGroupRes._() : super();
  factory EditGroupRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EditGroupRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EditGroupRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.bool>(2, _omitFieldNames ? '' : 'success', $pb.PbFieldType.QB)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EditGroupRes clone() => EditGroupRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EditGroupRes copyWith(void Function(EditGroupRes) updates) => super.copyWith((message) => updates(message as EditGroupRes)) as EditGroupRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EditGroupRes create() => EditGroupRes._();
  EditGroupRes createEmptyInstance() => create();
  static $pb.PbList<EditGroupRes> createRepeated() => $pb.PbList<EditGroupRes>();
  @$core.pragma('dart2js:noInline')
  static EditGroupRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EditGroupRes>(create);
  static EditGroupRes? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get success => $_getBF(1);
  @$pb.TagNumber(2)
  set success($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSuccess() => $_has(1);
  @$pb.TagNumber(2)
  void clearSuccess() => clearField(2);
}

class ChangeUserLevelInGroupReq extends $pb.GeneratedMessage {
  factory ChangeUserLevelInGroupReq({
    $fixnum.Int64? groupId,
    $fixnum.Int64? userId,
    $0.GMEMBER_LTYPE? level,
  }) {
    final $result = create();
    if (groupId != null) {
      $result.groupId = groupId;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    if (level != null) {
      $result.level = level;
    }
    return $result;
  }
  ChangeUserLevelInGroupReq._() : super();
  factory ChangeUserLevelInGroupReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChangeUserLevelInGroupReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChangeUserLevelInGroupReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'groupId', $pb.PbFieldType.QU6, protoName: 'groupId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.QU6, protoName: 'userId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..e<$0.GMEMBER_LTYPE>(3, _omitFieldNames ? '' : 'level', $pb.PbFieldType.QE, defaultOrMaker: $0.GMEMBER_LTYPE.GM_OWNER, valueOf: $0.GMEMBER_LTYPE.valueOf, enumValues: $0.GMEMBER_LTYPE.values)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChangeUserLevelInGroupReq clone() => ChangeUserLevelInGroupReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChangeUserLevelInGroupReq copyWith(void Function(ChangeUserLevelInGroupReq) updates) => super.copyWith((message) => updates(message as ChangeUserLevelInGroupReq)) as ChangeUserLevelInGroupReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChangeUserLevelInGroupReq create() => ChangeUserLevelInGroupReq._();
  ChangeUserLevelInGroupReq createEmptyInstance() => create();
  static $pb.PbList<ChangeUserLevelInGroupReq> createRepeated() => $pb.PbList<ChangeUserLevelInGroupReq>();
  @$core.pragma('dart2js:noInline')
  static ChangeUserLevelInGroupReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChangeUserLevelInGroupReq>(create);
  static ChangeUserLevelInGroupReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get groupId => $_getI64(0);
  @$pb.TagNumber(1)
  set groupId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGroupId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get userId => $_getI64(1);
  @$pb.TagNumber(2)
  set userId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  @$pb.TagNumber(3)
  $0.GMEMBER_LTYPE get level => $_getN(2);
  @$pb.TagNumber(3)
  set level($0.GMEMBER_LTYPE v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasLevel() => $_has(2);
  @$pb.TagNumber(3)
  void clearLevel() => clearField(3);
}

class ChangeUserLevelInGroupRes extends $pb.GeneratedMessage {
  factory ChangeUserLevelInGroupRes({
    $fixnum.Int64? groupId,
    $fixnum.Int64? userId,
    $core.bool? success,
  }) {
    final $result = create();
    if (groupId != null) {
      $result.groupId = groupId;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  ChangeUserLevelInGroupRes._() : super();
  factory ChangeUserLevelInGroupRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChangeUserLevelInGroupRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChangeUserLevelInGroupRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'groupId', $pb.PbFieldType.QU6, protoName: 'groupId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.QU6, protoName: 'userId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.bool>(3, _omitFieldNames ? '' : 'success', $pb.PbFieldType.QB)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChangeUserLevelInGroupRes clone() => ChangeUserLevelInGroupRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChangeUserLevelInGroupRes copyWith(void Function(ChangeUserLevelInGroupRes) updates) => super.copyWith((message) => updates(message as ChangeUserLevelInGroupRes)) as ChangeUserLevelInGroupRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChangeUserLevelInGroupRes create() => ChangeUserLevelInGroupRes._();
  ChangeUserLevelInGroupRes createEmptyInstance() => create();
  static $pb.PbList<ChangeUserLevelInGroupRes> createRepeated() => $pb.PbList<ChangeUserLevelInGroupRes>();
  @$core.pragma('dart2js:noInline')
  static ChangeUserLevelInGroupRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChangeUserLevelInGroupRes>(create);
  static ChangeUserLevelInGroupRes? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get groupId => $_getI64(0);
  @$pb.TagNumber(1)
  set groupId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGroupId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get userId => $_getI64(1);
  @$pb.TagNumber(2)
  set userId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get success => $_getBF(2);
  @$pb.TagNumber(3)
  set success($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSuccess() => $_has(2);
  @$pb.TagNumber(3)
  void clearSuccess() => clearField(3);
}

class InviteUserToGroupReq extends $pb.GeneratedMessage {
  factory InviteUserToGroupReq({
    $fixnum.Int64? groupId,
    $fixnum.Int64? userId,
    $0.GMEMBER_LTYPE? level,
  }) {
    final $result = create();
    if (groupId != null) {
      $result.groupId = groupId;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    if (level != null) {
      $result.level = level;
    }
    return $result;
  }
  InviteUserToGroupReq._() : super();
  factory InviteUserToGroupReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InviteUserToGroupReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'InviteUserToGroupReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'groupId', $pb.PbFieldType.QU6, protoName: 'groupId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.QU6, protoName: 'userId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..e<$0.GMEMBER_LTYPE>(3, _omitFieldNames ? '' : 'level', $pb.PbFieldType.QE, defaultOrMaker: $0.GMEMBER_LTYPE.GM_OWNER, valueOf: $0.GMEMBER_LTYPE.valueOf, enumValues: $0.GMEMBER_LTYPE.values)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InviteUserToGroupReq clone() => InviteUserToGroupReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InviteUserToGroupReq copyWith(void Function(InviteUserToGroupReq) updates) => super.copyWith((message) => updates(message as InviteUserToGroupReq)) as InviteUserToGroupReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InviteUserToGroupReq create() => InviteUserToGroupReq._();
  InviteUserToGroupReq createEmptyInstance() => create();
  static $pb.PbList<InviteUserToGroupReq> createRepeated() => $pb.PbList<InviteUserToGroupReq>();
  @$core.pragma('dart2js:noInline')
  static InviteUserToGroupReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InviteUserToGroupReq>(create);
  static InviteUserToGroupReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get groupId => $_getI64(0);
  @$pb.TagNumber(1)
  set groupId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGroupId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get userId => $_getI64(1);
  @$pb.TagNumber(2)
  set userId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  @$pb.TagNumber(3)
  $0.GMEMBER_LTYPE get level => $_getN(2);
  @$pb.TagNumber(3)
  set level($0.GMEMBER_LTYPE v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasLevel() => $_has(2);
  @$pb.TagNumber(3)
  void clearLevel() => clearField(3);
}

class InviteUserToGroupRes extends $pb.GeneratedMessage {
  factory InviteUserToGroupRes({
    $fixnum.Int64? groupId,
    $fixnum.Int64? userId,
    $core.bool? success,
  }) {
    final $result = create();
    if (groupId != null) {
      $result.groupId = groupId;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  InviteUserToGroupRes._() : super();
  factory InviteUserToGroupRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InviteUserToGroupRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'InviteUserToGroupRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'groupId', $pb.PbFieldType.QU6, protoName: 'groupId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.QU6, protoName: 'userId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.bool>(3, _omitFieldNames ? '' : 'success', $pb.PbFieldType.QB)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InviteUserToGroupRes clone() => InviteUserToGroupRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InviteUserToGroupRes copyWith(void Function(InviteUserToGroupRes) updates) => super.copyWith((message) => updates(message as InviteUserToGroupRes)) as InviteUserToGroupRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InviteUserToGroupRes create() => InviteUserToGroupRes._();
  InviteUserToGroupRes createEmptyInstance() => create();
  static $pb.PbList<InviteUserToGroupRes> createRepeated() => $pb.PbList<InviteUserToGroupRes>();
  @$core.pragma('dart2js:noInline')
  static InviteUserToGroupRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InviteUserToGroupRes>(create);
  static InviteUserToGroupRes? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get groupId => $_getI64(0);
  @$pb.TagNumber(1)
  set groupId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGroupId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get userId => $_getI64(1);
  @$pb.TagNumber(2)
  set userId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get success => $_getBF(2);
  @$pb.TagNumber(3)
  set success($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSuccess() => $_has(2);
  @$pb.TagNumber(3)
  void clearSuccess() => clearField(3);
}

class RemoveUserFromGroupReq extends $pb.GeneratedMessage {
  factory RemoveUserFromGroupReq({
    $fixnum.Int64? groupId,
    $fixnum.Int64? userId,
  }) {
    final $result = create();
    if (groupId != null) {
      $result.groupId = groupId;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    return $result;
  }
  RemoveUserFromGroupReq._() : super();
  factory RemoveUserFromGroupReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoveUserFromGroupReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RemoveUserFromGroupReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'groupId', $pb.PbFieldType.QU6, protoName: 'groupId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.QU6, protoName: 'userId', defaultOrMaker: $fixnum.Int64.ZERO)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemoveUserFromGroupReq clone() => RemoveUserFromGroupReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemoveUserFromGroupReq copyWith(void Function(RemoveUserFromGroupReq) updates) => super.copyWith((message) => updates(message as RemoveUserFromGroupReq)) as RemoveUserFromGroupReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoveUserFromGroupReq create() => RemoveUserFromGroupReq._();
  RemoveUserFromGroupReq createEmptyInstance() => create();
  static $pb.PbList<RemoveUserFromGroupReq> createRepeated() => $pb.PbList<RemoveUserFromGroupReq>();
  @$core.pragma('dart2js:noInline')
  static RemoveUserFromGroupReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoveUserFromGroupReq>(create);
  static RemoveUserFromGroupReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get groupId => $_getI64(0);
  @$pb.TagNumber(1)
  set groupId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGroupId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get userId => $_getI64(1);
  @$pb.TagNumber(2)
  set userId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);
}

class RemoveUserFromGroupRes extends $pb.GeneratedMessage {
  factory RemoveUserFromGroupRes({
    $fixnum.Int64? groupId,
    $fixnum.Int64? userId,
    $core.bool? success,
  }) {
    final $result = create();
    if (groupId != null) {
      $result.groupId = groupId;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  RemoveUserFromGroupRes._() : super();
  factory RemoveUserFromGroupRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoveUserFromGroupRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RemoveUserFromGroupRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'groupId', $pb.PbFieldType.QU6, protoName: 'groupId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.QU6, protoName: 'userId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.bool>(3, _omitFieldNames ? '' : 'success', $pb.PbFieldType.QB)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemoveUserFromGroupRes clone() => RemoveUserFromGroupRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemoveUserFromGroupRes copyWith(void Function(RemoveUserFromGroupRes) updates) => super.copyWith((message) => updates(message as RemoveUserFromGroupRes)) as RemoveUserFromGroupRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoveUserFromGroupRes create() => RemoveUserFromGroupRes._();
  RemoveUserFromGroupRes createEmptyInstance() => create();
  static $pb.PbList<RemoveUserFromGroupRes> createRepeated() => $pb.PbList<RemoveUserFromGroupRes>();
  @$core.pragma('dart2js:noInline')
  static RemoveUserFromGroupRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoveUserFromGroupRes>(create);
  static RemoveUserFromGroupRes? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get groupId => $_getI64(0);
  @$pb.TagNumber(1)
  set groupId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGroupId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get userId => $_getI64(1);
  @$pb.TagNumber(2)
  set userId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get success => $_getBF(2);
  @$pb.TagNumber(3)
  set success($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSuccess() => $_has(2);
  @$pb.TagNumber(3)
  void clearSuccess() => clearField(3);
}

class GetInfoGroupReq extends $pb.GeneratedMessage {
  factory GetInfoGroupReq({
    $fixnum.Int64? groupId,
  }) {
    final $result = create();
    if (groupId != null) {
      $result.groupId = groupId;
    }
    return $result;
  }
  GetInfoGroupReq._() : super();
  factory GetInfoGroupReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetInfoGroupReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetInfoGroupReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'groupId', $pb.PbFieldType.QU6, protoName: 'groupId', defaultOrMaker: $fixnum.Int64.ZERO)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetInfoGroupReq clone() => GetInfoGroupReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetInfoGroupReq copyWith(void Function(GetInfoGroupReq) updates) => super.copyWith((message) => updates(message as GetInfoGroupReq)) as GetInfoGroupReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetInfoGroupReq create() => GetInfoGroupReq._();
  GetInfoGroupReq createEmptyInstance() => create();
  static $pb.PbList<GetInfoGroupReq> createRepeated() => $pb.PbList<GetInfoGroupReq>();
  @$core.pragma('dart2js:noInline')
  static GetInfoGroupReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetInfoGroupReq>(create);
  static GetInfoGroupReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get groupId => $_getI64(0);
  @$pb.TagNumber(1)
  set groupId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGroupId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupId() => clearField(1);
}

class GetInfoGroupRes extends $pb.GeneratedMessage {
  factory GetInfoGroupRes({
    $fixnum.Int64? groupId,
    $core.String? name,
    $core.String? description,
    $core.bool? success,
  }) {
    final $result = create();
    if (groupId != null) {
      $result.groupId = groupId;
    }
    if (name != null) {
      $result.name = name;
    }
    if (description != null) {
      $result.description = description;
    }
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  GetInfoGroupRes._() : super();
  factory GetInfoGroupRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetInfoGroupRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetInfoGroupRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'groupId', $pb.PbFieldType.QU6, protoName: 'groupId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aQS(2, _omitFieldNames ? '' : 'name')
    ..aQS(3, _omitFieldNames ? '' : 'description')
    ..a<$core.bool>(4, _omitFieldNames ? '' : 'success', $pb.PbFieldType.QB)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetInfoGroupRes clone() => GetInfoGroupRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetInfoGroupRes copyWith(void Function(GetInfoGroupRes) updates) => super.copyWith((message) => updates(message as GetInfoGroupRes)) as GetInfoGroupRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetInfoGroupRes create() => GetInfoGroupRes._();
  GetInfoGroupRes createEmptyInstance() => create();
  static $pb.PbList<GetInfoGroupRes> createRepeated() => $pb.PbList<GetInfoGroupRes>();
  @$core.pragma('dart2js:noInline')
  static GetInfoGroupRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetInfoGroupRes>(create);
  static GetInfoGroupRes? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get groupId => $_getI64(0);
  @$pb.TagNumber(1)
  set groupId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGroupId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get success => $_getBF(3);
  @$pb.TagNumber(4)
  set success($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSuccess() => $_has(3);
  @$pb.TagNumber(4)
  void clearSuccess() => clearField(4);
}

class SetIconReq extends $pb.GeneratedMessage {
  factory SetIconReq({
    $fixnum.Int64? destId,
    $0.DEST_TYPE? destType,
    $core.Iterable<$core.int>? img,
  }) {
    final $result = create();
    if (destId != null) {
      $result.destId = destId;
    }
    if (destType != null) {
      $result.destType = destType;
    }
    if (img != null) {
      $result.img.addAll(img);
    }
    return $result;
  }
  SetIconReq._() : super();
  factory SetIconReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetIconReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SetIconReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'destId', $pb.PbFieldType.QU6, protoName: 'destId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..e<$0.DEST_TYPE>(2, _omitFieldNames ? '' : 'destType', $pb.PbFieldType.QE, defaultOrMaker: $0.DEST_TYPE.ABONENT, valueOf: $0.DEST_TYPE.valueOf, enumValues: $0.DEST_TYPE.values)
    ..p<$core.int>(3, _omitFieldNames ? '' : 'img', $pb.PbFieldType.PU3)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SetIconReq clone() => SetIconReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SetIconReq copyWith(void Function(SetIconReq) updates) => super.copyWith((message) => updates(message as SetIconReq)) as SetIconReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetIconReq create() => SetIconReq._();
  SetIconReq createEmptyInstance() => create();
  static $pb.PbList<SetIconReq> createRepeated() => $pb.PbList<SetIconReq>();
  @$core.pragma('dart2js:noInline')
  static SetIconReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetIconReq>(create);
  static SetIconReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get destId => $_getI64(0);
  @$pb.TagNumber(1)
  set destId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDestId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDestId() => clearField(1);

  @$pb.TagNumber(2)
  $0.DEST_TYPE get destType => $_getN(1);
  @$pb.TagNumber(2)
  set destType($0.DEST_TYPE v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasDestType() => $_has(1);
  @$pb.TagNumber(2)
  void clearDestType() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get img => $_getList(2);
}

class SetIconRes extends $pb.GeneratedMessage {
  factory SetIconRes({
    $core.bool? success,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  SetIconRes._() : super();
  factory SetIconRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetIconRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SetIconRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..a<$core.bool>(3, _omitFieldNames ? '' : 'success', $pb.PbFieldType.QB)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SetIconRes clone() => SetIconRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SetIconRes copyWith(void Function(SetIconRes) updates) => super.copyWith((message) => updates(message as SetIconRes)) as SetIconRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetIconRes create() => SetIconRes._();
  SetIconRes createEmptyInstance() => create();
  static $pb.PbList<SetIconRes> createRepeated() => $pb.PbList<SetIconRes>();
  @$core.pragma('dart2js:noInline')
  static SetIconRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetIconRes>(create);
  static SetIconRes? _defaultInstance;

  @$pb.TagNumber(3)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(3)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(3)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(3)
  void clearSuccess() => clearField(3);
}

class GetUserInfoReq extends $pb.GeneratedMessage {
  factory GetUserInfoReq({
    $fixnum.Int64? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  GetUserInfoReq._() : super();
  factory GetUserInfoReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUserInfoReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetUserInfoReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUserInfoReq clone() => GetUserInfoReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUserInfoReq copyWith(void Function(GetUserInfoReq) updates) => super.copyWith((message) => updates(message as GetUserInfoReq)) as GetUserInfoReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUserInfoReq create() => GetUserInfoReq._();
  GetUserInfoReq createEmptyInstance() => create();
  static $pb.PbList<GetUserInfoReq> createRepeated() => $pb.PbList<GetUserInfoReq>();
  @$core.pragma('dart2js:noInline')
  static GetUserInfoReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUserInfoReq>(create);
  static GetUserInfoReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class GetUserInfoRes extends $pb.GeneratedMessage {
  factory GetUserInfoRes({
    $fixnum.Int64? id,
    $0.ABONENT_INFO? info,
    $core.bool? success,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (info != null) {
      $result.info = info;
    }
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  GetUserInfoRes._() : super();
  factory GetUserInfoRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUserInfoRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetUserInfoRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<$0.ABONENT_INFO>(2, _omitFieldNames ? '' : 'info', subBuilder: $0.ABONENT_INFO.create)
    ..a<$core.bool>(3, _omitFieldNames ? '' : 'success', $pb.PbFieldType.QB)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUserInfoRes clone() => GetUserInfoRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUserInfoRes copyWith(void Function(GetUserInfoRes) updates) => super.copyWith((message) => updates(message as GetUserInfoRes)) as GetUserInfoRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUserInfoRes create() => GetUserInfoRes._();
  GetUserInfoRes createEmptyInstance() => create();
  static $pb.PbList<GetUserInfoRes> createRepeated() => $pb.PbList<GetUserInfoRes>();
  @$core.pragma('dart2js:noInline')
  static GetUserInfoRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUserInfoRes>(create);
  static GetUserInfoRes? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $0.ABONENT_INFO get info => $_getN(1);
  @$pb.TagNumber(2)
  set info($0.ABONENT_INFO v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearInfo() => clearField(2);
  @$pb.TagNumber(2)
  $0.ABONENT_INFO ensureInfo() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.bool get success => $_getBF(2);
  @$pb.TagNumber(3)
  set success($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSuccess() => $_has(2);
  @$pb.TagNumber(3)
  void clearSuccess() => clearField(3);
}

class SetUserInfoReq extends $pb.GeneratedMessage {
  factory SetUserInfoReq({
    $0.ABONENT_INFO? info,
  }) {
    final $result = create();
    if (info != null) {
      $result.info = info;
    }
    return $result;
  }
  SetUserInfoReq._() : super();
  factory SetUserInfoReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetUserInfoReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SetUserInfoReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..aQM<$0.ABONENT_INFO>(1, _omitFieldNames ? '' : 'info', subBuilder: $0.ABONENT_INFO.create)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SetUserInfoReq clone() => SetUserInfoReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SetUserInfoReq copyWith(void Function(SetUserInfoReq) updates) => super.copyWith((message) => updates(message as SetUserInfoReq)) as SetUserInfoReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetUserInfoReq create() => SetUserInfoReq._();
  SetUserInfoReq createEmptyInstance() => create();
  static $pb.PbList<SetUserInfoReq> createRepeated() => $pb.PbList<SetUserInfoReq>();
  @$core.pragma('dart2js:noInline')
  static SetUserInfoReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetUserInfoReq>(create);
  static SetUserInfoReq? _defaultInstance;

  @$pb.TagNumber(1)
  $0.ABONENT_INFO get info => $_getN(0);
  @$pb.TagNumber(1)
  set info($0.ABONENT_INFO v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearInfo() => clearField(1);
  @$pb.TagNumber(1)
  $0.ABONENT_INFO ensureInfo() => $_ensure(0);
}

class SetUserInfoResp extends $pb.GeneratedMessage {
  factory SetUserInfoResp({
    $core.bool? success,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  SetUserInfoResp._() : super();
  factory SetUserInfoResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetUserInfoResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SetUserInfoResp', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..a<$core.bool>(1, _omitFieldNames ? '' : 'success', $pb.PbFieldType.QB)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SetUserInfoResp clone() => SetUserInfoResp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SetUserInfoResp copyWith(void Function(SetUserInfoResp) updates) => super.copyWith((message) => updates(message as SetUserInfoResp)) as SetUserInfoResp;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetUserInfoResp create() => SetUserInfoResp._();
  SetUserInfoResp createEmptyInstance() => create();
  static $pb.PbList<SetUserInfoResp> createRepeated() => $pb.PbList<SetUserInfoResp>();
  @$core.pragma('dart2js:noInline')
  static SetUserInfoResp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetUserInfoResp>(create);
  static SetUserInfoResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class FindUserReq extends $pb.GeneratedMessage {
  factory FindUserReq({
    $core.String? nameMask,
    $core.String? secondNameMask,
  }) {
    final $result = create();
    if (nameMask != null) {
      $result.nameMask = nameMask;
    }
    if (secondNameMask != null) {
      $result.secondNameMask = secondNameMask;
    }
    return $result;
  }
  FindUserReq._() : super();
  factory FindUserReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FindUserReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FindUserReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'nameMask')
    ..aOS(2, _omitFieldNames ? '' : 'secondNameMask')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FindUserReq clone() => FindUserReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FindUserReq copyWith(void Function(FindUserReq) updates) => super.copyWith((message) => updates(message as FindUserReq)) as FindUserReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FindUserReq create() => FindUserReq._();
  FindUserReq createEmptyInstance() => create();
  static $pb.PbList<FindUserReq> createRepeated() => $pb.PbList<FindUserReq>();
  @$core.pragma('dart2js:noInline')
  static FindUserReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FindUserReq>(create);
  static FindUserReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get nameMask => $_getSZ(0);
  @$pb.TagNumber(1)
  set nameMask($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNameMask() => $_has(0);
  @$pb.TagNumber(1)
  void clearNameMask() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get secondNameMask => $_getSZ(1);
  @$pb.TagNumber(2)
  set secondNameMask($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSecondNameMask() => $_has(1);
  @$pb.TagNumber(2)
  void clearSecondNameMask() => clearField(2);
}

class FindUserResp extends $pb.GeneratedMessage {
  factory FindUserResp({
    $0.ERROR_CODE? codeNameMask,
    $0.ERROR_CODE? codeSecondNameMask,
    $core.Iterable<USER_REC>? userByNameMask,
    $core.Iterable<USER_REC>? userBySecondNameMask,
  }) {
    final $result = create();
    if (codeNameMask != null) {
      $result.codeNameMask = codeNameMask;
    }
    if (codeSecondNameMask != null) {
      $result.codeSecondNameMask = codeSecondNameMask;
    }
    if (userByNameMask != null) {
      $result.userByNameMask.addAll(userByNameMask);
    }
    if (userBySecondNameMask != null) {
      $result.userBySecondNameMask.addAll(userBySecondNameMask);
    }
    return $result;
  }
  FindUserResp._() : super();
  factory FindUserResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FindUserResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FindUserResp', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..e<$0.ERROR_CODE>(1, _omitFieldNames ? '' : 'codeNameMask', $pb.PbFieldType.QE, defaultOrMaker: $0.ERROR_CODE.ERR_OK, valueOf: $0.ERROR_CODE.valueOf, enumValues: $0.ERROR_CODE.values)
    ..e<$0.ERROR_CODE>(2, _omitFieldNames ? '' : 'codeSecondNameMask', $pb.PbFieldType.QE, defaultOrMaker: $0.ERROR_CODE.ERR_OK, valueOf: $0.ERROR_CODE.valueOf, enumValues: $0.ERROR_CODE.values)
    ..pc<USER_REC>(3, _omitFieldNames ? '' : 'userByNameMask', $pb.PbFieldType.PM, subBuilder: USER_REC.create)
    ..pc<USER_REC>(4, _omitFieldNames ? '' : 'userBySecondNameMask', $pb.PbFieldType.PM, subBuilder: USER_REC.create)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FindUserResp clone() => FindUserResp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FindUserResp copyWith(void Function(FindUserResp) updates) => super.copyWith((message) => updates(message as FindUserResp)) as FindUserResp;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FindUserResp create() => FindUserResp._();
  FindUserResp createEmptyInstance() => create();
  static $pb.PbList<FindUserResp> createRepeated() => $pb.PbList<FindUserResp>();
  @$core.pragma('dart2js:noInline')
  static FindUserResp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FindUserResp>(create);
  static FindUserResp? _defaultInstance;

  @$pb.TagNumber(1)
  $0.ERROR_CODE get codeNameMask => $_getN(0);
  @$pb.TagNumber(1)
  set codeNameMask($0.ERROR_CODE v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCodeNameMask() => $_has(0);
  @$pb.TagNumber(1)
  void clearCodeNameMask() => clearField(1);

  @$pb.TagNumber(2)
  $0.ERROR_CODE get codeSecondNameMask => $_getN(1);
  @$pb.TagNumber(2)
  set codeSecondNameMask($0.ERROR_CODE v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCodeSecondNameMask() => $_has(1);
  @$pb.TagNumber(2)
  void clearCodeSecondNameMask() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<USER_REC> get userByNameMask => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<USER_REC> get userBySecondNameMask => $_getList(3);
}

class USER_REC extends $pb.GeneratedMessage {
  factory USER_REC({
    $fixnum.Int64? id,
    $fixnum.Int64? idi,
    $fixnum.Int64? cTime,
    $core.String? name,
    $core.String? secondName,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (idi != null) {
      $result.idi = idi;
    }
    if (cTime != null) {
      $result.cTime = cTime;
    }
    if (name != null) {
      $result.name = name;
    }
    if (secondName != null) {
      $result.secondName = secondName;
    }
    return $result;
  }
  USER_REC._() : super();
  factory USER_REC.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory USER_REC.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'USER_REC', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'Id', $pb.PbFieldType.OU6, protoName: 'Id', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'Idi', $pb.PbFieldType.OU6, protoName: 'Idi', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'CTime', $pb.PbFieldType.OU6, protoName: 'CTime', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(4, _omitFieldNames ? '' : 'Name', protoName: 'Name')
    ..aOS(5, _omitFieldNames ? '' : 'SecondName', protoName: 'SecondName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  USER_REC clone() => USER_REC()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  USER_REC copyWith(void Function(USER_REC) updates) => super.copyWith((message) => updates(message as USER_REC)) as USER_REC;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static USER_REC create() => USER_REC._();
  USER_REC createEmptyInstance() => create();
  static $pb.PbList<USER_REC> createRepeated() => $pb.PbList<USER_REC>();
  @$core.pragma('dart2js:noInline')
  static USER_REC getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<USER_REC>(create);
  static USER_REC? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get idi => $_getI64(1);
  @$pb.TagNumber(2)
  set idi($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIdi() => $_has(1);
  @$pb.TagNumber(2)
  void clearIdi() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get cTime => $_getI64(2);
  @$pb.TagNumber(3)
  set cTime($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearCTime() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get name => $_getSZ(3);
  @$pb.TagNumber(4)
  set name($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasName() => $_has(3);
  @$pb.TagNumber(4)
  void clearName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get secondName => $_getSZ(4);
  @$pb.TagNumber(5)
  set secondName($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSecondName() => $_has(4);
  @$pb.TagNumber(5)
  void clearSecondName() => clearField(5);
}

enum ServiceCmdReq_Msg {
  initUpdate, 
  id, 
  notSet
}

class ServiceCmdReq extends $pb.GeneratedMessage {
  factory ServiceCmdReq({
    ServiceCmdType? command,
    InitUpdateReq? initUpdate,
    Id? id,
  }) {
    final $result = create();
    if (command != null) {
      $result.command = command;
    }
    if (initUpdate != null) {
      $result.initUpdate = initUpdate;
    }
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  ServiceCmdReq._() : super();
  factory ServiceCmdReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ServiceCmdReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, ServiceCmdReq_Msg> _ServiceCmdReq_MsgByTag = {
    2 : ServiceCmdReq_Msg.initUpdate,
    3 : ServiceCmdReq_Msg.id,
    0 : ServiceCmdReq_Msg.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ServiceCmdReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..oo(0, [2, 3])
    ..e<ServiceCmdType>(1, _omitFieldNames ? '' : 'command', $pb.PbFieldType.QE, defaultOrMaker: ServiceCmdType.CHECK_STATE, valueOf: ServiceCmdType.valueOf, enumValues: ServiceCmdType.values)
    ..aOM<InitUpdateReq>(2, _omitFieldNames ? '' : 'initUpdate', protoName: 'initUpdate', subBuilder: InitUpdateReq.create)
    ..aOM<Id>(3, _omitFieldNames ? '' : 'id', subBuilder: Id.create)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ServiceCmdReq clone() => ServiceCmdReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ServiceCmdReq copyWith(void Function(ServiceCmdReq) updates) => super.copyWith((message) => updates(message as ServiceCmdReq)) as ServiceCmdReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ServiceCmdReq create() => ServiceCmdReq._();
  ServiceCmdReq createEmptyInstance() => create();
  static $pb.PbList<ServiceCmdReq> createRepeated() => $pb.PbList<ServiceCmdReq>();
  @$core.pragma('dart2js:noInline')
  static ServiceCmdReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ServiceCmdReq>(create);
  static ServiceCmdReq? _defaultInstance;

  ServiceCmdReq_Msg whichMsg() => _ServiceCmdReq_MsgByTag[$_whichOneof(0)]!;
  void clearMsg() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  ServiceCmdType get command => $_getN(0);
  @$pb.TagNumber(1)
  set command(ServiceCmdType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCommand() => $_has(0);
  @$pb.TagNumber(1)
  void clearCommand() => clearField(1);

  @$pb.TagNumber(2)
  InitUpdateReq get initUpdate => $_getN(1);
  @$pb.TagNumber(2)
  set initUpdate(InitUpdateReq v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasInitUpdate() => $_has(1);
  @$pb.TagNumber(2)
  void clearInitUpdate() => clearField(2);
  @$pb.TagNumber(2)
  InitUpdateReq ensureInitUpdate() => $_ensure(1);

  @$pb.TagNumber(3)
  Id get id => $_getN(2);
  @$pb.TagNumber(3)
  set id(Id v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasId() => $_has(2);
  @$pb.TagNumber(3)
  void clearId() => clearField(3);
  @$pb.TagNumber(3)
  Id ensureId() => $_ensure(2);
}

enum ServiceCmdResp_Msg {
  updateReady, 
  screenDpi, 
  notSet
}

class ServiceCmdResp extends $pb.GeneratedMessage {
  factory ServiceCmdResp({
    UpdateReadyResp? updateReady,
    $core.double? screenDpi,
  }) {
    final $result = create();
    if (updateReady != null) {
      $result.updateReady = updateReady;
    }
    if (screenDpi != null) {
      $result.screenDpi = screenDpi;
    }
    return $result;
  }
  ServiceCmdResp._() : super();
  factory ServiceCmdResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ServiceCmdResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, ServiceCmdResp_Msg> _ServiceCmdResp_MsgByTag = {
    1 : ServiceCmdResp_Msg.updateReady,
    2 : ServiceCmdResp_Msg.screenDpi,
    0 : ServiceCmdResp_Msg.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ServiceCmdResp', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<UpdateReadyResp>(1, _omitFieldNames ? '' : 'updateReady', protoName: 'updateReady', subBuilder: UpdateReadyResp.create)
    ..a<$core.double>(2, _omitFieldNames ? '' : 'screenDpi', $pb.PbFieldType.OD, protoName: 'screenDpi')
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ServiceCmdResp clone() => ServiceCmdResp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ServiceCmdResp copyWith(void Function(ServiceCmdResp) updates) => super.copyWith((message) => updates(message as ServiceCmdResp)) as ServiceCmdResp;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ServiceCmdResp create() => ServiceCmdResp._();
  ServiceCmdResp createEmptyInstance() => create();
  static $pb.PbList<ServiceCmdResp> createRepeated() => $pb.PbList<ServiceCmdResp>();
  @$core.pragma('dart2js:noInline')
  static ServiceCmdResp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ServiceCmdResp>(create);
  static ServiceCmdResp? _defaultInstance;

  ServiceCmdResp_Msg whichMsg() => _ServiceCmdResp_MsgByTag[$_whichOneof(0)]!;
  void clearMsg() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  UpdateReadyResp get updateReady => $_getN(0);
  @$pb.TagNumber(1)
  set updateReady(UpdateReadyResp v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUpdateReady() => $_has(0);
  @$pb.TagNumber(1)
  void clearUpdateReady() => clearField(1);
  @$pb.TagNumber(1)
  UpdateReadyResp ensureUpdateReady() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.double get screenDpi => $_getN(1);
  @$pb.TagNumber(2)
  set screenDpi($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasScreenDpi() => $_has(1);
  @$pb.TagNumber(2)
  void clearScreenDpi() => clearField(2);
}

class Id extends $pb.GeneratedMessage {
  factory Id({
    $fixnum.Int64? id,
    $0.DEST_TYPE? type,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (type != null) {
      $result.type = type;
    }
    return $result;
  }
  Id._() : super();
  factory Id.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Id.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Id', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..e<$0.DEST_TYPE>(2, _omitFieldNames ? '' : 'type', $pb.PbFieldType.QE, defaultOrMaker: $0.DEST_TYPE.ABONENT, valueOf: $0.DEST_TYPE.valueOf, enumValues: $0.DEST_TYPE.values)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Id clone() => Id()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Id copyWith(void Function(Id) updates) => super.copyWith((message) => updates(message as Id)) as Id;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Id create() => Id._();
  Id createEmptyInstance() => create();
  static $pb.PbList<Id> createRepeated() => $pb.PbList<Id>();
  @$core.pragma('dart2js:noInline')
  static Id getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Id>(create);
  static Id? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $0.DEST_TYPE get type => $_getN(1);
  @$pb.TagNumber(2)
  set type($0.DEST_TYPE v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);
}

class DebugVideoFrame extends $pb.GeneratedMessage {
  factory DebugVideoFrame({
    $fixnum.Int64? chan,
    $fixnum.Int64? counter,
    $fixnum.Int64? time,
    $fixnum.Int64? flags,
    $core.Iterable<$fixnum.Int64>? data,
    $fixnum.Int64? codec,
    $fixnum.Int64? width,
    $fixnum.Int64? height,
    $fixnum.Int64? bitrate,
    $fixnum.Int64? sampleRate,
    $fixnum.Int64? keyRate,
  }) {
    final $result = create();
    if (chan != null) {
      $result.chan = chan;
    }
    if (counter != null) {
      $result.counter = counter;
    }
    if (time != null) {
      $result.time = time;
    }
    if (flags != null) {
      $result.flags = flags;
    }
    if (data != null) {
      $result.data.addAll(data);
    }
    if (codec != null) {
      $result.codec = codec;
    }
    if (width != null) {
      $result.width = width;
    }
    if (height != null) {
      $result.height = height;
    }
    if (bitrate != null) {
      $result.bitrate = bitrate;
    }
    if (sampleRate != null) {
      $result.sampleRate = sampleRate;
    }
    if (keyRate != null) {
      $result.keyRate = keyRate;
    }
    return $result;
  }
  DebugVideoFrame._() : super();
  factory DebugVideoFrame.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DebugVideoFrame.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DebugVideoFrame', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'chan', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'counter', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'time', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : 'flags', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..p<$fixnum.Int64>(5, _omitFieldNames ? '' : 'data', $pb.PbFieldType.PU6)
    ..a<$fixnum.Int64>(6, _omitFieldNames ? '' : 'codec', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(7, _omitFieldNames ? '' : 'width', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(8, _omitFieldNames ? '' : 'height', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(9, _omitFieldNames ? '' : 'bitrate', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(10, _omitFieldNames ? '' : 'sampleRate', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(11, _omitFieldNames ? '' : 'keyRate', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DebugVideoFrame clone() => DebugVideoFrame()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DebugVideoFrame copyWith(void Function(DebugVideoFrame) updates) => super.copyWith((message) => updates(message as DebugVideoFrame)) as DebugVideoFrame;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DebugVideoFrame create() => DebugVideoFrame._();
  DebugVideoFrame createEmptyInstance() => create();
  static $pb.PbList<DebugVideoFrame> createRepeated() => $pb.PbList<DebugVideoFrame>();
  @$core.pragma('dart2js:noInline')
  static DebugVideoFrame getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DebugVideoFrame>(create);
  static DebugVideoFrame? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get chan => $_getI64(0);
  @$pb.TagNumber(1)
  set chan($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChan() => $_has(0);
  @$pb.TagNumber(1)
  void clearChan() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get counter => $_getI64(1);
  @$pb.TagNumber(2)
  set counter($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCounter() => $_has(1);
  @$pb.TagNumber(2)
  void clearCounter() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get time => $_getI64(2);
  @$pb.TagNumber(3)
  set time($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearTime() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get flags => $_getI64(3);
  @$pb.TagNumber(4)
  set flags($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFlags() => $_has(3);
  @$pb.TagNumber(4)
  void clearFlags() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$fixnum.Int64> get data => $_getList(4);

  @$pb.TagNumber(6)
  $fixnum.Int64 get codec => $_getI64(5);
  @$pb.TagNumber(6)
  set codec($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCodec() => $_has(5);
  @$pb.TagNumber(6)
  void clearCodec() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get width => $_getI64(6);
  @$pb.TagNumber(7)
  set width($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasWidth() => $_has(6);
  @$pb.TagNumber(7)
  void clearWidth() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get height => $_getI64(7);
  @$pb.TagNumber(8)
  set height($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasHeight() => $_has(7);
  @$pb.TagNumber(8)
  void clearHeight() => clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get bitrate => $_getI64(8);
  @$pb.TagNumber(9)
  set bitrate($fixnum.Int64 v) { $_setInt64(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasBitrate() => $_has(8);
  @$pb.TagNumber(9)
  void clearBitrate() => clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get sampleRate => $_getI64(9);
  @$pb.TagNumber(10)
  set sampleRate($fixnum.Int64 v) { $_setInt64(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasSampleRate() => $_has(9);
  @$pb.TagNumber(10)
  void clearSampleRate() => clearField(10);

  @$pb.TagNumber(11)
  $fixnum.Int64 get keyRate => $_getI64(10);
  @$pb.TagNumber(11)
  set keyRate($fixnum.Int64 v) { $_setInt64(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasKeyRate() => $_has(10);
  @$pb.TagNumber(11)
  void clearKeyRate() => clearField(11);
}

class InitUpdateReq extends $pb.GeneratedMessage {
  factory InitUpdateReq({
    $core.String? host,
    $core.String? path,
    $core.int? checkInterval,
  }) {
    final $result = create();
    if (host != null) {
      $result.host = host;
    }
    if (path != null) {
      $result.path = path;
    }
    if (checkInterval != null) {
      $result.checkInterval = checkInterval;
    }
    return $result;
  }
  InitUpdateReq._() : super();
  factory InitUpdateReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InitUpdateReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'InitUpdateReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..aQS(1, _omitFieldNames ? '' : 'host')
    ..aQS(2, _omitFieldNames ? '' : 'path')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'checkInterval', $pb.PbFieldType.QU3)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InitUpdateReq clone() => InitUpdateReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InitUpdateReq copyWith(void Function(InitUpdateReq) updates) => super.copyWith((message) => updates(message as InitUpdateReq)) as InitUpdateReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InitUpdateReq create() => InitUpdateReq._();
  InitUpdateReq createEmptyInstance() => create();
  static $pb.PbList<InitUpdateReq> createRepeated() => $pb.PbList<InitUpdateReq>();
  @$core.pragma('dart2js:noInline')
  static InitUpdateReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InitUpdateReq>(create);
  static InitUpdateReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get host => $_getSZ(0);
  @$pb.TagNumber(1)
  set host($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHost() => $_has(0);
  @$pb.TagNumber(1)
  void clearHost() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get path => $_getSZ(1);
  @$pb.TagNumber(2)
  set path($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPath() => $_has(1);
  @$pb.TagNumber(2)
  void clearPath() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get checkInterval => $_getIZ(2);
  @$pb.TagNumber(3)
  set checkInterval($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCheckInterval() => $_has(2);
  @$pb.TagNumber(3)
  void clearCheckInterval() => clearField(3);
}

class SetChatMuteReq extends $pb.GeneratedMessage {
  factory SetChatMuteReq({
    $fixnum.Int64? chatId,
    $core.bool? mute,
    $fixnum.Int64? time,
  }) {
    final $result = create();
    if (chatId != null) {
      $result.chatId = chatId;
    }
    if (mute != null) {
      $result.mute = mute;
    }
    if (time != null) {
      $result.time = time;
    }
    return $result;
  }
  SetChatMuteReq._() : super();
  factory SetChatMuteReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetChatMuteReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SetChatMuteReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'chatId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(2, _omitFieldNames ? '' : 'mute')
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'time', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SetChatMuteReq clone() => SetChatMuteReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SetChatMuteReq copyWith(void Function(SetChatMuteReq) updates) => super.copyWith((message) => updates(message as SetChatMuteReq)) as SetChatMuteReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetChatMuteReq create() => SetChatMuteReq._();
  SetChatMuteReq createEmptyInstance() => create();
  static $pb.PbList<SetChatMuteReq> createRepeated() => $pb.PbList<SetChatMuteReq>();
  @$core.pragma('dart2js:noInline')
  static SetChatMuteReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetChatMuteReq>(create);
  static SetChatMuteReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get chatId => $_getI64(0);
  @$pb.TagNumber(1)
  set chatId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChatId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatId() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get mute => $_getBF(1);
  @$pb.TagNumber(2)
  set mute($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMute() => $_has(1);
  @$pb.TagNumber(2)
  void clearMute() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get time => $_getI64(2);
  @$pb.TagNumber(3)
  set time($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearTime() => clearField(3);
}

enum NotificationReq_Body {
  state, 
  eventList, 
  eventText, 
  notSet
}

class NotificationReq extends $pb.GeneratedMessage {
  factory NotificationReq({
    NotificationType? notificationType,
    $0.ClientState? state,
    NotificationList? eventList,
    NotificationText? eventText,
  }) {
    final $result = create();
    if (notificationType != null) {
      $result.notificationType = notificationType;
    }
    if (state != null) {
      $result.state = state;
    }
    if (eventList != null) {
      $result.eventList = eventList;
    }
    if (eventText != null) {
      $result.eventText = eventText;
    }
    return $result;
  }
  NotificationReq._() : super();
  factory NotificationReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NotificationReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, NotificationReq_Body> _NotificationReq_BodyByTag = {
    2 : NotificationReq_Body.state,
    3 : NotificationReq_Body.eventList,
    4 : NotificationReq_Body.eventText,
    0 : NotificationReq_Body.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NotificationReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..oo(0, [2, 3, 4])
    ..e<NotificationType>(1, _omitFieldNames ? '' : 'notificationType', $pb.PbFieldType.QE, defaultOrMaker: NotificationType.APP_STATUS, valueOf: NotificationType.valueOf, enumValues: NotificationType.values)
    ..e<$0.ClientState>(2, _omitFieldNames ? '' : 'state', $pb.PbFieldType.OE, defaultOrMaker: $0.ClientState.CLIENT_OFF, valueOf: $0.ClientState.valueOf, enumValues: $0.ClientState.values)
    ..aOM<NotificationList>(3, _omitFieldNames ? '' : 'eventList', subBuilder: NotificationList.create)
    ..aOM<NotificationText>(4, _omitFieldNames ? '' : 'eventText', subBuilder: NotificationText.create)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NotificationReq clone() => NotificationReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NotificationReq copyWith(void Function(NotificationReq) updates) => super.copyWith((message) => updates(message as NotificationReq)) as NotificationReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NotificationReq create() => NotificationReq._();
  NotificationReq createEmptyInstance() => create();
  static $pb.PbList<NotificationReq> createRepeated() => $pb.PbList<NotificationReq>();
  @$core.pragma('dart2js:noInline')
  static NotificationReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NotificationReq>(create);
  static NotificationReq? _defaultInstance;

  NotificationReq_Body whichBody() => _NotificationReq_BodyByTag[$_whichOneof(0)]!;
  void clearBody() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  NotificationType get notificationType => $_getN(0);
  @$pb.TagNumber(1)
  set notificationType(NotificationType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasNotificationType() => $_has(0);
  @$pb.TagNumber(1)
  void clearNotificationType() => clearField(1);

  /// app status
  @$pb.TagNumber(2)
  $0.ClientState get state => $_getN(1);
  @$pb.TagNumber(2)
  set state($0.ClientState v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasState() => $_has(1);
  @$pb.TagNumber(2)
  void clearState() => clearField(2);

  /// notifications in list (android)
  @$pb.TagNumber(3)
  NotificationList get eventList => $_getN(2);
  @$pb.TagNumber(3)
  set eventList(NotificationList v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasEventList() => $_has(2);
  @$pb.TagNumber(3)
  void clearEventList() => clearField(3);
  @$pb.TagNumber(3)
  NotificationList ensureEventList() => $_ensure(2);

  /// show plane text (desktop)
  @$pb.TagNumber(4)
  NotificationText get eventText => $_getN(3);
  @$pb.TagNumber(4)
  set eventText(NotificationText v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasEventText() => $_has(3);
  @$pb.TagNumber(4)
  void clearEventText() => clearField(4);
  @$pb.TagNumber(4)
  NotificationText ensureEventText() => $_ensure(3);
}

class NotificationCallStatusReq extends $pb.GeneratedMessage {
  factory NotificationCallStatusReq({
    $core.String? callName,
    $fixnum.Int64? callDestId,
    $0.DEST_TYPE? callDestType,
    $0.CALL_STATE? callState,
    $core.bool? withVideo,
    $fixnum.Int64? callId,
  }) {
    final $result = create();
    if (callName != null) {
      $result.callName = callName;
    }
    if (callDestId != null) {
      $result.callDestId = callDestId;
    }
    if (callDestType != null) {
      $result.callDestType = callDestType;
    }
    if (callState != null) {
      $result.callState = callState;
    }
    if (withVideo != null) {
      $result.withVideo = withVideo;
    }
    if (callId != null) {
      $result.callId = callId;
    }
    return $result;
  }
  NotificationCallStatusReq._() : super();
  factory NotificationCallStatusReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NotificationCallStatusReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NotificationCallStatusReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..aOS(12, _omitFieldNames ? '' : 'callName')
    ..a<$fixnum.Int64>(13, _omitFieldNames ? '' : 'callDestId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..e<$0.DEST_TYPE>(14, _omitFieldNames ? '' : 'callDestType', $pb.PbFieldType.OE, defaultOrMaker: $0.DEST_TYPE.ABONENT, valueOf: $0.DEST_TYPE.valueOf, enumValues: $0.DEST_TYPE.values)
    ..e<$0.CALL_STATE>(15, _omitFieldNames ? '' : 'callState', $pb.PbFieldType.OE, defaultOrMaker: $0.CALL_STATE.CALL_IDLE, valueOf: $0.CALL_STATE.valueOf, enumValues: $0.CALL_STATE.values)
    ..aOB(16, _omitFieldNames ? '' : 'withVideo')
    ..a<$fixnum.Int64>(17, _omitFieldNames ? '' : 'callId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NotificationCallStatusReq clone() => NotificationCallStatusReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NotificationCallStatusReq copyWith(void Function(NotificationCallStatusReq) updates) => super.copyWith((message) => updates(message as NotificationCallStatusReq)) as NotificationCallStatusReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NotificationCallStatusReq create() => NotificationCallStatusReq._();
  NotificationCallStatusReq createEmptyInstance() => create();
  static $pb.PbList<NotificationCallStatusReq> createRepeated() => $pb.PbList<NotificationCallStatusReq>();
  @$core.pragma('dart2js:noInline')
  static NotificationCallStatusReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NotificationCallStatusReq>(create);
  static NotificationCallStatusReq? _defaultInstance;

  @$pb.TagNumber(12)
  $core.String get callName => $_getSZ(0);
  @$pb.TagNumber(12)
  set callName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(12)
  $core.bool hasCallName() => $_has(0);
  @$pb.TagNumber(12)
  void clearCallName() => clearField(12);

  @$pb.TagNumber(13)
  $fixnum.Int64 get callDestId => $_getI64(1);
  @$pb.TagNumber(13)
  set callDestId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(13)
  $core.bool hasCallDestId() => $_has(1);
  @$pb.TagNumber(13)
  void clearCallDestId() => clearField(13);

  @$pb.TagNumber(14)
  $0.DEST_TYPE get callDestType => $_getN(2);
  @$pb.TagNumber(14)
  set callDestType($0.DEST_TYPE v) { setField(14, v); }
  @$pb.TagNumber(14)
  $core.bool hasCallDestType() => $_has(2);
  @$pb.TagNumber(14)
  void clearCallDestType() => clearField(14);

  @$pb.TagNumber(15)
  $0.CALL_STATE get callState => $_getN(3);
  @$pb.TagNumber(15)
  set callState($0.CALL_STATE v) { setField(15, v); }
  @$pb.TagNumber(15)
  $core.bool hasCallState() => $_has(3);
  @$pb.TagNumber(15)
  void clearCallState() => clearField(15);

  @$pb.TagNumber(16)
  $core.bool get withVideo => $_getBF(4);
  @$pb.TagNumber(16)
  set withVideo($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(16)
  $core.bool hasWithVideo() => $_has(4);
  @$pb.TagNumber(16)
  void clearWithVideo() => clearField(16);

  @$pb.TagNumber(17)
  $fixnum.Int64 get callId => $_getI64(5);
  @$pb.TagNumber(17)
  set callId($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(17)
  $core.bool hasCallId() => $_has(5);
  @$pb.TagNumber(17)
  void clearCallId() => clearField(17);
}

class NotificationList extends $pb.GeneratedMessage {
  factory NotificationList({
    $core.Iterable<NotificationItem>? msgItems,
    $core.Iterable<NotificationItem>? callItems,
  }) {
    final $result = create();
    if (msgItems != null) {
      $result.msgItems.addAll(msgItems);
    }
    if (callItems != null) {
      $result.callItems.addAll(callItems);
    }
    return $result;
  }
  NotificationList._() : super();
  factory NotificationList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NotificationList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NotificationList', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..pc<NotificationItem>(1, _omitFieldNames ? '' : 'msgItems', $pb.PbFieldType.PM, subBuilder: NotificationItem.create)
    ..pc<NotificationItem>(2, _omitFieldNames ? '' : 'callItems', $pb.PbFieldType.PM, subBuilder: NotificationItem.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NotificationList clone() => NotificationList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NotificationList copyWith(void Function(NotificationList) updates) => super.copyWith((message) => updates(message as NotificationList)) as NotificationList;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NotificationList create() => NotificationList._();
  NotificationList createEmptyInstance() => create();
  static $pb.PbList<NotificationList> createRepeated() => $pb.PbList<NotificationList>();
  @$core.pragma('dart2js:noInline')
  static NotificationList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NotificationList>(create);
  static NotificationList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<NotificationItem> get msgItems => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<NotificationItem> get callItems => $_getList(1);
}

class NotificationText extends $pb.GeneratedMessage {
  factory NotificationText({
    $core.String? title,
    $core.String? message,
  }) {
    final $result = create();
    if (title != null) {
      $result.title = title;
    }
    if (message != null) {
      $result.message = message;
    }
    return $result;
  }
  NotificationText._() : super();
  factory NotificationText.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NotificationText.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NotificationText', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..aOS(6, _omitFieldNames ? '' : 'title')
    ..aOS(7, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NotificationText clone() => NotificationText()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NotificationText copyWith(void Function(NotificationText) updates) => super.copyWith((message) => updates(message as NotificationText)) as NotificationText;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NotificationText create() => NotificationText._();
  NotificationText createEmptyInstance() => create();
  static $pb.PbList<NotificationText> createRepeated() => $pb.PbList<NotificationText>();
  @$core.pragma('dart2js:noInline')
  static NotificationText getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NotificationText>(create);
  static NotificationText? _defaultInstance;

  @$pb.TagNumber(6)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(6)
  set title($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(6)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(6)
  void clearTitle() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(7)
  set message($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(7)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(7)
  void clearMessage() => clearField(7);
}

class NotificationItem extends $pb.GeneratedMessage {
  factory NotificationItem({
    $fixnum.Int64? destId,
    $0.DEST_TYPE? destType,
    $core.String? name,
    $core.String? body,
    $fixnum.Int64? time,
    $fixnum.Int64? chatId,
  }) {
    final $result = create();
    if (destId != null) {
      $result.destId = destId;
    }
    if (destType != null) {
      $result.destType = destType;
    }
    if (name != null) {
      $result.name = name;
    }
    if (body != null) {
      $result.body = body;
    }
    if (time != null) {
      $result.time = time;
    }
    if (chatId != null) {
      $result.chatId = chatId;
    }
    return $result;
  }
  NotificationItem._() : super();
  factory NotificationItem.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NotificationItem.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NotificationItem', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'destId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..e<$0.DEST_TYPE>(2, _omitFieldNames ? '' : 'destType', $pb.PbFieldType.OE, defaultOrMaker: $0.DEST_TYPE.ABONENT, valueOf: $0.DEST_TYPE.valueOf, enumValues: $0.DEST_TYPE.values)
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOS(4, _omitFieldNames ? '' : 'body')
    ..a<$fixnum.Int64>(5, _omitFieldNames ? '' : 'time', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(6, _omitFieldNames ? '' : 'chatId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NotificationItem clone() => NotificationItem()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NotificationItem copyWith(void Function(NotificationItem) updates) => super.copyWith((message) => updates(message as NotificationItem)) as NotificationItem;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NotificationItem create() => NotificationItem._();
  NotificationItem createEmptyInstance() => create();
  static $pb.PbList<NotificationItem> createRepeated() => $pb.PbList<NotificationItem>();
  @$core.pragma('dart2js:noInline')
  static NotificationItem getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NotificationItem>(create);
  static NotificationItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get destId => $_getI64(0);
  @$pb.TagNumber(1)
  set destId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDestId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDestId() => clearField(1);

  @$pb.TagNumber(2)
  $0.DEST_TYPE get destType => $_getN(1);
  @$pb.TagNumber(2)
  set destType($0.DEST_TYPE v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasDestType() => $_has(1);
  @$pb.TagNumber(2)
  void clearDestType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get body => $_getSZ(3);
  @$pb.TagNumber(4)
  set body($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBody() => $_has(3);
  @$pb.TagNumber(4)
  void clearBody() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get time => $_getI64(4);
  @$pb.TagNumber(5)
  set time($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearTime() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get chatId => $_getI64(5);
  @$pb.TagNumber(6)
  set chatId($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasChatId() => $_has(5);
  @$pb.TagNumber(6)
  void clearChatId() => clearField(6);
}

class UpdateReadyResp extends $pb.GeneratedMessage {
  factory UpdateReadyResp({
    $core.String? version,
    $core.String? note,
  }) {
    final $result = create();
    if (version != null) {
      $result.version = version;
    }
    if (note != null) {
      $result.note = note;
    }
    return $result;
  }
  UpdateReadyResp._() : super();
  factory UpdateReadyResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateReadyResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateReadyResp', package: const $pb.PackageName(_omitMessageNames ? '' : 'apiProto'), createEmptyInstance: create)
    ..aQS(1, _omitFieldNames ? '' : 'version')
    ..aQS(2, _omitFieldNames ? '' : 'note')
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateReadyResp clone() => UpdateReadyResp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateReadyResp copyWith(void Function(UpdateReadyResp) updates) => super.copyWith((message) => updates(message as UpdateReadyResp)) as UpdateReadyResp;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateReadyResp create() => UpdateReadyResp._();
  UpdateReadyResp createEmptyInstance() => create();
  static $pb.PbList<UpdateReadyResp> createRepeated() => $pb.PbList<UpdateReadyResp>();
  @$core.pragma('dart2js:noInline')
  static UpdateReadyResp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateReadyResp>(create);
  static UpdateReadyResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get version => $_getSZ(0);
  @$pb.TagNumber(1)
  set version($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearVersion() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get note => $_getSZ(1);
  @$pb.TagNumber(2)
  set note($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNote() => $_has(1);
  @$pb.TagNumber(2)
  void clearNote() => clearField(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');

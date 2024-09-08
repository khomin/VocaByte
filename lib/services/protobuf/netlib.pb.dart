//
//  Generated code. Do not modify.
//  source: netlib.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'netlib.pbenum.dart';

export 'netlib.pbenum.dart';

class EventCall extends $pb.GeneratedMessage {
  factory EventCall({
    $fixnum.Int64? localCallId,
    CALL_STATE? state,
    CALL_STATE? oldState,
    $fixnum.Int64? abonentId,
    $fixnum.Int64? deviceId,
    $core.int? deviceType,
    $core.int? codec,
    DISCON_REASON? reason,
    $core.bool? hold,
    $fixnum.Int64? beforeCallId,
    ActiveCallStatus? activeCall,
  }) {
    final $result = create();
    if (localCallId != null) {
      $result.localCallId = localCallId;
    }
    if (state != null) {
      $result.state = state;
    }
    if (oldState != null) {
      $result.oldState = oldState;
    }
    if (abonentId != null) {
      $result.abonentId = abonentId;
    }
    if (deviceId != null) {
      $result.deviceId = deviceId;
    }
    if (deviceType != null) {
      $result.deviceType = deviceType;
    }
    if (codec != null) {
      $result.codec = codec;
    }
    if (reason != null) {
      $result.reason = reason;
    }
    if (hold != null) {
      $result.hold = hold;
    }
    if (beforeCallId != null) {
      $result.beforeCallId = beforeCallId;
    }
    if (activeCall != null) {
      $result.activeCall = activeCall;
    }
    return $result;
  }
  EventCall._() : super();
  factory EventCall.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EventCall.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EventCall', package: const $pb.PackageName(_omitMessageNames ? '' : 'netLib'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'LocalCallId', $pb.PbFieldType.QU6, protoName: 'LocalCallId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..e<CALL_STATE>(2, _omitFieldNames ? '' : 'State', $pb.PbFieldType.QE, protoName: 'State', defaultOrMaker: CALL_STATE.CALL_IDLE, valueOf: CALL_STATE.valueOf, enumValues: CALL_STATE.values)
    ..e<CALL_STATE>(3, _omitFieldNames ? '' : 'OldState', $pb.PbFieldType.QE, protoName: 'OldState', defaultOrMaker: CALL_STATE.CALL_IDLE, valueOf: CALL_STATE.valueOf, enumValues: CALL_STATE.values)
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : 'AbonentId', $pb.PbFieldType.QU6, protoName: 'AbonentId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(5, _omitFieldNames ? '' : 'DeviceId', $pb.PbFieldType.QU6, protoName: 'DeviceId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'DeviceType', $pb.PbFieldType.QU3, protoName: 'DeviceType')
    ..a<$core.int>(7, _omitFieldNames ? '' : 'Codec', $pb.PbFieldType.QU3, protoName: 'Codec')
    ..e<DISCON_REASON>(8, _omitFieldNames ? '' : 'Reason', $pb.PbFieldType.QE, protoName: 'Reason', defaultOrMaker: DISCON_REASON.CALL_ACTIVE, valueOf: DISCON_REASON.valueOf, enumValues: DISCON_REASON.values)
    ..a<$core.bool>(9, _omitFieldNames ? '' : 'Hold', $pb.PbFieldType.QB, protoName: 'Hold')
    ..a<$fixnum.Int64>(10, _omitFieldNames ? '' : 'BeforeCallId', $pb.PbFieldType.QU6, protoName: 'BeforeCallId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aQM<ActiveCallStatus>(11, _omitFieldNames ? '' : 'activeCall', protoName: 'activeCall', subBuilder: ActiveCallStatus.create)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EventCall clone() => EventCall()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EventCall copyWith(void Function(EventCall) updates) => super.copyWith((message) => updates(message as EventCall)) as EventCall;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EventCall create() => EventCall._();
  EventCall createEmptyInstance() => create();
  static $pb.PbList<EventCall> createRepeated() => $pb.PbList<EventCall>();
  @$core.pragma('dart2js:noInline')
  static EventCall getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EventCall>(create);
  static EventCall? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get localCallId => $_getI64(0);
  @$pb.TagNumber(1)
  set localCallId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLocalCallId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLocalCallId() => clearField(1);

  @$pb.TagNumber(2)
  CALL_STATE get state => $_getN(1);
  @$pb.TagNumber(2)
  set state(CALL_STATE v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasState() => $_has(1);
  @$pb.TagNumber(2)
  void clearState() => clearField(2);

  @$pb.TagNumber(3)
  CALL_STATE get oldState => $_getN(2);
  @$pb.TagNumber(3)
  set oldState(CALL_STATE v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasOldState() => $_has(2);
  @$pb.TagNumber(3)
  void clearOldState() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get abonentId => $_getI64(3);
  @$pb.TagNumber(4)
  set abonentId($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAbonentId() => $_has(3);
  @$pb.TagNumber(4)
  void clearAbonentId() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get deviceId => $_getI64(4);
  @$pb.TagNumber(5)
  set deviceId($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDeviceId() => $_has(4);
  @$pb.TagNumber(5)
  void clearDeviceId() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get deviceType => $_getIZ(5);
  @$pb.TagNumber(6)
  set deviceType($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasDeviceType() => $_has(5);
  @$pb.TagNumber(6)
  void clearDeviceType() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get codec => $_getIZ(6);
  @$pb.TagNumber(7)
  set codec($core.int v) { $_setUnsignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasCodec() => $_has(6);
  @$pb.TagNumber(7)
  void clearCodec() => clearField(7);

  @$pb.TagNumber(8)
  DISCON_REASON get reason => $_getN(7);
  @$pb.TagNumber(8)
  set reason(DISCON_REASON v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasReason() => $_has(7);
  @$pb.TagNumber(8)
  void clearReason() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get hold => $_getBF(8);
  @$pb.TagNumber(9)
  set hold($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasHold() => $_has(8);
  @$pb.TagNumber(9)
  void clearHold() => clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get beforeCallId => $_getI64(9);
  @$pb.TagNumber(10)
  set beforeCallId($fixnum.Int64 v) { $_setInt64(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasBeforeCallId() => $_has(9);
  @$pb.TagNumber(10)
  void clearBeforeCallId() => clearField(10);

  @$pb.TagNumber(11)
  ActiveCallStatus get activeCall => $_getN(10);
  @$pb.TagNumber(11)
  set activeCall(ActiveCallStatus v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasActiveCall() => $_has(10);
  @$pb.TagNumber(11)
  void clearActiveCall() => clearField(11);
  @$pb.TagNumber(11)
  ActiveCallStatus ensureActiveCall() => $_ensure(10);
}

class CALL_LIST_REC extends $pb.GeneratedMessage {
  factory CALL_LIST_REC({
    $fixnum.Int64? id,
    $fixnum.Int64? abonentId,
    $fixnum.Int64? deviceId,
    DEV_TYPE? deviceType,
    $fixnum.Int64? ownDeviceId,
    DEV_TYPE? ownDeviceType,
    $core.bool? out,
    $core.bool? connected,
    $core.bool? deviceDirect,
    $core.bool? video,
    DISCON_REASON? dReason,
    $fixnum.Int64? cTime,
    $core.int? lastedTime,
    $core.String? number,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (abonentId != null) {
      $result.abonentId = abonentId;
    }
    if (deviceId != null) {
      $result.deviceId = deviceId;
    }
    if (deviceType != null) {
      $result.deviceType = deviceType;
    }
    if (ownDeviceId != null) {
      $result.ownDeviceId = ownDeviceId;
    }
    if (ownDeviceType != null) {
      $result.ownDeviceType = ownDeviceType;
    }
    if (out != null) {
      $result.out = out;
    }
    if (connected != null) {
      $result.connected = connected;
    }
    if (deviceDirect != null) {
      $result.deviceDirect = deviceDirect;
    }
    if (video != null) {
      $result.video = video;
    }
    if (dReason != null) {
      $result.dReason = dReason;
    }
    if (cTime != null) {
      $result.cTime = cTime;
    }
    if (lastedTime != null) {
      $result.lastedTime = lastedTime;
    }
    if (number != null) {
      $result.number = number;
    }
    return $result;
  }
  CALL_LIST_REC._() : super();
  factory CALL_LIST_REC.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CALL_LIST_REC.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CALL_LIST_REC', package: const $pb.PackageName(_omitMessageNames ? '' : 'netLib'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'abonentId', $pb.PbFieldType.QU6, protoName: 'abonentId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'deviceId', $pb.PbFieldType.QU6, protoName: 'deviceId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..e<DEV_TYPE>(4, _omitFieldNames ? '' : 'deviceType', $pb.PbFieldType.QE, protoName: 'deviceType', defaultOrMaker: DEV_TYPE.DEVICE_UNDEFINED, valueOf: DEV_TYPE.valueOf, enumValues: DEV_TYPE.values)
    ..a<$fixnum.Int64>(5, _omitFieldNames ? '' : 'ownDeviceId', $pb.PbFieldType.QU6, protoName: 'ownDeviceId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..e<DEV_TYPE>(6, _omitFieldNames ? '' : 'ownDeviceType', $pb.PbFieldType.QE, protoName: 'ownDeviceType', defaultOrMaker: DEV_TYPE.DEVICE_UNDEFINED, valueOf: DEV_TYPE.valueOf, enumValues: DEV_TYPE.values)
    ..a<$core.bool>(7, _omitFieldNames ? '' : 'out', $pb.PbFieldType.QB)
    ..a<$core.bool>(8, _omitFieldNames ? '' : 'connected', $pb.PbFieldType.QB)
    ..a<$core.bool>(9, _omitFieldNames ? '' : 'deviceDirect', $pb.PbFieldType.QB, protoName: 'deviceDirect')
    ..a<$core.bool>(10, _omitFieldNames ? '' : 'video', $pb.PbFieldType.QB)
    ..e<DISCON_REASON>(11, _omitFieldNames ? '' : 'dReason', $pb.PbFieldType.QE, protoName: 'dReason', defaultOrMaker: DISCON_REASON.CALL_ACTIVE, valueOf: DISCON_REASON.valueOf, enumValues: DISCON_REASON.values)
    ..a<$fixnum.Int64>(12, _omitFieldNames ? '' : 'cTime', $pb.PbFieldType.QU6, protoName: 'cTime', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(13, _omitFieldNames ? '' : 'lastedTime', $pb.PbFieldType.QU3, protoName: 'lastedTime')
    ..aQS(14, _omitFieldNames ? '' : 'number')
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CALL_LIST_REC clone() => CALL_LIST_REC()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CALL_LIST_REC copyWith(void Function(CALL_LIST_REC) updates) => super.copyWith((message) => updates(message as CALL_LIST_REC)) as CALL_LIST_REC;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CALL_LIST_REC create() => CALL_LIST_REC._();
  CALL_LIST_REC createEmptyInstance() => create();
  static $pb.PbList<CALL_LIST_REC> createRepeated() => $pb.PbList<CALL_LIST_REC>();
  @$core.pragma('dart2js:noInline')
  static CALL_LIST_REC getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CALL_LIST_REC>(create);
  static CALL_LIST_REC? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get abonentId => $_getI64(1);
  @$pb.TagNumber(2)
  set abonentId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAbonentId() => $_has(1);
  @$pb.TagNumber(2)
  void clearAbonentId() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get deviceId => $_getI64(2);
  @$pb.TagNumber(3)
  set deviceId($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDeviceId() => $_has(2);
  @$pb.TagNumber(3)
  void clearDeviceId() => clearField(3);

  @$pb.TagNumber(4)
  DEV_TYPE get deviceType => $_getN(3);
  @$pb.TagNumber(4)
  set deviceType(DEV_TYPE v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasDeviceType() => $_has(3);
  @$pb.TagNumber(4)
  void clearDeviceType() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get ownDeviceId => $_getI64(4);
  @$pb.TagNumber(5)
  set ownDeviceId($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasOwnDeviceId() => $_has(4);
  @$pb.TagNumber(5)
  void clearOwnDeviceId() => clearField(5);

  @$pb.TagNumber(6)
  DEV_TYPE get ownDeviceType => $_getN(5);
  @$pb.TagNumber(6)
  set ownDeviceType(DEV_TYPE v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasOwnDeviceType() => $_has(5);
  @$pb.TagNumber(6)
  void clearOwnDeviceType() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get out => $_getBF(6);
  @$pb.TagNumber(7)
  set out($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasOut() => $_has(6);
  @$pb.TagNumber(7)
  void clearOut() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get connected => $_getBF(7);
  @$pb.TagNumber(8)
  set connected($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasConnected() => $_has(7);
  @$pb.TagNumber(8)
  void clearConnected() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get deviceDirect => $_getBF(8);
  @$pb.TagNumber(9)
  set deviceDirect($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasDeviceDirect() => $_has(8);
  @$pb.TagNumber(9)
  void clearDeviceDirect() => clearField(9);

  @$pb.TagNumber(10)
  $core.bool get video => $_getBF(9);
  @$pb.TagNumber(10)
  set video($core.bool v) { $_setBool(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasVideo() => $_has(9);
  @$pb.TagNumber(10)
  void clearVideo() => clearField(10);

  @$pb.TagNumber(11)
  DISCON_REASON get dReason => $_getN(10);
  @$pb.TagNumber(11)
  set dReason(DISCON_REASON v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasDReason() => $_has(10);
  @$pb.TagNumber(11)
  void clearDReason() => clearField(11);

  @$pb.TagNumber(12)
  $fixnum.Int64 get cTime => $_getI64(11);
  @$pb.TagNumber(12)
  set cTime($fixnum.Int64 v) { $_setInt64(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasCTime() => $_has(11);
  @$pb.TagNumber(12)
  void clearCTime() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get lastedTime => $_getIZ(12);
  @$pb.TagNumber(13)
  set lastedTime($core.int v) { $_setUnsignedInt32(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasLastedTime() => $_has(12);
  @$pb.TagNumber(13)
  void clearLastedTime() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get number => $_getSZ(13);
  @$pb.TagNumber(14)
  set number($core.String v) { $_setString(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasNumber() => $_has(13);
  @$pb.TagNumber(14)
  void clearNumber() => clearField(14);
}

class CALL_INFO extends $pb.GeneratedMessage {
  factory CALL_INFO({
    $fixnum.Int64? callId,
    $fixnum.Int64? callIdServer,
    $fixnum.Int64? userId,
    $fixnum.Int64? deviceId,
    CALL_STATE? state,
    CALL_STATE? oldState,
    CALL_DIRECT? direction,
    $fixnum.Int64? stateTime,
    $fixnum.Int64? startTime,
    $fixnum.Int64? ringTime,
    $core.int? audioCodec,
    $core.bool? onHold,
    $core.bool? holdLocal,
    $core.bool? holdVideoLocal,
    $fixnum.Int64? streamId,
    $fixnum.Int64? channelId,
    $core.String? number,
    DISCON_REASON? dReason,
    $core.bool? videoMode,
    $core.bool? directMode,
    $core.int? error,
    $fixnum.Int64? conferenceId,
    $core.int? inCount,
    $core.int? lostInCount,
    $core.int? recoverInCount,
    $core.int? lostPeerCount,
    $core.int? orderError,
    $core.int? recvSframeCnt,
    $core.int? recvVframeCnt,
    $core.int? doubSend,
    $core.int? flushCnt,
    $core.int? recvFifoFull,
    $core.int? recvMaxSize,
    DEV_TYPE? deviceType,
  }) {
    final $result = create();
    if (callId != null) {
      $result.callId = callId;
    }
    if (callIdServer != null) {
      $result.callIdServer = callIdServer;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    if (deviceId != null) {
      $result.deviceId = deviceId;
    }
    if (state != null) {
      $result.state = state;
    }
    if (oldState != null) {
      $result.oldState = oldState;
    }
    if (direction != null) {
      $result.direction = direction;
    }
    if (stateTime != null) {
      $result.stateTime = stateTime;
    }
    if (startTime != null) {
      $result.startTime = startTime;
    }
    if (ringTime != null) {
      $result.ringTime = ringTime;
    }
    if (audioCodec != null) {
      $result.audioCodec = audioCodec;
    }
    if (onHold != null) {
      $result.onHold = onHold;
    }
    if (holdLocal != null) {
      $result.holdLocal = holdLocal;
    }
    if (holdVideoLocal != null) {
      $result.holdVideoLocal = holdVideoLocal;
    }
    if (streamId != null) {
      $result.streamId = streamId;
    }
    if (channelId != null) {
      $result.channelId = channelId;
    }
    if (number != null) {
      $result.number = number;
    }
    if (dReason != null) {
      $result.dReason = dReason;
    }
    if (videoMode != null) {
      $result.videoMode = videoMode;
    }
    if (directMode != null) {
      $result.directMode = directMode;
    }
    if (error != null) {
      $result.error = error;
    }
    if (conferenceId != null) {
      $result.conferenceId = conferenceId;
    }
    if (inCount != null) {
      $result.inCount = inCount;
    }
    if (lostInCount != null) {
      $result.lostInCount = lostInCount;
    }
    if (recoverInCount != null) {
      $result.recoverInCount = recoverInCount;
    }
    if (lostPeerCount != null) {
      $result.lostPeerCount = lostPeerCount;
    }
    if (orderError != null) {
      $result.orderError = orderError;
    }
    if (recvSframeCnt != null) {
      $result.recvSframeCnt = recvSframeCnt;
    }
    if (recvVframeCnt != null) {
      $result.recvVframeCnt = recvVframeCnt;
    }
    if (doubSend != null) {
      $result.doubSend = doubSend;
    }
    if (flushCnt != null) {
      $result.flushCnt = flushCnt;
    }
    if (recvFifoFull != null) {
      $result.recvFifoFull = recvFifoFull;
    }
    if (recvMaxSize != null) {
      $result.recvMaxSize = recvMaxSize;
    }
    if (deviceType != null) {
      $result.deviceType = deviceType;
    }
    return $result;
  }
  CALL_INFO._() : super();
  factory CALL_INFO.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CALL_INFO.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CALL_INFO', package: const $pb.PackageName(_omitMessageNames ? '' : 'netLib'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'CallId', $pb.PbFieldType.QU6, protoName: 'CallId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'CallIdServer', $pb.PbFieldType.QU6, protoName: 'CallIdServer', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'UserId', $pb.PbFieldType.QU6, protoName: 'User_Id', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : 'DeviceId', $pb.PbFieldType.QU6, protoName: 'Device_Id', defaultOrMaker: $fixnum.Int64.ZERO)
    ..e<CALL_STATE>(5, _omitFieldNames ? '' : 'State', $pb.PbFieldType.QE, protoName: 'State', defaultOrMaker: CALL_STATE.CALL_IDLE, valueOf: CALL_STATE.valueOf, enumValues: CALL_STATE.values)
    ..e<CALL_STATE>(6, _omitFieldNames ? '' : 'OldState', $pb.PbFieldType.QE, protoName: 'Old_State', defaultOrMaker: CALL_STATE.CALL_IDLE, valueOf: CALL_STATE.valueOf, enumValues: CALL_STATE.values)
    ..e<CALL_DIRECT>(7, _omitFieldNames ? '' : 'Direction', $pb.PbFieldType.QE, protoName: 'Direction', defaultOrMaker: CALL_DIRECT.Out, valueOf: CALL_DIRECT.valueOf, enumValues: CALL_DIRECT.values)
    ..a<$fixnum.Int64>(8, _omitFieldNames ? '' : 'StateTime', $pb.PbFieldType.QU6, protoName: 'State_Time', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(9, _omitFieldNames ? '' : 'StartTime', $pb.PbFieldType.QU6, protoName: 'Start_Time', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(10, _omitFieldNames ? '' : 'RingTime', $pb.PbFieldType.QU6, protoName: 'Ring_Time', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(11, _omitFieldNames ? '' : 'AudioCodec', $pb.PbFieldType.QU3, protoName: 'Audio_Codec')
    ..a<$core.bool>(13, _omitFieldNames ? '' : 'OnHold', $pb.PbFieldType.QB, protoName: 'On_Hold')
    ..a<$core.bool>(14, _omitFieldNames ? '' : 'HoldLocal', $pb.PbFieldType.QB, protoName: 'Hold_Local')
    ..a<$core.bool>(15, _omitFieldNames ? '' : 'HoldVideoLocal', $pb.PbFieldType.QB, protoName: 'Hold_Video_Local')
    ..a<$fixnum.Int64>(16, _omitFieldNames ? '' : 'StreamId', $pb.PbFieldType.QU6, protoName: 'Stream_Id', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(17, _omitFieldNames ? '' : 'ChannelId', $pb.PbFieldType.QU6, protoName: 'Channel_Id', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aQS(18, _omitFieldNames ? '' : 'Number', protoName: 'Number')
    ..e<DISCON_REASON>(19, _omitFieldNames ? '' : 'DReason', $pb.PbFieldType.QE, protoName: 'DReason', defaultOrMaker: DISCON_REASON.CALL_ACTIVE, valueOf: DISCON_REASON.valueOf, enumValues: DISCON_REASON.values)
    ..a<$core.bool>(20, _omitFieldNames ? '' : 'VideoMode', $pb.PbFieldType.QB, protoName: 'VideoMode')
    ..a<$core.bool>(21, _omitFieldNames ? '' : 'DirectMode', $pb.PbFieldType.QB, protoName: 'DirectMode')
    ..a<$core.int>(22, _omitFieldNames ? '' : 'Error', $pb.PbFieldType.QU3, protoName: 'Error')
    ..a<$fixnum.Int64>(23, _omitFieldNames ? '' : 'ConferenceId', $pb.PbFieldType.QU6, protoName: 'Conference_Id', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(24, _omitFieldNames ? '' : 'InCount', $pb.PbFieldType.QU3, protoName: 'In_Count')
    ..a<$core.int>(25, _omitFieldNames ? '' : 'LostInCount', $pb.PbFieldType.QU3, protoName: 'Lost_In_Count')
    ..a<$core.int>(26, _omitFieldNames ? '' : 'RecoverInCount', $pb.PbFieldType.QU3, protoName: 'Recover_In_Count')
    ..a<$core.int>(27, _omitFieldNames ? '' : 'LostPeerCount', $pb.PbFieldType.QU3, protoName: 'Lost_Peer_Count')
    ..a<$core.int>(28, _omitFieldNames ? '' : 'orderError', $pb.PbFieldType.QU3)
    ..a<$core.int>(29, _omitFieldNames ? '' : 'recvSframeCnt', $pb.PbFieldType.QU3)
    ..a<$core.int>(30, _omitFieldNames ? '' : 'recvVframeCnt', $pb.PbFieldType.QU3)
    ..a<$core.int>(31, _omitFieldNames ? '' : 'doubSend', $pb.PbFieldType.QU3)
    ..a<$core.int>(32, _omitFieldNames ? '' : 'flushCnt', $pb.PbFieldType.QU3)
    ..a<$core.int>(33, _omitFieldNames ? '' : 'recvFifoFull', $pb.PbFieldType.QU3)
    ..a<$core.int>(34, _omitFieldNames ? '' : 'recvMaxSize', $pb.PbFieldType.QU3)
    ..e<DEV_TYPE>(35, _omitFieldNames ? '' : 'DeviceType', $pb.PbFieldType.QE, protoName: 'Device_Type', defaultOrMaker: DEV_TYPE.DEVICE_UNDEFINED, valueOf: DEV_TYPE.valueOf, enumValues: DEV_TYPE.values)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CALL_INFO clone() => CALL_INFO()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CALL_INFO copyWith(void Function(CALL_INFO) updates) => super.copyWith((message) => updates(message as CALL_INFO)) as CALL_INFO;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CALL_INFO create() => CALL_INFO._();
  CALL_INFO createEmptyInstance() => create();
  static $pb.PbList<CALL_INFO> createRepeated() => $pb.PbList<CALL_INFO>();
  @$core.pragma('dart2js:noInline')
  static CALL_INFO getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CALL_INFO>(create);
  static CALL_INFO? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get callId => $_getI64(0);
  @$pb.TagNumber(1)
  set callId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCallId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCallId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get callIdServer => $_getI64(1);
  @$pb.TagNumber(2)
  set callIdServer($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCallIdServer() => $_has(1);
  @$pb.TagNumber(2)
  void clearCallIdServer() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get userId => $_getI64(2);
  @$pb.TagNumber(3)
  set userId($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUserId() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserId() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get deviceId => $_getI64(3);
  @$pb.TagNumber(4)
  set deviceId($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDeviceId() => $_has(3);
  @$pb.TagNumber(4)
  void clearDeviceId() => clearField(4);

  @$pb.TagNumber(5)
  CALL_STATE get state => $_getN(4);
  @$pb.TagNumber(5)
  set state(CALL_STATE v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasState() => $_has(4);
  @$pb.TagNumber(5)
  void clearState() => clearField(5);

  @$pb.TagNumber(6)
  CALL_STATE get oldState => $_getN(5);
  @$pb.TagNumber(6)
  set oldState(CALL_STATE v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasOldState() => $_has(5);
  @$pb.TagNumber(6)
  void clearOldState() => clearField(6);

  @$pb.TagNumber(7)
  CALL_DIRECT get direction => $_getN(6);
  @$pb.TagNumber(7)
  set direction(CALL_DIRECT v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasDirection() => $_has(6);
  @$pb.TagNumber(7)
  void clearDirection() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get stateTime => $_getI64(7);
  @$pb.TagNumber(8)
  set stateTime($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasStateTime() => $_has(7);
  @$pb.TagNumber(8)
  void clearStateTime() => clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get startTime => $_getI64(8);
  @$pb.TagNumber(9)
  set startTime($fixnum.Int64 v) { $_setInt64(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasStartTime() => $_has(8);
  @$pb.TagNumber(9)
  void clearStartTime() => clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get ringTime => $_getI64(9);
  @$pb.TagNumber(10)
  set ringTime($fixnum.Int64 v) { $_setInt64(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasRingTime() => $_has(9);
  @$pb.TagNumber(10)
  void clearRingTime() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get audioCodec => $_getIZ(10);
  @$pb.TagNumber(11)
  set audioCodec($core.int v) { $_setUnsignedInt32(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasAudioCodec() => $_has(10);
  @$pb.TagNumber(11)
  void clearAudioCodec() => clearField(11);

  @$pb.TagNumber(13)
  $core.bool get onHold => $_getBF(11);
  @$pb.TagNumber(13)
  set onHold($core.bool v) { $_setBool(11, v); }
  @$pb.TagNumber(13)
  $core.bool hasOnHold() => $_has(11);
  @$pb.TagNumber(13)
  void clearOnHold() => clearField(13);

  @$pb.TagNumber(14)
  $core.bool get holdLocal => $_getBF(12);
  @$pb.TagNumber(14)
  set holdLocal($core.bool v) { $_setBool(12, v); }
  @$pb.TagNumber(14)
  $core.bool hasHoldLocal() => $_has(12);
  @$pb.TagNumber(14)
  void clearHoldLocal() => clearField(14);

  @$pb.TagNumber(15)
  $core.bool get holdVideoLocal => $_getBF(13);
  @$pb.TagNumber(15)
  set holdVideoLocal($core.bool v) { $_setBool(13, v); }
  @$pb.TagNumber(15)
  $core.bool hasHoldVideoLocal() => $_has(13);
  @$pb.TagNumber(15)
  void clearHoldVideoLocal() => clearField(15);

  @$pb.TagNumber(16)
  $fixnum.Int64 get streamId => $_getI64(14);
  @$pb.TagNumber(16)
  set streamId($fixnum.Int64 v) { $_setInt64(14, v); }
  @$pb.TagNumber(16)
  $core.bool hasStreamId() => $_has(14);
  @$pb.TagNumber(16)
  void clearStreamId() => clearField(16);

  @$pb.TagNumber(17)
  $fixnum.Int64 get channelId => $_getI64(15);
  @$pb.TagNumber(17)
  set channelId($fixnum.Int64 v) { $_setInt64(15, v); }
  @$pb.TagNumber(17)
  $core.bool hasChannelId() => $_has(15);
  @$pb.TagNumber(17)
  void clearChannelId() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get number => $_getSZ(16);
  @$pb.TagNumber(18)
  set number($core.String v) { $_setString(16, v); }
  @$pb.TagNumber(18)
  $core.bool hasNumber() => $_has(16);
  @$pb.TagNumber(18)
  void clearNumber() => clearField(18);

  @$pb.TagNumber(19)
  DISCON_REASON get dReason => $_getN(17);
  @$pb.TagNumber(19)
  set dReason(DISCON_REASON v) { setField(19, v); }
  @$pb.TagNumber(19)
  $core.bool hasDReason() => $_has(17);
  @$pb.TagNumber(19)
  void clearDReason() => clearField(19);

  @$pb.TagNumber(20)
  $core.bool get videoMode => $_getBF(18);
  @$pb.TagNumber(20)
  set videoMode($core.bool v) { $_setBool(18, v); }
  @$pb.TagNumber(20)
  $core.bool hasVideoMode() => $_has(18);
  @$pb.TagNumber(20)
  void clearVideoMode() => clearField(20);

  @$pb.TagNumber(21)
  $core.bool get directMode => $_getBF(19);
  @$pb.TagNumber(21)
  set directMode($core.bool v) { $_setBool(19, v); }
  @$pb.TagNumber(21)
  $core.bool hasDirectMode() => $_has(19);
  @$pb.TagNumber(21)
  void clearDirectMode() => clearField(21);

  @$pb.TagNumber(22)
  $core.int get error => $_getIZ(20);
  @$pb.TagNumber(22)
  set error($core.int v) { $_setUnsignedInt32(20, v); }
  @$pb.TagNumber(22)
  $core.bool hasError() => $_has(20);
  @$pb.TagNumber(22)
  void clearError() => clearField(22);

  @$pb.TagNumber(23)
  $fixnum.Int64 get conferenceId => $_getI64(21);
  @$pb.TagNumber(23)
  set conferenceId($fixnum.Int64 v) { $_setInt64(21, v); }
  @$pb.TagNumber(23)
  $core.bool hasConferenceId() => $_has(21);
  @$pb.TagNumber(23)
  void clearConferenceId() => clearField(23);

  @$pb.TagNumber(24)
  $core.int get inCount => $_getIZ(22);
  @$pb.TagNumber(24)
  set inCount($core.int v) { $_setUnsignedInt32(22, v); }
  @$pb.TagNumber(24)
  $core.bool hasInCount() => $_has(22);
  @$pb.TagNumber(24)
  void clearInCount() => clearField(24);

  @$pb.TagNumber(25)
  $core.int get lostInCount => $_getIZ(23);
  @$pb.TagNumber(25)
  set lostInCount($core.int v) { $_setUnsignedInt32(23, v); }
  @$pb.TagNumber(25)
  $core.bool hasLostInCount() => $_has(23);
  @$pb.TagNumber(25)
  void clearLostInCount() => clearField(25);

  @$pb.TagNumber(26)
  $core.int get recoverInCount => $_getIZ(24);
  @$pb.TagNumber(26)
  set recoverInCount($core.int v) { $_setUnsignedInt32(24, v); }
  @$pb.TagNumber(26)
  $core.bool hasRecoverInCount() => $_has(24);
  @$pb.TagNumber(26)
  void clearRecoverInCount() => clearField(26);

  @$pb.TagNumber(27)
  $core.int get lostPeerCount => $_getIZ(25);
  @$pb.TagNumber(27)
  set lostPeerCount($core.int v) { $_setUnsignedInt32(25, v); }
  @$pb.TagNumber(27)
  $core.bool hasLostPeerCount() => $_has(25);
  @$pb.TagNumber(27)
  void clearLostPeerCount() => clearField(27);

  @$pb.TagNumber(28)
  $core.int get orderError => $_getIZ(26);
  @$pb.TagNumber(28)
  set orderError($core.int v) { $_setUnsignedInt32(26, v); }
  @$pb.TagNumber(28)
  $core.bool hasOrderError() => $_has(26);
  @$pb.TagNumber(28)
  void clearOrderError() => clearField(28);

  @$pb.TagNumber(29)
  $core.int get recvSframeCnt => $_getIZ(27);
  @$pb.TagNumber(29)
  set recvSframeCnt($core.int v) { $_setUnsignedInt32(27, v); }
  @$pb.TagNumber(29)
  $core.bool hasRecvSframeCnt() => $_has(27);
  @$pb.TagNumber(29)
  void clearRecvSframeCnt() => clearField(29);

  @$pb.TagNumber(30)
  $core.int get recvVframeCnt => $_getIZ(28);
  @$pb.TagNumber(30)
  set recvVframeCnt($core.int v) { $_setUnsignedInt32(28, v); }
  @$pb.TagNumber(30)
  $core.bool hasRecvVframeCnt() => $_has(28);
  @$pb.TagNumber(30)
  void clearRecvVframeCnt() => clearField(30);

  @$pb.TagNumber(31)
  $core.int get doubSend => $_getIZ(29);
  @$pb.TagNumber(31)
  set doubSend($core.int v) { $_setUnsignedInt32(29, v); }
  @$pb.TagNumber(31)
  $core.bool hasDoubSend() => $_has(29);
  @$pb.TagNumber(31)
  void clearDoubSend() => clearField(31);

  @$pb.TagNumber(32)
  $core.int get flushCnt => $_getIZ(30);
  @$pb.TagNumber(32)
  set flushCnt($core.int v) { $_setUnsignedInt32(30, v); }
  @$pb.TagNumber(32)
  $core.bool hasFlushCnt() => $_has(30);
  @$pb.TagNumber(32)
  void clearFlushCnt() => clearField(32);

  @$pb.TagNumber(33)
  $core.int get recvFifoFull => $_getIZ(31);
  @$pb.TagNumber(33)
  set recvFifoFull($core.int v) { $_setUnsignedInt32(31, v); }
  @$pb.TagNumber(33)
  $core.bool hasRecvFifoFull() => $_has(31);
  @$pb.TagNumber(33)
  void clearRecvFifoFull() => clearField(33);

  @$pb.TagNumber(34)
  $core.int get recvMaxSize => $_getIZ(32);
  @$pb.TagNumber(34)
  set recvMaxSize($core.int v) { $_setUnsignedInt32(32, v); }
  @$pb.TagNumber(34)
  $core.bool hasRecvMaxSize() => $_has(32);
  @$pb.TagNumber(34)
  void clearRecvMaxSize() => clearField(34);

  @$pb.TagNumber(35)
  DEV_TYPE get deviceType => $_getN(33);
  @$pb.TagNumber(35)
  set deviceType(DEV_TYPE v) { setField(35, v); }
  @$pb.TagNumber(35)
  $core.bool hasDeviceType() => $_has(33);
  @$pb.TagNumber(35)
  void clearDeviceType() => clearField(35);
}

class ActiveCallStatus extends $pb.GeneratedMessage {
  factory ActiveCallStatus({
    CALL_INFO? active,
    $core.Iterable<CALL_INFO>? calls,
  }) {
    final $result = create();
    if (active != null) {
      $result.active = active;
    }
    if (calls != null) {
      $result.calls.addAll(calls);
    }
    return $result;
  }
  ActiveCallStatus._() : super();
  factory ActiveCallStatus.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ActiveCallStatus.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ActiveCallStatus', package: const $pb.PackageName(_omitMessageNames ? '' : 'netLib'), createEmptyInstance: create)
    ..aOM<CALL_INFO>(1, _omitFieldNames ? '' : 'active', subBuilder: CALL_INFO.create)
    ..pc<CALL_INFO>(2, _omitFieldNames ? '' : 'calls', $pb.PbFieldType.PM, subBuilder: CALL_INFO.create)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ActiveCallStatus clone() => ActiveCallStatus()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ActiveCallStatus copyWith(void Function(ActiveCallStatus) updates) => super.copyWith((message) => updates(message as ActiveCallStatus)) as ActiveCallStatus;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ActiveCallStatus create() => ActiveCallStatus._();
  ActiveCallStatus createEmptyInstance() => create();
  static $pb.PbList<ActiveCallStatus> createRepeated() => $pb.PbList<ActiveCallStatus>();
  @$core.pragma('dart2js:noInline')
  static ActiveCallStatus getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ActiveCallStatus>(create);
  static ActiveCallStatus? _defaultInstance;

  @$pb.TagNumber(1)
  CALL_INFO get active => $_getN(0);
  @$pb.TagNumber(1)
  set active(CALL_INFO v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasActive() => $_has(0);
  @$pb.TagNumber(1)
  void clearActive() => clearField(1);
  @$pb.TagNumber(1)
  CALL_INFO ensureActive() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<CALL_INFO> get calls => $_getList(1);
}

class EventChatTime extends $pb.GeneratedMessage {
  factory EventChatTime({
    $fixnum.Int64? id,
    $fixnum.Int64? time,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (time != null) {
      $result.time = time;
    }
    return $result;
  }
  EventChatTime._() : super();
  factory EventChatTime.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EventChatTime.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EventChatTime', package: const $pb.PackageName(_omitMessageNames ? '' : 'netLib'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'Id', $pb.PbFieldType.QU6, protoName: 'Id', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'Time', $pb.PbFieldType.QU6, protoName: 'Time', defaultOrMaker: $fixnum.Int64.ZERO)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EventChatTime clone() => EventChatTime()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EventChatTime copyWith(void Function(EventChatTime) updates) => super.copyWith((message) => updates(message as EventChatTime)) as EventChatTime;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EventChatTime create() => EventChatTime._();
  EventChatTime createEmptyInstance() => create();
  static $pb.PbList<EventChatTime> createRepeated() => $pb.PbList<EventChatTime>();
  @$core.pragma('dart2js:noInline')
  static EventChatTime getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EventChatTime>(create);
  static EventChatTime? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get time => $_getI64(1);
  @$pb.TagNumber(2)
  set time($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearTime() => clearField(2);
}

class CHAT_LIST_REC extends $pb.GeneratedMessage {
  factory CHAT_LIST_REC({
    $fixnum.Int64? id,
    $fixnum.Int64? destId,
    DEST_TYPE? destType,
    $fixnum.Int64? idi,
    $core.int? gType,
    CHAT_STATE? state,
    GMEMBER_LTYPE? level,
    $core.String? name,
    $fixnum.Int64? keyId,
    $core.bool? online,
    $fixnum.Int64? rTime,
    $fixnum.Int64? lTime,
    $fixnum.Int64? cTime,
    $core.bool? muted,
    $fixnum.Int64? mutedTime,
    $core.String? draft,
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
    if (idi != null) {
      $result.idi = idi;
    }
    if (gType != null) {
      $result.gType = gType;
    }
    if (state != null) {
      $result.state = state;
    }
    if (level != null) {
      $result.level = level;
    }
    if (name != null) {
      $result.name = name;
    }
    if (keyId != null) {
      $result.keyId = keyId;
    }
    if (online != null) {
      $result.online = online;
    }
    if (rTime != null) {
      $result.rTime = rTime;
    }
    if (lTime != null) {
      $result.lTime = lTime;
    }
    if (cTime != null) {
      $result.cTime = cTime;
    }
    if (muted != null) {
      $result.muted = muted;
    }
    if (mutedTime != null) {
      $result.mutedTime = mutedTime;
    }
    if (draft != null) {
      $result.draft = draft;
    }
    return $result;
  }
  CHAT_LIST_REC._() : super();
  factory CHAT_LIST_REC.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CHAT_LIST_REC.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CHAT_LIST_REC', package: const $pb.PackageName(_omitMessageNames ? '' : 'netLib'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'DestId', $pb.PbFieldType.OU6, protoName: 'DestId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..e<DEST_TYPE>(3, _omitFieldNames ? '' : 'DestType', $pb.PbFieldType.OE, protoName: 'DestType', defaultOrMaker: DEST_TYPE.ABONENT, valueOf: DEST_TYPE.valueOf, enumValues: DEST_TYPE.values)
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : 'Idi', $pb.PbFieldType.OU6, protoName: 'Idi', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'GType', $pb.PbFieldType.OU3, protoName: 'GType')
    ..e<CHAT_STATE>(6, _omitFieldNames ? '' : 'State', $pb.PbFieldType.OE, protoName: 'State', defaultOrMaker: CHAT_STATE.CHAT_WAIT, valueOf: CHAT_STATE.valueOf, enumValues: CHAT_STATE.values)
    ..e<GMEMBER_LTYPE>(7, _omitFieldNames ? '' : 'Level', $pb.PbFieldType.OE, protoName: 'Level', defaultOrMaker: GMEMBER_LTYPE.GM_OWNER, valueOf: GMEMBER_LTYPE.valueOf, enumValues: GMEMBER_LTYPE.values)
    ..aOS(8, _omitFieldNames ? '' : 'Name', protoName: 'Name')
    ..a<$fixnum.Int64>(9, _omitFieldNames ? '' : 'KeyId', $pb.PbFieldType.OU6, protoName: 'KeyId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(10, _omitFieldNames ? '' : 'Online', protoName: 'Online')
    ..a<$fixnum.Int64>(11, _omitFieldNames ? '' : 'RTime', $pb.PbFieldType.OU6, protoName: 'RTime', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(12, _omitFieldNames ? '' : 'LTime', $pb.PbFieldType.OU6, protoName: 'LTime', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(13, _omitFieldNames ? '' : 'CTime', $pb.PbFieldType.OU6, protoName: 'CTime', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(14, _omitFieldNames ? '' : 'Muted', protoName: 'Muted')
    ..a<$fixnum.Int64>(15, _omitFieldNames ? '' : 'MutedTime', $pb.PbFieldType.OU6, protoName: 'Muted_time', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(16, _omitFieldNames ? '' : 'Draft', protoName: 'Draft')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CHAT_LIST_REC clone() => CHAT_LIST_REC()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CHAT_LIST_REC copyWith(void Function(CHAT_LIST_REC) updates) => super.copyWith((message) => updates(message as CHAT_LIST_REC)) as CHAT_LIST_REC;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CHAT_LIST_REC create() => CHAT_LIST_REC._();
  CHAT_LIST_REC createEmptyInstance() => create();
  static $pb.PbList<CHAT_LIST_REC> createRepeated() => $pb.PbList<CHAT_LIST_REC>();
  @$core.pragma('dart2js:noInline')
  static CHAT_LIST_REC getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CHAT_LIST_REC>(create);
  static CHAT_LIST_REC? _defaultInstance;

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
  DEST_TYPE get destType => $_getN(2);
  @$pb.TagNumber(3)
  set destType(DEST_TYPE v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasDestType() => $_has(2);
  @$pb.TagNumber(3)
  void clearDestType() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get idi => $_getI64(3);
  @$pb.TagNumber(4)
  set idi($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIdi() => $_has(3);
  @$pb.TagNumber(4)
  void clearIdi() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get gType => $_getIZ(4);
  @$pb.TagNumber(5)
  set gType($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasGType() => $_has(4);
  @$pb.TagNumber(5)
  void clearGType() => clearField(5);

  @$pb.TagNumber(6)
  CHAT_STATE get state => $_getN(5);
  @$pb.TagNumber(6)
  set state(CHAT_STATE v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasState() => $_has(5);
  @$pb.TagNumber(6)
  void clearState() => clearField(6);

  @$pb.TagNumber(7)
  GMEMBER_LTYPE get level => $_getN(6);
  @$pb.TagNumber(7)
  set level(GMEMBER_LTYPE v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasLevel() => $_has(6);
  @$pb.TagNumber(7)
  void clearLevel() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get name => $_getSZ(7);
  @$pb.TagNumber(8)
  set name($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasName() => $_has(7);
  @$pb.TagNumber(8)
  void clearName() => clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get keyId => $_getI64(8);
  @$pb.TagNumber(9)
  set keyId($fixnum.Int64 v) { $_setInt64(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasKeyId() => $_has(8);
  @$pb.TagNumber(9)
  void clearKeyId() => clearField(9);

  @$pb.TagNumber(10)
  $core.bool get online => $_getBF(9);
  @$pb.TagNumber(10)
  set online($core.bool v) { $_setBool(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasOnline() => $_has(9);
  @$pb.TagNumber(10)
  void clearOnline() => clearField(10);

  @$pb.TagNumber(11)
  $fixnum.Int64 get rTime => $_getI64(10);
  @$pb.TagNumber(11)
  set rTime($fixnum.Int64 v) { $_setInt64(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasRTime() => $_has(10);
  @$pb.TagNumber(11)
  void clearRTime() => clearField(11);

  @$pb.TagNumber(12)
  $fixnum.Int64 get lTime => $_getI64(11);
  @$pb.TagNumber(12)
  set lTime($fixnum.Int64 v) { $_setInt64(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasLTime() => $_has(11);
  @$pb.TagNumber(12)
  void clearLTime() => clearField(12);

  @$pb.TagNumber(13)
  $fixnum.Int64 get cTime => $_getI64(12);
  @$pb.TagNumber(13)
  set cTime($fixnum.Int64 v) { $_setInt64(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasCTime() => $_has(12);
  @$pb.TagNumber(13)
  void clearCTime() => clearField(13);

  @$pb.TagNumber(14)
  $core.bool get muted => $_getBF(13);
  @$pb.TagNumber(14)
  set muted($core.bool v) { $_setBool(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasMuted() => $_has(13);
  @$pb.TagNumber(14)
  void clearMuted() => clearField(14);

  @$pb.TagNumber(15)
  $fixnum.Int64 get mutedTime => $_getI64(14);
  @$pb.TagNumber(15)
  set mutedTime($fixnum.Int64 v) { $_setInt64(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasMutedTime() => $_has(14);
  @$pb.TagNumber(15)
  void clearMutedTime() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get draft => $_getSZ(15);
  @$pb.TagNumber(16)
  set draft($core.String v) { $_setString(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasDraft() => $_has(15);
  @$pb.TagNumber(16)
  void clearDraft() => clearField(16);
}

class CHAT_UNREAD extends $pb.GeneratedMessage {
  factory CHAT_UNREAD({
    $fixnum.Int64? id,
    $fixnum.Int64? rtime,
    $core.int? count,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (rtime != null) {
      $result.rtime = rtime;
    }
    if (count != null) {
      $result.count = count;
    }
    return $result;
  }
  CHAT_UNREAD._() : super();
  factory CHAT_UNREAD.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CHAT_UNREAD.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CHAT_UNREAD', package: const $pb.PackageName(_omitMessageNames ? '' : 'netLib'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'rtime', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'count', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CHAT_UNREAD clone() => CHAT_UNREAD()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CHAT_UNREAD copyWith(void Function(CHAT_UNREAD) updates) => super.copyWith((message) => updates(message as CHAT_UNREAD)) as CHAT_UNREAD;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CHAT_UNREAD create() => CHAT_UNREAD._();
  CHAT_UNREAD createEmptyInstance() => create();
  static $pb.PbList<CHAT_UNREAD> createRepeated() => $pb.PbList<CHAT_UNREAD>();
  @$core.pragma('dart2js:noInline')
  static CHAT_UNREAD getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CHAT_UNREAD>(create);
  static CHAT_UNREAD? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get rtime => $_getI64(1);
  @$pb.TagNumber(2)
  set rtime($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRtime() => $_has(1);
  @$pb.TagNumber(2)
  void clearRtime() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get count => $_getIZ(2);
  @$pb.TagNumber(3)
  set count($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearCount() => clearField(3);
}

class CONTACT_LIST_REC extends $pb.GeneratedMessage {
  factory CONTACT_LIST_REC({
    $fixnum.Int64? id,
    $fixnum.Int64? destId,
    DEST_TYPE? destType,
    $fixnum.Int64? idi,
    $core.String? name,
    $core.String? number,
    $core.bool? online,
    $fixnum.Int64? cTime,
    $fixnum.Int64? mTime,
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
    if (idi != null) {
      $result.idi = idi;
    }
    if (name != null) {
      $result.name = name;
    }
    if (number != null) {
      $result.number = number;
    }
    if (online != null) {
      $result.online = online;
    }
    if (cTime != null) {
      $result.cTime = cTime;
    }
    if (mTime != null) {
      $result.mTime = mTime;
    }
    return $result;
  }
  CONTACT_LIST_REC._() : super();
  factory CONTACT_LIST_REC.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CONTACT_LIST_REC.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CONTACT_LIST_REC', package: const $pb.PackageName(_omitMessageNames ? '' : 'netLib'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'Id', $pb.PbFieldType.QU6, protoName: 'Id', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'DestId', $pb.PbFieldType.QU6, protoName: 'DestId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..e<DEST_TYPE>(3, _omitFieldNames ? '' : 'DestType', $pb.PbFieldType.QE, protoName: 'DestType', defaultOrMaker: DEST_TYPE.ABONENT, valueOf: DEST_TYPE.valueOf, enumValues: DEST_TYPE.values)
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : 'Idi', $pb.PbFieldType.QU6, protoName: 'Idi', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aQS(5, _omitFieldNames ? '' : 'Name', protoName: 'Name')
    ..aQS(6, _omitFieldNames ? '' : 'Number', protoName: 'Number')
    ..a<$core.bool>(7, _omitFieldNames ? '' : 'Online', $pb.PbFieldType.QB, protoName: 'Online')
    ..a<$fixnum.Int64>(8, _omitFieldNames ? '' : 'CTime', $pb.PbFieldType.QU6, protoName: 'CTime', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(9, _omitFieldNames ? '' : 'MTime', $pb.PbFieldType.QU6, protoName: 'MTime', defaultOrMaker: $fixnum.Int64.ZERO)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CONTACT_LIST_REC clone() => CONTACT_LIST_REC()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CONTACT_LIST_REC copyWith(void Function(CONTACT_LIST_REC) updates) => super.copyWith((message) => updates(message as CONTACT_LIST_REC)) as CONTACT_LIST_REC;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CONTACT_LIST_REC create() => CONTACT_LIST_REC._();
  CONTACT_LIST_REC createEmptyInstance() => create();
  static $pb.PbList<CONTACT_LIST_REC> createRepeated() => $pb.PbList<CONTACT_LIST_REC>();
  @$core.pragma('dart2js:noInline')
  static CONTACT_LIST_REC getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CONTACT_LIST_REC>(create);
  static CONTACT_LIST_REC? _defaultInstance;

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
  DEST_TYPE get destType => $_getN(2);
  @$pb.TagNumber(3)
  set destType(DEST_TYPE v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasDestType() => $_has(2);
  @$pb.TagNumber(3)
  void clearDestType() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get idi => $_getI64(3);
  @$pb.TagNumber(4)
  set idi($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIdi() => $_has(3);
  @$pb.TagNumber(4)
  void clearIdi() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get name => $_getSZ(4);
  @$pb.TagNumber(5)
  set name($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasName() => $_has(4);
  @$pb.TagNumber(5)
  void clearName() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get number => $_getSZ(5);
  @$pb.TagNumber(6)
  set number($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasNumber() => $_has(5);
  @$pb.TagNumber(6)
  void clearNumber() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get online => $_getBF(6);
  @$pb.TagNumber(7)
  set online($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasOnline() => $_has(6);
  @$pb.TagNumber(7)
  void clearOnline() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get cTime => $_getI64(7);
  @$pb.TagNumber(8)
  set cTime($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasCTime() => $_has(7);
  @$pb.TagNumber(8)
  void clearCTime() => clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get mTime => $_getI64(8);
  @$pb.TagNumber(9)
  set mTime($fixnum.Int64 v) { $_setInt64(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasMTime() => $_has(8);
  @$pb.TagNumber(9)
  void clearMTime() => clearField(9);
}

class EventListRec extends $pb.GeneratedMessage {
  factory EventListRec({
    $fixnum.Int64? id,
    $fixnum.Int64? destId,
    DEST_TYPE? destType,
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
    return $result;
  }
  EventListRec._() : super();
  factory EventListRec.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EventListRec.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EventListRec', package: const $pb.PackageName(_omitMessageNames ? '' : 'netLib'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'Id', $pb.PbFieldType.QU6, protoName: 'Id', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'DestId', $pb.PbFieldType.QU6, protoName: 'DestId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..e<DEST_TYPE>(3, _omitFieldNames ? '' : 'DestType', $pb.PbFieldType.QE, protoName: 'DestType', defaultOrMaker: DEST_TYPE.ABONENT, valueOf: DEST_TYPE.valueOf, enumValues: DEST_TYPE.values)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EventListRec clone() => EventListRec()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EventListRec copyWith(void Function(EventListRec) updates) => super.copyWith((message) => updates(message as EventListRec)) as EventListRec;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EventListRec create() => EventListRec._();
  EventListRec createEmptyInstance() => create();
  static $pb.PbList<EventListRec> createRepeated() => $pb.PbList<EventListRec>();
  @$core.pragma('dart2js:noInline')
  static EventListRec getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EventListRec>(create);
  static EventListRec? _defaultInstance;

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
  DEST_TYPE get destType => $_getN(2);
  @$pb.TagNumber(3)
  set destType(DEST_TYPE v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasDestType() => $_has(2);
  @$pb.TagNumber(3)
  void clearDestType() => clearField(3);
}

class ABONENT_INFO extends $pb.GeneratedMessage {
  factory ABONENT_INFO({
    $fixnum.Int64? id,
    $fixnum.Int64? idi,
    $fixnum.Int64? cTime,
    $fixnum.Int64? mTime,
    $core.bool? hide,
    $core.int? passMode,
    $core.bool? passLoginSet,
    $core.bool? passMsgNotTrivial,
    $fixnum.Int64? mKey,
    $core.String? name,
    $core.String? secondName,
    $core.String? email,
    $core.bool? emailConfirmed,
    $core.String? phone,
    $core.bool? phoneConfirmed,
    $core.String? address,
    $core.String? about,
    $core.String? email2,
    $core.bool? email2Confirmed,
    $core.String? phone2,
    $core.bool? phone2Confirmed,
    $core.bool? online,
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
    if (mTime != null) {
      $result.mTime = mTime;
    }
    if (hide != null) {
      $result.hide = hide;
    }
    if (passMode != null) {
      $result.passMode = passMode;
    }
    if (passLoginSet != null) {
      $result.passLoginSet = passLoginSet;
    }
    if (passMsgNotTrivial != null) {
      $result.passMsgNotTrivial = passMsgNotTrivial;
    }
    if (mKey != null) {
      $result.mKey = mKey;
    }
    if (name != null) {
      $result.name = name;
    }
    if (secondName != null) {
      $result.secondName = secondName;
    }
    if (email != null) {
      $result.email = email;
    }
    if (emailConfirmed != null) {
      $result.emailConfirmed = emailConfirmed;
    }
    if (phone != null) {
      $result.phone = phone;
    }
    if (phoneConfirmed != null) {
      $result.phoneConfirmed = phoneConfirmed;
    }
    if (address != null) {
      $result.address = address;
    }
    if (about != null) {
      $result.about = about;
    }
    if (email2 != null) {
      $result.email2 = email2;
    }
    if (email2Confirmed != null) {
      $result.email2Confirmed = email2Confirmed;
    }
    if (phone2 != null) {
      $result.phone2 = phone2;
    }
    if (phone2Confirmed != null) {
      $result.phone2Confirmed = phone2Confirmed;
    }
    if (online != null) {
      $result.online = online;
    }
    return $result;
  }
  ABONENT_INFO._() : super();
  factory ABONENT_INFO.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ABONENT_INFO.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ABONENT_INFO', package: const $pb.PackageName(_omitMessageNames ? '' : 'netLib'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'Id', $pb.PbFieldType.QU6, protoName: 'Id', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'Idi', $pb.PbFieldType.QU6, protoName: 'Idi', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'CTime', $pb.PbFieldType.QU6, protoName: 'CTime', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : 'MTime', $pb.PbFieldType.QU6, protoName: 'MTime', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.bool>(5, _omitFieldNames ? '' : 'Hide', $pb.PbFieldType.QB, protoName: 'Hide')
    ..a<$core.int>(6, _omitFieldNames ? '' : 'PassMode', $pb.PbFieldType.QU3, protoName: 'PassMode')
    ..a<$core.bool>(7, _omitFieldNames ? '' : 'PassLoginSet', $pb.PbFieldType.QB, protoName: 'PassLoginSet')
    ..a<$core.bool>(8, _omitFieldNames ? '' : 'PassMsgNotTrivial', $pb.PbFieldType.QB, protoName: 'PassMsgNotTrivial')
    ..a<$fixnum.Int64>(9, _omitFieldNames ? '' : 'MKey', $pb.PbFieldType.QU6, protoName: 'MKey', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aQS(10, _omitFieldNames ? '' : 'Name', protoName: 'Name')
    ..aQS(11, _omitFieldNames ? '' : 'SecondName', protoName: 'SecondName')
    ..aQS(12, _omitFieldNames ? '' : 'Email', protoName: 'Email')
    ..a<$core.bool>(13, _omitFieldNames ? '' : 'EmailConfirmed', $pb.PbFieldType.QB, protoName: 'EmailConfirmed')
    ..aQS(14, _omitFieldNames ? '' : 'Phone', protoName: 'Phone')
    ..a<$core.bool>(15, _omitFieldNames ? '' : 'PhoneConfirmed', $pb.PbFieldType.QB, protoName: 'PhoneConfirmed')
    ..aQS(16, _omitFieldNames ? '' : 'Address', protoName: 'Address')
    ..aQS(17, _omitFieldNames ? '' : 'About', protoName: 'About')
    ..aQS(18, _omitFieldNames ? '' : 'Email2', protoName: 'Email2')
    ..a<$core.bool>(19, _omitFieldNames ? '' : 'Email2Confirmed', $pb.PbFieldType.QB, protoName: 'Email2Confirmed')
    ..aQS(20, _omitFieldNames ? '' : 'Phone2', protoName: 'Phone2')
    ..a<$core.bool>(21, _omitFieldNames ? '' : 'Phone2Confirmed', $pb.PbFieldType.QB, protoName: 'Phone2Confirmed')
    ..a<$core.bool>(22, _omitFieldNames ? '' : 'Online', $pb.PbFieldType.QB, protoName: 'Online')
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ABONENT_INFO clone() => ABONENT_INFO()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ABONENT_INFO copyWith(void Function(ABONENT_INFO) updates) => super.copyWith((message) => updates(message as ABONENT_INFO)) as ABONENT_INFO;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ABONENT_INFO create() => ABONENT_INFO._();
  ABONENT_INFO createEmptyInstance() => create();
  static $pb.PbList<ABONENT_INFO> createRepeated() => $pb.PbList<ABONENT_INFO>();
  @$core.pragma('dart2js:noInline')
  static ABONENT_INFO getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ABONENT_INFO>(create);
  static ABONENT_INFO? _defaultInstance;

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
  $fixnum.Int64 get mTime => $_getI64(3);
  @$pb.TagNumber(4)
  set mTime($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearMTime() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get hide => $_getBF(4);
  @$pb.TagNumber(5)
  set hide($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasHide() => $_has(4);
  @$pb.TagNumber(5)
  void clearHide() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get passMode => $_getIZ(5);
  @$pb.TagNumber(6)
  set passMode($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasPassMode() => $_has(5);
  @$pb.TagNumber(6)
  void clearPassMode() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get passLoginSet => $_getBF(6);
  @$pb.TagNumber(7)
  set passLoginSet($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasPassLoginSet() => $_has(6);
  @$pb.TagNumber(7)
  void clearPassLoginSet() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get passMsgNotTrivial => $_getBF(7);
  @$pb.TagNumber(8)
  set passMsgNotTrivial($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasPassMsgNotTrivial() => $_has(7);
  @$pb.TagNumber(8)
  void clearPassMsgNotTrivial() => clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get mKey => $_getI64(8);
  @$pb.TagNumber(9)
  set mKey($fixnum.Int64 v) { $_setInt64(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasMKey() => $_has(8);
  @$pb.TagNumber(9)
  void clearMKey() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get name => $_getSZ(9);
  @$pb.TagNumber(10)
  set name($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasName() => $_has(9);
  @$pb.TagNumber(10)
  void clearName() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get secondName => $_getSZ(10);
  @$pb.TagNumber(11)
  set secondName($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasSecondName() => $_has(10);
  @$pb.TagNumber(11)
  void clearSecondName() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get email => $_getSZ(11);
  @$pb.TagNumber(12)
  set email($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasEmail() => $_has(11);
  @$pb.TagNumber(12)
  void clearEmail() => clearField(12);

  @$pb.TagNumber(13)
  $core.bool get emailConfirmed => $_getBF(12);
  @$pb.TagNumber(13)
  set emailConfirmed($core.bool v) { $_setBool(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasEmailConfirmed() => $_has(12);
  @$pb.TagNumber(13)
  void clearEmailConfirmed() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get phone => $_getSZ(13);
  @$pb.TagNumber(14)
  set phone($core.String v) { $_setString(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasPhone() => $_has(13);
  @$pb.TagNumber(14)
  void clearPhone() => clearField(14);

  @$pb.TagNumber(15)
  $core.bool get phoneConfirmed => $_getBF(14);
  @$pb.TagNumber(15)
  set phoneConfirmed($core.bool v) { $_setBool(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasPhoneConfirmed() => $_has(14);
  @$pb.TagNumber(15)
  void clearPhoneConfirmed() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get address => $_getSZ(15);
  @$pb.TagNumber(16)
  set address($core.String v) { $_setString(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasAddress() => $_has(15);
  @$pb.TagNumber(16)
  void clearAddress() => clearField(16);

  @$pb.TagNumber(17)
  $core.String get about => $_getSZ(16);
  @$pb.TagNumber(17)
  set about($core.String v) { $_setString(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasAbout() => $_has(16);
  @$pb.TagNumber(17)
  void clearAbout() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get email2 => $_getSZ(17);
  @$pb.TagNumber(18)
  set email2($core.String v) { $_setString(17, v); }
  @$pb.TagNumber(18)
  $core.bool hasEmail2() => $_has(17);
  @$pb.TagNumber(18)
  void clearEmail2() => clearField(18);

  @$pb.TagNumber(19)
  $core.bool get email2Confirmed => $_getBF(18);
  @$pb.TagNumber(19)
  set email2Confirmed($core.bool v) { $_setBool(18, v); }
  @$pb.TagNumber(19)
  $core.bool hasEmail2Confirmed() => $_has(18);
  @$pb.TagNumber(19)
  void clearEmail2Confirmed() => clearField(19);

  @$pb.TagNumber(20)
  $core.String get phone2 => $_getSZ(19);
  @$pb.TagNumber(20)
  set phone2($core.String v) { $_setString(19, v); }
  @$pb.TagNumber(20)
  $core.bool hasPhone2() => $_has(19);
  @$pb.TagNumber(20)
  void clearPhone2() => clearField(20);

  @$pb.TagNumber(21)
  $core.bool get phone2Confirmed => $_getBF(20);
  @$pb.TagNumber(21)
  set phone2Confirmed($core.bool v) { $_setBool(20, v); }
  @$pb.TagNumber(21)
  $core.bool hasPhone2Confirmed() => $_has(20);
  @$pb.TagNumber(21)
  void clearPhone2Confirmed() => clearField(21);

  @$pb.TagNumber(22)
  $core.bool get online => $_getBF(21);
  @$pb.TagNumber(22)
  set online($core.bool v) { $_setBool(21, v); }
  @$pb.TagNumber(22)
  $core.bool hasOnline() => $_has(21);
  @$pb.TagNumber(22)
  void clearOnline() => clearField(22);
}

class IconResult extends $pb.GeneratedMessage {
  factory IconResult({
    $core.Iterable<$core.int>? bitmap,
    $fixnum.Int64? id,
    DEST_TYPE? type,
    IconSizeType? size,
    ERROR_CODE? code,
  }) {
    final $result = create();
    if (bitmap != null) {
      $result.bitmap.addAll(bitmap);
    }
    if (id != null) {
      $result.id = id;
    }
    if (type != null) {
      $result.type = type;
    }
    if (size != null) {
      $result.size = size;
    }
    if (code != null) {
      $result.code = code;
    }
    return $result;
  }
  IconResult._() : super();
  factory IconResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IconResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'IconResult', package: const $pb.PackageName(_omitMessageNames ? '' : 'netLib'), createEmptyInstance: create)
    ..p<$core.int>(1, _omitFieldNames ? '' : 'bitmap', $pb.PbFieldType.PU3)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'id', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..e<DEST_TYPE>(3, _omitFieldNames ? '' : 'type', $pb.PbFieldType.QE, defaultOrMaker: DEST_TYPE.ABONENT, valueOf: DEST_TYPE.valueOf, enumValues: DEST_TYPE.values)
    ..e<IconSizeType>(4, _omitFieldNames ? '' : 'size', $pb.PbFieldType.QE, defaultOrMaker: IconSizeType.Small, valueOf: IconSizeType.valueOf, enumValues: IconSizeType.values)
    ..e<ERROR_CODE>(5, _omitFieldNames ? '' : 'code', $pb.PbFieldType.QE, defaultOrMaker: ERROR_CODE.ERR_OK, valueOf: ERROR_CODE.valueOf, enumValues: ERROR_CODE.values)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IconResult clone() => IconResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IconResult copyWith(void Function(IconResult) updates) => super.copyWith((message) => updates(message as IconResult)) as IconResult;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IconResult create() => IconResult._();
  IconResult createEmptyInstance() => create();
  static $pb.PbList<IconResult> createRepeated() => $pb.PbList<IconResult>();
  @$core.pragma('dart2js:noInline')
  static IconResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IconResult>(create);
  static IconResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get bitmap => $_getList(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get id => $_getI64(1);
  @$pb.TagNumber(2)
  set id($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);

  @$pb.TagNumber(3)
  DEST_TYPE get type => $_getN(2);
  @$pb.TagNumber(3)
  set type(DEST_TYPE v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => clearField(3);

  @$pb.TagNumber(4)
  IconSizeType get size => $_getN(3);
  @$pb.TagNumber(4)
  set size(IconSizeType v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasSize() => $_has(3);
  @$pb.TagNumber(4)
  void clearSize() => clearField(4);

  @$pb.TagNumber(5)
  ERROR_CODE get code => $_getN(4);
  @$pb.TagNumber(5)
  set code(ERROR_CODE v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasCode() => $_has(4);
  @$pb.TagNumber(5)
  void clearCode() => clearField(5);
}

class IconRequst extends $pb.GeneratedMessage {
  factory IconRequst({
    $fixnum.Int64? id,
    DEST_TYPE? type,
    IconSizeType? size,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (type != null) {
      $result.type = type;
    }
    if (size != null) {
      $result.size = size;
    }
    return $result;
  }
  IconRequst._() : super();
  factory IconRequst.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IconRequst.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'IconRequst', package: const $pb.PackageName(_omitMessageNames ? '' : 'netLib'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'id', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..e<DEST_TYPE>(3, _omitFieldNames ? '' : 'type', $pb.PbFieldType.QE, defaultOrMaker: DEST_TYPE.ABONENT, valueOf: DEST_TYPE.valueOf, enumValues: DEST_TYPE.values)
    ..e<IconSizeType>(4, _omitFieldNames ? '' : 'size', $pb.PbFieldType.QE, defaultOrMaker: IconSizeType.Small, valueOf: IconSizeType.valueOf, enumValues: IconSizeType.values)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IconRequst clone() => IconRequst()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IconRequst copyWith(void Function(IconRequst) updates) => super.copyWith((message) => updates(message as IconRequst)) as IconRequst;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IconRequst create() => IconRequst._();
  IconRequst createEmptyInstance() => create();
  static $pb.PbList<IconRequst> createRepeated() => $pb.PbList<IconRequst>();
  @$core.pragma('dart2js:noInline')
  static IconRequst getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IconRequst>(create);
  static IconRequst? _defaultInstance;

  @$pb.TagNumber(2)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(2)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);

  @$pb.TagNumber(3)
  DEST_TYPE get type => $_getN(1);
  @$pb.TagNumber(3)
  set type(DEST_TYPE v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(3)
  void clearType() => clearField(3);

  @$pb.TagNumber(4)
  IconSizeType get size => $_getN(2);
  @$pb.TagNumber(4)
  set size(IconSizeType v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasSize() => $_has(2);
  @$pb.TagNumber(4)
  void clearSize() => clearField(4);
}

class MEMBER_LIST_REC extends $pb.GeneratedMessage {
  factory MEMBER_LIST_REC({
    $fixnum.Int64? abonentId,
    GMEMBER_LTYPE? gMLevel,
    $core.int? state,
    $fixnum.Int64? rTime,
  }) {
    final $result = create();
    if (abonentId != null) {
      $result.abonentId = abonentId;
    }
    if (gMLevel != null) {
      $result.gMLevel = gMLevel;
    }
    if (state != null) {
      $result.state = state;
    }
    if (rTime != null) {
      $result.rTime = rTime;
    }
    return $result;
  }
  MEMBER_LIST_REC._() : super();
  factory MEMBER_LIST_REC.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MEMBER_LIST_REC.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MEMBER_LIST_REC', package: const $pb.PackageName(_omitMessageNames ? '' : 'netLib'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'AbonentId', $pb.PbFieldType.QU6, protoName: 'AbonentId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..e<GMEMBER_LTYPE>(2, _omitFieldNames ? '' : 'GMLevel', $pb.PbFieldType.QE, protoName: 'GMLevel', defaultOrMaker: GMEMBER_LTYPE.GM_OWNER, valueOf: GMEMBER_LTYPE.valueOf, enumValues: GMEMBER_LTYPE.values)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'State', $pb.PbFieldType.Q3, protoName: 'State')
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : 'RTime', $pb.PbFieldType.QU6, protoName: 'RTime', defaultOrMaker: $fixnum.Int64.ZERO)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MEMBER_LIST_REC clone() => MEMBER_LIST_REC()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MEMBER_LIST_REC copyWith(void Function(MEMBER_LIST_REC) updates) => super.copyWith((message) => updates(message as MEMBER_LIST_REC)) as MEMBER_LIST_REC;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MEMBER_LIST_REC create() => MEMBER_LIST_REC._();
  MEMBER_LIST_REC createEmptyInstance() => create();
  static $pb.PbList<MEMBER_LIST_REC> createRepeated() => $pb.PbList<MEMBER_LIST_REC>();
  @$core.pragma('dart2js:noInline')
  static MEMBER_LIST_REC getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MEMBER_LIST_REC>(create);
  static MEMBER_LIST_REC? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get abonentId => $_getI64(0);
  @$pb.TagNumber(1)
  set abonentId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAbonentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAbonentId() => clearField(1);

  @$pb.TagNumber(2)
  GMEMBER_LTYPE get gMLevel => $_getN(1);
  @$pb.TagNumber(2)
  set gMLevel(GMEMBER_LTYPE v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasGMLevel() => $_has(1);
  @$pb.TagNumber(2)
  void clearGMLevel() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get state => $_getIZ(2);
  @$pb.TagNumber(3)
  set state($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasState() => $_has(2);
  @$pb.TagNumber(3)
  void clearState() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get rTime => $_getI64(3);
  @$pb.TagNumber(4)
  set rTime($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearRTime() => clearField(4);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');

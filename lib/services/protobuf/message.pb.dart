//
//  Generated code. Do not modify.
//  source: message.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'message.pbenum.dart';
import 'netlib.pb.dart' as $0;
import 'netlib.pbenum.dart' as $0;

export 'message.pbenum.dart';

class T_MessageRec extends $pb.GeneratedMessage {
  factory T_MessageRec({
    $fixnum.Int64? idm,
    $fixnum.Int64? toId,
    $fixnum.Int64? fromId,
    $0.DEST_TYPE? destType,
    $0.MSG_TYPE? mtype,
    $0.MSG_STATE? state,
    $fixnum.Int64? ctime,
    $fixnum.Int64? etime,
    $fixnum.Int64? sendId,
    $core.String? rawMsg,
    $core.String? msg,
    $core.bool? withFile,
    $core.bool? withForward,
    $core.bool? withChattEvent,
    $core.bool? withReply,
    T_ForwardRec? forward,
    MTCahtEvent? event,
    T_QuotedRec? quoteRec,
    T_FileRec? fileRec,
  }) {
    final $result = create();
    if (idm != null) {
      $result.idm = idm;
    }
    if (toId != null) {
      $result.toId = toId;
    }
    if (fromId != null) {
      $result.fromId = fromId;
    }
    if (destType != null) {
      $result.destType = destType;
    }
    if (mtype != null) {
      $result.mtype = mtype;
    }
    if (state != null) {
      $result.state = state;
    }
    if (ctime != null) {
      $result.ctime = ctime;
    }
    if (etime != null) {
      $result.etime = etime;
    }
    if (sendId != null) {
      $result.sendId = sendId;
    }
    if (rawMsg != null) {
      $result.rawMsg = rawMsg;
    }
    if (msg != null) {
      $result.msg = msg;
    }
    if (withFile != null) {
      $result.withFile = withFile;
    }
    if (withForward != null) {
      $result.withForward = withForward;
    }
    if (withChattEvent != null) {
      $result.withChattEvent = withChattEvent;
    }
    if (withReply != null) {
      $result.withReply = withReply;
    }
    if (forward != null) {
      $result.forward = forward;
    }
    if (event != null) {
      $result.event = event;
    }
    if (quoteRec != null) {
      $result.quoteRec = quoteRec;
    }
    if (fileRec != null) {
      $result.fileRec = fileRec;
    }
    return $result;
  }
  T_MessageRec._() : super();
  factory T_MessageRec.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory T_MessageRec.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'T_MessageRec', package: const $pb.PackageName(_omitMessageNames ? '' : 'message'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'idm', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'toId', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'fromId', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..e<$0.DEST_TYPE>(4, _omitFieldNames ? '' : 'destType', $pb.PbFieldType.QE, protoName: 'destType', defaultOrMaker: $0.DEST_TYPE.ABONENT, valueOf: $0.DEST_TYPE.valueOf, enumValues: $0.DEST_TYPE.values)
    ..e<$0.MSG_TYPE>(5, _omitFieldNames ? '' : 'mtype', $pb.PbFieldType.QE, defaultOrMaker: $0.MSG_TYPE.MSG_ANY, valueOf: $0.MSG_TYPE.valueOf, enumValues: $0.MSG_TYPE.values)
    ..e<$0.MSG_STATE>(6, _omitFieldNames ? '' : 'state', $pb.PbFieldType.QE, defaultOrMaker: $0.MSG_STATE.MSG_UNSENT, valueOf: $0.MSG_STATE.valueOf, enumValues: $0.MSG_STATE.values)
    ..a<$fixnum.Int64>(7, _omitFieldNames ? '' : 'ctime', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(8, _omitFieldNames ? '' : 'etime', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(9, _omitFieldNames ? '' : 'sendId', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aQS(11, _omitFieldNames ? '' : 'rawMsg')
    ..aQS(12, _omitFieldNames ? '' : 'msg')
    ..a<$core.bool>(13, _omitFieldNames ? '' : 'withFile', $pb.PbFieldType.QB)
    ..a<$core.bool>(14, _omitFieldNames ? '' : 'withForward', $pb.PbFieldType.QB)
    ..a<$core.bool>(15, _omitFieldNames ? '' : 'withChattEvent', $pb.PbFieldType.QB)
    ..a<$core.bool>(16, _omitFieldNames ? '' : 'withReply', $pb.PbFieldType.QB)
    ..aOM<T_ForwardRec>(17, _omitFieldNames ? '' : 'forward', subBuilder: T_ForwardRec.create)
    ..aOM<MTCahtEvent>(18, _omitFieldNames ? '' : 'event', subBuilder: MTCahtEvent.create)
    ..aOM<T_QuotedRec>(19, _omitFieldNames ? '' : 'quoteRec', subBuilder: T_QuotedRec.create)
    ..aOM<T_FileRec>(20, _omitFieldNames ? '' : 'fileRec', subBuilder: T_FileRec.create)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  T_MessageRec clone() => T_MessageRec()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  T_MessageRec copyWith(void Function(T_MessageRec) updates) => super.copyWith((message) => updates(message as T_MessageRec)) as T_MessageRec;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static T_MessageRec create() => T_MessageRec._();
  T_MessageRec createEmptyInstance() => create();
  static $pb.PbList<T_MessageRec> createRepeated() => $pb.PbList<T_MessageRec>();
  @$core.pragma('dart2js:noInline')
  static T_MessageRec getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<T_MessageRec>(create);
  static T_MessageRec? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get idm => $_getI64(0);
  @$pb.TagNumber(1)
  set idm($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIdm() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdm() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get toId => $_getI64(1);
  @$pb.TagNumber(2)
  set toId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasToId() => $_has(1);
  @$pb.TagNumber(2)
  void clearToId() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get fromId => $_getI64(2);
  @$pb.TagNumber(3)
  set fromId($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFromId() => $_has(2);
  @$pb.TagNumber(3)
  void clearFromId() => clearField(3);

  @$pb.TagNumber(4)
  $0.DEST_TYPE get destType => $_getN(3);
  @$pb.TagNumber(4)
  set destType($0.DEST_TYPE v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasDestType() => $_has(3);
  @$pb.TagNumber(4)
  void clearDestType() => clearField(4);

  @$pb.TagNumber(5)
  $0.MSG_TYPE get mtype => $_getN(4);
  @$pb.TagNumber(5)
  set mtype($0.MSG_TYPE v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasMtype() => $_has(4);
  @$pb.TagNumber(5)
  void clearMtype() => clearField(5);

  @$pb.TagNumber(6)
  $0.MSG_STATE get state => $_getN(5);
  @$pb.TagNumber(6)
  set state($0.MSG_STATE v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasState() => $_has(5);
  @$pb.TagNumber(6)
  void clearState() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get ctime => $_getI64(6);
  @$pb.TagNumber(7)
  set ctime($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasCtime() => $_has(6);
  @$pb.TagNumber(7)
  void clearCtime() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get etime => $_getI64(7);
  @$pb.TagNumber(8)
  set etime($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasEtime() => $_has(7);
  @$pb.TagNumber(8)
  void clearEtime() => clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get sendId => $_getI64(8);
  @$pb.TagNumber(9)
  set sendId($fixnum.Int64 v) { $_setInt64(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasSendId() => $_has(8);
  @$pb.TagNumber(9)
  void clearSendId() => clearField(9);

  @$pb.TagNumber(11)
  $core.String get rawMsg => $_getSZ(9);
  @$pb.TagNumber(11)
  set rawMsg($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(11)
  $core.bool hasRawMsg() => $_has(9);
  @$pb.TagNumber(11)
  void clearRawMsg() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get msg => $_getSZ(10);
  @$pb.TagNumber(12)
  set msg($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(12)
  $core.bool hasMsg() => $_has(10);
  @$pb.TagNumber(12)
  void clearMsg() => clearField(12);

  @$pb.TagNumber(13)
  $core.bool get withFile => $_getBF(11);
  @$pb.TagNumber(13)
  set withFile($core.bool v) { $_setBool(11, v); }
  @$pb.TagNumber(13)
  $core.bool hasWithFile() => $_has(11);
  @$pb.TagNumber(13)
  void clearWithFile() => clearField(13);

  @$pb.TagNumber(14)
  $core.bool get withForward => $_getBF(12);
  @$pb.TagNumber(14)
  set withForward($core.bool v) { $_setBool(12, v); }
  @$pb.TagNumber(14)
  $core.bool hasWithForward() => $_has(12);
  @$pb.TagNumber(14)
  void clearWithForward() => clearField(14);

  @$pb.TagNumber(15)
  $core.bool get withChattEvent => $_getBF(13);
  @$pb.TagNumber(15)
  set withChattEvent($core.bool v) { $_setBool(13, v); }
  @$pb.TagNumber(15)
  $core.bool hasWithChattEvent() => $_has(13);
  @$pb.TagNumber(15)
  void clearWithChattEvent() => clearField(15);

  @$pb.TagNumber(16)
  $core.bool get withReply => $_getBF(14);
  @$pb.TagNumber(16)
  set withReply($core.bool v) { $_setBool(14, v); }
  @$pb.TagNumber(16)
  $core.bool hasWithReply() => $_has(14);
  @$pb.TagNumber(16)
  void clearWithReply() => clearField(16);

  @$pb.TagNumber(17)
  T_ForwardRec get forward => $_getN(15);
  @$pb.TagNumber(17)
  set forward(T_ForwardRec v) { setField(17, v); }
  @$pb.TagNumber(17)
  $core.bool hasForward() => $_has(15);
  @$pb.TagNumber(17)
  void clearForward() => clearField(17);
  @$pb.TagNumber(17)
  T_ForwardRec ensureForward() => $_ensure(15);

  @$pb.TagNumber(18)
  MTCahtEvent get event => $_getN(16);
  @$pb.TagNumber(18)
  set event(MTCahtEvent v) { setField(18, v); }
  @$pb.TagNumber(18)
  $core.bool hasEvent() => $_has(16);
  @$pb.TagNumber(18)
  void clearEvent() => clearField(18);
  @$pb.TagNumber(18)
  MTCahtEvent ensureEvent() => $_ensure(16);

  @$pb.TagNumber(19)
  T_QuotedRec get quoteRec => $_getN(17);
  @$pb.TagNumber(19)
  set quoteRec(T_QuotedRec v) { setField(19, v); }
  @$pb.TagNumber(19)
  $core.bool hasQuoteRec() => $_has(17);
  @$pb.TagNumber(19)
  void clearQuoteRec() => clearField(19);
  @$pb.TagNumber(19)
  T_QuotedRec ensureQuoteRec() => $_ensure(17);

  @$pb.TagNumber(20)
  T_FileRec get fileRec => $_getN(18);
  @$pb.TagNumber(20)
  set fileRec(T_FileRec v) { setField(20, v); }
  @$pb.TagNumber(20)
  $core.bool hasFileRec() => $_has(18);
  @$pb.TagNumber(20)
  void clearFileRec() => clearField(20);
  @$pb.TagNumber(20)
  T_FileRec ensureFileRec() => $_ensure(18);
}

class T_ForwardRec extends $pb.GeneratedMessage {
  factory T_ForwardRec({
    $fixnum.Int64? ida,
    $fixnum.Int64? idm,
    $fixnum.Int64? cnt,
    $fixnum.Int64? time,
    $core.String? msg,
    $core.bool? withFile,
    $core.bool? withQuote,
    $core.bool? withForward,
    T_FileRec? fileRec,
    T_QuotedRec? quoteRec,
    T_ForwardRec? forward,
  }) {
    final $result = create();
    if (ida != null) {
      $result.ida = ida;
    }
    if (idm != null) {
      $result.idm = idm;
    }
    if (cnt != null) {
      $result.cnt = cnt;
    }
    if (time != null) {
      $result.time = time;
    }
    if (msg != null) {
      $result.msg = msg;
    }
    if (withFile != null) {
      $result.withFile = withFile;
    }
    if (withQuote != null) {
      $result.withQuote = withQuote;
    }
    if (withForward != null) {
      $result.withForward = withForward;
    }
    if (fileRec != null) {
      $result.fileRec = fileRec;
    }
    if (quoteRec != null) {
      $result.quoteRec = quoteRec;
    }
    if (forward != null) {
      $result.forward = forward;
    }
    return $result;
  }
  T_ForwardRec._() : super();
  factory T_ForwardRec.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory T_ForwardRec.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'T_ForwardRec', package: const $pb.PackageName(_omitMessageNames ? '' : 'message'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'ida', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'idm', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'cnt', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : 'time', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aQS(5, _omitFieldNames ? '' : 'msg')
    ..a<$core.bool>(6, _omitFieldNames ? '' : 'withFile', $pb.PbFieldType.QB, protoName: 'withFile')
    ..a<$core.bool>(7, _omitFieldNames ? '' : 'withQuote', $pb.PbFieldType.QB, protoName: 'withQuote')
    ..a<$core.bool>(8, _omitFieldNames ? '' : 'withForward', $pb.PbFieldType.QB, protoName: 'withForward')
    ..aOM<T_FileRec>(9, _omitFieldNames ? '' : 'fileRec', protoName: 'fileRec', subBuilder: T_FileRec.create)
    ..aOM<T_QuotedRec>(10, _omitFieldNames ? '' : 'quoteRec', protoName: 'quoteRec', subBuilder: T_QuotedRec.create)
    ..aOM<T_ForwardRec>(11, _omitFieldNames ? '' : 'forward', subBuilder: T_ForwardRec.create)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  T_ForwardRec clone() => T_ForwardRec()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  T_ForwardRec copyWith(void Function(T_ForwardRec) updates) => super.copyWith((message) => updates(message as T_ForwardRec)) as T_ForwardRec;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static T_ForwardRec create() => T_ForwardRec._();
  T_ForwardRec createEmptyInstance() => create();
  static $pb.PbList<T_ForwardRec> createRepeated() => $pb.PbList<T_ForwardRec>();
  @$core.pragma('dart2js:noInline')
  static T_ForwardRec getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<T_ForwardRec>(create);
  static T_ForwardRec? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get ida => $_getI64(0);
  @$pb.TagNumber(1)
  set ida($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIda() => $_has(0);
  @$pb.TagNumber(1)
  void clearIda() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get idm => $_getI64(1);
  @$pb.TagNumber(2)
  set idm($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIdm() => $_has(1);
  @$pb.TagNumber(2)
  void clearIdm() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get cnt => $_getI64(2);
  @$pb.TagNumber(3)
  set cnt($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCnt() => $_has(2);
  @$pb.TagNumber(3)
  void clearCnt() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get time => $_getI64(3);
  @$pb.TagNumber(4)
  set time($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearTime() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get msg => $_getSZ(4);
  @$pb.TagNumber(5)
  set msg($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasMsg() => $_has(4);
  @$pb.TagNumber(5)
  void clearMsg() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get withFile => $_getBF(5);
  @$pb.TagNumber(6)
  set withFile($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasWithFile() => $_has(5);
  @$pb.TagNumber(6)
  void clearWithFile() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get withQuote => $_getBF(6);
  @$pb.TagNumber(7)
  set withQuote($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasWithQuote() => $_has(6);
  @$pb.TagNumber(7)
  void clearWithQuote() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get withForward => $_getBF(7);
  @$pb.TagNumber(8)
  set withForward($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasWithForward() => $_has(7);
  @$pb.TagNumber(8)
  void clearWithForward() => clearField(8);

  @$pb.TagNumber(9)
  T_FileRec get fileRec => $_getN(8);
  @$pb.TagNumber(9)
  set fileRec(T_FileRec v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasFileRec() => $_has(8);
  @$pb.TagNumber(9)
  void clearFileRec() => clearField(9);
  @$pb.TagNumber(9)
  T_FileRec ensureFileRec() => $_ensure(8);

  @$pb.TagNumber(10)
  T_QuotedRec get quoteRec => $_getN(9);
  @$pb.TagNumber(10)
  set quoteRec(T_QuotedRec v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasQuoteRec() => $_has(9);
  @$pb.TagNumber(10)
  void clearQuoteRec() => clearField(10);
  @$pb.TagNumber(10)
  T_QuotedRec ensureQuoteRec() => $_ensure(9);

  @$pb.TagNumber(11)
  T_ForwardRec get forward => $_getN(10);
  @$pb.TagNumber(11)
  set forward(T_ForwardRec v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasForward() => $_has(10);
  @$pb.TagNumber(11)
  void clearForward() => clearField(11);
  @$pb.TagNumber(11)
  T_ForwardRec ensureForward() => $_ensure(10);
}

class MTCahtEvent extends $pb.GeneratedMessage {
  factory MTCahtEvent({
    CHAT_EVENT? event,
    $fixnum.Int64? from,
    $fixnum.Int64? to,
    $fixnum.Int64? data,
    $core.String? info,
  }) {
    final $result = create();
    if (event != null) {
      $result.event = event;
    }
    if (from != null) {
      $result.from = from;
    }
    if (to != null) {
      $result.to = to;
    }
    if (data != null) {
      $result.data = data;
    }
    if (info != null) {
      $result.info = info;
    }
    return $result;
  }
  MTCahtEvent._() : super();
  factory MTCahtEvent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MTCahtEvent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MTCahtEvent', package: const $pb.PackageName(_omitMessageNames ? '' : 'message'), createEmptyInstance: create)
    ..e<CHAT_EVENT>(1, _omitFieldNames ? '' : 'Event', $pb.PbFieldType.QE, protoName: 'Event', defaultOrMaker: CHAT_EVENT.CHEV_CREATE, valueOf: CHAT_EVENT.valueOf, enumValues: CHAT_EVENT.values)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'From', $pb.PbFieldType.QU6, protoName: 'From', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'To', $pb.PbFieldType.QU6, protoName: 'To', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : 'Data', $pb.PbFieldType.QU6, protoName: 'Data', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aQS(5, _omitFieldNames ? '' : 'Info', protoName: 'Info')
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MTCahtEvent clone() => MTCahtEvent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MTCahtEvent copyWith(void Function(MTCahtEvent) updates) => super.copyWith((message) => updates(message as MTCahtEvent)) as MTCahtEvent;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MTCahtEvent create() => MTCahtEvent._();
  MTCahtEvent createEmptyInstance() => create();
  static $pb.PbList<MTCahtEvent> createRepeated() => $pb.PbList<MTCahtEvent>();
  @$core.pragma('dart2js:noInline')
  static MTCahtEvent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MTCahtEvent>(create);
  static MTCahtEvent? _defaultInstance;

  @$pb.TagNumber(1)
  CHAT_EVENT get event => $_getN(0);
  @$pb.TagNumber(1)
  set event(CHAT_EVENT v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEvent() => $_has(0);
  @$pb.TagNumber(1)
  void clearEvent() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get from => $_getI64(1);
  @$pb.TagNumber(2)
  set from($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFrom() => $_has(1);
  @$pb.TagNumber(2)
  void clearFrom() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get to => $_getI64(2);
  @$pb.TagNumber(3)
  set to($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTo() => $_has(2);
  @$pb.TagNumber(3)
  void clearTo() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get data => $_getI64(3);
  @$pb.TagNumber(4)
  set data($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasData() => $_has(3);
  @$pb.TagNumber(4)
  void clearData() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get info => $_getSZ(4);
  @$pb.TagNumber(5)
  set info($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasInfo() => $_has(4);
  @$pb.TagNumber(5)
  void clearInfo() => clearField(5);
}

class T_FileRec extends $pb.GeneratedMessage {
  factory T_FileRec({
    $core.String? msg,
    $core.String? crypto,
    $fixnum.Int64? strgId,
    $core.String? fileName,
    $fixnum.Int64? size,
    $fixnum.Int64? tnSize,
    $fixnum.Int64? tnWidth,
    $fixnum.Int64? tnHeight,
    $fixnum.Int64? tnSmallWidth,
    $fixnum.Int64? tnSmallHeight,
    $core.int? tnSmallDataSize,
    $core.Iterable<$core.int>? tnSmall,
    $fixnum.Int64? width,
    $fixnum.Int64? height,
  }) {
    final $result = create();
    if (msg != null) {
      $result.msg = msg;
    }
    if (crypto != null) {
      $result.crypto = crypto;
    }
    if (strgId != null) {
      $result.strgId = strgId;
    }
    if (fileName != null) {
      $result.fileName = fileName;
    }
    if (size != null) {
      $result.size = size;
    }
    if (tnSize != null) {
      $result.tnSize = tnSize;
    }
    if (tnWidth != null) {
      $result.tnWidth = tnWidth;
    }
    if (tnHeight != null) {
      $result.tnHeight = tnHeight;
    }
    if (tnSmallWidth != null) {
      $result.tnSmallWidth = tnSmallWidth;
    }
    if (tnSmallHeight != null) {
      $result.tnSmallHeight = tnSmallHeight;
    }
    if (tnSmallDataSize != null) {
      $result.tnSmallDataSize = tnSmallDataSize;
    }
    if (tnSmall != null) {
      $result.tnSmall.addAll(tnSmall);
    }
    if (width != null) {
      $result.width = width;
    }
    if (height != null) {
      $result.height = height;
    }
    return $result;
  }
  T_FileRec._() : super();
  factory T_FileRec.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory T_FileRec.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'T_FileRec', package: const $pb.PackageName(_omitMessageNames ? '' : 'message'), createEmptyInstance: create)
    ..aQS(1, _omitFieldNames ? '' : 'msg')
    ..aQS(2, _omitFieldNames ? '' : 'crypto')
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'strgId', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aQS(5, _omitFieldNames ? '' : 'fileName')
    ..a<$fixnum.Int64>(8, _omitFieldNames ? '' : 'size', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(10, _omitFieldNames ? '' : 'tnSize', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(12, _omitFieldNames ? '' : 'tnWidth', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(13, _omitFieldNames ? '' : 'tnHeight', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(14, _omitFieldNames ? '' : 'tnSmallWidth', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(15, _omitFieldNames ? '' : 'tnSmallHeight', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(16, _omitFieldNames ? '' : 'tnSmallDataSize', $pb.PbFieldType.QU3)
    ..p<$core.int>(17, _omitFieldNames ? '' : 'tnSmall', $pb.PbFieldType.PU3)
    ..a<$fixnum.Int64>(18, _omitFieldNames ? '' : 'width', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(19, _omitFieldNames ? '' : 'height', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  T_FileRec clone() => T_FileRec()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  T_FileRec copyWith(void Function(T_FileRec) updates) => super.copyWith((message) => updates(message as T_FileRec)) as T_FileRec;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static T_FileRec create() => T_FileRec._();
  T_FileRec createEmptyInstance() => create();
  static $pb.PbList<T_FileRec> createRepeated() => $pb.PbList<T_FileRec>();
  @$core.pragma('dart2js:noInline')
  static T_FileRec getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<T_FileRec>(create);
  static T_FileRec? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get msg => $_getSZ(0);
  @$pb.TagNumber(1)
  set msg($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMsg() => $_has(0);
  @$pb.TagNumber(1)
  void clearMsg() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get crypto => $_getSZ(1);
  @$pb.TagNumber(2)
  set crypto($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCrypto() => $_has(1);
  @$pb.TagNumber(2)
  void clearCrypto() => clearField(2);

  /// file protocol identification
  @$pb.TagNumber(3)
  $fixnum.Int64 get strgId => $_getI64(2);
  @$pb.TagNumber(3)
  set strgId($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasStrgId() => $_has(2);
  @$pb.TagNumber(3)
  void clearStrgId() => clearField(3);

  /// file/image/video fields
  @$pb.TagNumber(5)
  $core.String get fileName => $_getSZ(3);
  @$pb.TagNumber(5)
  set fileName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(5)
  $core.bool hasFileName() => $_has(3);
  @$pb.TagNumber(5)
  void clearFileName() => clearField(5);

  @$pb.TagNumber(8)
  $fixnum.Int64 get size => $_getI64(4);
  @$pb.TagNumber(8)
  set size($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(8)
  $core.bool hasSize() => $_has(4);
  @$pb.TagNumber(8)
  void clearSize() => clearField(8);

  @$pb.TagNumber(10)
  $fixnum.Int64 get tnSize => $_getI64(5);
  @$pb.TagNumber(10)
  set tnSize($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(10)
  $core.bool hasTnSize() => $_has(5);
  @$pb.TagNumber(10)
  void clearTnSize() => clearField(10);

  @$pb.TagNumber(12)
  $fixnum.Int64 get tnWidth => $_getI64(6);
  @$pb.TagNumber(12)
  set tnWidth($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(12)
  $core.bool hasTnWidth() => $_has(6);
  @$pb.TagNumber(12)
  void clearTnWidth() => clearField(12);

  @$pb.TagNumber(13)
  $fixnum.Int64 get tnHeight => $_getI64(7);
  @$pb.TagNumber(13)
  set tnHeight($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(13)
  $core.bool hasTnHeight() => $_has(7);
  @$pb.TagNumber(13)
  void clearTnHeight() => clearField(13);

  @$pb.TagNumber(14)
  $fixnum.Int64 get tnSmallWidth => $_getI64(8);
  @$pb.TagNumber(14)
  set tnSmallWidth($fixnum.Int64 v) { $_setInt64(8, v); }
  @$pb.TagNumber(14)
  $core.bool hasTnSmallWidth() => $_has(8);
  @$pb.TagNumber(14)
  void clearTnSmallWidth() => clearField(14);

  @$pb.TagNumber(15)
  $fixnum.Int64 get tnSmallHeight => $_getI64(9);
  @$pb.TagNumber(15)
  set tnSmallHeight($fixnum.Int64 v) { $_setInt64(9, v); }
  @$pb.TagNumber(15)
  $core.bool hasTnSmallHeight() => $_has(9);
  @$pb.TagNumber(15)
  void clearTnSmallHeight() => clearField(15);

  @$pb.TagNumber(16)
  $core.int get tnSmallDataSize => $_getIZ(10);
  @$pb.TagNumber(16)
  set tnSmallDataSize($core.int v) { $_setUnsignedInt32(10, v); }
  @$pb.TagNumber(16)
  $core.bool hasTnSmallDataSize() => $_has(10);
  @$pb.TagNumber(16)
  void clearTnSmallDataSize() => clearField(16);

  @$pb.TagNumber(17)
  $core.List<$core.int> get tnSmall => $_getList(11);

  @$pb.TagNumber(18)
  $fixnum.Int64 get width => $_getI64(12);
  @$pb.TagNumber(18)
  set width($fixnum.Int64 v) { $_setInt64(12, v); }
  @$pb.TagNumber(18)
  $core.bool hasWidth() => $_has(12);
  @$pb.TagNumber(18)
  void clearWidth() => clearField(18);

  @$pb.TagNumber(19)
  $fixnum.Int64 get height => $_getI64(13);
  @$pb.TagNumber(19)
  set height($fixnum.Int64 v) { $_setInt64(13, v); }
  @$pb.TagNumber(19)
  $core.bool hasHeight() => $_has(13);
  @$pb.TagNumber(19)
  void clearHeight() => clearField(19);
}

class T_QuotedRec extends $pb.GeneratedMessage {
  factory T_QuotedRec({
    $core.String? msg,
    $core.String? quotionBody,
    $fixnum.Int64? quotionUserId,
    $fixnum.Int64? idm,
    $0.MSG_TYPE? mtype,
  }) {
    final $result = create();
    if (msg != null) {
      $result.msg = msg;
    }
    if (quotionBody != null) {
      $result.quotionBody = quotionBody;
    }
    if (quotionUserId != null) {
      $result.quotionUserId = quotionUserId;
    }
    if (idm != null) {
      $result.idm = idm;
    }
    if (mtype != null) {
      $result.mtype = mtype;
    }
    return $result;
  }
  T_QuotedRec._() : super();
  factory T_QuotedRec.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory T_QuotedRec.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'T_QuotedRec', package: const $pb.PackageName(_omitMessageNames ? '' : 'message'), createEmptyInstance: create)
    ..aQS(1, _omitFieldNames ? '' : 'msg')
    ..aQS(2, _omitFieldNames ? '' : 'quotionBody')
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'quotionUserId', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : 'idm', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..e<$0.MSG_TYPE>(5, _omitFieldNames ? '' : 'mtype', $pb.PbFieldType.QE, defaultOrMaker: $0.MSG_TYPE.MSG_ANY, valueOf: $0.MSG_TYPE.valueOf, enumValues: $0.MSG_TYPE.values)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  T_QuotedRec clone() => T_QuotedRec()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  T_QuotedRec copyWith(void Function(T_QuotedRec) updates) => super.copyWith((message) => updates(message as T_QuotedRec)) as T_QuotedRec;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static T_QuotedRec create() => T_QuotedRec._();
  T_QuotedRec createEmptyInstance() => create();
  static $pb.PbList<T_QuotedRec> createRepeated() => $pb.PbList<T_QuotedRec>();
  @$core.pragma('dart2js:noInline')
  static T_QuotedRec getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<T_QuotedRec>(create);
  static T_QuotedRec? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get msg => $_getSZ(0);
  @$pb.TagNumber(1)
  set msg($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMsg() => $_has(0);
  @$pb.TagNumber(1)
  void clearMsg() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get quotionBody => $_getSZ(1);
  @$pb.TagNumber(2)
  set quotionBody($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasQuotionBody() => $_has(1);
  @$pb.TagNumber(2)
  void clearQuotionBody() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get quotionUserId => $_getI64(2);
  @$pb.TagNumber(3)
  set quotionUserId($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasQuotionUserId() => $_has(2);
  @$pb.TagNumber(3)
  void clearQuotionUserId() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get idm => $_getI64(3);
  @$pb.TagNumber(4)
  set idm($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIdm() => $_has(3);
  @$pb.TagNumber(4)
  void clearIdm() => clearField(4);

  @$pb.TagNumber(5)
  $0.MSG_TYPE get mtype => $_getN(4);
  @$pb.TagNumber(5)
  set mtype($0.MSG_TYPE v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasMtype() => $_has(4);
  @$pb.TagNumber(5)
  void clearMtype() => clearField(5);
}

class T_GetMsgReq extends $pb.GeneratedMessage {
  factory T_GetMsgReq({
    $fixnum.Int64? chId,
    $0.DEST_TYPE? chType,
    MoveTo? direction,
    $core.int? count,
    $fixnum.Int64? idm,
    GetMsgTypeReqType? reqType,
  }) {
    final $result = create();
    if (chId != null) {
      $result.chId = chId;
    }
    if (chType != null) {
      $result.chType = chType;
    }
    if (direction != null) {
      $result.direction = direction;
    }
    if (count != null) {
      $result.count = count;
    }
    if (idm != null) {
      $result.idm = idm;
    }
    if (reqType != null) {
      $result.reqType = reqType;
    }
    return $result;
  }
  T_GetMsgReq._() : super();
  factory T_GetMsgReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory T_GetMsgReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'T_GetMsgReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'message'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'chId', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..e<$0.DEST_TYPE>(2, _omitFieldNames ? '' : 'chType', $pb.PbFieldType.QE, defaultOrMaker: $0.DEST_TYPE.ABONENT, valueOf: $0.DEST_TYPE.valueOf, enumValues: $0.DEST_TYPE.values)
    ..e<MoveTo>(3, _omitFieldNames ? '' : 'direction', $pb.PbFieldType.QE, defaultOrMaker: MoveTo.Up, valueOf: MoveTo.valueOf, enumValues: MoveTo.values)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'count', $pb.PbFieldType.QU3)
    ..a<$fixnum.Int64>(5, _omitFieldNames ? '' : 'idm', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..e<GetMsgTypeReqType>(6, _omitFieldNames ? '' : 'reqType', $pb.PbFieldType.QE, defaultOrMaker: GetMsgTypeReqType.ID, valueOf: GetMsgTypeReqType.valueOf, enumValues: GetMsgTypeReqType.values)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  T_GetMsgReq clone() => T_GetMsgReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  T_GetMsgReq copyWith(void Function(T_GetMsgReq) updates) => super.copyWith((message) => updates(message as T_GetMsgReq)) as T_GetMsgReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static T_GetMsgReq create() => T_GetMsgReq._();
  T_GetMsgReq createEmptyInstance() => create();
  static $pb.PbList<T_GetMsgReq> createRepeated() => $pb.PbList<T_GetMsgReq>();
  @$core.pragma('dart2js:noInline')
  static T_GetMsgReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<T_GetMsgReq>(create);
  static T_GetMsgReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get chId => $_getI64(0);
  @$pb.TagNumber(1)
  set chId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChId() => clearField(1);

  @$pb.TagNumber(2)
  $0.DEST_TYPE get chType => $_getN(1);
  @$pb.TagNumber(2)
  set chType($0.DEST_TYPE v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasChType() => $_has(1);
  @$pb.TagNumber(2)
  void clearChType() => clearField(2);

  @$pb.TagNumber(3)
  MoveTo get direction => $_getN(2);
  @$pb.TagNumber(3)
  set direction(MoveTo v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasDirection() => $_has(2);
  @$pb.TagNumber(3)
  void clearDirection() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get count => $_getIZ(3);
  @$pb.TagNumber(4)
  set count($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearCount() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get idm => $_getI64(4);
  @$pb.TagNumber(5)
  set idm($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIdm() => $_has(4);
  @$pb.TagNumber(5)
  void clearIdm() => clearField(5);

  @$pb.TagNumber(6)
  GetMsgTypeReqType get reqType => $_getN(5);
  @$pb.TagNumber(6)
  set reqType(GetMsgTypeReqType v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasReqType() => $_has(5);
  @$pb.TagNumber(6)
  void clearReqType() => clearField(6);
}

class T_UnreadChats extends $pb.GeneratedMessage {
  factory T_UnreadChats({
    $0.ERROR_CODE? code,
    $core.Iterable<$0.CHAT_UNREAD>? data,
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
  T_UnreadChats._() : super();
  factory T_UnreadChats.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory T_UnreadChats.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'T_UnreadChats', package: const $pb.PackageName(_omitMessageNames ? '' : 'message'), createEmptyInstance: create)
    ..e<$0.ERROR_CODE>(1, _omitFieldNames ? '' : 'code', $pb.PbFieldType.QE, defaultOrMaker: $0.ERROR_CODE.ERR_OK, valueOf: $0.ERROR_CODE.valueOf, enumValues: $0.ERROR_CODE.values)
    ..pc<$0.CHAT_UNREAD>(2, _omitFieldNames ? '' : 'data', $pb.PbFieldType.PM, subBuilder: $0.CHAT_UNREAD.create)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  T_UnreadChats clone() => T_UnreadChats()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  T_UnreadChats copyWith(void Function(T_UnreadChats) updates) => super.copyWith((message) => updates(message as T_UnreadChats)) as T_UnreadChats;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static T_UnreadChats create() => T_UnreadChats._();
  T_UnreadChats createEmptyInstance() => create();
  static $pb.PbList<T_UnreadChats> createRepeated() => $pb.PbList<T_UnreadChats>();
  @$core.pragma('dart2js:noInline')
  static T_UnreadChats getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<T_UnreadChats>(create);
  static T_UnreadChats? _defaultInstance;

  @$pb.TagNumber(1)
  $0.ERROR_CODE get code => $_getN(0);
  @$pb.TagNumber(1)
  set code($0.ERROR_CODE v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$0.CHAT_UNREAD> get data => $_getList(1);
}

class T_UploadFileRes extends $pb.GeneratedMessage {
  factory T_UploadFileRes({
    $core.String? key,
    $core.bool? success,
    $core.bool? isAborted,
    $core.int? fd,
    $core.String? guid,
  }) {
    final $result = create();
    if (key != null) {
      $result.key = key;
    }
    if (success != null) {
      $result.success = success;
    }
    if (isAborted != null) {
      $result.isAborted = isAborted;
    }
    if (fd != null) {
      $result.fd = fd;
    }
    if (guid != null) {
      $result.guid = guid;
    }
    return $result;
  }
  T_UploadFileRes._() : super();
  factory T_UploadFileRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory T_UploadFileRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'T_UploadFileRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'message'), createEmptyInstance: create)
    ..aQS(1, _omitFieldNames ? '' : 'key')
    ..a<$core.bool>(2, _omitFieldNames ? '' : 'success', $pb.PbFieldType.QB)
    ..a<$core.bool>(3, _omitFieldNames ? '' : 'isAborted', $pb.PbFieldType.QB, protoName: 'isAborted')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'fd', $pb.PbFieldType.Q3)
    ..aQS(5, _omitFieldNames ? '' : 'guid')
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  T_UploadFileRes clone() => T_UploadFileRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  T_UploadFileRes copyWith(void Function(T_UploadFileRes) updates) => super.copyWith((message) => updates(message as T_UploadFileRes)) as T_UploadFileRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static T_UploadFileRes create() => T_UploadFileRes._();
  T_UploadFileRes createEmptyInstance() => create();
  static $pb.PbList<T_UploadFileRes> createRepeated() => $pb.PbList<T_UploadFileRes>();
  @$core.pragma('dart2js:noInline')
  static T_UploadFileRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<T_UploadFileRes>(create);
  static T_UploadFileRes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get key => $_getSZ(0);
  @$pb.TagNumber(1)
  set key($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get success => $_getBF(1);
  @$pb.TagNumber(2)
  set success($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSuccess() => $_has(1);
  @$pb.TagNumber(2)
  void clearSuccess() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isAborted => $_getBF(2);
  @$pb.TagNumber(3)
  set isAborted($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIsAborted() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsAborted() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get fd => $_getIZ(3);
  @$pb.TagNumber(4)
  set fd($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFd() => $_has(3);
  @$pb.TagNumber(4)
  void clearFd() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get guid => $_getSZ(4);
  @$pb.TagNumber(5)
  set guid($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasGuid() => $_has(4);
  @$pb.TagNumber(5)
  void clearGuid() => clearField(5);
}

class T_DownloadFileRes extends $pb.GeneratedMessage {
  factory T_DownloadFileRes({
    $core.String? key,
    $core.bool? success,
    $core.bool? isAborted,
  }) {
    final $result = create();
    if (key != null) {
      $result.key = key;
    }
    if (success != null) {
      $result.success = success;
    }
    if (isAborted != null) {
      $result.isAborted = isAborted;
    }
    return $result;
  }
  T_DownloadFileRes._() : super();
  factory T_DownloadFileRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory T_DownloadFileRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'T_DownloadFileRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'message'), createEmptyInstance: create)
    ..aQS(1, _omitFieldNames ? '' : 'key')
    ..a<$core.bool>(2, _omitFieldNames ? '' : 'success', $pb.PbFieldType.QB)
    ..a<$core.bool>(3, _omitFieldNames ? '' : 'isAborted', $pb.PbFieldType.QB, protoName: 'isAborted')
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  T_DownloadFileRes clone() => T_DownloadFileRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  T_DownloadFileRes copyWith(void Function(T_DownloadFileRes) updates) => super.copyWith((message) => updates(message as T_DownloadFileRes)) as T_DownloadFileRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static T_DownloadFileRes create() => T_DownloadFileRes._();
  T_DownloadFileRes createEmptyInstance() => create();
  static $pb.PbList<T_DownloadFileRes> createRepeated() => $pb.PbList<T_DownloadFileRes>();
  @$core.pragma('dart2js:noInline')
  static T_DownloadFileRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<T_DownloadFileRes>(create);
  static T_DownloadFileRes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get key => $_getSZ(0);
  @$pb.TagNumber(1)
  set key($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get success => $_getBF(1);
  @$pb.TagNumber(2)
  set success($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSuccess() => $_has(1);
  @$pb.TagNumber(2)
  void clearSuccess() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isAborted => $_getBF(2);
  @$pb.TagNumber(3)
  set isAborted($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIsAborted() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsAborted() => clearField(3);
}

class FileProgress extends $pb.GeneratedMessage {
  factory FileProgress({
    $core.String? key,
    $core.int? progress,
    $fixnum.Int64? bitrate,
  }) {
    final $result = create();
    if (key != null) {
      $result.key = key;
    }
    if (progress != null) {
      $result.progress = progress;
    }
    if (bitrate != null) {
      $result.bitrate = bitrate;
    }
    return $result;
  }
  FileProgress._() : super();
  factory FileProgress.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FileProgress.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FileProgress', package: const $pb.PackageName(_omitMessageNames ? '' : 'message'), createEmptyInstance: create)
    ..aQS(2, _omitFieldNames ? '' : 'key')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'progress', $pb.PbFieldType.Q3)
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : 'bitrate', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FileProgress clone() => FileProgress()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FileProgress copyWith(void Function(FileProgress) updates) => super.copyWith((message) => updates(message as FileProgress)) as FileProgress;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FileProgress create() => FileProgress._();
  FileProgress createEmptyInstance() => create();
  static $pb.PbList<FileProgress> createRepeated() => $pb.PbList<FileProgress>();
  @$core.pragma('dart2js:noInline')
  static FileProgress getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FileProgress>(create);
  static FileProgress? _defaultInstance;

  @$pb.TagNumber(2)
  $core.String get key => $_getSZ(0);
  @$pb.TagNumber(2)
  set key($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(2)
  void clearKey() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get progress => $_getIZ(1);
  @$pb.TagNumber(3)
  set progress($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasProgress() => $_has(1);
  @$pb.TagNumber(3)
  void clearProgress() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get bitrate => $_getI64(2);
  @$pb.TagNumber(4)
  set bitrate($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasBitrate() => $_has(2);
  @$pb.TagNumber(4)
  void clearBitrate() => clearField(4);
}

class SendMessageReq extends $pb.GeneratedMessage {
  factory SendMessageReq({
    $fixnum.Int64? destId,
    $0.DEST_TYPE? destType,
    $core.String? msg,
  }) {
    final $result = create();
    if (destId != null) {
      $result.destId = destId;
    }
    if (destType != null) {
      $result.destType = destType;
    }
    if (msg != null) {
      $result.msg = msg;
    }
    return $result;
  }
  SendMessageReq._() : super();
  factory SendMessageReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SendMessageReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SendMessageReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'message'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'destId', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..e<$0.DEST_TYPE>(2, _omitFieldNames ? '' : 'destType', $pb.PbFieldType.QE, defaultOrMaker: $0.DEST_TYPE.ABONENT, valueOf: $0.DEST_TYPE.valueOf, enumValues: $0.DEST_TYPE.values)
    ..aQS(3, _omitFieldNames ? '' : 'msg')
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SendMessageReq clone() => SendMessageReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SendMessageReq copyWith(void Function(SendMessageReq) updates) => super.copyWith((message) => updates(message as SendMessageReq)) as SendMessageReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendMessageReq create() => SendMessageReq._();
  SendMessageReq createEmptyInstance() => create();
  static $pb.PbList<SendMessageReq> createRepeated() => $pb.PbList<SendMessageReq>();
  @$core.pragma('dart2js:noInline')
  static SendMessageReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SendMessageReq>(create);
  static SendMessageReq? _defaultInstance;

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
  $core.String get msg => $_getSZ(2);
  @$pb.TagNumber(3)
  set msg($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMsg() => $_has(2);
  @$pb.TagNumber(3)
  void clearMsg() => clearField(3);
}

class SendMessageRes extends $pb.GeneratedMessage {
  factory SendMessageRes({
    $fixnum.Int64? sendId,
    $0.ERROR_CODE? code,
    T_MessageRec? rec,
  }) {
    final $result = create();
    if (sendId != null) {
      $result.sendId = sendId;
    }
    if (code != null) {
      $result.code = code;
    }
    if (rec != null) {
      $result.rec = rec;
    }
    return $result;
  }
  SendMessageRes._() : super();
  factory SendMessageRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SendMessageRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SendMessageRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'message'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'sendId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..e<$0.ERROR_CODE>(2, _omitFieldNames ? '' : 'code', $pb.PbFieldType.OE, defaultOrMaker: $0.ERROR_CODE.ERR_OK, valueOf: $0.ERROR_CODE.valueOf, enumValues: $0.ERROR_CODE.values)
    ..aOM<T_MessageRec>(3, _omitFieldNames ? '' : 'rec', subBuilder: T_MessageRec.create)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SendMessageRes clone() => SendMessageRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SendMessageRes copyWith(void Function(SendMessageRes) updates) => super.copyWith((message) => updates(message as SendMessageRes)) as SendMessageRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendMessageRes create() => SendMessageRes._();
  SendMessageRes createEmptyInstance() => create();
  static $pb.PbList<SendMessageRes> createRepeated() => $pb.PbList<SendMessageRes>();
  @$core.pragma('dart2js:noInline')
  static SendMessageRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SendMessageRes>(create);
  static SendMessageRes? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get sendId => $_getI64(0);
  @$pb.TagNumber(1)
  set sendId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSendId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSendId() => clearField(1);

  @$pb.TagNumber(2)
  $0.ERROR_CODE get code => $_getN(1);
  @$pb.TagNumber(2)
  set code($0.ERROR_CODE v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => clearField(2);

  @$pb.TagNumber(3)
  T_MessageRec get rec => $_getN(2);
  @$pb.TagNumber(3)
  set rec(T_MessageRec v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasRec() => $_has(2);
  @$pb.TagNumber(3)
  void clearRec() => clearField(3);
  @$pb.TagNumber(3)
  T_MessageRec ensureRec() => $_ensure(2);
}

class SendQuoteMessageIn extends $pb.GeneratedMessage {
  factory SendQuoteMessageIn({
    $fixnum.Int64? destId,
    $0.DEST_TYPE? destType,
    $core.String? msg,
    $fixnum.Int64? quoteUserId,
    $core.String? quoteMsg,
    $fixnum.Int64? quoteMsgId,
    $fixnum.Int64? time,
    $0.MSG_TYPE? quoteMtype,
  }) {
    final $result = create();
    if (destId != null) {
      $result.destId = destId;
    }
    if (destType != null) {
      $result.destType = destType;
    }
    if (msg != null) {
      $result.msg = msg;
    }
    if (quoteUserId != null) {
      $result.quoteUserId = quoteUserId;
    }
    if (quoteMsg != null) {
      $result.quoteMsg = quoteMsg;
    }
    if (quoteMsgId != null) {
      $result.quoteMsgId = quoteMsgId;
    }
    if (time != null) {
      $result.time = time;
    }
    if (quoteMtype != null) {
      $result.quoteMtype = quoteMtype;
    }
    return $result;
  }
  SendQuoteMessageIn._() : super();
  factory SendQuoteMessageIn.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SendQuoteMessageIn.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SendQuoteMessageIn', package: const $pb.PackageName(_omitMessageNames ? '' : 'message'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'destId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..e<$0.DEST_TYPE>(2, _omitFieldNames ? '' : 'destType', $pb.PbFieldType.OE, defaultOrMaker: $0.DEST_TYPE.ABONENT, valueOf: $0.DEST_TYPE.valueOf, enumValues: $0.DEST_TYPE.values)
    ..aOS(3, _omitFieldNames ? '' : 'msg')
    ..a<$fixnum.Int64>(5, _omitFieldNames ? '' : 'quoteUserId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(6, _omitFieldNames ? '' : 'quoteMsg')
    ..a<$fixnum.Int64>(7, _omitFieldNames ? '' : 'quoteMsgId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(8, _omitFieldNames ? '' : 'time', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..e<$0.MSG_TYPE>(9, _omitFieldNames ? '' : 'quoteMtype', $pb.PbFieldType.OE, defaultOrMaker: $0.MSG_TYPE.MSG_ANY, valueOf: $0.MSG_TYPE.valueOf, enumValues: $0.MSG_TYPE.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SendQuoteMessageIn clone() => SendQuoteMessageIn()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SendQuoteMessageIn copyWith(void Function(SendQuoteMessageIn) updates) => super.copyWith((message) => updates(message as SendQuoteMessageIn)) as SendQuoteMessageIn;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendQuoteMessageIn create() => SendQuoteMessageIn._();
  SendQuoteMessageIn createEmptyInstance() => create();
  static $pb.PbList<SendQuoteMessageIn> createRepeated() => $pb.PbList<SendQuoteMessageIn>();
  @$core.pragma('dart2js:noInline')
  static SendQuoteMessageIn getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SendQuoteMessageIn>(create);
  static SendQuoteMessageIn? _defaultInstance;

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
  $core.String get msg => $_getSZ(2);
  @$pb.TagNumber(3)
  set msg($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMsg() => $_has(2);
  @$pb.TagNumber(3)
  void clearMsg() => clearField(3);

  @$pb.TagNumber(5)
  $fixnum.Int64 get quoteUserId => $_getI64(3);
  @$pb.TagNumber(5)
  set quoteUserId($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(5)
  $core.bool hasQuoteUserId() => $_has(3);
  @$pb.TagNumber(5)
  void clearQuoteUserId() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get quoteMsg => $_getSZ(4);
  @$pb.TagNumber(6)
  set quoteMsg($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(6)
  $core.bool hasQuoteMsg() => $_has(4);
  @$pb.TagNumber(6)
  void clearQuoteMsg() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get quoteMsgId => $_getI64(5);
  @$pb.TagNumber(7)
  set quoteMsgId($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(7)
  $core.bool hasQuoteMsgId() => $_has(5);
  @$pb.TagNumber(7)
  void clearQuoteMsgId() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get time => $_getI64(6);
  @$pb.TagNumber(8)
  set time($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(8)
  $core.bool hasTime() => $_has(6);
  @$pb.TagNumber(8)
  void clearTime() => clearField(8);

  @$pb.TagNumber(9)
  $0.MSG_TYPE get quoteMtype => $_getN(7);
  @$pb.TagNumber(9)
  set quoteMtype($0.MSG_TYPE v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasQuoteMtype() => $_has(7);
  @$pb.TagNumber(9)
  void clearQuoteMtype() => clearField(9);
}

class SendQuoteMessageOut extends $pb.GeneratedMessage {
  factory SendQuoteMessageOut({
    $fixnum.Int64? sendId,
    T_MessageRec? rec,
  }) {
    final $result = create();
    if (sendId != null) {
      $result.sendId = sendId;
    }
    if (rec != null) {
      $result.rec = rec;
    }
    return $result;
  }
  SendQuoteMessageOut._() : super();
  factory SendQuoteMessageOut.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SendQuoteMessageOut.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SendQuoteMessageOut', package: const $pb.PackageName(_omitMessageNames ? '' : 'message'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'sendId', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<T_MessageRec>(2, _omitFieldNames ? '' : 'rec', subBuilder: T_MessageRec.create)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SendQuoteMessageOut clone() => SendQuoteMessageOut()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SendQuoteMessageOut copyWith(void Function(SendQuoteMessageOut) updates) => super.copyWith((message) => updates(message as SendQuoteMessageOut)) as SendQuoteMessageOut;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendQuoteMessageOut create() => SendQuoteMessageOut._();
  SendQuoteMessageOut createEmptyInstance() => create();
  static $pb.PbList<SendQuoteMessageOut> createRepeated() => $pb.PbList<SendQuoteMessageOut>();
  @$core.pragma('dart2js:noInline')
  static SendQuoteMessageOut getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SendQuoteMessageOut>(create);
  static SendQuoteMessageOut? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get sendId => $_getI64(0);
  @$pb.TagNumber(1)
  set sendId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSendId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSendId() => clearField(1);

  @$pb.TagNumber(2)
  T_MessageRec get rec => $_getN(1);
  @$pb.TagNumber(2)
  set rec(T_MessageRec v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasRec() => $_has(1);
  @$pb.TagNumber(2)
  void clearRec() => clearField(2);
  @$pb.TagNumber(2)
  T_MessageRec ensureRec() => $_ensure(1);
}

class EditMessageIn extends $pb.GeneratedMessage {
  factory EditMessageIn({
    $fixnum.Int64? idm,
    $core.String? msg,
  }) {
    final $result = create();
    if (idm != null) {
      $result.idm = idm;
    }
    if (msg != null) {
      $result.msg = msg;
    }
    return $result;
  }
  EditMessageIn._() : super();
  factory EditMessageIn.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EditMessageIn.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EditMessageIn', package: const $pb.PackageName(_omitMessageNames ? '' : 'message'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'idm', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aQS(2, _omitFieldNames ? '' : 'msg')
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EditMessageIn clone() => EditMessageIn()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EditMessageIn copyWith(void Function(EditMessageIn) updates) => super.copyWith((message) => updates(message as EditMessageIn)) as EditMessageIn;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EditMessageIn create() => EditMessageIn._();
  EditMessageIn createEmptyInstance() => create();
  static $pb.PbList<EditMessageIn> createRepeated() => $pb.PbList<EditMessageIn>();
  @$core.pragma('dart2js:noInline')
  static EditMessageIn getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EditMessageIn>(create);
  static EditMessageIn? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get idm => $_getI64(0);
  @$pb.TagNumber(1)
  set idm($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIdm() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdm() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get msg => $_getSZ(1);
  @$pb.TagNumber(2)
  set msg($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMsg() => $_has(1);
  @$pb.TagNumber(2)
  void clearMsg() => clearField(2);
}

class EditMessageOut extends $pb.GeneratedMessage {
  factory EditMessageOut({
    $fixnum.Int64? res,
  }) {
    final $result = create();
    if (res != null) {
      $result.res = res;
    }
    return $result;
  }
  EditMessageOut._() : super();
  factory EditMessageOut.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EditMessageOut.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EditMessageOut', package: const $pb.PackageName(_omitMessageNames ? '' : 'message'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'res', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EditMessageOut clone() => EditMessageOut()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EditMessageOut copyWith(void Function(EditMessageOut) updates) => super.copyWith((message) => updates(message as EditMessageOut)) as EditMessageOut;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EditMessageOut create() => EditMessageOut._();
  EditMessageOut createEmptyInstance() => create();
  static $pb.PbList<EditMessageOut> createRepeated() => $pb.PbList<EditMessageOut>();
  @$core.pragma('dart2js:noInline')
  static EditMessageOut getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EditMessageOut>(create);
  static EditMessageOut? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get res => $_getI64(0);
  @$pb.TagNumber(1)
  set res($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRes() => $_has(0);
  @$pb.TagNumber(1)
  void clearRes() => clearField(1);
}

class ForwardMessageIn extends $pb.GeneratedMessage {
  factory ForwardMessageIn({
    $fixnum.Int64? destId,
    $0.DEST_TYPE? destType,
    T_MessageRec? referenceRec,
  }) {
    final $result = create();
    if (destId != null) {
      $result.destId = destId;
    }
    if (destType != null) {
      $result.destType = destType;
    }
    if (referenceRec != null) {
      $result.referenceRec = referenceRec;
    }
    return $result;
  }
  ForwardMessageIn._() : super();
  factory ForwardMessageIn.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ForwardMessageIn.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ForwardMessageIn', package: const $pb.PackageName(_omitMessageNames ? '' : 'message'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'destId', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..e<$0.DEST_TYPE>(2, _omitFieldNames ? '' : 'destType', $pb.PbFieldType.QE, defaultOrMaker: $0.DEST_TYPE.ABONENT, valueOf: $0.DEST_TYPE.valueOf, enumValues: $0.DEST_TYPE.values)
    ..aQM<T_MessageRec>(3, _omitFieldNames ? '' : 'referenceRec', subBuilder: T_MessageRec.create)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ForwardMessageIn clone() => ForwardMessageIn()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ForwardMessageIn copyWith(void Function(ForwardMessageIn) updates) => super.copyWith((message) => updates(message as ForwardMessageIn)) as ForwardMessageIn;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ForwardMessageIn create() => ForwardMessageIn._();
  ForwardMessageIn createEmptyInstance() => create();
  static $pb.PbList<ForwardMessageIn> createRepeated() => $pb.PbList<ForwardMessageIn>();
  @$core.pragma('dart2js:noInline')
  static ForwardMessageIn getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ForwardMessageIn>(create);
  static ForwardMessageIn? _defaultInstance;

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
  T_MessageRec get referenceRec => $_getN(2);
  @$pb.TagNumber(3)
  set referenceRec(T_MessageRec v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasReferenceRec() => $_has(2);
  @$pb.TagNumber(3)
  void clearReferenceRec() => clearField(3);
  @$pb.TagNumber(3)
  T_MessageRec ensureReferenceRec() => $_ensure(2);
}

class ForwardMessageOut extends $pb.GeneratedMessage {
  factory ForwardMessageOut({
    $fixnum.Int64? sendId,
    $0.ERROR_CODE? code,
    T_MessageRec? rec,
  }) {
    final $result = create();
    if (sendId != null) {
      $result.sendId = sendId;
    }
    if (code != null) {
      $result.code = code;
    }
    if (rec != null) {
      $result.rec = rec;
    }
    return $result;
  }
  ForwardMessageOut._() : super();
  factory ForwardMessageOut.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ForwardMessageOut.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ForwardMessageOut', package: const $pb.PackageName(_omitMessageNames ? '' : 'message'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'sendId', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..e<$0.ERROR_CODE>(2, _omitFieldNames ? '' : 'code', $pb.PbFieldType.OE, defaultOrMaker: $0.ERROR_CODE.ERR_OK, valueOf: $0.ERROR_CODE.valueOf, enumValues: $0.ERROR_CODE.values)
    ..aOM<T_MessageRec>(3, _omitFieldNames ? '' : 'rec', subBuilder: T_MessageRec.create)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ForwardMessageOut clone() => ForwardMessageOut()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ForwardMessageOut copyWith(void Function(ForwardMessageOut) updates) => super.copyWith((message) => updates(message as ForwardMessageOut)) as ForwardMessageOut;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ForwardMessageOut create() => ForwardMessageOut._();
  ForwardMessageOut createEmptyInstance() => create();
  static $pb.PbList<ForwardMessageOut> createRepeated() => $pb.PbList<ForwardMessageOut>();
  @$core.pragma('dart2js:noInline')
  static ForwardMessageOut getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ForwardMessageOut>(create);
  static ForwardMessageOut? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get sendId => $_getI64(0);
  @$pb.TagNumber(1)
  set sendId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSendId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSendId() => clearField(1);

  @$pb.TagNumber(2)
  $0.ERROR_CODE get code => $_getN(1);
  @$pb.TagNumber(2)
  set code($0.ERROR_CODE v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => clearField(2);

  @$pb.TagNumber(3)
  T_MessageRec get rec => $_getN(2);
  @$pb.TagNumber(3)
  set rec(T_MessageRec v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasRec() => $_has(2);
  @$pb.TagNumber(3)
  void clearRec() => clearField(3);
  @$pb.TagNumber(3)
  T_MessageRec ensureRec() => $_ensure(2);
}

class SendFileIn extends $pb.GeneratedMessage {
  factory SendFileIn({
    $fixnum.Int64? destId,
    $0.DEST_TYPE? destType,
    $core.String? filePath,
    $core.String? msg,
  }) {
    final $result = create();
    if (destId != null) {
      $result.destId = destId;
    }
    if (destType != null) {
      $result.destType = destType;
    }
    if (filePath != null) {
      $result.filePath = filePath;
    }
    if (msg != null) {
      $result.msg = msg;
    }
    return $result;
  }
  SendFileIn._() : super();
  factory SendFileIn.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SendFileIn.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SendFileIn', package: const $pb.PackageName(_omitMessageNames ? '' : 'message'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'destId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..e<$0.DEST_TYPE>(2, _omitFieldNames ? '' : 'destType', $pb.PbFieldType.OE, defaultOrMaker: $0.DEST_TYPE.ABONENT, valueOf: $0.DEST_TYPE.valueOf, enumValues: $0.DEST_TYPE.values)
    ..aOS(3, _omitFieldNames ? '' : 'filePath')
    ..aOS(4, _omitFieldNames ? '' : 'msg')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SendFileIn clone() => SendFileIn()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SendFileIn copyWith(void Function(SendFileIn) updates) => super.copyWith((message) => updates(message as SendFileIn)) as SendFileIn;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendFileIn create() => SendFileIn._();
  SendFileIn createEmptyInstance() => create();
  static $pb.PbList<SendFileIn> createRepeated() => $pb.PbList<SendFileIn>();
  @$core.pragma('dart2js:noInline')
  static SendFileIn getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SendFileIn>(create);
  static SendFileIn? _defaultInstance;

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
  $core.String get filePath => $_getSZ(2);
  @$pb.TagNumber(3)
  set filePath($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFilePath() => $_has(2);
  @$pb.TagNumber(3)
  void clearFilePath() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get msg => $_getSZ(3);
  @$pb.TagNumber(4)
  set msg($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMsg() => $_has(3);
  @$pb.TagNumber(4)
  void clearMsg() => clearField(4);
}

class SendFileOut extends $pb.GeneratedMessage {
  factory SendFileOut({
    $fixnum.Int64? sessionId,
    $0.ERROR_CODE? code,
    $core.int? width,
    $fixnum.Int64? height,
    $0.ERROR_CODE? thumbnailError,
    $core.Iterable<$core.int>? thumbnail,
    T_MessageRec? rec,
  }) {
    final $result = create();
    if (sessionId != null) {
      $result.sessionId = sessionId;
    }
    if (code != null) {
      $result.code = code;
    }
    if (width != null) {
      $result.width = width;
    }
    if (height != null) {
      $result.height = height;
    }
    if (thumbnailError != null) {
      $result.thumbnailError = thumbnailError;
    }
    if (thumbnail != null) {
      $result.thumbnail.addAll(thumbnail);
    }
    if (rec != null) {
      $result.rec = rec;
    }
    return $result;
  }
  SendFileOut._() : super();
  factory SendFileOut.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SendFileOut.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SendFileOut', package: const $pb.PackageName(_omitMessageNames ? '' : 'message'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'sessionId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..e<$0.ERROR_CODE>(2, _omitFieldNames ? '' : 'code', $pb.PbFieldType.OE, defaultOrMaker: $0.ERROR_CODE.ERR_OK, valueOf: $0.ERROR_CODE.valueOf, enumValues: $0.ERROR_CODE.values)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'width', $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : 'height', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..e<$0.ERROR_CODE>(5, _omitFieldNames ? '' : 'thumbnailError', $pb.PbFieldType.OE, defaultOrMaker: $0.ERROR_CODE.ERR_OK, valueOf: $0.ERROR_CODE.valueOf, enumValues: $0.ERROR_CODE.values)
    ..p<$core.int>(6, _omitFieldNames ? '' : 'thumbnail', $pb.PbFieldType.PU3)
    ..aOM<T_MessageRec>(7, _omitFieldNames ? '' : 'rec', subBuilder: T_MessageRec.create)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SendFileOut clone() => SendFileOut()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SendFileOut copyWith(void Function(SendFileOut) updates) => super.copyWith((message) => updates(message as SendFileOut)) as SendFileOut;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendFileOut create() => SendFileOut._();
  SendFileOut createEmptyInstance() => create();
  static $pb.PbList<SendFileOut> createRepeated() => $pb.PbList<SendFileOut>();
  @$core.pragma('dart2js:noInline')
  static SendFileOut getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SendFileOut>(create);
  static SendFileOut? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get sessionId => $_getI64(0);
  @$pb.TagNumber(1)
  set sessionId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionId() => clearField(1);

  @$pb.TagNumber(2)
  $0.ERROR_CODE get code => $_getN(1);
  @$pb.TagNumber(2)
  set code($0.ERROR_CODE v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get width => $_getIZ(2);
  @$pb.TagNumber(3)
  set width($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasWidth() => $_has(2);
  @$pb.TagNumber(3)
  void clearWidth() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get height => $_getI64(3);
  @$pb.TagNumber(4)
  set height($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasHeight() => $_has(3);
  @$pb.TagNumber(4)
  void clearHeight() => clearField(4);

  @$pb.TagNumber(5)
  $0.ERROR_CODE get thumbnailError => $_getN(4);
  @$pb.TagNumber(5)
  set thumbnailError($0.ERROR_CODE v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasThumbnailError() => $_has(4);
  @$pb.TagNumber(5)
  void clearThumbnailError() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.int> get thumbnail => $_getList(5);

  @$pb.TagNumber(7)
  T_MessageRec get rec => $_getN(6);
  @$pb.TagNumber(7)
  set rec(T_MessageRec v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasRec() => $_has(6);
  @$pb.TagNumber(7)
  void clearRec() => clearField(7);
  @$pb.TagNumber(7)
  T_MessageRec ensureRec() => $_ensure(6);
}

class DeleteMessageReq extends $pb.GeneratedMessage {
  factory DeleteMessageReq({
    $core.Iterable<$fixnum.Int64>? idm,
  }) {
    final $result = create();
    if (idm != null) {
      $result.idm.addAll(idm);
    }
    return $result;
  }
  DeleteMessageReq._() : super();
  factory DeleteMessageReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteMessageReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteMessageReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'message'), createEmptyInstance: create)
    ..p<$fixnum.Int64>(1, _omitFieldNames ? '' : 'idm', $pb.PbFieldType.PU6)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteMessageReq clone() => DeleteMessageReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteMessageReq copyWith(void Function(DeleteMessageReq) updates) => super.copyWith((message) => updates(message as DeleteMessageReq)) as DeleteMessageReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteMessageReq create() => DeleteMessageReq._();
  DeleteMessageReq createEmptyInstance() => create();
  static $pb.PbList<DeleteMessageReq> createRepeated() => $pb.PbList<DeleteMessageReq>();
  @$core.pragma('dart2js:noInline')
  static DeleteMessageReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteMessageReq>(create);
  static DeleteMessageReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$fixnum.Int64> get idm => $_getList(0);
}

class DownloadFileIn extends $pb.GeneratedMessage {
  factory DownloadFileIn({
    $core.String? crFilePath,
    $core.String? filePath,
    $fixnum.Int64? fileSize,
  }) {
    final $result = create();
    if (crFilePath != null) {
      $result.crFilePath = crFilePath;
    }
    if (filePath != null) {
      $result.filePath = filePath;
    }
    if (fileSize != null) {
      $result.fileSize = fileSize;
    }
    return $result;
  }
  DownloadFileIn._() : super();
  factory DownloadFileIn.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DownloadFileIn.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DownloadFileIn', package: const $pb.PackageName(_omitMessageNames ? '' : 'message'), createEmptyInstance: create)
    ..aQS(1, _omitFieldNames ? '' : 'crFilePath')
    ..aQS(2, _omitFieldNames ? '' : 'filePath')
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'fileSize', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DownloadFileIn clone() => DownloadFileIn()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DownloadFileIn copyWith(void Function(DownloadFileIn) updates) => super.copyWith((message) => updates(message as DownloadFileIn)) as DownloadFileIn;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DownloadFileIn create() => DownloadFileIn._();
  DownloadFileIn createEmptyInstance() => create();
  static $pb.PbList<DownloadFileIn> createRepeated() => $pb.PbList<DownloadFileIn>();
  @$core.pragma('dart2js:noInline')
  static DownloadFileIn getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DownloadFileIn>(create);
  static DownloadFileIn? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get crFilePath => $_getSZ(0);
  @$pb.TagNumber(1)
  set crFilePath($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCrFilePath() => $_has(0);
  @$pb.TagNumber(1)
  void clearCrFilePath() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get filePath => $_getSZ(1);
  @$pb.TagNumber(2)
  set filePath($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFilePath() => $_has(1);
  @$pb.TagNumber(2)
  void clearFilePath() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get fileSize => $_getI64(2);
  @$pb.TagNumber(3)
  set fileSize($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFileSize() => $_has(2);
  @$pb.TagNumber(3)
  void clearFileSize() => clearField(3);
}

class DownloadFileOut extends $pb.GeneratedMessage {
  factory DownloadFileOut({
    T_DownloadFileRes? res,
  }) {
    final $result = create();
    if (res != null) {
      $result.res = res;
    }
    return $result;
  }
  DownloadFileOut._() : super();
  factory DownloadFileOut.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DownloadFileOut.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DownloadFileOut', package: const $pb.PackageName(_omitMessageNames ? '' : 'message'), createEmptyInstance: create)
    ..aQM<T_DownloadFileRes>(1, _omitFieldNames ? '' : 'res', subBuilder: T_DownloadFileRes.create)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DownloadFileOut clone() => DownloadFileOut()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DownloadFileOut copyWith(void Function(DownloadFileOut) updates) => super.copyWith((message) => updates(message as DownloadFileOut)) as DownloadFileOut;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DownloadFileOut create() => DownloadFileOut._();
  DownloadFileOut createEmptyInstance() => create();
  static $pb.PbList<DownloadFileOut> createRepeated() => $pb.PbList<DownloadFileOut>();
  @$core.pragma('dart2js:noInline')
  static DownloadFileOut getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DownloadFileOut>(create);
  static DownloadFileOut? _defaultInstance;

  @$pb.TagNumber(1)
  T_DownloadFileRes get res => $_getN(0);
  @$pb.TagNumber(1)
  set res(T_DownloadFileRes v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasRes() => $_has(0);
  @$pb.TagNumber(1)
  void clearRes() => clearField(1);
  @$pb.TagNumber(1)
  T_DownloadFileRes ensureRes() => $_ensure(0);
}

class DownloadImageThumbnailIn extends $pb.GeneratedMessage {
  factory DownloadImageThumbnailIn({
    $core.String? crFilePath,
    $core.String? tnFilePath,
    $fixnum.Int64? tnFileSize,
  }) {
    final $result = create();
    if (crFilePath != null) {
      $result.crFilePath = crFilePath;
    }
    if (tnFilePath != null) {
      $result.tnFilePath = tnFilePath;
    }
    if (tnFileSize != null) {
      $result.tnFileSize = tnFileSize;
    }
    return $result;
  }
  DownloadImageThumbnailIn._() : super();
  factory DownloadImageThumbnailIn.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DownloadImageThumbnailIn.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DownloadImageThumbnailIn', package: const $pb.PackageName(_omitMessageNames ? '' : 'message'), createEmptyInstance: create)
    ..aQS(1, _omitFieldNames ? '' : 'crFilePath')
    ..aQS(2, _omitFieldNames ? '' : 'tnFilePath')
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'tnFileSize', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DownloadImageThumbnailIn clone() => DownloadImageThumbnailIn()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DownloadImageThumbnailIn copyWith(void Function(DownloadImageThumbnailIn) updates) => super.copyWith((message) => updates(message as DownloadImageThumbnailIn)) as DownloadImageThumbnailIn;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DownloadImageThumbnailIn create() => DownloadImageThumbnailIn._();
  DownloadImageThumbnailIn createEmptyInstance() => create();
  static $pb.PbList<DownloadImageThumbnailIn> createRepeated() => $pb.PbList<DownloadImageThumbnailIn>();
  @$core.pragma('dart2js:noInline')
  static DownloadImageThumbnailIn getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DownloadImageThumbnailIn>(create);
  static DownloadImageThumbnailIn? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get crFilePath => $_getSZ(0);
  @$pb.TagNumber(1)
  set crFilePath($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCrFilePath() => $_has(0);
  @$pb.TagNumber(1)
  void clearCrFilePath() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get tnFilePath => $_getSZ(1);
  @$pb.TagNumber(2)
  set tnFilePath($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTnFilePath() => $_has(1);
  @$pb.TagNumber(2)
  void clearTnFilePath() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get tnFileSize => $_getI64(2);
  @$pb.TagNumber(3)
  set tnFileSize($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTnFileSize() => $_has(2);
  @$pb.TagNumber(3)
  void clearTnFileSize() => clearField(3);
}

class DownloadImageThumbnailOut extends $pb.GeneratedMessage {
  factory DownloadImageThumbnailOut({
    T_DownloadFileRes? res,
  }) {
    final $result = create();
    if (res != null) {
      $result.res = res;
    }
    return $result;
  }
  DownloadImageThumbnailOut._() : super();
  factory DownloadImageThumbnailOut.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DownloadImageThumbnailOut.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DownloadImageThumbnailOut', package: const $pb.PackageName(_omitMessageNames ? '' : 'message'), createEmptyInstance: create)
    ..aQM<T_DownloadFileRes>(1, _omitFieldNames ? '' : 'res', subBuilder: T_DownloadFileRes.create)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DownloadImageThumbnailOut clone() => DownloadImageThumbnailOut()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DownloadImageThumbnailOut copyWith(void Function(DownloadImageThumbnailOut) updates) => super.copyWith((message) => updates(message as DownloadImageThumbnailOut)) as DownloadImageThumbnailOut;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DownloadImageThumbnailOut create() => DownloadImageThumbnailOut._();
  DownloadImageThumbnailOut createEmptyInstance() => create();
  static $pb.PbList<DownloadImageThumbnailOut> createRepeated() => $pb.PbList<DownloadImageThumbnailOut>();
  @$core.pragma('dart2js:noInline')
  static DownloadImageThumbnailOut getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DownloadImageThumbnailOut>(create);
  static DownloadImageThumbnailOut? _defaultInstance;

  @$pb.TagNumber(1)
  T_DownloadFileRes get res => $_getN(0);
  @$pb.TagNumber(1)
  set res(T_DownloadFileRes v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasRes() => $_has(0);
  @$pb.TagNumber(1)
  void clearRes() => clearField(1);
  @$pb.TagNumber(1)
  T_DownloadFileRes ensureRes() => $_ensure(0);
}

class AbortFileIn extends $pb.GeneratedMessage {
  factory AbortFileIn({
    $fixnum.Int64? sessionId,
  }) {
    final $result = create();
    if (sessionId != null) {
      $result.sessionId = sessionId;
    }
    return $result;
  }
  AbortFileIn._() : super();
  factory AbortFileIn.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AbortFileIn.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AbortFileIn', package: const $pb.PackageName(_omitMessageNames ? '' : 'message'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'sessionId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AbortFileIn clone() => AbortFileIn()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AbortFileIn copyWith(void Function(AbortFileIn) updates) => super.copyWith((message) => updates(message as AbortFileIn)) as AbortFileIn;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AbortFileIn create() => AbortFileIn._();
  AbortFileIn createEmptyInstance() => create();
  static $pb.PbList<AbortFileIn> createRepeated() => $pb.PbList<AbortFileIn>();
  @$core.pragma('dart2js:noInline')
  static AbortFileIn getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AbortFileIn>(create);
  static AbortFileIn? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get sessionId => $_getI64(0);
  @$pb.TagNumber(1)
  set sessionId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionId() => clearField(1);
}

class AbortFileOut extends $pb.GeneratedMessage {
  factory AbortFileOut({
    $0.ERROR_CODE? error,
  }) {
    final $result = create();
    if (error != null) {
      $result.error = error;
    }
    return $result;
  }
  AbortFileOut._() : super();
  factory AbortFileOut.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AbortFileOut.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AbortFileOut', package: const $pb.PackageName(_omitMessageNames ? '' : 'message'), createEmptyInstance: create)
    ..e<$0.ERROR_CODE>(1, _omitFieldNames ? '' : 'error', $pb.PbFieldType.OE, defaultOrMaker: $0.ERROR_CODE.ERR_OK, valueOf: $0.ERROR_CODE.valueOf, enumValues: $0.ERROR_CODE.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AbortFileOut clone() => AbortFileOut()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AbortFileOut copyWith(void Function(AbortFileOut) updates) => super.copyWith((message) => updates(message as AbortFileOut)) as AbortFileOut;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AbortFileOut create() => AbortFileOut._();
  AbortFileOut createEmptyInstance() => create();
  static $pb.PbList<AbortFileOut> createRepeated() => $pb.PbList<AbortFileOut>();
  @$core.pragma('dart2js:noInline')
  static AbortFileOut getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AbortFileOut>(create);
  static AbortFileOut? _defaultInstance;

  @$pb.TagNumber(1)
  $0.ERROR_CODE get error => $_getN(0);
  @$pb.TagNumber(1)
  set error($0.ERROR_CODE v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasError() => $_has(0);
  @$pb.TagNumber(1)
  void clearError() => clearField(1);
}

class RevealFileIn extends $pb.GeneratedMessage {
  factory RevealFileIn({
    $core.String? path,
  }) {
    final $result = create();
    if (path != null) {
      $result.path = path;
    }
    return $result;
  }
  RevealFileIn._() : super();
  factory RevealFileIn.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RevealFileIn.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RevealFileIn', package: const $pb.PackageName(_omitMessageNames ? '' : 'message'), createEmptyInstance: create)
    ..aQS(1, _omitFieldNames ? '' : 'path')
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RevealFileIn clone() => RevealFileIn()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RevealFileIn copyWith(void Function(RevealFileIn) updates) => super.copyWith((message) => updates(message as RevealFileIn)) as RevealFileIn;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RevealFileIn create() => RevealFileIn._();
  RevealFileIn createEmptyInstance() => create();
  static $pb.PbList<RevealFileIn> createRepeated() => $pb.PbList<RevealFileIn>();
  @$core.pragma('dart2js:noInline')
  static RevealFileIn getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RevealFileIn>(create);
  static RevealFileIn? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get path => $_getSZ(0);
  @$pb.TagNumber(1)
  set path($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPath() => $_has(0);
  @$pb.TagNumber(1)
  void clearPath() => clearField(1);
}

class FileState extends $pb.GeneratedMessage {
  factory FileState({
    $core.String? path,
    $fixnum.Int64? size,
    $fixnum.Int64? direction,
    $fixnum.Int64? startTime,
    $core.double? prcntReady,
    $fixnum.Int64? speed,
    StorageState? state,
    $0.ERROR_CODE? error,
    $fixnum.Int64? sendMessageId,
    $core.String? thumbnail,
    $core.bool? thumbnailReady,
    $core.String? link,
    $core.String? ext,
    $fixnum.Int64? seesionId,
  }) {
    final $result = create();
    if (path != null) {
      $result.path = path;
    }
    if (size != null) {
      $result.size = size;
    }
    if (direction != null) {
      $result.direction = direction;
    }
    if (startTime != null) {
      $result.startTime = startTime;
    }
    if (prcntReady != null) {
      $result.prcntReady = prcntReady;
    }
    if (speed != null) {
      $result.speed = speed;
    }
    if (state != null) {
      $result.state = state;
    }
    if (error != null) {
      $result.error = error;
    }
    if (sendMessageId != null) {
      $result.sendMessageId = sendMessageId;
    }
    if (thumbnail != null) {
      $result.thumbnail = thumbnail;
    }
    if (thumbnailReady != null) {
      $result.thumbnailReady = thumbnailReady;
    }
    if (link != null) {
      $result.link = link;
    }
    if (ext != null) {
      $result.ext = ext;
    }
    if (seesionId != null) {
      $result.seesionId = seesionId;
    }
    return $result;
  }
  FileState._() : super();
  factory FileState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FileState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FileState', package: const $pb.PackageName(_omitMessageNames ? '' : 'message'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'path')
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'size', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'direction', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : 'startTime', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.double>(5, _omitFieldNames ? '' : 'prcntReady', $pb.PbFieldType.OF)
    ..a<$fixnum.Int64>(6, _omitFieldNames ? '' : 'speed', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..e<StorageState>(7, _omitFieldNames ? '' : 'state', $pb.PbFieldType.OE, defaultOrMaker: StorageState.FSTATE_WAIT, valueOf: StorageState.valueOf, enumValues: StorageState.values)
    ..e<$0.ERROR_CODE>(8, _omitFieldNames ? '' : 'error', $pb.PbFieldType.OE, defaultOrMaker: $0.ERROR_CODE.ERR_OK, valueOf: $0.ERROR_CODE.valueOf, enumValues: $0.ERROR_CODE.values)
    ..a<$fixnum.Int64>(9, _omitFieldNames ? '' : 'sendMessageId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(10, _omitFieldNames ? '' : 'thumbnail')
    ..aOB(11, _omitFieldNames ? '' : 'thumbnailReady')
    ..aOS(12, _omitFieldNames ? '' : 'link')
    ..aOS(13, _omitFieldNames ? '' : 'ext')
    ..a<$fixnum.Int64>(14, _omitFieldNames ? '' : 'seesionId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FileState clone() => FileState()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FileState copyWith(void Function(FileState) updates) => super.copyWith((message) => updates(message as FileState)) as FileState;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FileState create() => FileState._();
  FileState createEmptyInstance() => create();
  static $pb.PbList<FileState> createRepeated() => $pb.PbList<FileState>();
  @$core.pragma('dart2js:noInline')
  static FileState getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FileState>(create);
  static FileState? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get path => $_getSZ(0);
  @$pb.TagNumber(1)
  set path($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPath() => $_has(0);
  @$pb.TagNumber(1)
  void clearPath() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get size => $_getI64(1);
  @$pb.TagNumber(2)
  set size($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSize() => $_has(1);
  @$pb.TagNumber(2)
  void clearSize() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get direction => $_getI64(2);
  @$pb.TagNumber(3)
  set direction($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDirection() => $_has(2);
  @$pb.TagNumber(3)
  void clearDirection() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get startTime => $_getI64(3);
  @$pb.TagNumber(4)
  set startTime($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasStartTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearStartTime() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get prcntReady => $_getN(4);
  @$pb.TagNumber(5)
  set prcntReady($core.double v) { $_setFloat(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPrcntReady() => $_has(4);
  @$pb.TagNumber(5)
  void clearPrcntReady() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get speed => $_getI64(5);
  @$pb.TagNumber(6)
  set speed($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasSpeed() => $_has(5);
  @$pb.TagNumber(6)
  void clearSpeed() => clearField(6);

  @$pb.TagNumber(7)
  StorageState get state => $_getN(6);
  @$pb.TagNumber(7)
  set state(StorageState v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasState() => $_has(6);
  @$pb.TagNumber(7)
  void clearState() => clearField(7);

  @$pb.TagNumber(8)
  $0.ERROR_CODE get error => $_getN(7);
  @$pb.TagNumber(8)
  set error($0.ERROR_CODE v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasError() => $_has(7);
  @$pb.TagNumber(8)
  void clearError() => clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get sendMessageId => $_getI64(8);
  @$pb.TagNumber(9)
  set sendMessageId($fixnum.Int64 v) { $_setInt64(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasSendMessageId() => $_has(8);
  @$pb.TagNumber(9)
  void clearSendMessageId() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get thumbnail => $_getSZ(9);
  @$pb.TagNumber(10)
  set thumbnail($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasThumbnail() => $_has(9);
  @$pb.TagNumber(10)
  void clearThumbnail() => clearField(10);

  @$pb.TagNumber(11)
  $core.bool get thumbnailReady => $_getBF(10);
  @$pb.TagNumber(11)
  set thumbnailReady($core.bool v) { $_setBool(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasThumbnailReady() => $_has(10);
  @$pb.TagNumber(11)
  void clearThumbnailReady() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get link => $_getSZ(11);
  @$pb.TagNumber(12)
  set link($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasLink() => $_has(11);
  @$pb.TagNumber(12)
  void clearLink() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get ext => $_getSZ(12);
  @$pb.TagNumber(13)
  set ext($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasExt() => $_has(12);
  @$pb.TagNumber(13)
  void clearExt() => clearField(13);

  @$pb.TagNumber(14)
  $fixnum.Int64 get seesionId => $_getI64(13);
  @$pb.TagNumber(14)
  set seesionId($fixnum.Int64 v) { $_setInt64(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasSeesionId() => $_has(13);
  @$pb.TagNumber(14)
  void clearSeesionId() => clearField(14);
}

class FilePart extends $pb.GeneratedMessage {
  factory FilePart({
    $fixnum.Int64? sessionId,
    $fixnum.Int64? readyPartsCount,
    $fixnum.Int64? partsCount,
    $fixnum.Int64? size,
    $fixnum.Int64? speed,
  }) {
    final $result = create();
    if (sessionId != null) {
      $result.sessionId = sessionId;
    }
    if (readyPartsCount != null) {
      $result.readyPartsCount = readyPartsCount;
    }
    if (partsCount != null) {
      $result.partsCount = partsCount;
    }
    if (size != null) {
      $result.size = size;
    }
    if (speed != null) {
      $result.speed = speed;
    }
    return $result;
  }
  FilePart._() : super();
  factory FilePart.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FilePart.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FilePart', package: const $pb.PackageName(_omitMessageNames ? '' : 'message'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'sessionId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'readyPartsCount', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'partsCount', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : 'size', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(5, _omitFieldNames ? '' : 'speed', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FilePart clone() => FilePart()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FilePart copyWith(void Function(FilePart) updates) => super.copyWith((message) => updates(message as FilePart)) as FilePart;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FilePart create() => FilePart._();
  FilePart createEmptyInstance() => create();
  static $pb.PbList<FilePart> createRepeated() => $pb.PbList<FilePart>();
  @$core.pragma('dart2js:noInline')
  static FilePart getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FilePart>(create);
  static FilePart? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get sessionId => $_getI64(0);
  @$pb.TagNumber(1)
  set sessionId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get readyPartsCount => $_getI64(1);
  @$pb.TagNumber(2)
  set readyPartsCount($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasReadyPartsCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearReadyPartsCount() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get partsCount => $_getI64(2);
  @$pb.TagNumber(3)
  set partsCount($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPartsCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearPartsCount() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get size => $_getI64(3);
  @$pb.TagNumber(4)
  set size($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSize() => $_has(3);
  @$pb.TagNumber(4)
  void clearSize() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get speed => $_getI64(4);
  @$pb.TagNumber(5)
  set speed($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSpeed() => $_has(4);
  @$pb.TagNumber(5)
  void clearSpeed() => clearField(5);
}

class GetFileIn extends $pb.GeneratedMessage {
  factory GetFileIn({
    GetFileType? type,
    $core.String? link,
    $core.String? path,
  }) {
    final $result = create();
    if (type != null) {
      $result.type = type;
    }
    if (link != null) {
      $result.link = link;
    }
    if (path != null) {
      $result.path = path;
    }
    return $result;
  }
  GetFileIn._() : super();
  factory GetFileIn.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetFileIn.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetFileIn', package: const $pb.PackageName(_omitMessageNames ? '' : 'message'), createEmptyInstance: create)
    ..e<GetFileType>(1, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: GetFileType.FileToPath, valueOf: GetFileType.valueOf, enumValues: GetFileType.values)
    ..aOS(2, _omitFieldNames ? '' : 'link')
    ..aOS(3, _omitFieldNames ? '' : 'path')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetFileIn clone() => GetFileIn()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetFileIn copyWith(void Function(GetFileIn) updates) => super.copyWith((message) => updates(message as GetFileIn)) as GetFileIn;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetFileIn create() => GetFileIn._();
  GetFileIn createEmptyInstance() => create();
  static $pb.PbList<GetFileIn> createRepeated() => $pb.PbList<GetFileIn>();
  @$core.pragma('dart2js:noInline')
  static GetFileIn getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetFileIn>(create);
  static GetFileIn? _defaultInstance;

  @$pb.TagNumber(1)
  GetFileType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(GetFileType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get link => $_getSZ(1);
  @$pb.TagNumber(2)
  set link($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLink() => $_has(1);
  @$pb.TagNumber(2)
  void clearLink() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get path => $_getSZ(2);
  @$pb.TagNumber(3)
  set path($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPath() => $_has(2);
  @$pb.TagNumber(3)
  void clearPath() => clearField(3);
}

class GetFileOut extends $pb.GeneratedMessage {
  factory GetFileOut({
    $0.ERROR_CODE? error,
    $core.Iterable<$core.int>? data,
    $fixnum.Int64? sessionId,
  }) {
    final $result = create();
    if (error != null) {
      $result.error = error;
    }
    if (data != null) {
      $result.data.addAll(data);
    }
    if (sessionId != null) {
      $result.sessionId = sessionId;
    }
    return $result;
  }
  GetFileOut._() : super();
  factory GetFileOut.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetFileOut.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetFileOut', package: const $pb.PackageName(_omitMessageNames ? '' : 'message'), createEmptyInstance: create)
    ..e<$0.ERROR_CODE>(1, _omitFieldNames ? '' : 'error', $pb.PbFieldType.OE, defaultOrMaker: $0.ERROR_CODE.ERR_OK, valueOf: $0.ERROR_CODE.valueOf, enumValues: $0.ERROR_CODE.values)
    ..p<$core.int>(2, _omitFieldNames ? '' : 'data', $pb.PbFieldType.PU3)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'sessionId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetFileOut clone() => GetFileOut()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetFileOut copyWith(void Function(GetFileOut) updates) => super.copyWith((message) => updates(message as GetFileOut)) as GetFileOut;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetFileOut create() => GetFileOut._();
  GetFileOut createEmptyInstance() => create();
  static $pb.PbList<GetFileOut> createRepeated() => $pb.PbList<GetFileOut>();
  @$core.pragma('dart2js:noInline')
  static GetFileOut getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetFileOut>(create);
  static GetFileOut? _defaultInstance;

  @$pb.TagNumber(1)
  $0.ERROR_CODE get error => $_getN(0);
  @$pb.TagNumber(1)
  set error($0.ERROR_CODE v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasError() => $_has(0);
  @$pb.TagNumber(1)
  void clearError() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get data => $_getList(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get sessionId => $_getI64(2);
  @$pb.TagNumber(3)
  set sessionId($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSessionId() => $_has(2);
  @$pb.TagNumber(3)
  void clearSessionId() => clearField(3);
}

enum GetFileStateIn_Msg {
  link, 
  sessionId, 
  notSet
}

class GetFileStateIn extends $pb.GeneratedMessage {
  factory GetFileStateIn({
    GetFileStateType? type,
    $core.String? link,
    $fixnum.Int64? sessionId,
  }) {
    final $result = create();
    if (type != null) {
      $result.type = type;
    }
    if (link != null) {
      $result.link = link;
    }
    if (sessionId != null) {
      $result.sessionId = sessionId;
    }
    return $result;
  }
  GetFileStateIn._() : super();
  factory GetFileStateIn.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetFileStateIn.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, GetFileStateIn_Msg> _GetFileStateIn_MsgByTag = {
    2 : GetFileStateIn_Msg.link,
    3 : GetFileStateIn_Msg.sessionId,
    0 : GetFileStateIn_Msg.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetFileStateIn', package: const $pb.PackageName(_omitMessageNames ? '' : 'message'), createEmptyInstance: create)
    ..oo(0, [2, 3])
    ..e<GetFileStateType>(1, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: GetFileStateType.FileStateSession, valueOf: GetFileStateType.valueOf, enumValues: GetFileStateType.values)
    ..aOS(2, _omitFieldNames ? '' : 'link')
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'sessionId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetFileStateIn clone() => GetFileStateIn()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetFileStateIn copyWith(void Function(GetFileStateIn) updates) => super.copyWith((message) => updates(message as GetFileStateIn)) as GetFileStateIn;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetFileStateIn create() => GetFileStateIn._();
  GetFileStateIn createEmptyInstance() => create();
  static $pb.PbList<GetFileStateIn> createRepeated() => $pb.PbList<GetFileStateIn>();
  @$core.pragma('dart2js:noInline')
  static GetFileStateIn getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetFileStateIn>(create);
  static GetFileStateIn? _defaultInstance;

  GetFileStateIn_Msg whichMsg() => _GetFileStateIn_MsgByTag[$_whichOneof(0)]!;
  void clearMsg() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  GetFileStateType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(GetFileStateType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get link => $_getSZ(1);
  @$pb.TagNumber(2)
  set link($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLink() => $_has(1);
  @$pb.TagNumber(2)
  void clearLink() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get sessionId => $_getI64(2);
  @$pb.TagNumber(3)
  set sessionId($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSessionId() => $_has(2);
  @$pb.TagNumber(3)
  void clearSessionId() => clearField(3);
}

enum GetFileStateOut_Msg {
  isLoaded, 
  fileState, 
  notSet
}

class GetFileStateOut extends $pb.GeneratedMessage {
  factory GetFileStateOut({
    $core.bool? isLoaded,
    FileState? fileState,
  }) {
    final $result = create();
    if (isLoaded != null) {
      $result.isLoaded = isLoaded;
    }
    if (fileState != null) {
      $result.fileState = fileState;
    }
    return $result;
  }
  GetFileStateOut._() : super();
  factory GetFileStateOut.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetFileStateOut.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, GetFileStateOut_Msg> _GetFileStateOut_MsgByTag = {
    1 : GetFileStateOut_Msg.isLoaded,
    2 : GetFileStateOut_Msg.fileState,
    0 : GetFileStateOut_Msg.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetFileStateOut', package: const $pb.PackageName(_omitMessageNames ? '' : 'message'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOB(1, _omitFieldNames ? '' : 'isLoaded')
    ..aOM<FileState>(2, _omitFieldNames ? '' : 'fileState', subBuilder: FileState.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetFileStateOut clone() => GetFileStateOut()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetFileStateOut copyWith(void Function(GetFileStateOut) updates) => super.copyWith((message) => updates(message as GetFileStateOut)) as GetFileStateOut;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetFileStateOut create() => GetFileStateOut._();
  GetFileStateOut createEmptyInstance() => create();
  static $pb.PbList<GetFileStateOut> createRepeated() => $pb.PbList<GetFileStateOut>();
  @$core.pragma('dart2js:noInline')
  static GetFileStateOut getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetFileStateOut>(create);
  static GetFileStateOut? _defaultInstance;

  GetFileStateOut_Msg whichMsg() => _GetFileStateOut_MsgByTag[$_whichOneof(0)]!;
  void clearMsg() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.bool get isLoaded => $_getBF(0);
  @$pb.TagNumber(1)
  set isLoaded($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsLoaded() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsLoaded() => clearField(1);

  @$pb.TagNumber(2)
  FileState get fileState => $_getN(1);
  @$pb.TagNumber(2)
  set fileState(FileState v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasFileState() => $_has(1);
  @$pb.TagNumber(2)
  void clearFileState() => clearField(2);
  @$pb.TagNumber(2)
  FileState ensureFileState() => $_ensure(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');

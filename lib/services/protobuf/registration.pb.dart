//
//  Generated code. Do not modify.
//  source: registration.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'netlib.pbenum.dart' as $0;
import 'registration.pbenum.dart';

export 'registration.pbenum.dart';

class ProfileRec extends $pb.GeneratedMessage {
  factory ProfileRec({
    $core.String? profile,
    $fixnum.Int64? deviceId,
    $fixnum.Int64? abonentId,
    $core.String? name,
    GREG_STATE? gRegState,
    PROFILE_STATE? use,
  }) {
    final $result = create();
    if (profile != null) {
      $result.profile = profile;
    }
    if (deviceId != null) {
      $result.deviceId = deviceId;
    }
    if (abonentId != null) {
      $result.abonentId = abonentId;
    }
    if (name != null) {
      $result.name = name;
    }
    if (gRegState != null) {
      $result.gRegState = gRegState;
    }
    if (use != null) {
      $result.use = use;
    }
    return $result;
  }
  ProfileRec._() : super();
  factory ProfileRec.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ProfileRec.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ProfileRec', package: const $pb.PackageName(_omitMessageNames ? '' : 'registration'), createEmptyInstance: create)
    ..aQS(1, _omitFieldNames ? '' : 'Profile', protoName: 'Profile')
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'DeviceId', $pb.PbFieldType.QU6, protoName: 'DeviceId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'AbonentId', $pb.PbFieldType.QU6, protoName: 'AbonentId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aQS(4, _omitFieldNames ? '' : 'Name', protoName: 'Name')
    ..e<GREG_STATE>(6, _omitFieldNames ? '' : 'GRegState', $pb.PbFieldType.QE, protoName: 'GRegState', defaultOrMaker: GREG_STATE.GREG_OK_NO_ACTIVE_PROFILE, valueOf: GREG_STATE.valueOf, enumValues: GREG_STATE.values)
    ..e<PROFILE_STATE>(9, _omitFieldNames ? '' : 'Use', $pb.PbFieldType.QE, protoName: 'Use', defaultOrMaker: PROFILE_STATE.PROF_UNUSED, valueOf: PROFILE_STATE.valueOf, enumValues: PROFILE_STATE.values)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ProfileRec clone() => ProfileRec()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ProfileRec copyWith(void Function(ProfileRec) updates) => super.copyWith((message) => updates(message as ProfileRec)) as ProfileRec;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProfileRec create() => ProfileRec._();
  ProfileRec createEmptyInstance() => create();
  static $pb.PbList<ProfileRec> createRepeated() => $pb.PbList<ProfileRec>();
  @$core.pragma('dart2js:noInline')
  static ProfileRec getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ProfileRec>(create);
  static ProfileRec? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get profile => $_getSZ(0);
  @$pb.TagNumber(1)
  set profile($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasProfile() => $_has(0);
  @$pb.TagNumber(1)
  void clearProfile() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get deviceId => $_getI64(1);
  @$pb.TagNumber(2)
  set deviceId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDeviceId() => $_has(1);
  @$pb.TagNumber(2)
  void clearDeviceId() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get abonentId => $_getI64(2);
  @$pb.TagNumber(3)
  set abonentId($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAbonentId() => $_has(2);
  @$pb.TagNumber(3)
  void clearAbonentId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get name => $_getSZ(3);
  @$pb.TagNumber(4)
  set name($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasName() => $_has(3);
  @$pb.TagNumber(4)
  void clearName() => clearField(4);

  @$pb.TagNumber(6)
  GREG_STATE get gRegState => $_getN(4);
  @$pb.TagNumber(6)
  set gRegState(GREG_STATE v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasGRegState() => $_has(4);
  @$pb.TagNumber(6)
  void clearGRegState() => clearField(6);

  @$pb.TagNumber(9)
  PROFILE_STATE get use => $_getN(5);
  @$pb.TagNumber(9)
  set use(PROFILE_STATE v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasUse() => $_has(5);
  @$pb.TagNumber(9)
  void clearUse() => clearField(9);
}

class RegProfileListChangedData extends $pb.GeneratedMessage {
  factory RegProfileListChangedData({
    $core.Iterable<ProfileRec>? profileListChanged,
  }) {
    final $result = create();
    if (profileListChanged != null) {
      $result.profileListChanged.addAll(profileListChanged);
    }
    return $result;
  }
  RegProfileListChangedData._() : super();
  factory RegProfileListChangedData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RegProfileListChangedData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RegProfileListChangedData', package: const $pb.PackageName(_omitMessageNames ? '' : 'registration'), createEmptyInstance: create)
    ..pc<ProfileRec>(1, _omitFieldNames ? '' : 'profileListChanged', $pb.PbFieldType.PM, subBuilder: ProfileRec.create)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RegProfileListChangedData clone() => RegProfileListChangedData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RegProfileListChangedData copyWith(void Function(RegProfileListChangedData) updates) => super.copyWith((message) => updates(message as RegProfileListChangedData)) as RegProfileListChangedData;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RegProfileListChangedData create() => RegProfileListChangedData._();
  RegProfileListChangedData createEmptyInstance() => create();
  static $pb.PbList<RegProfileListChangedData> createRepeated() => $pb.PbList<RegProfileListChangedData>();
  @$core.pragma('dart2js:noInline')
  static RegProfileListChangedData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RegProfileListChangedData>(create);
  static RegProfileListChangedData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ProfileRec> get profileListChanged => $_getList(0);
}

class RegStatusChangedRes extends $pb.GeneratedMessage {
  factory RegStatusChangedRes({
    GREG_STATE? regState,
    $core.String? regStateStr,
    $0.ERROR_CODE? regErr,
    $core.String? email,
    $core.String? phone,
    $core.String? name,
    $core.String? nameSecond,
    $core.String? address,
    $core.String? notes,
    $core.bool? hide,
    REG_EXT_FACTOR_TYPE? factor,
    $core.bool? isWait,
    $fixnum.Int64? infoId,
    $fixnum.Int64? infoDevId,
    $core.String? infoName,
    $core.String? profileId,
  }) {
    final $result = create();
    if (regState != null) {
      $result.regState = regState;
    }
    if (regStateStr != null) {
      $result.regStateStr = regStateStr;
    }
    if (regErr != null) {
      $result.regErr = regErr;
    }
    if (email != null) {
      $result.email = email;
    }
    if (phone != null) {
      $result.phone = phone;
    }
    if (name != null) {
      $result.name = name;
    }
    if (nameSecond != null) {
      $result.nameSecond = nameSecond;
    }
    if (address != null) {
      $result.address = address;
    }
    if (notes != null) {
      $result.notes = notes;
    }
    if (hide != null) {
      $result.hide = hide;
    }
    if (factor != null) {
      $result.factor = factor;
    }
    if (isWait != null) {
      $result.isWait = isWait;
    }
    if (infoId != null) {
      $result.infoId = infoId;
    }
    if (infoDevId != null) {
      $result.infoDevId = infoDevId;
    }
    if (infoName != null) {
      $result.infoName = infoName;
    }
    if (profileId != null) {
      $result.profileId = profileId;
    }
    return $result;
  }
  RegStatusChangedRes._() : super();
  factory RegStatusChangedRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RegStatusChangedRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RegStatusChangedRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'registration'), createEmptyInstance: create)
    ..e<GREG_STATE>(1, _omitFieldNames ? '' : 'regState', $pb.PbFieldType.OE, protoName: 'regState', defaultOrMaker: GREG_STATE.GREG_OK_NO_ACTIVE_PROFILE, valueOf: GREG_STATE.valueOf, enumValues: GREG_STATE.values)
    ..aOS(3, _omitFieldNames ? '' : 'regStateStr', protoName: 'regStateStr')
    ..e<$0.ERROR_CODE>(4, _omitFieldNames ? '' : 'regErr', $pb.PbFieldType.OE, protoName: 'regErr', defaultOrMaker: $0.ERROR_CODE.ERR_OK, valueOf: $0.ERROR_CODE.valueOf, enumValues: $0.ERROR_CODE.values)
    ..aOS(5, _omitFieldNames ? '' : 'email')
    ..aOS(6, _omitFieldNames ? '' : 'phone')
    ..aOS(7, _omitFieldNames ? '' : 'name')
    ..aOS(8, _omitFieldNames ? '' : 'nameSecond', protoName: 'nameSecond')
    ..aOS(9, _omitFieldNames ? '' : 'address')
    ..aOS(10, _omitFieldNames ? '' : 'notes')
    ..aOB(11, _omitFieldNames ? '' : 'hide')
    ..e<REG_EXT_FACTOR_TYPE>(12, _omitFieldNames ? '' : 'factor', $pb.PbFieldType.OE, defaultOrMaker: REG_EXT_FACTOR_TYPE.REG_EXTFACTOR_UNSET, valueOf: REG_EXT_FACTOR_TYPE.valueOf, enumValues: REG_EXT_FACTOR_TYPE.values)
    ..aOB(13, _omitFieldNames ? '' : 'isWait', protoName: 'isWait')
    ..a<$fixnum.Int64>(14, _omitFieldNames ? '' : 'infoId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(15, _omitFieldNames ? '' : 'infoDevId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(16, _omitFieldNames ? '' : 'infoName')
    ..aOS(17, _omitFieldNames ? '' : 'profileId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RegStatusChangedRes clone() => RegStatusChangedRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RegStatusChangedRes copyWith(void Function(RegStatusChangedRes) updates) => super.copyWith((message) => updates(message as RegStatusChangedRes)) as RegStatusChangedRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RegStatusChangedRes create() => RegStatusChangedRes._();
  RegStatusChangedRes createEmptyInstance() => create();
  static $pb.PbList<RegStatusChangedRes> createRepeated() => $pb.PbList<RegStatusChangedRes>();
  @$core.pragma('dart2js:noInline')
  static RegStatusChangedRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RegStatusChangedRes>(create);
  static RegStatusChangedRes? _defaultInstance;

  @$pb.TagNumber(1)
  GREG_STATE get regState => $_getN(0);
  @$pb.TagNumber(1)
  set regState(GREG_STATE v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasRegState() => $_has(0);
  @$pb.TagNumber(1)
  void clearRegState() => clearField(1);

  @$pb.TagNumber(3)
  $core.String get regStateStr => $_getSZ(1);
  @$pb.TagNumber(3)
  set regStateStr($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasRegStateStr() => $_has(1);
  @$pb.TagNumber(3)
  void clearRegStateStr() => clearField(3);

  @$pb.TagNumber(4)
  $0.ERROR_CODE get regErr => $_getN(2);
  @$pb.TagNumber(4)
  set regErr($0.ERROR_CODE v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasRegErr() => $_has(2);
  @$pb.TagNumber(4)
  void clearRegErr() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get email => $_getSZ(3);
  @$pb.TagNumber(5)
  set email($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(5)
  $core.bool hasEmail() => $_has(3);
  @$pb.TagNumber(5)
  void clearEmail() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get phone => $_getSZ(4);
  @$pb.TagNumber(6)
  set phone($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(6)
  $core.bool hasPhone() => $_has(4);
  @$pb.TagNumber(6)
  void clearPhone() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get name => $_getSZ(5);
  @$pb.TagNumber(7)
  set name($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(7)
  $core.bool hasName() => $_has(5);
  @$pb.TagNumber(7)
  void clearName() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get nameSecond => $_getSZ(6);
  @$pb.TagNumber(8)
  set nameSecond($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(8)
  $core.bool hasNameSecond() => $_has(6);
  @$pb.TagNumber(8)
  void clearNameSecond() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get address => $_getSZ(7);
  @$pb.TagNumber(9)
  set address($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(9)
  $core.bool hasAddress() => $_has(7);
  @$pb.TagNumber(9)
  void clearAddress() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get notes => $_getSZ(8);
  @$pb.TagNumber(10)
  set notes($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(10)
  $core.bool hasNotes() => $_has(8);
  @$pb.TagNumber(10)
  void clearNotes() => clearField(10);

  @$pb.TagNumber(11)
  $core.bool get hide => $_getBF(9);
  @$pb.TagNumber(11)
  set hide($core.bool v) { $_setBool(9, v); }
  @$pb.TagNumber(11)
  $core.bool hasHide() => $_has(9);
  @$pb.TagNumber(11)
  void clearHide() => clearField(11);

  @$pb.TagNumber(12)
  REG_EXT_FACTOR_TYPE get factor => $_getN(10);
  @$pb.TagNumber(12)
  set factor(REG_EXT_FACTOR_TYPE v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasFactor() => $_has(10);
  @$pb.TagNumber(12)
  void clearFactor() => clearField(12);

  @$pb.TagNumber(13)
  $core.bool get isWait => $_getBF(11);
  @$pb.TagNumber(13)
  set isWait($core.bool v) { $_setBool(11, v); }
  @$pb.TagNumber(13)
  $core.bool hasIsWait() => $_has(11);
  @$pb.TagNumber(13)
  void clearIsWait() => clearField(13);

  @$pb.TagNumber(14)
  $fixnum.Int64 get infoId => $_getI64(12);
  @$pb.TagNumber(14)
  set infoId($fixnum.Int64 v) { $_setInt64(12, v); }
  @$pb.TagNumber(14)
  $core.bool hasInfoId() => $_has(12);
  @$pb.TagNumber(14)
  void clearInfoId() => clearField(14);

  @$pb.TagNumber(15)
  $fixnum.Int64 get infoDevId => $_getI64(13);
  @$pb.TagNumber(15)
  set infoDevId($fixnum.Int64 v) { $_setInt64(13, v); }
  @$pb.TagNumber(15)
  $core.bool hasInfoDevId() => $_has(13);
  @$pb.TagNumber(15)
  void clearInfoDevId() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get infoName => $_getSZ(14);
  @$pb.TagNumber(16)
  set infoName($core.String v) { $_setString(14, v); }
  @$pb.TagNumber(16)
  $core.bool hasInfoName() => $_has(14);
  @$pb.TagNumber(16)
  void clearInfoName() => clearField(16);

  @$pb.TagNumber(17)
  $core.String get profileId => $_getSZ(15);
  @$pb.TagNumber(17)
  set profileId($core.String v) { $_setString(15, v); }
  @$pb.TagNumber(17)
  $core.bool hasProfileId() => $_has(15);
  @$pb.TagNumber(17)
  void clearProfileId() => clearField(17);
}

class RegNetErrorChangedData extends $pb.GeneratedMessage {
  factory RegNetErrorChangedData({
    $0.ERROR_CODE? netErrorCode,
    $core.String? netErrorCodeStr,
  }) {
    final $result = create();
    if (netErrorCode != null) {
      $result.netErrorCode = netErrorCode;
    }
    if (netErrorCodeStr != null) {
      $result.netErrorCodeStr = netErrorCodeStr;
    }
    return $result;
  }
  RegNetErrorChangedData._() : super();
  factory RegNetErrorChangedData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RegNetErrorChangedData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RegNetErrorChangedData', package: const $pb.PackageName(_omitMessageNames ? '' : 'registration'), createEmptyInstance: create)
    ..e<$0.ERROR_CODE>(1, _omitFieldNames ? '' : 'netErrorCode', $pb.PbFieldType.QE, protoName: 'netErrorCode', defaultOrMaker: $0.ERROR_CODE.ERR_OK, valueOf: $0.ERROR_CODE.valueOf, enumValues: $0.ERROR_CODE.values)
    ..aQS(2, _omitFieldNames ? '' : 'netErrorCodeStr', protoName: 'netErrorCodeStr')
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RegNetErrorChangedData clone() => RegNetErrorChangedData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RegNetErrorChangedData copyWith(void Function(RegNetErrorChangedData) updates) => super.copyWith((message) => updates(message as RegNetErrorChangedData)) as RegNetErrorChangedData;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RegNetErrorChangedData create() => RegNetErrorChangedData._();
  RegNetErrorChangedData createEmptyInstance() => create();
  static $pb.PbList<RegNetErrorChangedData> createRepeated() => $pb.PbList<RegNetErrorChangedData>();
  @$core.pragma('dart2js:noInline')
  static RegNetErrorChangedData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RegNetErrorChangedData>(create);
  static RegNetErrorChangedData? _defaultInstance;

  @$pb.TagNumber(1)
  $0.ERROR_CODE get netErrorCode => $_getN(0);
  @$pb.TagNumber(1)
  set netErrorCode($0.ERROR_CODE v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasNetErrorCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearNetErrorCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get netErrorCodeStr => $_getSZ(1);
  @$pb.TagNumber(2)
  set netErrorCodeStr($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNetErrorCodeStr() => $_has(1);
  @$pb.TagNumber(2)
  void clearNetErrorCodeStr() => clearField(2);
}

class RegStartReq extends $pb.GeneratedMessage {
  factory RegStartReq({
    $core.String? password,
    $core.bool? cancelRegistration,
  }) {
    final $result = create();
    if (password != null) {
      $result.password = password;
    }
    if (cancelRegistration != null) {
      $result.cancelRegistration = cancelRegistration;
    }
    return $result;
  }
  RegStartReq._() : super();
  factory RegStartReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RegStartReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RegStartReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'registration'), createEmptyInstance: create)
    ..aQS(1, _omitFieldNames ? '' : 'password')
    ..a<$core.bool>(2, _omitFieldNames ? '' : 'cancelRegistration', $pb.PbFieldType.QB, protoName: 'cancelRegistration')
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RegStartReq clone() => RegStartReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RegStartReq copyWith(void Function(RegStartReq) updates) => super.copyWith((message) => updates(message as RegStartReq)) as RegStartReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RegStartReq create() => RegStartReq._();
  RegStartReq createEmptyInstance() => create();
  static $pb.PbList<RegStartReq> createRepeated() => $pb.PbList<RegStartReq>();
  @$core.pragma('dart2js:noInline')
  static RegStartReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RegStartReq>(create);
  static RegStartReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get password => $_getSZ(0);
  @$pb.TagNumber(1)
  set password($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPassword() => $_has(0);
  @$pb.TagNumber(1)
  void clearPassword() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get cancelRegistration => $_getBF(1);
  @$pb.TagNumber(2)
  set cancelRegistration($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCancelRegistration() => $_has(1);
  @$pb.TagNumber(2)
  void clearCancelRegistration() => clearField(2);
}

class RegStartRecoveryReq extends $pb.GeneratedMessage {
  factory RegStartRecoveryReq({
    $core.bool? cancelRegistration,
  }) {
    final $result = create();
    if (cancelRegistration != null) {
      $result.cancelRegistration = cancelRegistration;
    }
    return $result;
  }
  RegStartRecoveryReq._() : super();
  factory RegStartRecoveryReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RegStartRecoveryReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RegStartRecoveryReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'registration'), createEmptyInstance: create)
    ..a<$core.bool>(1, _omitFieldNames ? '' : 'cancelRegistration', $pb.PbFieldType.QB, protoName: 'cancelRegistration')
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RegStartRecoveryReq clone() => RegStartRecoveryReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RegStartRecoveryReq copyWith(void Function(RegStartRecoveryReq) updates) => super.copyWith((message) => updates(message as RegStartRecoveryReq)) as RegStartRecoveryReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RegStartRecoveryReq create() => RegStartRecoveryReq._();
  RegStartRecoveryReq createEmptyInstance() => create();
  static $pb.PbList<RegStartRecoveryReq> createRepeated() => $pb.PbList<RegStartRecoveryReq>();
  @$core.pragma('dart2js:noInline')
  static RegStartRecoveryReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RegStartRecoveryReq>(create);
  static RegStartRecoveryReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get cancelRegistration => $_getBF(0);
  @$pb.TagNumber(1)
  set cancelRegistration($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCancelRegistration() => $_has(0);
  @$pb.TagNumber(1)
  void clearCancelRegistration() => clearField(1);
}

class RegSetExtFactorReq extends $pb.GeneratedMessage {
  factory RegSetExtFactorReq({
    REG_EXT_FACTOR_TYPE? factoryType,
    $core.String? value,
  }) {
    final $result = create();
    if (factoryType != null) {
      $result.factoryType = factoryType;
    }
    if (value != null) {
      $result.value = value;
    }
    return $result;
  }
  RegSetExtFactorReq._() : super();
  factory RegSetExtFactorReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RegSetExtFactorReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RegSetExtFactorReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'registration'), createEmptyInstance: create)
    ..e<REG_EXT_FACTOR_TYPE>(1, _omitFieldNames ? '' : 'factoryType', $pb.PbFieldType.QE, protoName: 'factoryType', defaultOrMaker: REG_EXT_FACTOR_TYPE.REG_EXTFACTOR_UNSET, valueOf: REG_EXT_FACTOR_TYPE.valueOf, enumValues: REG_EXT_FACTOR_TYPE.values)
    ..aQS(2, _omitFieldNames ? '' : 'value')
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RegSetExtFactorReq clone() => RegSetExtFactorReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RegSetExtFactorReq copyWith(void Function(RegSetExtFactorReq) updates) => super.copyWith((message) => updates(message as RegSetExtFactorReq)) as RegSetExtFactorReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RegSetExtFactorReq create() => RegSetExtFactorReq._();
  RegSetExtFactorReq createEmptyInstance() => create();
  static $pb.PbList<RegSetExtFactorReq> createRepeated() => $pb.PbList<RegSetExtFactorReq>();
  @$core.pragma('dart2js:noInline')
  static RegSetExtFactorReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RegSetExtFactorReq>(create);
  static RegSetExtFactorReq? _defaultInstance;

  @$pb.TagNumber(1)
  REG_EXT_FACTOR_TYPE get factoryType => $_getN(0);
  @$pb.TagNumber(1)
  set factoryType(REG_EXT_FACTOR_TYPE v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasFactoryType() => $_has(0);
  @$pb.TagNumber(1)
  void clearFactoryType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get value => $_getSZ(1);
  @$pb.TagNumber(2)
  set value($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);
}

class RegEnterConfirmCodeReq extends $pb.GeneratedMessage {
  factory RegEnterConfirmCodeReq({
    $core.String? value,
  }) {
    final $result = create();
    if (value != null) {
      $result.value = value;
    }
    return $result;
  }
  RegEnterConfirmCodeReq._() : super();
  factory RegEnterConfirmCodeReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RegEnterConfirmCodeReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RegEnterConfirmCodeReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'registration'), createEmptyInstance: create)
    ..aQS(1, _omitFieldNames ? '' : 'value')
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RegEnterConfirmCodeReq clone() => RegEnterConfirmCodeReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RegEnterConfirmCodeReq copyWith(void Function(RegEnterConfirmCodeReq) updates) => super.copyWith((message) => updates(message as RegEnterConfirmCodeReq)) as RegEnterConfirmCodeReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RegEnterConfirmCodeReq create() => RegEnterConfirmCodeReq._();
  RegEnterConfirmCodeReq createEmptyInstance() => create();
  static $pb.PbList<RegEnterConfirmCodeReq> createRepeated() => $pb.PbList<RegEnterConfirmCodeReq>();
  @$core.pragma('dart2js:noInline')
  static RegEnterConfirmCodeReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RegEnterConfirmCodeReq>(create);
  static RegEnterConfirmCodeReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get value => $_getSZ(0);
  @$pb.TagNumber(1)
  set value($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

class RegEnterInfoReq extends $pb.GeneratedMessage {
  factory RegEnterInfoReq({
    $core.String? email,
    $core.String? phone,
    $core.String? name,
    $core.String? nameSecond,
    $core.String? address,
    $core.String? notes,
    $core.bool? hide,
  }) {
    final $result = create();
    if (email != null) {
      $result.email = email;
    }
    if (phone != null) {
      $result.phone = phone;
    }
    if (name != null) {
      $result.name = name;
    }
    if (nameSecond != null) {
      $result.nameSecond = nameSecond;
    }
    if (address != null) {
      $result.address = address;
    }
    if (notes != null) {
      $result.notes = notes;
    }
    if (hide != null) {
      $result.hide = hide;
    }
    return $result;
  }
  RegEnterInfoReq._() : super();
  factory RegEnterInfoReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RegEnterInfoReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RegEnterInfoReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'registration'), createEmptyInstance: create)
    ..aQS(1, _omitFieldNames ? '' : 'email')
    ..aQS(2, _omitFieldNames ? '' : 'phone')
    ..aQS(3, _omitFieldNames ? '' : 'name')
    ..aQS(4, _omitFieldNames ? '' : 'nameSecond', protoName: 'nameSecond')
    ..aQS(5, _omitFieldNames ? '' : 'address')
    ..aQS(6, _omitFieldNames ? '' : 'notes')
    ..a<$core.bool>(7, _omitFieldNames ? '' : 'hide', $pb.PbFieldType.QB)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RegEnterInfoReq clone() => RegEnterInfoReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RegEnterInfoReq copyWith(void Function(RegEnterInfoReq) updates) => super.copyWith((message) => updates(message as RegEnterInfoReq)) as RegEnterInfoReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RegEnterInfoReq create() => RegEnterInfoReq._();
  RegEnterInfoReq createEmptyInstance() => create();
  static $pb.PbList<RegEnterInfoReq> createRepeated() => $pb.PbList<RegEnterInfoReq>();
  @$core.pragma('dart2js:noInline')
  static RegEnterInfoReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RegEnterInfoReq>(create);
  static RegEnterInfoReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get phone => $_getSZ(1);
  @$pb.TagNumber(2)
  set phone($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPhone() => $_has(1);
  @$pb.TagNumber(2)
  void clearPhone() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get nameSecond => $_getSZ(3);
  @$pb.TagNumber(4)
  set nameSecond($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasNameSecond() => $_has(3);
  @$pb.TagNumber(4)
  void clearNameSecond() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get address => $_getSZ(4);
  @$pb.TagNumber(5)
  set address($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasAddress() => $_has(4);
  @$pb.TagNumber(5)
  void clearAddress() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get notes => $_getSZ(5);
  @$pb.TagNumber(6)
  set notes($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasNotes() => $_has(5);
  @$pb.TagNumber(6)
  void clearNotes() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get hide => $_getBF(6);
  @$pb.TagNumber(7)
  set hide($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasHide() => $_has(6);
  @$pb.TagNumber(7)
  void clearHide() => clearField(7);
}

class RegEnterMsgKeyPasswordReq extends $pb.GeneratedMessage {
  factory RegEnterMsgKeyPasswordReq({
    $core.String? password,
    $core.bool? useForAccount,
  }) {
    final $result = create();
    if (password != null) {
      $result.password = password;
    }
    if (useForAccount != null) {
      $result.useForAccount = useForAccount;
    }
    return $result;
  }
  RegEnterMsgKeyPasswordReq._() : super();
  factory RegEnterMsgKeyPasswordReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RegEnterMsgKeyPasswordReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RegEnterMsgKeyPasswordReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'registration'), createEmptyInstance: create)
    ..aQS(1, _omitFieldNames ? '' : 'password')
    ..a<$core.bool>(2, _omitFieldNames ? '' : 'useForAccount', $pb.PbFieldType.QB, protoName: 'useForAccount')
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RegEnterMsgKeyPasswordReq clone() => RegEnterMsgKeyPasswordReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RegEnterMsgKeyPasswordReq copyWith(void Function(RegEnterMsgKeyPasswordReq) updates) => super.copyWith((message) => updates(message as RegEnterMsgKeyPasswordReq)) as RegEnterMsgKeyPasswordReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RegEnterMsgKeyPasswordReq create() => RegEnterMsgKeyPasswordReq._();
  RegEnterMsgKeyPasswordReq createEmptyInstance() => create();
  static $pb.PbList<RegEnterMsgKeyPasswordReq> createRepeated() => $pb.PbList<RegEnterMsgKeyPasswordReq>();
  @$core.pragma('dart2js:noInline')
  static RegEnterMsgKeyPasswordReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RegEnterMsgKeyPasswordReq>(create);
  static RegEnterMsgKeyPasswordReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get password => $_getSZ(0);
  @$pb.TagNumber(1)
  set password($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPassword() => $_has(0);
  @$pb.TagNumber(1)
  void clearPassword() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get useForAccount => $_getBF(1);
  @$pb.TagNumber(2)
  set useForAccount($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUseForAccount() => $_has(1);
  @$pb.TagNumber(2)
  void clearUseForAccount() => clearField(2);
}

class RegEnterAccountPasswordReq extends $pb.GeneratedMessage {
  factory RegEnterAccountPasswordReq({
    $core.String? password,
  }) {
    final $result = create();
    if (password != null) {
      $result.password = password;
    }
    return $result;
  }
  RegEnterAccountPasswordReq._() : super();
  factory RegEnterAccountPasswordReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RegEnterAccountPasswordReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RegEnterAccountPasswordReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'registration'), createEmptyInstance: create)
    ..aQS(1, _omitFieldNames ? '' : 'password')
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RegEnterAccountPasswordReq clone() => RegEnterAccountPasswordReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RegEnterAccountPasswordReq copyWith(void Function(RegEnterAccountPasswordReq) updates) => super.copyWith((message) => updates(message as RegEnterAccountPasswordReq)) as RegEnterAccountPasswordReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RegEnterAccountPasswordReq create() => RegEnterAccountPasswordReq._();
  RegEnterAccountPasswordReq createEmptyInstance() => create();
  static $pb.PbList<RegEnterAccountPasswordReq> createRepeated() => $pb.PbList<RegEnterAccountPasswordReq>();
  @$core.pragma('dart2js:noInline')
  static RegEnterAccountPasswordReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RegEnterAccountPasswordReq>(create);
  static RegEnterAccountPasswordReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get password => $_getSZ(0);
  @$pb.TagNumber(1)
  set password($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPassword() => $_has(0);
  @$pb.TagNumber(1)
  void clearPassword() => clearField(1);
}

class RegMouseNoiseReq extends $pb.GeneratedMessage {
  factory RegMouseNoiseReq({
    $core.String? code,
  }) {
    final $result = create();
    if (code != null) {
      $result.code = code;
    }
    return $result;
  }
  RegMouseNoiseReq._() : super();
  factory RegMouseNoiseReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RegMouseNoiseReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RegMouseNoiseReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'registration'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'code')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RegMouseNoiseReq clone() => RegMouseNoiseReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RegMouseNoiseReq copyWith(void Function(RegMouseNoiseReq) updates) => super.copyWith((message) => updates(message as RegMouseNoiseReq)) as RegMouseNoiseReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RegMouseNoiseReq create() => RegMouseNoiseReq._();
  RegMouseNoiseReq createEmptyInstance() => create();
  static $pb.PbList<RegMouseNoiseReq> createRepeated() => $pb.PbList<RegMouseNoiseReq>();
  @$core.pragma('dart2js:noInline')
  static RegMouseNoiseReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RegMouseNoiseReq>(create);
  static RegMouseNoiseReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get code => $_getSZ(0);
  @$pb.TagNumber(1)
  set code($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);
}

class RegMouseNoiseResult extends $pb.GeneratedMessage {
  factory RegMouseNoiseResult({
    $core.int? progress,
    $fixnum.Int64? authId,
    $core.bool? isDone,
  }) {
    final $result = create();
    if (progress != null) {
      $result.progress = progress;
    }
    if (authId != null) {
      $result.authId = authId;
    }
    if (isDone != null) {
      $result.isDone = isDone;
    }
    return $result;
  }
  RegMouseNoiseResult._() : super();
  factory RegMouseNoiseResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RegMouseNoiseResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RegMouseNoiseResult', package: const $pb.PackageName(_omitMessageNames ? '' : 'registration'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'progress', $pb.PbFieldType.QU3)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'authId', $pb.PbFieldType.QU6, protoName: 'authId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.bool>(3, _omitFieldNames ? '' : 'isDone', $pb.PbFieldType.QB, protoName: 'isDone')
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RegMouseNoiseResult clone() => RegMouseNoiseResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RegMouseNoiseResult copyWith(void Function(RegMouseNoiseResult) updates) => super.copyWith((message) => updates(message as RegMouseNoiseResult)) as RegMouseNoiseResult;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RegMouseNoiseResult create() => RegMouseNoiseResult._();
  RegMouseNoiseResult createEmptyInstance() => create();
  static $pb.PbList<RegMouseNoiseResult> createRepeated() => $pb.PbList<RegMouseNoiseResult>();
  @$core.pragma('dart2js:noInline')
  static RegMouseNoiseResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RegMouseNoiseResult>(create);
  static RegMouseNoiseResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get progress => $_getIZ(0);
  @$pb.TagNumber(1)
  set progress($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasProgress() => $_has(0);
  @$pb.TagNumber(1)
  void clearProgress() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get authId => $_getI64(1);
  @$pb.TagNumber(2)
  set authId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAuthId() => $_has(1);
  @$pb.TagNumber(2)
  void clearAuthId() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isDone => $_getBF(2);
  @$pb.TagNumber(3)
  set isDone($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIsDone() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsDone() => clearField(3);
}

class RegProfileIdReq extends $pb.GeneratedMessage {
  factory RegProfileIdReq({
    $core.String? name,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    return $result;
  }
  RegProfileIdReq._() : super();
  factory RegProfileIdReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RegProfileIdReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RegProfileIdReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'registration'), createEmptyInstance: create)
    ..aQS(1, _omitFieldNames ? '' : 'name')
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RegProfileIdReq clone() => RegProfileIdReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RegProfileIdReq copyWith(void Function(RegProfileIdReq) updates) => super.copyWith((message) => updates(message as RegProfileIdReq)) as RegProfileIdReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RegProfileIdReq create() => RegProfileIdReq._();
  RegProfileIdReq createEmptyInstance() => create();
  static $pb.PbList<RegProfileIdReq> createRepeated() => $pb.PbList<RegProfileIdReq>();
  @$core.pragma('dart2js:noInline')
  static RegProfileIdReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RegProfileIdReq>(create);
  static RegProfileIdReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);
}

class RegParseFileReq extends $pb.GeneratedMessage {
  factory RegParseFileReq({
    $core.String? path,
  }) {
    final $result = create();
    if (path != null) {
      $result.path = path;
    }
    return $result;
  }
  RegParseFileReq._() : super();
  factory RegParseFileReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RegParseFileReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RegParseFileReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'registration'), createEmptyInstance: create)
    ..aQS(1, _omitFieldNames ? '' : 'path')
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RegParseFileReq clone() => RegParseFileReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RegParseFileReq copyWith(void Function(RegParseFileReq) updates) => super.copyWith((message) => updates(message as RegParseFileReq)) as RegParseFileReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RegParseFileReq create() => RegParseFileReq._();
  RegParseFileReq createEmptyInstance() => create();
  static $pb.PbList<RegParseFileReq> createRepeated() => $pb.PbList<RegParseFileReq>();
  @$core.pragma('dart2js:noInline')
  static RegParseFileReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RegParseFileReq>(create);
  static RegParseFileReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get path => $_getSZ(0);
  @$pb.TagNumber(1)
  set path($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPath() => $_has(0);
  @$pb.TagNumber(1)
  void clearPath() => clearField(1);
}

class RegParseFileResp extends $pb.GeneratedMessage {
  factory RegParseFileResp({
    $core.bool? success,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  RegParseFileResp._() : super();
  factory RegParseFileResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RegParseFileResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RegParseFileResp', package: const $pb.PackageName(_omitMessageNames ? '' : 'registration'), createEmptyInstance: create)
    ..a<$core.bool>(1, _omitFieldNames ? '' : 'success', $pb.PbFieldType.QB)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RegParseFileResp clone() => RegParseFileResp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RegParseFileResp copyWith(void Function(RegParseFileResp) updates) => super.copyWith((message) => updates(message as RegParseFileResp)) as RegParseFileResp;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RegParseFileResp create() => RegParseFileResp._();
  RegParseFileResp createEmptyInstance() => create();
  static $pb.PbList<RegParseFileResp> createRepeated() => $pb.PbList<RegParseFileResp>();
  @$core.pragma('dart2js:noInline')
  static RegParseFileResp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RegParseFileResp>(create);
  static RegParseFileResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');

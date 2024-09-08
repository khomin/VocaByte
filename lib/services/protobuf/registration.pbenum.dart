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

import 'package:protobuf/protobuf.dart' as $pb;

class STORE_REG_STATE extends $pb.ProtobufEnum {
  static const STORE_REG_STATE SREG_STATE_NOT_EXIST = STORE_REG_STATE._(0, _omitEnumNames ? '' : 'SREG_STATE_NOT_EXIST');
  static const STORE_REG_STATE SREG_STATE_NOT_REGISTRED = STORE_REG_STATE._(1, _omitEnumNames ? '' : 'SREG_STATE_NOT_REGISTRED');
  static const STORE_REG_STATE SREG_STATE_CONFIRMED = STORE_REG_STATE._(2, _omitEnumNames ? '' : 'SREG_STATE_CONFIRMED');
  static const STORE_REG_STATE SREG_STATE_PASSWORD_SET = STORE_REG_STATE._(3, _omitEnumNames ? '' : 'SREG_STATE_PASSWORD_SET');
  static const STORE_REG_STATE SREG_STATE_PASSMODE_SET = STORE_REG_STATE._(4, _omitEnumNames ? '' : 'SREG_STATE_PASSMODE_SET');
  static const STORE_REG_STATE SREG_STATE_INFO_SET = STORE_REG_STATE._(5, _omitEnumNames ? '' : 'SREG_STATE_INFO_SET');
  static const STORE_REG_STATE SREG_STATE_READY = STORE_REG_STATE._(6, _omitEnumNames ? '' : 'SREG_STATE_READY');
  static const STORE_REG_STATE SREG_STATE_GOT_PIN = STORE_REG_STATE._(7, _omitEnumNames ? '' : 'SREG_STATE_GOT_PIN');
  static const STORE_REG_STATE SREG_STATE_ENTER_NOISE = STORE_REG_STATE._(8, _omitEnumNames ? '' : 'SREG_STATE_ENTER_NOISE');
  static const STORE_REG_STATE SREG_STATE_DEVICE_READY = STORE_REG_STATE._(9, _omitEnumNames ? '' : 'SREG_STATE_DEVICE_READY');
  static const STORE_REG_STATE SREG_STATE_FIRST_CONNECT = STORE_REG_STATE._(10, _omitEnumNames ? '' : 'SREG_STATE_FIRST_CONNECT');
  static const STORE_REG_STATE SREG_STATE_WORK_CONNECT = STORE_REG_STATE._(11, _omitEnumNames ? '' : 'SREG_STATE_WORK_CONNECT');
  static const STORE_REG_STATE SREG_STATE_FULL_REGISTERED = STORE_REG_STATE._(12, _omitEnumNames ? '' : 'SREG_STATE_FULL_REGISTERED');
  static const STORE_REG_STATE SREG_STATE_FATAL_ERROR = STORE_REG_STATE._(255, _omitEnumNames ? '' : 'SREG_STATE_FATAL_ERROR');
  static const STORE_REG_STATE SREG_STATE_UNDEFINED = STORE_REG_STATE._(65535, _omitEnumNames ? '' : 'SREG_STATE_UNDEFINED');

  static const $core.List<STORE_REG_STATE> values = <STORE_REG_STATE> [
    SREG_STATE_NOT_EXIST,
    SREG_STATE_NOT_REGISTRED,
    SREG_STATE_CONFIRMED,
    SREG_STATE_PASSWORD_SET,
    SREG_STATE_PASSMODE_SET,
    SREG_STATE_INFO_SET,
    SREG_STATE_READY,
    SREG_STATE_GOT_PIN,
    SREG_STATE_ENTER_NOISE,
    SREG_STATE_DEVICE_READY,
    SREG_STATE_FIRST_CONNECT,
    SREG_STATE_WORK_CONNECT,
    SREG_STATE_FULL_REGISTERED,
    SREG_STATE_FATAL_ERROR,
    SREG_STATE_UNDEFINED,
  ];

  static final $core.Map<$core.int, STORE_REG_STATE> _byValue = $pb.ProtobufEnum.initByValue(values);
  static STORE_REG_STATE? valueOf($core.int value) => _byValue[value];

  const STORE_REG_STATE._($core.int v, $core.String n) : super(v, n);
}

class GREG_STATE extends $pb.ProtobufEnum {
  static const GREG_STATE GREG_OK_NO_ACTIVE_PROFILE = GREG_STATE._(0, _omitEnumNames ? '' : 'GREG_OK_NO_ACTIVE_PROFILE');
  static const GREG_STATE GREG_OK_NOT_REGISTEDED = GREG_STATE._(1, _omitEnumNames ? '' : 'GREG_OK_NOT_REGISTEDED');
  static const GREG_STATE GREG_OK_ENTER_FACTOR = GREG_STATE._(2, _omitEnumNames ? '' : 'GREG_OK_ENTER_FACTOR');
  static const GREG_STATE GREG_WAIT_FACTOR_CONFIRMATION_CODE = GREG_STATE._(3, _omitEnumNames ? '' : 'GREG_WAIT_FACTOR_CONFIRMATION_CODE');
  static const GREG_STATE GREG_OK_ENTER_CONFIRMATION_CODE = GREG_STATE._(4, _omitEnumNames ? '' : 'GREG_OK_ENTER_CONFIRMATION_CODE');
  static const GREG_STATE GREG_WAIT_APPLY_CONFIRMATION_CODE = GREG_STATE._(5, _omitEnumNames ? '' : 'GREG_WAIT_APPLY_CONFIRMATION_CODE');
  static const GREG_STATE GREG_OK_ENTER_ABONENT_ID = GREG_STATE._(6, _omitEnumNames ? '' : 'GREG_OK_ENTER_ABONENT_ID');
  static const GREG_STATE GREG_OK_ENTER_PASSWORD = GREG_STATE._(7, _omitEnumNames ? '' : 'GREG_OK_ENTER_PASSWORD');
  static const GREG_STATE GREG_WAIT_APPLY_PASSWORD = GREG_STATE._(8, _omitEnumNames ? '' : 'GREG_WAIT_APPLY_PASSWORD');
  static const GREG_STATE GREG_OK_ENTER_TFA_MODE = GREG_STATE._(9, _omitEnumNames ? '' : 'GREG_OK_ENTER_TFA_MODE');
  static const GREG_STATE GREG_WAIT_APPLY_TFA_MODE = GREG_STATE._(10, _omitEnumNames ? '' : 'GREG_WAIT_APPLY_TFA_MODE');
  static const GREG_STATE GREG_OK_ENTER_INFO = GREG_STATE._(11, _omitEnumNames ? '' : 'GREG_OK_ENTER_INFO');
  static const GREG_STATE GREG_WAIT_REGISTRATION = GREG_STATE._(12, _omitEnumNames ? '' : 'GREG_WAIT_REGISTRATION');
  static const GREG_STATE GREG_OK_ENTER_NOISE = GREG_STATE._(13, _omitEnumNames ? '' : 'GREG_OK_ENTER_NOISE');
  static const GREG_STATE GREG_WAIT_CONNECTION = GREG_STATE._(14, _omitEnumNames ? '' : 'GREG_WAIT_CONNECTION');
  static const GREG_STATE GREG_OK_ENTER_PASSWORD_IMPORT = GREG_STATE._(15, _omitEnumNames ? '' : 'GREG_OK_ENTER_PASSWORD_IMPORT');
  static const GREG_STATE GREG_OK_ENTER_PASSWORD_EXPORT = GREG_STATE._(16, _omitEnumNames ? '' : 'GREG_OK_ENTER_PASSWORD_EXPORT');
  static const GREG_STATE GREG_WAIT_KEY_SYCRONIZATION = GREG_STATE._(17, _omitEnumNames ? '' : 'GREG_WAIT_KEY_SYCRONIZATION');
  static const GREG_STATE GREG_FULL_REGISTERED = GREG_STATE._(18, _omitEnumNames ? '' : 'GREG_FULL_REGISTERED');
  static const GREG_STATE GREG_STATE_FATAL_ERROR = GREG_STATE._(19, _omitEnumNames ? '' : 'GREG_STATE_FATAL_ERROR');
  static const GREG_STATE GREG_STATE_UNDEFINED = GREG_STATE._(65535, _omitEnumNames ? '' : 'GREG_STATE_UNDEFINED');

  static const $core.List<GREG_STATE> values = <GREG_STATE> [
    GREG_OK_NO_ACTIVE_PROFILE,
    GREG_OK_NOT_REGISTEDED,
    GREG_OK_ENTER_FACTOR,
    GREG_WAIT_FACTOR_CONFIRMATION_CODE,
    GREG_OK_ENTER_CONFIRMATION_CODE,
    GREG_WAIT_APPLY_CONFIRMATION_CODE,
    GREG_OK_ENTER_ABONENT_ID,
    GREG_OK_ENTER_PASSWORD,
    GREG_WAIT_APPLY_PASSWORD,
    GREG_OK_ENTER_TFA_MODE,
    GREG_WAIT_APPLY_TFA_MODE,
    GREG_OK_ENTER_INFO,
    GREG_WAIT_REGISTRATION,
    GREG_OK_ENTER_NOISE,
    GREG_WAIT_CONNECTION,
    GREG_OK_ENTER_PASSWORD_IMPORT,
    GREG_OK_ENTER_PASSWORD_EXPORT,
    GREG_WAIT_KEY_SYCRONIZATION,
    GREG_FULL_REGISTERED,
    GREG_STATE_FATAL_ERROR,
    GREG_STATE_UNDEFINED,
  ];

  static final $core.Map<$core.int, GREG_STATE> _byValue = $pb.ProtobufEnum.initByValue(values);
  static GREG_STATE? valueOf($core.int value) => _byValue[value];

  const GREG_STATE._($core.int v, $core.String n) : super(v, n);
}

class REG_EXT_FACTOR_TYPE extends $pb.ProtobufEnum {
  static const REG_EXT_FACTOR_TYPE REG_EXTFACTOR_UNSET = REG_EXT_FACTOR_TYPE._(0, _omitEnumNames ? '' : 'REG_EXTFACTOR_UNSET');
  static const REG_EXT_FACTOR_TYPE REG_EXTFACTOR_NONE = REG_EXT_FACTOR_TYPE._(1, _omitEnumNames ? '' : 'REG_EXTFACTOR_NONE');
  static const REG_EXT_FACTOR_TYPE REG_EXTFACTOR_EMAIL = REG_EXT_FACTOR_TYPE._(2, _omitEnumNames ? '' : 'REG_EXTFACTOR_EMAIL');
  static const REG_EXT_FACTOR_TYPE REG_EXTFACTOR_PHONE = REG_EXT_FACTOR_TYPE._(3, _omitEnumNames ? '' : 'REG_EXTFACTOR_PHONE');

  static const $core.List<REG_EXT_FACTOR_TYPE> values = <REG_EXT_FACTOR_TYPE> [
    REG_EXTFACTOR_UNSET,
    REG_EXTFACTOR_NONE,
    REG_EXTFACTOR_EMAIL,
    REG_EXTFACTOR_PHONE,
  ];

  static final $core.Map<$core.int, REG_EXT_FACTOR_TYPE> _byValue = $pb.ProtobufEnum.initByValue(values);
  static REG_EXT_FACTOR_TYPE? valueOf($core.int value) => _byValue[value];

  const REG_EXT_FACTOR_TYPE._($core.int v, $core.String n) : super(v, n);
}

class PROFILE_STATE extends $pb.ProtobufEnum {
  static const PROFILE_STATE PROF_UNUSED = PROFILE_STATE._(0, _omitEnumNames ? '' : 'PROF_UNUSED');
  static const PROFILE_STATE PROF_LAST = PROFILE_STATE._(1, _omitEnumNames ? '' : 'PROF_LAST');
  static const PROFILE_STATE PROF_ACTIVE = PROFILE_STATE._(2, _omitEnumNames ? '' : 'PROF_ACTIVE');

  static const $core.List<PROFILE_STATE> values = <PROFILE_STATE> [
    PROF_UNUSED,
    PROF_LAST,
    PROF_ACTIVE,
  ];

  static final $core.Map<$core.int, PROFILE_STATE> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PROFILE_STATE? valueOf($core.int value) => _byValue[value];

  const PROFILE_STATE._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');

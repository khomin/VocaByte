//
//  Generated code. Do not modify.
//  source: registration.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use sTORE_REG_STATEDescriptor instead')
const STORE_REG_STATE$json = {
  '1': 'STORE_REG_STATE',
  '2': [
    {'1': 'SREG_STATE_NOT_EXIST', '2': 0},
    {'1': 'SREG_STATE_NOT_REGISTRED', '2': 1},
    {'1': 'SREG_STATE_CONFIRMED', '2': 2},
    {'1': 'SREG_STATE_PASSWORD_SET', '2': 3},
    {'1': 'SREG_STATE_PASSMODE_SET', '2': 4},
    {'1': 'SREG_STATE_INFO_SET', '2': 5},
    {'1': 'SREG_STATE_READY', '2': 6},
    {'1': 'SREG_STATE_GOT_PIN', '2': 7},
    {'1': 'SREG_STATE_ENTER_NOISE', '2': 8},
    {'1': 'SREG_STATE_DEVICE_READY', '2': 9},
    {'1': 'SREG_STATE_FIRST_CONNECT', '2': 10},
    {'1': 'SREG_STATE_WORK_CONNECT', '2': 11},
    {'1': 'SREG_STATE_FULL_REGISTERED', '2': 12},
    {'1': 'SREG_STATE_FATAL_ERROR', '2': 255},
    {'1': 'SREG_STATE_UNDEFINED', '2': 65535},
  ],
};

/// Descriptor for `STORE_REG_STATE`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List sTORE_REG_STATEDescriptor = $convert.base64Decode(
    'Cg9TVE9SRV9SRUdfU1RBVEUSGAoUU1JFR19TVEFURV9OT1RfRVhJU1QQABIcChhTUkVHX1NUQV'
    'RFX05PVF9SRUdJU1RSRUQQARIYChRTUkVHX1NUQVRFX0NPTkZJUk1FRBACEhsKF1NSRUdfU1RB'
    'VEVfUEFTU1dPUkRfU0VUEAMSGwoXU1JFR19TVEFURV9QQVNTTU9ERV9TRVQQBBIXChNTUkVHX1'
    'NUQVRFX0lORk9fU0VUEAUSFAoQU1JFR19TVEFURV9SRUFEWRAGEhYKElNSRUdfU1RBVEVfR09U'
    'X1BJThAHEhoKFlNSRUdfU1RBVEVfRU5URVJfTk9JU0UQCBIbChdTUkVHX1NUQVRFX0RFVklDRV'
    '9SRUFEWRAJEhwKGFNSRUdfU1RBVEVfRklSU1RfQ09OTkVDVBAKEhsKF1NSRUdfU1RBVEVfV09S'
    'S19DT05ORUNUEAsSHgoaU1JFR19TVEFURV9GVUxMX1JFR0lTVEVSRUQQDBIbChZTUkVHX1NUQV'
    'RFX0ZBVEFMX0VSUk9SEP8BEhoKFFNSRUdfU1RBVEVfVU5ERUZJTkVEEP//Aw==');

@$core.Deprecated('Use gREG_STATEDescriptor instead')
const GREG_STATE$json = {
  '1': 'GREG_STATE',
  '2': [
    {'1': 'GREG_OK_NO_ACTIVE_PROFILE', '2': 0},
    {'1': 'GREG_OK_NOT_REGISTEDED', '2': 1},
    {'1': 'GREG_OK_ENTER_FACTOR', '2': 2},
    {'1': 'GREG_WAIT_FACTOR_CONFIRMATION_CODE', '2': 3},
    {'1': 'GREG_OK_ENTER_CONFIRMATION_CODE', '2': 4},
    {'1': 'GREG_WAIT_APPLY_CONFIRMATION_CODE', '2': 5},
    {'1': 'GREG_OK_ENTER_ABONENT_ID', '2': 6},
    {'1': 'GREG_OK_ENTER_PASSWORD', '2': 7},
    {'1': 'GREG_WAIT_APPLY_PASSWORD', '2': 8},
    {'1': 'GREG_OK_ENTER_TFA_MODE', '2': 9},
    {'1': 'GREG_WAIT_APPLY_TFA_MODE', '2': 10},
    {'1': 'GREG_OK_ENTER_INFO', '2': 11},
    {'1': 'GREG_WAIT_REGISTRATION', '2': 12},
    {'1': 'GREG_OK_ENTER_NOISE', '2': 13},
    {'1': 'GREG_WAIT_CONNECTION', '2': 14},
    {'1': 'GREG_OK_ENTER_PASSWORD_IMPORT', '2': 15},
    {'1': 'GREG_OK_ENTER_PASSWORD_EXPORT', '2': 16},
    {'1': 'GREG_WAIT_KEY_SYCRONIZATION', '2': 17},
    {'1': 'GREG_FULL_REGISTERED', '2': 18},
    {'1': 'GREG_STATE_FATAL_ERROR', '2': 19},
    {'1': 'GREG_STATE_UNDEFINED', '2': 65535},
  ],
};

/// Descriptor for `GREG_STATE`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List gREG_STATEDescriptor = $convert.base64Decode(
    'CgpHUkVHX1NUQVRFEh0KGUdSRUdfT0tfTk9fQUNUSVZFX1BST0ZJTEUQABIaChZHUkVHX09LX0'
    '5PVF9SRUdJU1RFREVEEAESGAoUR1JFR19PS19FTlRFUl9GQUNUT1IQAhImCiJHUkVHX1dBSVRf'
    'RkFDVE9SX0NPTkZJUk1BVElPTl9DT0RFEAMSIwofR1JFR19PS19FTlRFUl9DT05GSVJNQVRJT0'
    '5fQ09ERRAEEiUKIUdSRUdfV0FJVF9BUFBMWV9DT05GSVJNQVRJT05fQ09ERRAFEhwKGEdSRUdf'
    'T0tfRU5URVJfQUJPTkVOVF9JRBAGEhoKFkdSRUdfT0tfRU5URVJfUEFTU1dPUkQQBxIcChhHUk'
    'VHX1dBSVRfQVBQTFlfUEFTU1dPUkQQCBIaChZHUkVHX09LX0VOVEVSX1RGQV9NT0RFEAkSHAoY'
    'R1JFR19XQUlUX0FQUExZX1RGQV9NT0RFEAoSFgoSR1JFR19PS19FTlRFUl9JTkZPEAsSGgoWR1'
    'JFR19XQUlUX1JFR0lTVFJBVElPThAMEhcKE0dSRUdfT0tfRU5URVJfTk9JU0UQDRIYChRHUkVH'
    'X1dBSVRfQ09OTkVDVElPThAOEiEKHUdSRUdfT0tfRU5URVJfUEFTU1dPUkRfSU1QT1JUEA8SIQ'
    'odR1JFR19PS19FTlRFUl9QQVNTV09SRF9FWFBPUlQQEBIfChtHUkVHX1dBSVRfS0VZX1NZQ1JP'
    'TklaQVRJT04QERIYChRHUkVHX0ZVTExfUkVHSVNURVJFRBASEhoKFkdSRUdfU1RBVEVfRkFUQU'
    'xfRVJST1IQExIaChRHUkVHX1NUQVRFX1VOREVGSU5FRBD//wM=');

@$core.Deprecated('Use rEG_EXT_FACTOR_TYPEDescriptor instead')
const REG_EXT_FACTOR_TYPE$json = {
  '1': 'REG_EXT_FACTOR_TYPE',
  '2': [
    {'1': 'REG_EXTFACTOR_UNSET', '2': 0},
    {'1': 'REG_EXTFACTOR_NONE', '2': 1},
    {'1': 'REG_EXTFACTOR_EMAIL', '2': 2},
    {'1': 'REG_EXTFACTOR_PHONE', '2': 3},
  ],
};

/// Descriptor for `REG_EXT_FACTOR_TYPE`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List rEG_EXT_FACTOR_TYPEDescriptor = $convert.base64Decode(
    'ChNSRUdfRVhUX0ZBQ1RPUl9UWVBFEhcKE1JFR19FWFRGQUNUT1JfVU5TRVQQABIWChJSRUdfRV'
    'hURkFDVE9SX05PTkUQARIXChNSRUdfRVhURkFDVE9SX0VNQUlMEAISFwoTUkVHX0VYVEZBQ1RP'
    'Ul9QSE9ORRAD');

@$core.Deprecated('Use pROFILE_STATEDescriptor instead')
const PROFILE_STATE$json = {
  '1': 'PROFILE_STATE',
  '2': [
    {'1': 'PROF_UNUSED', '2': 0},
    {'1': 'PROF_LAST', '2': 1},
    {'1': 'PROF_ACTIVE', '2': 2},
  ],
};

/// Descriptor for `PROFILE_STATE`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List pROFILE_STATEDescriptor = $convert.base64Decode(
    'Cg1QUk9GSUxFX1NUQVRFEg8KC1BST0ZfVU5VU0VEEAASDQoJUFJPRl9MQVNUEAESDwoLUFJPRl'
    '9BQ1RJVkUQAg==');

@$core.Deprecated('Use profileRecDescriptor instead')
const ProfileRec$json = {
  '1': 'ProfileRec',
  '2': [
    {'1': 'Profile', '3': 1, '4': 2, '5': 9, '10': 'Profile'},
    {'1': 'DeviceId', '3': 2, '4': 2, '5': 4, '10': 'DeviceId'},
    {'1': 'AbonentId', '3': 3, '4': 2, '5': 4, '10': 'AbonentId'},
    {'1': 'Name', '3': 4, '4': 2, '5': 9, '10': 'Name'},
    {'1': 'GRegState', '3': 6, '4': 2, '5': 14, '6': '.registration.GREG_STATE', '10': 'GRegState'},
    {'1': 'Use', '3': 9, '4': 2, '5': 14, '6': '.registration.PROFILE_STATE', '10': 'Use'},
  ],
};

/// Descriptor for `ProfileRec`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List profileRecDescriptor = $convert.base64Decode(
    'CgpQcm9maWxlUmVjEhgKB1Byb2ZpbGUYASACKAlSB1Byb2ZpbGUSGgoIRGV2aWNlSWQYAiACKA'
    'RSCERldmljZUlkEhwKCUFib25lbnRJZBgDIAIoBFIJQWJvbmVudElkEhIKBE5hbWUYBCACKAlS'
    'BE5hbWUSNgoJR1JlZ1N0YXRlGAYgAigOMhgucmVnaXN0cmF0aW9uLkdSRUdfU1RBVEVSCUdSZW'
    'dTdGF0ZRItCgNVc2UYCSACKA4yGy5yZWdpc3RyYXRpb24uUFJPRklMRV9TVEFURVIDVXNl');

@$core.Deprecated('Use regProfileListChangedDataDescriptor instead')
const RegProfileListChangedData$json = {
  '1': 'RegProfileListChangedData',
  '2': [
    {'1': 'profile_list_changed', '3': 1, '4': 3, '5': 11, '6': '.registration.ProfileRec', '10': 'profileListChanged'},
  ],
};

/// Descriptor for `RegProfileListChangedData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List regProfileListChangedDataDescriptor = $convert.base64Decode(
    'ChlSZWdQcm9maWxlTGlzdENoYW5nZWREYXRhEkoKFHByb2ZpbGVfbGlzdF9jaGFuZ2VkGAEgAy'
    'gLMhgucmVnaXN0cmF0aW9uLlByb2ZpbGVSZWNSEnByb2ZpbGVMaXN0Q2hhbmdlZA==');

@$core.Deprecated('Use regStatusChangedResDescriptor instead')
const RegStatusChangedRes$json = {
  '1': 'RegStatusChangedRes',
  '2': [
    {'1': 'regState', '3': 1, '4': 1, '5': 14, '6': '.registration.GREG_STATE', '10': 'regState'},
    {'1': 'regStateStr', '3': 3, '4': 1, '5': 9, '10': 'regStateStr'},
    {'1': 'regErr', '3': 4, '4': 1, '5': 14, '6': '.netLib.ERROR_CODE', '10': 'regErr'},
    {'1': 'email', '3': 5, '4': 1, '5': 9, '10': 'email'},
    {'1': 'phone', '3': 6, '4': 1, '5': 9, '10': 'phone'},
    {'1': 'name', '3': 7, '4': 1, '5': 9, '10': 'name'},
    {'1': 'nameSecond', '3': 8, '4': 1, '5': 9, '10': 'nameSecond'},
    {'1': 'address', '3': 9, '4': 1, '5': 9, '10': 'address'},
    {'1': 'notes', '3': 10, '4': 1, '5': 9, '10': 'notes'},
    {'1': 'hide', '3': 11, '4': 1, '5': 8, '10': 'hide'},
    {'1': 'factor', '3': 12, '4': 1, '5': 14, '6': '.registration.REG_EXT_FACTOR_TYPE', '10': 'factor'},
    {'1': 'isWait', '3': 13, '4': 1, '5': 8, '10': 'isWait'},
    {'1': 'info_id', '3': 14, '4': 1, '5': 4, '10': 'infoId'},
    {'1': 'info_dev_id', '3': 15, '4': 1, '5': 4, '10': 'infoDevId'},
    {'1': 'info_name', '3': 16, '4': 1, '5': 9, '10': 'infoName'},
    {'1': 'profile_id', '3': 17, '4': 1, '5': 9, '10': 'profileId'},
  ],
};

/// Descriptor for `RegStatusChangedRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List regStatusChangedResDescriptor = $convert.base64Decode(
    'ChNSZWdTdGF0dXNDaGFuZ2VkUmVzEjQKCHJlZ1N0YXRlGAEgASgOMhgucmVnaXN0cmF0aW9uLk'
    'dSRUdfU1RBVEVSCHJlZ1N0YXRlEiAKC3JlZ1N0YXRlU3RyGAMgASgJUgtyZWdTdGF0ZVN0chIq'
    'CgZyZWdFcnIYBCABKA4yEi5uZXRMaWIuRVJST1JfQ09ERVIGcmVnRXJyEhQKBWVtYWlsGAUgAS'
    'gJUgVlbWFpbBIUCgVwaG9uZRgGIAEoCVIFcGhvbmUSEgoEbmFtZRgHIAEoCVIEbmFtZRIeCgpu'
    'YW1lU2Vjb25kGAggASgJUgpuYW1lU2Vjb25kEhgKB2FkZHJlc3MYCSABKAlSB2FkZHJlc3MSFA'
    'oFbm90ZXMYCiABKAlSBW5vdGVzEhIKBGhpZGUYCyABKAhSBGhpZGUSOQoGZmFjdG9yGAwgASgO'
    'MiEucmVnaXN0cmF0aW9uLlJFR19FWFRfRkFDVE9SX1RZUEVSBmZhY3RvchIWCgZpc1dhaXQYDS'
    'ABKAhSBmlzV2FpdBIXCgdpbmZvX2lkGA4gASgEUgZpbmZvSWQSHgoLaW5mb19kZXZfaWQYDyAB'
    'KARSCWluZm9EZXZJZBIbCglpbmZvX25hbWUYECABKAlSCGluZm9OYW1lEh0KCnByb2ZpbGVfaW'
    'QYESABKAlSCXByb2ZpbGVJZA==');

@$core.Deprecated('Use regNetErrorChangedDataDescriptor instead')
const RegNetErrorChangedData$json = {
  '1': 'RegNetErrorChangedData',
  '2': [
    {'1': 'netErrorCode', '3': 1, '4': 2, '5': 14, '6': '.netLib.ERROR_CODE', '10': 'netErrorCode'},
    {'1': 'netErrorCodeStr', '3': 2, '4': 2, '5': 9, '10': 'netErrorCodeStr'},
  ],
};

/// Descriptor for `RegNetErrorChangedData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List regNetErrorChangedDataDescriptor = $convert.base64Decode(
    'ChZSZWdOZXRFcnJvckNoYW5nZWREYXRhEjYKDG5ldEVycm9yQ29kZRgBIAIoDjISLm5ldExpYi'
    '5FUlJPUl9DT0RFUgxuZXRFcnJvckNvZGUSKAoPbmV0RXJyb3JDb2RlU3RyGAIgAigJUg9uZXRF'
    'cnJvckNvZGVTdHI=');

@$core.Deprecated('Use regStartReqDescriptor instead')
const RegStartReq$json = {
  '1': 'RegStartReq',
  '2': [
    {'1': 'password', '3': 1, '4': 2, '5': 9, '10': 'password'},
    {'1': 'cancelRegistration', '3': 2, '4': 2, '5': 8, '10': 'cancelRegistration'},
  ],
};

/// Descriptor for `RegStartReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List regStartReqDescriptor = $convert.base64Decode(
    'CgtSZWdTdGFydFJlcRIaCghwYXNzd29yZBgBIAIoCVIIcGFzc3dvcmQSLgoSY2FuY2VsUmVnaX'
    'N0cmF0aW9uGAIgAigIUhJjYW5jZWxSZWdpc3RyYXRpb24=');

@$core.Deprecated('Use regStartRecoveryReqDescriptor instead')
const RegStartRecoveryReq$json = {
  '1': 'RegStartRecoveryReq',
  '2': [
    {'1': 'cancelRegistration', '3': 1, '4': 2, '5': 8, '10': 'cancelRegistration'},
  ],
};

/// Descriptor for `RegStartRecoveryReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List regStartRecoveryReqDescriptor = $convert.base64Decode(
    'ChNSZWdTdGFydFJlY292ZXJ5UmVxEi4KEmNhbmNlbFJlZ2lzdHJhdGlvbhgBIAIoCFISY2FuY2'
    'VsUmVnaXN0cmF0aW9u');

@$core.Deprecated('Use regSetExtFactorReqDescriptor instead')
const RegSetExtFactorReq$json = {
  '1': 'RegSetExtFactorReq',
  '2': [
    {'1': 'factoryType', '3': 1, '4': 2, '5': 14, '6': '.registration.REG_EXT_FACTOR_TYPE', '10': 'factoryType'},
    {'1': 'value', '3': 2, '4': 2, '5': 9, '10': 'value'},
  ],
};

/// Descriptor for `RegSetExtFactorReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List regSetExtFactorReqDescriptor = $convert.base64Decode(
    'ChJSZWdTZXRFeHRGYWN0b3JSZXESQwoLZmFjdG9yeVR5cGUYASACKA4yIS5yZWdpc3RyYXRpb2'
    '4uUkVHX0VYVF9GQUNUT1JfVFlQRVILZmFjdG9yeVR5cGUSFAoFdmFsdWUYAiACKAlSBXZhbHVl');

@$core.Deprecated('Use regEnterConfirmCodeReqDescriptor instead')
const RegEnterConfirmCodeReq$json = {
  '1': 'RegEnterConfirmCodeReq',
  '2': [
    {'1': 'value', '3': 1, '4': 2, '5': 9, '10': 'value'},
  ],
};

/// Descriptor for `RegEnterConfirmCodeReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List regEnterConfirmCodeReqDescriptor = $convert.base64Decode(
    'ChZSZWdFbnRlckNvbmZpcm1Db2RlUmVxEhQKBXZhbHVlGAEgAigJUgV2YWx1ZQ==');

@$core.Deprecated('Use regEnterInfoReqDescriptor instead')
const RegEnterInfoReq$json = {
  '1': 'RegEnterInfoReq',
  '2': [
    {'1': 'email', '3': 1, '4': 2, '5': 9, '10': 'email'},
    {'1': 'phone', '3': 2, '4': 2, '5': 9, '10': 'phone'},
    {'1': 'name', '3': 3, '4': 2, '5': 9, '10': 'name'},
    {'1': 'nameSecond', '3': 4, '4': 2, '5': 9, '10': 'nameSecond'},
    {'1': 'address', '3': 5, '4': 2, '5': 9, '10': 'address'},
    {'1': 'notes', '3': 6, '4': 2, '5': 9, '10': 'notes'},
    {'1': 'hide', '3': 7, '4': 2, '5': 8, '10': 'hide'},
  ],
};

/// Descriptor for `RegEnterInfoReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List regEnterInfoReqDescriptor = $convert.base64Decode(
    'Cg9SZWdFbnRlckluZm9SZXESFAoFZW1haWwYASACKAlSBWVtYWlsEhQKBXBob25lGAIgAigJUg'
    'VwaG9uZRISCgRuYW1lGAMgAigJUgRuYW1lEh4KCm5hbWVTZWNvbmQYBCACKAlSCm5hbWVTZWNv'
    'bmQSGAoHYWRkcmVzcxgFIAIoCVIHYWRkcmVzcxIUCgVub3RlcxgGIAIoCVIFbm90ZXMSEgoEaG'
    'lkZRgHIAIoCFIEaGlkZQ==');

@$core.Deprecated('Use regEnterMsgKeyPasswordReqDescriptor instead')
const RegEnterMsgKeyPasswordReq$json = {
  '1': 'RegEnterMsgKeyPasswordReq',
  '2': [
    {'1': 'password', '3': 1, '4': 2, '5': 9, '10': 'password'},
    {'1': 'useForAccount', '3': 2, '4': 2, '5': 8, '10': 'useForAccount'},
  ],
};

/// Descriptor for `RegEnterMsgKeyPasswordReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List regEnterMsgKeyPasswordReqDescriptor = $convert.base64Decode(
    'ChlSZWdFbnRlck1zZ0tleVBhc3N3b3JkUmVxEhoKCHBhc3N3b3JkGAEgAigJUghwYXNzd29yZB'
    'IkCg11c2VGb3JBY2NvdW50GAIgAigIUg11c2VGb3JBY2NvdW50');

@$core.Deprecated('Use regEnterAccountPasswordReqDescriptor instead')
const RegEnterAccountPasswordReq$json = {
  '1': 'RegEnterAccountPasswordReq',
  '2': [
    {'1': 'password', '3': 1, '4': 2, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `RegEnterAccountPasswordReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List regEnterAccountPasswordReqDescriptor = $convert.base64Decode(
    'ChpSZWdFbnRlckFjY291bnRQYXNzd29yZFJlcRIaCghwYXNzd29yZBgBIAIoCVIIcGFzc3dvcm'
    'Q=');

@$core.Deprecated('Use regMouseNoiseReqDescriptor instead')
const RegMouseNoiseReq$json = {
  '1': 'RegMouseNoiseReq',
  '2': [
    {'1': 'code', '3': 1, '4': 1, '5': 9, '10': 'code'},
  ],
};

/// Descriptor for `RegMouseNoiseReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List regMouseNoiseReqDescriptor = $convert.base64Decode(
    'ChBSZWdNb3VzZU5vaXNlUmVxEhIKBGNvZGUYASABKAlSBGNvZGU=');

@$core.Deprecated('Use regMouseNoiseResultDescriptor instead')
const RegMouseNoiseResult$json = {
  '1': 'RegMouseNoiseResult',
  '2': [
    {'1': 'progress', '3': 1, '4': 2, '5': 13, '10': 'progress'},
    {'1': 'authId', '3': 2, '4': 2, '5': 4, '10': 'authId'},
    {'1': 'isDone', '3': 3, '4': 2, '5': 8, '10': 'isDone'},
  ],
};

/// Descriptor for `RegMouseNoiseResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List regMouseNoiseResultDescriptor = $convert.base64Decode(
    'ChNSZWdNb3VzZU5vaXNlUmVzdWx0EhoKCHByb2dyZXNzGAEgAigNUghwcm9ncmVzcxIWCgZhdX'
    'RoSWQYAiACKARSBmF1dGhJZBIWCgZpc0RvbmUYAyACKAhSBmlzRG9uZQ==');

@$core.Deprecated('Use regProfileIdReqDescriptor instead')
const RegProfileIdReq$json = {
  '1': 'RegProfileIdReq',
  '2': [
    {'1': 'name', '3': 1, '4': 2, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `RegProfileIdReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List regProfileIdReqDescriptor = $convert.base64Decode(
    'Cg9SZWdQcm9maWxlSWRSZXESEgoEbmFtZRgBIAIoCVIEbmFtZQ==');

@$core.Deprecated('Use regParseFileReqDescriptor instead')
const RegParseFileReq$json = {
  '1': 'RegParseFileReq',
  '2': [
    {'1': 'path', '3': 1, '4': 2, '5': 9, '10': 'path'},
  ],
};

/// Descriptor for `RegParseFileReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List regParseFileReqDescriptor = $convert.base64Decode(
    'Cg9SZWdQYXJzZUZpbGVSZXESEgoEcGF0aBgBIAIoCVIEcGF0aA==');

@$core.Deprecated('Use regParseFileRespDescriptor instead')
const RegParseFileResp$json = {
  '1': 'RegParseFileResp',
  '2': [
    {'1': 'success', '3': 1, '4': 2, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `RegParseFileResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List regParseFileRespDescriptor = $convert.base64Decode(
    'ChBSZWdQYXJzZUZpbGVSZXNwEhgKB3N1Y2Nlc3MYASACKAhSB3N1Y2Nlc3M=');


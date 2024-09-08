//
//  Generated code. Do not modify.
//  source: message.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use cHAT_EVENTDescriptor instead')
const CHAT_EVENT$json = {
  '1': 'CHAT_EVENT',
  '2': [
    {'1': 'CHEV_CREATE', '2': 1},
    {'1': 'CHEV_ADDMBR', '2': 2},
    {'1': 'CHEV_DELMBR', '2': 3},
    {'1': 'CHEV_CNGMBR', '2': 4},
    {'1': 'CHEV_CNGNAME', '2': 5},
    {'1': 'CHEV_CNGIMG', '2': 6},
  ],
};

/// Descriptor for `CHAT_EVENT`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List cHAT_EVENTDescriptor = $convert.base64Decode(
    'CgpDSEFUX0VWRU5UEg8KC0NIRVZfQ1JFQVRFEAESDwoLQ0hFVl9BRERNQlIQAhIPCgtDSEVWX0'
    'RFTE1CUhADEg8KC0NIRVZfQ05HTUJSEAQSEAoMQ0hFVl9DTkdOQU1FEAUSDwoLQ0hFVl9DTkdJ'
    'TUcQBg==');

@$core.Deprecated('Use getMsgTypeReqTypeDescriptor instead')
const GetMsgTypeReqType$json = {
  '1': 'GetMsgTypeReqType',
  '2': [
    {'1': 'ID', '2': 0},
    {'1': 'TIME', '2': 1},
    {'1': 'CACHED', '2': 2},
  ],
};

/// Descriptor for `GetMsgTypeReqType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List getMsgTypeReqTypeDescriptor = $convert.base64Decode(
    'ChFHZXRNc2dUeXBlUmVxVHlwZRIGCgJJRBAAEggKBFRJTUUQARIKCgZDQUNIRUQQAg==');

@$core.Deprecated('Use moveToDescriptor instead')
const MoveTo$json = {
  '1': 'MoveTo',
  '2': [
    {'1': 'Up', '2': -1},
    {'1': 'Down', '2': 1},
  ],
};

/// Descriptor for `MoveTo`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List moveToDescriptor = $convert.base64Decode(
    'CgZNb3ZlVG8SDwoCVXAQ////////////ARIICgREb3duEAE=');

@$core.Deprecated('Use getFileTypeDescriptor instead')
const GetFileType$json = {
  '1': 'GetFileType',
  '2': [
    {'1': 'FileToPath', '2': 1},
    {'1': 'FileInMemory', '2': 2},
    {'1': 'Thumbnail', '2': 3},
  ],
};

/// Descriptor for `GetFileType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List getFileTypeDescriptor = $convert.base64Decode(
    'CgtHZXRGaWxlVHlwZRIOCgpGaWxlVG9QYXRoEAESEAoMRmlsZUluTWVtb3J5EAISDQoJVGh1bW'
    'JuYWlsEAM=');

@$core.Deprecated('Use getFileStateTypeDescriptor instead')
const GetFileStateType$json = {
  '1': 'GetFileStateType',
  '2': [
    {'1': 'FileStateSession', '2': 0},
    {'1': 'IsStorageFileLoaded', '2': 1},
    {'1': 'IsStorageThumbnailLoaded', '2': 2},
  ],
};

/// Descriptor for `GetFileStateType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List getFileStateTypeDescriptor = $convert.base64Decode(
    'ChBHZXRGaWxlU3RhdGVUeXBlEhQKEEZpbGVTdGF0ZVNlc3Npb24QABIXChNJc1N0b3JhZ2VGaW'
    'xlTG9hZGVkEAESHAoYSXNTdG9yYWdlVGh1bWJuYWlsTG9hZGVkEAI=');

@$core.Deprecated('Use storageStateDescriptor instead')
const StorageState$json = {
  '1': 'StorageState',
  '2': [
    {'1': 'FSTATE_WAIT', '2': 0},
    {'1': 'FSTATE_CONVERTING', '2': 1},
    {'1': 'FSTATE_PAUSED', '2': 2},
    {'1': 'FSTATE_START', '2': 3},
    {'1': 'FSTATE_RUN', '2': 4},
    {'1': 'FSTATE_READY', '2': 5},
    {'1': 'FSTATE_CLOSED', '2': 6},
    {'1': 'FSTATE_DELETED', '2': 7},
    {'1': 'FSTATE_FAIL', '2': 255},
  ],
};

/// Descriptor for `StorageState`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List storageStateDescriptor = $convert.base64Decode(
    'CgxTdG9yYWdlU3RhdGUSDwoLRlNUQVRFX1dBSVQQABIVChFGU1RBVEVfQ09OVkVSVElORxABEh'
    'EKDUZTVEFURV9QQVVTRUQQAhIQCgxGU1RBVEVfU1RBUlQQAxIOCgpGU1RBVEVfUlVOEAQSEAoM'
    'RlNUQVRFX1JFQURZEAUSEQoNRlNUQVRFX0NMT1NFRBAGEhIKDkZTVEFURV9ERUxFVEVEEAcSEA'
    'oLRlNUQVRFX0ZBSUwQ/wE=');

@$core.Deprecated('Use t_MessageRecDescriptor instead')
const T_MessageRec$json = {
  '1': 'T_MessageRec',
  '2': [
    {'1': 'idm', '3': 1, '4': 2, '5': 4, '10': 'idm'},
    {'1': 'to_id', '3': 2, '4': 2, '5': 4, '10': 'toId'},
    {'1': 'from_id', '3': 3, '4': 2, '5': 4, '10': 'fromId'},
    {'1': 'destType', '3': 4, '4': 2, '5': 14, '6': '.netLib.DEST_TYPE', '10': 'destType'},
    {'1': 'mtype', '3': 5, '4': 2, '5': 14, '6': '.netLib.MSG_TYPE', '10': 'mtype'},
    {'1': 'state', '3': 6, '4': 2, '5': 14, '6': '.netLib.MSG_STATE', '10': 'state'},
    {'1': 'ctime', '3': 7, '4': 2, '5': 4, '10': 'ctime'},
    {'1': 'etime', '3': 8, '4': 2, '5': 4, '10': 'etime'},
    {'1': 'send_id', '3': 9, '4': 2, '5': 4, '10': 'sendId'},
    {'1': 'raw_msg', '3': 11, '4': 2, '5': 9, '10': 'rawMsg'},
    {'1': 'msg', '3': 12, '4': 2, '5': 9, '10': 'msg'},
    {'1': 'with_file', '3': 13, '4': 2, '5': 8, '10': 'withFile'},
    {'1': 'with_forward', '3': 14, '4': 2, '5': 8, '10': 'withForward'},
    {'1': 'with_chatt_event', '3': 15, '4': 2, '5': 8, '10': 'withChattEvent'},
    {'1': 'with_reply', '3': 16, '4': 2, '5': 8, '10': 'withReply'},
    {'1': 'forward', '3': 17, '4': 1, '5': 11, '6': '.message.T_ForwardRec', '10': 'forward'},
    {'1': 'event', '3': 18, '4': 1, '5': 11, '6': '.message.MTCahtEvent', '10': 'event'},
    {'1': 'quote_rec', '3': 19, '4': 1, '5': 11, '6': '.message.T_QuotedRec', '10': 'quoteRec'},
    {'1': 'file_rec', '3': 20, '4': 1, '5': 11, '6': '.message.T_FileRec', '10': 'fileRec'},
  ],
};

/// Descriptor for `T_MessageRec`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List t_MessageRecDescriptor = $convert.base64Decode(
    'CgxUX01lc3NhZ2VSZWMSEAoDaWRtGAEgAigEUgNpZG0SEwoFdG9faWQYAiACKARSBHRvSWQSFw'
    'oHZnJvbV9pZBgDIAIoBFIGZnJvbUlkEi0KCGRlc3RUeXBlGAQgAigOMhEubmV0TGliLkRFU1Rf'
    'VFlQRVIIZGVzdFR5cGUSJgoFbXR5cGUYBSACKA4yEC5uZXRMaWIuTVNHX1RZUEVSBW10eXBlEi'
    'cKBXN0YXRlGAYgAigOMhEubmV0TGliLk1TR19TVEFURVIFc3RhdGUSFAoFY3RpbWUYByACKARS'
    'BWN0aW1lEhQKBWV0aW1lGAggAigEUgVldGltZRIXCgdzZW5kX2lkGAkgAigEUgZzZW5kSWQSFw'
    'oHcmF3X21zZxgLIAIoCVIGcmF3TXNnEhAKA21zZxgMIAIoCVIDbXNnEhsKCXdpdGhfZmlsZRgN'
    'IAIoCFIId2l0aEZpbGUSIQoMd2l0aF9mb3J3YXJkGA4gAigIUgt3aXRoRm9yd2FyZBIoChB3aX'
    'RoX2NoYXR0X2V2ZW50GA8gAigIUg53aXRoQ2hhdHRFdmVudBIdCgp3aXRoX3JlcGx5GBAgAigI'
    'Ugl3aXRoUmVwbHkSLwoHZm9yd2FyZBgRIAEoCzIVLm1lc3NhZ2UuVF9Gb3J3YXJkUmVjUgdmb3'
    'J3YXJkEioKBWV2ZW50GBIgASgLMhQubWVzc2FnZS5NVENhaHRFdmVudFIFZXZlbnQSMQoJcXVv'
    'dGVfcmVjGBMgASgLMhQubWVzc2FnZS5UX1F1b3RlZFJlY1IIcXVvdGVSZWMSLQoIZmlsZV9yZW'
    'MYFCABKAsyEi5tZXNzYWdlLlRfRmlsZVJlY1IHZmlsZVJlYw==');

@$core.Deprecated('Use t_ForwardRecDescriptor instead')
const T_ForwardRec$json = {
  '1': 'T_ForwardRec',
  '2': [
    {'1': 'ida', '3': 1, '4': 2, '5': 4, '10': 'ida'},
    {'1': 'idm', '3': 2, '4': 2, '5': 4, '10': 'idm'},
    {'1': 'cnt', '3': 3, '4': 2, '5': 4, '10': 'cnt'},
    {'1': 'time', '3': 4, '4': 2, '5': 4, '10': 'time'},
    {'1': 'msg', '3': 5, '4': 2, '5': 9, '10': 'msg'},
    {'1': 'withFile', '3': 6, '4': 2, '5': 8, '10': 'withFile'},
    {'1': 'withQuote', '3': 7, '4': 2, '5': 8, '10': 'withQuote'},
    {'1': 'withForward', '3': 8, '4': 2, '5': 8, '10': 'withForward'},
    {'1': 'fileRec', '3': 9, '4': 1, '5': 11, '6': '.message.T_FileRec', '10': 'fileRec'},
    {'1': 'quoteRec', '3': 10, '4': 1, '5': 11, '6': '.message.T_QuotedRec', '10': 'quoteRec'},
    {'1': 'forward', '3': 11, '4': 1, '5': 11, '6': '.message.T_ForwardRec', '10': 'forward'},
  ],
};

/// Descriptor for `T_ForwardRec`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List t_ForwardRecDescriptor = $convert.base64Decode(
    'CgxUX0ZvcndhcmRSZWMSEAoDaWRhGAEgAigEUgNpZGESEAoDaWRtGAIgAigEUgNpZG0SEAoDY2'
    '50GAMgAigEUgNjbnQSEgoEdGltZRgEIAIoBFIEdGltZRIQCgNtc2cYBSACKAlSA21zZxIaCgh3'
    'aXRoRmlsZRgGIAIoCFIId2l0aEZpbGUSHAoJd2l0aFF1b3RlGAcgAigIUgl3aXRoUXVvdGUSIA'
    'oLd2l0aEZvcndhcmQYCCACKAhSC3dpdGhGb3J3YXJkEiwKB2ZpbGVSZWMYCSABKAsyEi5tZXNz'
    'YWdlLlRfRmlsZVJlY1IHZmlsZVJlYxIwCghxdW90ZVJlYxgKIAEoCzIULm1lc3NhZ2UuVF9RdW'
    '90ZWRSZWNSCHF1b3RlUmVjEi8KB2ZvcndhcmQYCyABKAsyFS5tZXNzYWdlLlRfRm9yd2FyZFJl'
    'Y1IHZm9yd2FyZA==');

@$core.Deprecated('Use mTCahtEventDescriptor instead')
const MTCahtEvent$json = {
  '1': 'MTCahtEvent',
  '2': [
    {'1': 'Event', '3': 1, '4': 2, '5': 14, '6': '.message.CHAT_EVENT', '10': 'Event'},
    {'1': 'From', '3': 2, '4': 2, '5': 4, '10': 'From'},
    {'1': 'To', '3': 3, '4': 2, '5': 4, '10': 'To'},
    {'1': 'Data', '3': 4, '4': 2, '5': 4, '10': 'Data'},
    {'1': 'Info', '3': 5, '4': 2, '5': 9, '10': 'Info'},
  ],
};

/// Descriptor for `MTCahtEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mTCahtEventDescriptor = $convert.base64Decode(
    'CgtNVENhaHRFdmVudBIpCgVFdmVudBgBIAIoDjITLm1lc3NhZ2UuQ0hBVF9FVkVOVFIFRXZlbn'
    'QSEgoERnJvbRgCIAIoBFIERnJvbRIOCgJUbxgDIAIoBFICVG8SEgoERGF0YRgEIAIoBFIERGF0'
    'YRISCgRJbmZvGAUgAigJUgRJbmZv');

@$core.Deprecated('Use t_FileRecDescriptor instead')
const T_FileRec$json = {
  '1': 'T_FileRec',
  '2': [
    {'1': 'msg', '3': 1, '4': 2, '5': 9, '10': 'msg'},
    {'1': 'crypto', '3': 2, '4': 2, '5': 9, '10': 'crypto'},
    {'1': 'strg_id', '3': 3, '4': 2, '5': 4, '10': 'strgId'},
    {'1': 'file_name', '3': 5, '4': 2, '5': 9, '10': 'fileName'},
    {'1': 'size', '3': 8, '4': 2, '5': 4, '10': 'size'},
    {'1': 'tn_size', '3': 10, '4': 2, '5': 4, '10': 'tnSize'},
    {'1': 'tn_width', '3': 12, '4': 2, '5': 4, '10': 'tnWidth'},
    {'1': 'tn_height', '3': 13, '4': 2, '5': 4, '10': 'tnHeight'},
    {'1': 'tn_small_width', '3': 14, '4': 2, '5': 4, '10': 'tnSmallWidth'},
    {'1': 'tn_small_height', '3': 15, '4': 2, '5': 4, '10': 'tnSmallHeight'},
    {'1': 'tn_small_data_size', '3': 16, '4': 2, '5': 13, '10': 'tnSmallDataSize'},
    {'1': 'tn_small', '3': 17, '4': 3, '5': 13, '10': 'tnSmall'},
    {'1': 'width', '3': 18, '4': 2, '5': 4, '10': 'width'},
    {'1': 'height', '3': 19, '4': 2, '5': 4, '10': 'height'},
  ],
};

/// Descriptor for `T_FileRec`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List t_FileRecDescriptor = $convert.base64Decode(
    'CglUX0ZpbGVSZWMSEAoDbXNnGAEgAigJUgNtc2cSFgoGY3J5cHRvGAIgAigJUgZjcnlwdG8SFw'
    'oHc3RyZ19pZBgDIAIoBFIGc3RyZ0lkEhsKCWZpbGVfbmFtZRgFIAIoCVIIZmlsZU5hbWUSEgoE'
    'c2l6ZRgIIAIoBFIEc2l6ZRIXCgd0bl9zaXplGAogAigEUgZ0blNpemUSGQoIdG5fd2lkdGgYDC'
    'ACKARSB3RuV2lkdGgSGwoJdG5faGVpZ2h0GA0gAigEUgh0bkhlaWdodBIkCg50bl9zbWFsbF93'
    'aWR0aBgOIAIoBFIMdG5TbWFsbFdpZHRoEiYKD3RuX3NtYWxsX2hlaWdodBgPIAIoBFINdG5TbW'
    'FsbEhlaWdodBIrChJ0bl9zbWFsbF9kYXRhX3NpemUYECACKA1SD3RuU21hbGxEYXRhU2l6ZRIZ'
    'Cgh0bl9zbWFsbBgRIAMoDVIHdG5TbWFsbBIUCgV3aWR0aBgSIAIoBFIFd2lkdGgSFgoGaGVpZ2'
    'h0GBMgAigEUgZoZWlnaHQ=');

@$core.Deprecated('Use t_QuotedRecDescriptor instead')
const T_QuotedRec$json = {
  '1': 'T_QuotedRec',
  '2': [
    {'1': 'msg', '3': 1, '4': 2, '5': 9, '10': 'msg'},
    {'1': 'quotion_body', '3': 2, '4': 2, '5': 9, '10': 'quotionBody'},
    {'1': 'quotion_user_id', '3': 3, '4': 2, '5': 4, '10': 'quotionUserId'},
    {'1': 'idm', '3': 4, '4': 2, '5': 4, '10': 'idm'},
    {'1': 'mtype', '3': 5, '4': 2, '5': 14, '6': '.netLib.MSG_TYPE', '10': 'mtype'},
  ],
};

/// Descriptor for `T_QuotedRec`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List t_QuotedRecDescriptor = $convert.base64Decode(
    'CgtUX1F1b3RlZFJlYxIQCgNtc2cYASACKAlSA21zZxIhCgxxdW90aW9uX2JvZHkYAiACKAlSC3'
    'F1b3Rpb25Cb2R5EiYKD3F1b3Rpb25fdXNlcl9pZBgDIAIoBFINcXVvdGlvblVzZXJJZBIQCgNp'
    'ZG0YBCACKARSA2lkbRImCgVtdHlwZRgFIAIoDjIQLm5ldExpYi5NU0dfVFlQRVIFbXR5cGU=');

@$core.Deprecated('Use t_GetMsgReqDescriptor instead')
const T_GetMsgReq$json = {
  '1': 'T_GetMsgReq',
  '2': [
    {'1': 'ch_id', '3': 1, '4': 2, '5': 4, '10': 'chId'},
    {'1': 'ch_type', '3': 2, '4': 2, '5': 14, '6': '.netLib.DEST_TYPE', '10': 'chType'},
    {'1': 'direction', '3': 3, '4': 2, '5': 14, '6': '.message.MoveTo', '10': 'direction'},
    {'1': 'count', '3': 4, '4': 2, '5': 13, '10': 'count'},
    {'1': 'idm', '3': 5, '4': 2, '5': 4, '10': 'idm'},
    {'1': 'req_type', '3': 6, '4': 2, '5': 14, '6': '.message.GetMsgTypeReqType', '10': 'reqType'},
  ],
};

/// Descriptor for `T_GetMsgReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List t_GetMsgReqDescriptor = $convert.base64Decode(
    'CgtUX0dldE1zZ1JlcRITCgVjaF9pZBgBIAIoBFIEY2hJZBIqCgdjaF90eXBlGAIgAigOMhEubm'
    'V0TGliLkRFU1RfVFlQRVIGY2hUeXBlEi0KCWRpcmVjdGlvbhgDIAIoDjIPLm1lc3NhZ2UuTW92'
    'ZVRvUglkaXJlY3Rpb24SFAoFY291bnQYBCACKA1SBWNvdW50EhAKA2lkbRgFIAIoBFIDaWRtEj'
    'UKCHJlcV90eXBlGAYgAigOMhoubWVzc2FnZS5HZXRNc2dUeXBlUmVxVHlwZVIHcmVxVHlwZQ==');

@$core.Deprecated('Use t_UnreadChatsDescriptor instead')
const T_UnreadChats$json = {
  '1': 'T_UnreadChats',
  '2': [
    {'1': 'code', '3': 1, '4': 2, '5': 14, '6': '.netLib.ERROR_CODE', '10': 'code'},
    {'1': 'data', '3': 2, '4': 3, '5': 11, '6': '.netLib.CHAT_UNREAD', '10': 'data'},
  ],
};

/// Descriptor for `T_UnreadChats`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List t_UnreadChatsDescriptor = $convert.base64Decode(
    'Cg1UX1VucmVhZENoYXRzEiYKBGNvZGUYASACKA4yEi5uZXRMaWIuRVJST1JfQ09ERVIEY29kZR'
    'InCgRkYXRhGAIgAygLMhMubmV0TGliLkNIQVRfVU5SRUFEUgRkYXRh');

@$core.Deprecated('Use t_UploadFileResDescriptor instead')
const T_UploadFileRes$json = {
  '1': 'T_UploadFileRes',
  '2': [
    {'1': 'key', '3': 1, '4': 2, '5': 9, '10': 'key'},
    {'1': 'success', '3': 2, '4': 2, '5': 8, '10': 'success'},
    {'1': 'isAborted', '3': 3, '4': 2, '5': 8, '10': 'isAborted'},
    {'1': 'fd', '3': 4, '4': 2, '5': 5, '10': 'fd'},
    {'1': 'guid', '3': 5, '4': 2, '5': 9, '10': 'guid'},
  ],
};

/// Descriptor for `T_UploadFileRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List t_UploadFileResDescriptor = $convert.base64Decode(
    'Cg9UX1VwbG9hZEZpbGVSZXMSEAoDa2V5GAEgAigJUgNrZXkSGAoHc3VjY2VzcxgCIAIoCFIHc3'
    'VjY2VzcxIcCglpc0Fib3J0ZWQYAyACKAhSCWlzQWJvcnRlZBIOCgJmZBgEIAIoBVICZmQSEgoE'
    'Z3VpZBgFIAIoCVIEZ3VpZA==');

@$core.Deprecated('Use t_DownloadFileResDescriptor instead')
const T_DownloadFileRes$json = {
  '1': 'T_DownloadFileRes',
  '2': [
    {'1': 'key', '3': 1, '4': 2, '5': 9, '10': 'key'},
    {'1': 'success', '3': 2, '4': 2, '5': 8, '10': 'success'},
    {'1': 'isAborted', '3': 3, '4': 2, '5': 8, '10': 'isAborted'},
  ],
};

/// Descriptor for `T_DownloadFileRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List t_DownloadFileResDescriptor = $convert.base64Decode(
    'ChFUX0Rvd25sb2FkRmlsZVJlcxIQCgNrZXkYASACKAlSA2tleRIYCgdzdWNjZXNzGAIgAigIUg'
    'dzdWNjZXNzEhwKCWlzQWJvcnRlZBgDIAIoCFIJaXNBYm9ydGVk');

@$core.Deprecated('Use fileProgressDescriptor instead')
const FileProgress$json = {
  '1': 'FileProgress',
  '2': [
    {'1': 'key', '3': 2, '4': 2, '5': 9, '10': 'key'},
    {'1': 'progress', '3': 3, '4': 2, '5': 5, '10': 'progress'},
    {'1': 'bitrate', '3': 4, '4': 2, '5': 4, '10': 'bitrate'},
  ],
};

/// Descriptor for `FileProgress`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fileProgressDescriptor = $convert.base64Decode(
    'CgxGaWxlUHJvZ3Jlc3MSEAoDa2V5GAIgAigJUgNrZXkSGgoIcHJvZ3Jlc3MYAyACKAVSCHByb2'
    'dyZXNzEhgKB2JpdHJhdGUYBCACKARSB2JpdHJhdGU=');

@$core.Deprecated('Use sendMessageReqDescriptor instead')
const SendMessageReq$json = {
  '1': 'SendMessageReq',
  '2': [
    {'1': 'dest_id', '3': 1, '4': 2, '5': 4, '10': 'destId'},
    {'1': 'dest_type', '3': 2, '4': 2, '5': 14, '6': '.netLib.DEST_TYPE', '10': 'destType'},
    {'1': 'msg', '3': 3, '4': 2, '5': 9, '10': 'msg'},
  ],
};

/// Descriptor for `SendMessageReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendMessageReqDescriptor = $convert.base64Decode(
    'Cg5TZW5kTWVzc2FnZVJlcRIXCgdkZXN0X2lkGAEgAigEUgZkZXN0SWQSLgoJZGVzdF90eXBlGA'
    'IgAigOMhEubmV0TGliLkRFU1RfVFlQRVIIZGVzdFR5cGUSEAoDbXNnGAMgAigJUgNtc2c=');

@$core.Deprecated('Use sendMessageResDescriptor instead')
const SendMessageRes$json = {
  '1': 'SendMessageRes',
  '2': [
    {'1': 'send_id', '3': 1, '4': 1, '5': 4, '10': 'sendId'},
    {'1': 'code', '3': 2, '4': 1, '5': 14, '6': '.netLib.ERROR_CODE', '10': 'code'},
    {'1': 'rec', '3': 3, '4': 1, '5': 11, '6': '.message.T_MessageRec', '10': 'rec'},
  ],
};

/// Descriptor for `SendMessageRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendMessageResDescriptor = $convert.base64Decode(
    'Cg5TZW5kTWVzc2FnZVJlcxIXCgdzZW5kX2lkGAEgASgEUgZzZW5kSWQSJgoEY29kZRgCIAEoDj'
    'ISLm5ldExpYi5FUlJPUl9DT0RFUgRjb2RlEicKA3JlYxgDIAEoCzIVLm1lc3NhZ2UuVF9NZXNz'
    'YWdlUmVjUgNyZWM=');

@$core.Deprecated('Use sendQuoteMessageInDescriptor instead')
const SendQuoteMessageIn$json = {
  '1': 'SendQuoteMessageIn',
  '2': [
    {'1': 'dest_id', '3': 1, '4': 1, '5': 4, '10': 'destId'},
    {'1': 'dest_type', '3': 2, '4': 1, '5': 14, '6': '.netLib.DEST_TYPE', '10': 'destType'},
    {'1': 'msg', '3': 3, '4': 1, '5': 9, '10': 'msg'},
    {'1': 'quote_user_id', '3': 5, '4': 1, '5': 4, '10': 'quoteUserId'},
    {'1': 'quote_msg', '3': 6, '4': 1, '5': 9, '10': 'quoteMsg'},
    {'1': 'quote_msg_id', '3': 7, '4': 1, '5': 4, '10': 'quoteMsgId'},
    {'1': 'time', '3': 8, '4': 1, '5': 4, '10': 'time'},
    {'1': 'quote_mtype', '3': 9, '4': 1, '5': 14, '6': '.netLib.MSG_TYPE', '10': 'quoteMtype'},
  ],
};

/// Descriptor for `SendQuoteMessageIn`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendQuoteMessageInDescriptor = $convert.base64Decode(
    'ChJTZW5kUXVvdGVNZXNzYWdlSW4SFwoHZGVzdF9pZBgBIAEoBFIGZGVzdElkEi4KCWRlc3RfdH'
    'lwZRgCIAEoDjIRLm5ldExpYi5ERVNUX1RZUEVSCGRlc3RUeXBlEhAKA21zZxgDIAEoCVIDbXNn'
    'EiIKDXF1b3RlX3VzZXJfaWQYBSABKARSC3F1b3RlVXNlcklkEhsKCXF1b3RlX21zZxgGIAEoCV'
    'IIcXVvdGVNc2cSIAoMcXVvdGVfbXNnX2lkGAcgASgEUgpxdW90ZU1zZ0lkEhIKBHRpbWUYCCAB'
    'KARSBHRpbWUSMQoLcXVvdGVfbXR5cGUYCSABKA4yEC5uZXRMaWIuTVNHX1RZUEVSCnF1b3RlTX'
    'R5cGU=');

@$core.Deprecated('Use sendQuoteMessageOutDescriptor instead')
const SendQuoteMessageOut$json = {
  '1': 'SendQuoteMessageOut',
  '2': [
    {'1': 'send_id', '3': 1, '4': 2, '5': 4, '10': 'sendId'},
    {'1': 'rec', '3': 2, '4': 1, '5': 11, '6': '.message.T_MessageRec', '10': 'rec'},
  ],
};

/// Descriptor for `SendQuoteMessageOut`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendQuoteMessageOutDescriptor = $convert.base64Decode(
    'ChNTZW5kUXVvdGVNZXNzYWdlT3V0EhcKB3NlbmRfaWQYASACKARSBnNlbmRJZBInCgNyZWMYAi'
    'ABKAsyFS5tZXNzYWdlLlRfTWVzc2FnZVJlY1IDcmVj');

@$core.Deprecated('Use editMessageInDescriptor instead')
const EditMessageIn$json = {
  '1': 'EditMessageIn',
  '2': [
    {'1': 'idm', '3': 1, '4': 2, '5': 4, '10': 'idm'},
    {'1': 'msg', '3': 2, '4': 2, '5': 9, '10': 'msg'},
  ],
};

/// Descriptor for `EditMessageIn`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List editMessageInDescriptor = $convert.base64Decode(
    'Cg1FZGl0TWVzc2FnZUluEhAKA2lkbRgBIAIoBFIDaWRtEhAKA21zZxgCIAIoCVIDbXNn');

@$core.Deprecated('Use editMessageOutDescriptor instead')
const EditMessageOut$json = {
  '1': 'EditMessageOut',
  '2': [
    {'1': 'res', '3': 1, '4': 2, '5': 4, '10': 'res'},
  ],
};

/// Descriptor for `EditMessageOut`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List editMessageOutDescriptor = $convert.base64Decode(
    'Cg5FZGl0TWVzc2FnZU91dBIQCgNyZXMYASACKARSA3Jlcw==');

@$core.Deprecated('Use forwardMessageInDescriptor instead')
const ForwardMessageIn$json = {
  '1': 'ForwardMessageIn',
  '2': [
    {'1': 'dest_id', '3': 1, '4': 2, '5': 4, '10': 'destId'},
    {'1': 'dest_type', '3': 2, '4': 2, '5': 14, '6': '.netLib.DEST_TYPE', '10': 'destType'},
    {'1': 'reference_rec', '3': 3, '4': 2, '5': 11, '6': '.message.T_MessageRec', '10': 'referenceRec'},
  ],
};

/// Descriptor for `ForwardMessageIn`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List forwardMessageInDescriptor = $convert.base64Decode(
    'ChBGb3J3YXJkTWVzc2FnZUluEhcKB2Rlc3RfaWQYASACKARSBmRlc3RJZBIuCglkZXN0X3R5cG'
    'UYAiACKA4yES5uZXRMaWIuREVTVF9UWVBFUghkZXN0VHlwZRI6Cg1yZWZlcmVuY2VfcmVjGAMg'
    'AigLMhUubWVzc2FnZS5UX01lc3NhZ2VSZWNSDHJlZmVyZW5jZVJlYw==');

@$core.Deprecated('Use forwardMessageOutDescriptor instead')
const ForwardMessageOut$json = {
  '1': 'ForwardMessageOut',
  '2': [
    {'1': 'send_id', '3': 1, '4': 2, '5': 4, '10': 'sendId'},
    {'1': 'code', '3': 2, '4': 1, '5': 14, '6': '.netLib.ERROR_CODE', '10': 'code'},
    {'1': 'rec', '3': 3, '4': 1, '5': 11, '6': '.message.T_MessageRec', '10': 'rec'},
  ],
};

/// Descriptor for `ForwardMessageOut`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List forwardMessageOutDescriptor = $convert.base64Decode(
    'ChFGb3J3YXJkTWVzc2FnZU91dBIXCgdzZW5kX2lkGAEgAigEUgZzZW5kSWQSJgoEY29kZRgCIA'
    'EoDjISLm5ldExpYi5FUlJPUl9DT0RFUgRjb2RlEicKA3JlYxgDIAEoCzIVLm1lc3NhZ2UuVF9N'
    'ZXNzYWdlUmVjUgNyZWM=');

@$core.Deprecated('Use sendFileInDescriptor instead')
const SendFileIn$json = {
  '1': 'SendFileIn',
  '2': [
    {'1': 'dest_id', '3': 1, '4': 1, '5': 4, '10': 'destId'},
    {'1': 'dest_type', '3': 2, '4': 1, '5': 14, '6': '.netLib.DEST_TYPE', '10': 'destType'},
    {'1': 'file_path', '3': 3, '4': 1, '5': 9, '10': 'filePath'},
    {'1': 'msg', '3': 4, '4': 1, '5': 9, '10': 'msg'},
  ],
};

/// Descriptor for `SendFileIn`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendFileInDescriptor = $convert.base64Decode(
    'CgpTZW5kRmlsZUluEhcKB2Rlc3RfaWQYASABKARSBmRlc3RJZBIuCglkZXN0X3R5cGUYAiABKA'
    '4yES5uZXRMaWIuREVTVF9UWVBFUghkZXN0VHlwZRIbCglmaWxlX3BhdGgYAyABKAlSCGZpbGVQ'
    'YXRoEhAKA21zZxgEIAEoCVIDbXNn');

@$core.Deprecated('Use sendFileOutDescriptor instead')
const SendFileOut$json = {
  '1': 'SendFileOut',
  '2': [
    {'1': 'session_id', '3': 1, '4': 1, '5': 4, '10': 'sessionId'},
    {'1': 'code', '3': 2, '4': 1, '5': 14, '6': '.netLib.ERROR_CODE', '10': 'code'},
    {'1': 'width', '3': 3, '4': 1, '5': 13, '10': 'width'},
    {'1': 'height', '3': 4, '4': 1, '5': 4, '10': 'height'},
    {'1': 'thumbnail_error', '3': 5, '4': 1, '5': 14, '6': '.netLib.ERROR_CODE', '10': 'thumbnailError'},
    {'1': 'thumbnail', '3': 6, '4': 3, '5': 13, '10': 'thumbnail'},
    {'1': 'rec', '3': 7, '4': 1, '5': 11, '6': '.message.T_MessageRec', '10': 'rec'},
  ],
};

/// Descriptor for `SendFileOut`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendFileOutDescriptor = $convert.base64Decode(
    'CgtTZW5kRmlsZU91dBIdCgpzZXNzaW9uX2lkGAEgASgEUglzZXNzaW9uSWQSJgoEY29kZRgCIA'
    'EoDjISLm5ldExpYi5FUlJPUl9DT0RFUgRjb2RlEhQKBXdpZHRoGAMgASgNUgV3aWR0aBIWCgZo'
    'ZWlnaHQYBCABKARSBmhlaWdodBI7Cg90aHVtYm5haWxfZXJyb3IYBSABKA4yEi5uZXRMaWIuRV'
    'JST1JfQ09ERVIOdGh1bWJuYWlsRXJyb3ISHAoJdGh1bWJuYWlsGAYgAygNUgl0aHVtYm5haWwS'
    'JwoDcmVjGAcgASgLMhUubWVzc2FnZS5UX01lc3NhZ2VSZWNSA3JlYw==');

@$core.Deprecated('Use deleteMessageReqDescriptor instead')
const DeleteMessageReq$json = {
  '1': 'DeleteMessageReq',
  '2': [
    {'1': 'idm', '3': 1, '4': 3, '5': 4, '10': 'idm'},
  ],
};

/// Descriptor for `DeleteMessageReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteMessageReqDescriptor = $convert.base64Decode(
    'ChBEZWxldGVNZXNzYWdlUmVxEhAKA2lkbRgBIAMoBFIDaWRt');

@$core.Deprecated('Use downloadFileInDescriptor instead')
const DownloadFileIn$json = {
  '1': 'DownloadFileIn',
  '2': [
    {'1': 'cr_file_path', '3': 1, '4': 2, '5': 9, '10': 'crFilePath'},
    {'1': 'file_path', '3': 2, '4': 2, '5': 9, '10': 'filePath'},
    {'1': 'file_size', '3': 3, '4': 2, '5': 4, '10': 'fileSize'},
  ],
};

/// Descriptor for `DownloadFileIn`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List downloadFileInDescriptor = $convert.base64Decode(
    'Cg5Eb3dubG9hZEZpbGVJbhIgCgxjcl9maWxlX3BhdGgYASACKAlSCmNyRmlsZVBhdGgSGwoJZm'
    'lsZV9wYXRoGAIgAigJUghmaWxlUGF0aBIbCglmaWxlX3NpemUYAyACKARSCGZpbGVTaXpl');

@$core.Deprecated('Use downloadFileOutDescriptor instead')
const DownloadFileOut$json = {
  '1': 'DownloadFileOut',
  '2': [
    {'1': 'res', '3': 1, '4': 2, '5': 11, '6': '.message.T_DownloadFileRes', '10': 'res'},
  ],
};

/// Descriptor for `DownloadFileOut`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List downloadFileOutDescriptor = $convert.base64Decode(
    'Cg9Eb3dubG9hZEZpbGVPdXQSLAoDcmVzGAEgAigLMhoubWVzc2FnZS5UX0Rvd25sb2FkRmlsZV'
    'Jlc1IDcmVz');

@$core.Deprecated('Use downloadImageThumbnailInDescriptor instead')
const DownloadImageThumbnailIn$json = {
  '1': 'DownloadImageThumbnailIn',
  '2': [
    {'1': 'cr_file_path', '3': 1, '4': 2, '5': 9, '10': 'crFilePath'},
    {'1': 'tn_file_path', '3': 2, '4': 2, '5': 9, '10': 'tnFilePath'},
    {'1': 'tn_file_size', '3': 3, '4': 2, '5': 4, '10': 'tnFileSize'},
  ],
};

/// Descriptor for `DownloadImageThumbnailIn`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List downloadImageThumbnailInDescriptor = $convert.base64Decode(
    'ChhEb3dubG9hZEltYWdlVGh1bWJuYWlsSW4SIAoMY3JfZmlsZV9wYXRoGAEgAigJUgpjckZpbG'
    'VQYXRoEiAKDHRuX2ZpbGVfcGF0aBgCIAIoCVIKdG5GaWxlUGF0aBIgCgx0bl9maWxlX3NpemUY'
    'AyACKARSCnRuRmlsZVNpemU=');

@$core.Deprecated('Use downloadImageThumbnailOutDescriptor instead')
const DownloadImageThumbnailOut$json = {
  '1': 'DownloadImageThumbnailOut',
  '2': [
    {'1': 'res', '3': 1, '4': 2, '5': 11, '6': '.message.T_DownloadFileRes', '10': 'res'},
  ],
};

/// Descriptor for `DownloadImageThumbnailOut`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List downloadImageThumbnailOutDescriptor = $convert.base64Decode(
    'ChlEb3dubG9hZEltYWdlVGh1bWJuYWlsT3V0EiwKA3JlcxgBIAIoCzIaLm1lc3NhZ2UuVF9Eb3'
    'dubG9hZEZpbGVSZXNSA3Jlcw==');

@$core.Deprecated('Use abortFileInDescriptor instead')
const AbortFileIn$json = {
  '1': 'AbortFileIn',
  '2': [
    {'1': 'session_id', '3': 1, '4': 1, '5': 4, '10': 'sessionId'},
  ],
};

/// Descriptor for `AbortFileIn`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List abortFileInDescriptor = $convert.base64Decode(
    'CgtBYm9ydEZpbGVJbhIdCgpzZXNzaW9uX2lkGAEgASgEUglzZXNzaW9uSWQ=');

@$core.Deprecated('Use abortFileOutDescriptor instead')
const AbortFileOut$json = {
  '1': 'AbortFileOut',
  '2': [
    {'1': 'error', '3': 1, '4': 1, '5': 14, '6': '.netLib.ERROR_CODE', '10': 'error'},
  ],
};

/// Descriptor for `AbortFileOut`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List abortFileOutDescriptor = $convert.base64Decode(
    'CgxBYm9ydEZpbGVPdXQSKAoFZXJyb3IYASABKA4yEi5uZXRMaWIuRVJST1JfQ09ERVIFZXJyb3'
    'I=');

@$core.Deprecated('Use revealFileInDescriptor instead')
const RevealFileIn$json = {
  '1': 'RevealFileIn',
  '2': [
    {'1': 'path', '3': 1, '4': 2, '5': 9, '10': 'path'},
  ],
};

/// Descriptor for `RevealFileIn`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List revealFileInDescriptor = $convert.base64Decode(
    'CgxSZXZlYWxGaWxlSW4SEgoEcGF0aBgBIAIoCVIEcGF0aA==');

@$core.Deprecated('Use fileStateDescriptor instead')
const FileState$json = {
  '1': 'FileState',
  '2': [
    {'1': 'path', '3': 1, '4': 1, '5': 9, '10': 'path'},
    {'1': 'size', '3': 2, '4': 1, '5': 4, '10': 'size'},
    {'1': 'direction', '3': 3, '4': 1, '5': 4, '10': 'direction'},
    {'1': 'start_time', '3': 4, '4': 1, '5': 4, '10': 'startTime'},
    {'1': 'prcnt_ready', '3': 5, '4': 1, '5': 2, '10': 'prcntReady'},
    {'1': 'speed', '3': 6, '4': 1, '5': 4, '10': 'speed'},
    {'1': 'state', '3': 7, '4': 1, '5': 14, '6': '.message.StorageState', '10': 'state'},
    {'1': 'error', '3': 8, '4': 1, '5': 14, '6': '.netLib.ERROR_CODE', '10': 'error'},
    {'1': 'send_message_id', '3': 9, '4': 1, '5': 4, '10': 'sendMessageId'},
    {'1': 'thumbnail', '3': 10, '4': 1, '5': 9, '10': 'thumbnail'},
    {'1': 'thumbnail_ready', '3': 11, '4': 1, '5': 8, '10': 'thumbnailReady'},
    {'1': 'link', '3': 12, '4': 1, '5': 9, '10': 'link'},
    {'1': 'ext', '3': 13, '4': 1, '5': 9, '10': 'ext'},
    {'1': 'seesion_id', '3': 14, '4': 1, '5': 4, '10': 'seesionId'},
  ],
};

/// Descriptor for `FileState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fileStateDescriptor = $convert.base64Decode(
    'CglGaWxlU3RhdGUSEgoEcGF0aBgBIAEoCVIEcGF0aBISCgRzaXplGAIgASgEUgRzaXplEhwKCW'
    'RpcmVjdGlvbhgDIAEoBFIJZGlyZWN0aW9uEh0KCnN0YXJ0X3RpbWUYBCABKARSCXN0YXJ0VGlt'
    'ZRIfCgtwcmNudF9yZWFkeRgFIAEoAlIKcHJjbnRSZWFkeRIUCgVzcGVlZBgGIAEoBFIFc3BlZW'
    'QSKwoFc3RhdGUYByABKA4yFS5tZXNzYWdlLlN0b3JhZ2VTdGF0ZVIFc3RhdGUSKAoFZXJyb3IY'
    'CCABKA4yEi5uZXRMaWIuRVJST1JfQ09ERVIFZXJyb3ISJgoPc2VuZF9tZXNzYWdlX2lkGAkgAS'
    'gEUg1zZW5kTWVzc2FnZUlkEhwKCXRodW1ibmFpbBgKIAEoCVIJdGh1bWJuYWlsEicKD3RodW1i'
    'bmFpbF9yZWFkeRgLIAEoCFIOdGh1bWJuYWlsUmVhZHkSEgoEbGluaxgMIAEoCVIEbGluaxIQCg'
    'NleHQYDSABKAlSA2V4dBIdCgpzZWVzaW9uX2lkGA4gASgEUglzZWVzaW9uSWQ=');

@$core.Deprecated('Use filePartDescriptor instead')
const FilePart$json = {
  '1': 'FilePart',
  '2': [
    {'1': 'session_id', '3': 1, '4': 1, '5': 4, '10': 'sessionId'},
    {'1': 'ready_parts_count', '3': 2, '4': 1, '5': 4, '10': 'readyPartsCount'},
    {'1': 'parts_count', '3': 3, '4': 1, '5': 4, '10': 'partsCount'},
    {'1': 'size', '3': 4, '4': 1, '5': 4, '10': 'size'},
    {'1': 'speed', '3': 5, '4': 1, '5': 4, '10': 'speed'},
  ],
};

/// Descriptor for `FilePart`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List filePartDescriptor = $convert.base64Decode(
    'CghGaWxlUGFydBIdCgpzZXNzaW9uX2lkGAEgASgEUglzZXNzaW9uSWQSKgoRcmVhZHlfcGFydH'
    'NfY291bnQYAiABKARSD3JlYWR5UGFydHNDb3VudBIfCgtwYXJ0c19jb3VudBgDIAEoBFIKcGFy'
    'dHNDb3VudBISCgRzaXplGAQgASgEUgRzaXplEhQKBXNwZWVkGAUgASgEUgVzcGVlZA==');

@$core.Deprecated('Use getFileInDescriptor instead')
const GetFileIn$json = {
  '1': 'GetFileIn',
  '2': [
    {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.message.GetFileType', '10': 'type'},
    {'1': 'link', '3': 2, '4': 1, '5': 9, '10': 'link'},
    {'1': 'path', '3': 3, '4': 1, '5': 9, '10': 'path'},
  ],
};

/// Descriptor for `GetFileIn`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getFileInDescriptor = $convert.base64Decode(
    'CglHZXRGaWxlSW4SKAoEdHlwZRgBIAEoDjIULm1lc3NhZ2UuR2V0RmlsZVR5cGVSBHR5cGUSEg'
    'oEbGluaxgCIAEoCVIEbGluaxISCgRwYXRoGAMgASgJUgRwYXRo');

@$core.Deprecated('Use getFileOutDescriptor instead')
const GetFileOut$json = {
  '1': 'GetFileOut',
  '2': [
    {'1': 'error', '3': 1, '4': 1, '5': 14, '6': '.netLib.ERROR_CODE', '10': 'error'},
    {'1': 'data', '3': 2, '4': 3, '5': 13, '10': 'data'},
    {'1': 'session_id', '3': 3, '4': 1, '5': 4, '10': 'sessionId'},
  ],
};

/// Descriptor for `GetFileOut`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getFileOutDescriptor = $convert.base64Decode(
    'CgpHZXRGaWxlT3V0EigKBWVycm9yGAEgASgOMhIubmV0TGliLkVSUk9SX0NPREVSBWVycm9yEh'
    'IKBGRhdGEYAiADKA1SBGRhdGESHQoKc2Vzc2lvbl9pZBgDIAEoBFIJc2Vzc2lvbklk');

@$core.Deprecated('Use getFileStateInDescriptor instead')
const GetFileStateIn$json = {
  '1': 'GetFileStateIn',
  '2': [
    {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.message.GetFileStateType', '10': 'type'},
    {'1': 'link', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'link'},
    {'1': 'session_id', '3': 3, '4': 1, '5': 4, '9': 0, '10': 'sessionId'},
  ],
  '8': [
    {'1': 'msg'},
  ],
};

/// Descriptor for `GetFileStateIn`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getFileStateInDescriptor = $convert.base64Decode(
    'Cg5HZXRGaWxlU3RhdGVJbhItCgR0eXBlGAEgASgOMhkubWVzc2FnZS5HZXRGaWxlU3RhdGVUeX'
    'BlUgR0eXBlEhQKBGxpbmsYAiABKAlIAFIEbGluaxIfCgpzZXNzaW9uX2lkGAMgASgESABSCXNl'
    'c3Npb25JZEIFCgNtc2c=');

@$core.Deprecated('Use getFileStateOutDescriptor instead')
const GetFileStateOut$json = {
  '1': 'GetFileStateOut',
  '2': [
    {'1': 'is_loaded', '3': 1, '4': 1, '5': 8, '9': 0, '10': 'isLoaded'},
    {'1': 'file_state', '3': 2, '4': 1, '5': 11, '6': '.message.FileState', '9': 0, '10': 'fileState'},
  ],
  '8': [
    {'1': 'msg'},
  ],
};

/// Descriptor for `GetFileStateOut`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getFileStateOutDescriptor = $convert.base64Decode(
    'Cg9HZXRGaWxlU3RhdGVPdXQSHQoJaXNfbG9hZGVkGAEgASgISABSCGlzTG9hZGVkEjMKCmZpbG'
    'Vfc3RhdGUYAiABKAsyEi5tZXNzYWdlLkZpbGVTdGF0ZUgAUglmaWxlU3RhdGVCBQoDbXNn');


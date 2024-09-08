//
//  Generated code. Do not modify.
//  source: app.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use serviceTypesDescriptor instead')
const ServiceTypes$json = {
  '1': 'ServiceTypes',
  '2': [
    {'1': 'taskIdOfEvent', '2': 16777215},
    {'1': 'ignoreTaskId', '2': 0},
  ],
};

/// Descriptor for `ServiceTypes`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List serviceTypesDescriptor = $convert.base64Decode(
    'CgxTZXJ2aWNlVHlwZXMSFAoNdGFza0lkT2ZFdmVudBD///8HEhAKDGlnbm9yZVRhc2tJZBAA');

@$core.Deprecated('Use apiEventDescriptor instead')
const ApiEvent$json = {
  '1': 'ApiEvent',
  '2': [
    {'1': 'AllMessagesReady', '2': 1},
    {'1': 'OnlineChanged', '2': 2},
    {'1': 'ChatListChanged', '2': 3},
    {'1': 'ChatRead', '2': 4},
    {'1': 'ChatAdded', '2': 5},
    {'1': 'ChatRemoved', '2': 6},
    {'1': 'CallEvent', '2': 7},
    {'1': 'CallListChanged', '2': 8},
    {'1': 'ActiveCallHardwareChanged', '2': 26},
    {'1': 'BookOnlineChanged', '2': 9},
    {'1': 'BookListChanged', '2': 10},
    {'1': 'RegProfileListChanged', '2': 13},
    {'1': 'RegStatusChanged', '2': 14},
    {'1': 'RegNetErrorChanged', '2': 16},
    {'1': 'UserInfoChanged', '2': 18},
    {'1': 'UpdateMsg', '2': 19},
    {'1': 'NetErrorCode', '2': 21},
    {'1': 'FilePart', '2': 30},
    {'1': 'MirrorCppLog', '2': 24},
    {'1': 'IconChanged', '2': 25},
    {'1': 'DebugCount', '2': 31},
    {'1': 'OnLocalMsgNotification', '2': 28},
    {'1': 'OnLocalCallNotification', '2': 29},
    {'1': 'MissedCallCountChanged', '2': 32},
  ],
};

/// Descriptor for `ApiEvent`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List apiEventDescriptor = $convert.base64Decode(
    'CghBcGlFdmVudBIUChBBbGxNZXNzYWdlc1JlYWR5EAESEQoNT25saW5lQ2hhbmdlZBACEhMKD0'
    'NoYXRMaXN0Q2hhbmdlZBADEgwKCENoYXRSZWFkEAQSDQoJQ2hhdEFkZGVkEAUSDwoLQ2hhdFJl'
    'bW92ZWQQBhINCglDYWxsRXZlbnQQBxITCg9DYWxsTGlzdENoYW5nZWQQCBIdChlBY3RpdmVDYW'
    'xsSGFyZHdhcmVDaGFuZ2VkEBoSFQoRQm9va09ubGluZUNoYW5nZWQQCRITCg9Cb29rTGlzdENo'
    'YW5nZWQQChIZChVSZWdQcm9maWxlTGlzdENoYW5nZWQQDRIUChBSZWdTdGF0dXNDaGFuZ2VkEA'
    '4SFgoSUmVnTmV0RXJyb3JDaGFuZ2VkEBASEwoPVXNlckluZm9DaGFuZ2VkEBISDQoJVXBkYXRl'
    'TXNnEBMSEAoMTmV0RXJyb3JDb2RlEBUSDAoIRmlsZVBhcnQQHhIQCgxNaXJyb3JDcHBMb2cQGB'
    'IPCgtJY29uQ2hhbmdlZBAZEg4KCkRlYnVnQ291bnQQHxIaChZPbkxvY2FsTXNnTm90aWZpY2F0'
    'aW9uEBwSGwoXT25Mb2NhbENhbGxOb3RpZmljYXRpb24QHRIaChZNaXNzZWRDYWxsQ291bnRDaG'
    'FuZ2VkECA=');

@$core.Deprecated('Use onlineStatusDescriptor instead')
const OnlineStatus$json = {
  '1': 'OnlineStatus',
  '2': [
    {'1': 'Connecting', '2': 0},
    {'1': 'Connected', '2': 1},
    {'1': 'Error', '2': 3},
    {'1': 'Disconnected', '2': 4},
  ],
};

/// Descriptor for `OnlineStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List onlineStatusDescriptor = $convert.base64Decode(
    'CgxPbmxpbmVTdGF0dXMSDgoKQ29ubmVjdGluZxAAEg0KCUNvbm5lY3RlZBABEgkKBUVycm9yEA'
    'MSEAoMRGlzY29ubmVjdGVkEAQ=');

@$core.Deprecated('Use activeCallVideoTypeDescriptor instead')
const ActiveCallVideoType$json = {
  '1': 'ActiveCallVideoType',
  '2': [
    {'1': 'Idle', '2': 0},
    {'1': 'Camera1', '2': 1},
    {'1': 'Camera2', '2': 2},
    {'1': 'Screen', '2': 3},
  ],
};

/// Descriptor for `ActiveCallVideoType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List activeCallVideoTypeDescriptor = $convert.base64Decode(
    'ChNBY3RpdmVDYWxsVmlkZW9UeXBlEggKBElkbGUQABILCgdDYW1lcmExEAESCwoHQ2FtZXJhMh'
    'ACEgoKBlNjcmVlbhAD');

@$core.Deprecated('Use audioCommandTypeDescriptor instead')
const AudioCommandType$json = {
  '1': 'AudioCommandType',
  '2': [
    {'1': 'START_CALL_MONITOR', '2': 0},
    {'1': 'STOP_CALL_MONITOR', '2': 1},
    {'1': 'SWITCH_TO_SPEAKERS', '2': 3},
    {'1': 'SWITCH_TO_VOICE', '2': 4},
    {'1': 'MUTE', '2': 5},
    {'1': 'UNMUTE', '2': 6},
    {'1': 'START_VIDEO_RECEIVER', '2': 7},
    {'1': 'STOP_VIDEO_RECEIVER', '2': 8},
    {'1': 'START_VIDEO_SENDER', '2': 9},
    {'1': 'STOP_VIDEO_SENDER', '2': 10},
    {'1': 'VIDEO_GET_CONFIG', '2': 11},
    {'1': 'GET_VIDEO_SOURCE_SIZE', '2': 12},
    {'1': 'FORCE_ACTIVE_CALL_HARDWARE_STATUS_CHANGED', '2': 13},
  ],
};

/// Descriptor for `AudioCommandType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List audioCommandTypeDescriptor = $convert.base64Decode(
    'ChBBdWRpb0NvbW1hbmRUeXBlEhYKElNUQVJUX0NBTExfTU9OSVRPUhAAEhUKEVNUT1BfQ0FMTF'
    '9NT05JVE9SEAESFgoSU1dJVENIX1RPX1NQRUFLRVJTEAMSEwoPU1dJVENIX1RPX1ZPSUNFEAQS'
    'CAoETVVURRAFEgoKBlVOTVVURRAGEhgKFFNUQVJUX1ZJREVPX1JFQ0VJVkVSEAcSFwoTU1RPUF'
    '9WSURFT19SRUNFSVZFUhAIEhYKElNUQVJUX1ZJREVPX1NFTkRFUhAJEhUKEVNUT1BfVklERU9f'
    'U0VOREVSEAoSFAoQVklERU9fR0VUX0NPTkZJRxALEhkKFUdFVF9WSURFT19TT1VSQ0VfU0laRR'
    'AMEi0KKUZPUkNFX0FDVElWRV9DQUxMX0hBUkRXQVJFX1NUQVRVU19DSEFOR0VEEA0=');

@$core.Deprecated('Use videoCodecTypeDescriptor instead')
const VideoCodecType$json = {
  '1': 'VideoCodecType',
  '2': [
    {'1': 'Codec3gp', '2': 0},
    {'1': 'CodecMP4', '2': 1},
    {'1': 'CodecAVC', '2': 2},
    {'1': 'CodecHEVC', '2': 3},
    {'1': 'CodecVP8', '2': 4},
    {'1': 'CodecVP9', '2': 5},
  ],
};

/// Descriptor for `VideoCodecType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List videoCodecTypeDescriptor = $convert.base64Decode(
    'Cg5WaWRlb0NvZGVjVHlwZRIMCghDb2RlYzNncBAAEgwKCENvZGVjTVA0EAESDAoIQ29kZWNBVk'
    'MQAhINCglDb2RlY0hFVkMQAxIMCghDb2RlY1ZQOBAEEgwKCENvZGVjVlA5EAU=');

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

@$core.Deprecated('Use serviceCmdTypeDescriptor instead')
const ServiceCmdType$json = {
  '1': 'ServiceCmdType',
  '2': [
    {'1': 'CHECK_STATE', '2': 0},
    {'1': 'REINIT_REG', '2': 2},
    {'1': 'INIT_UPDATE', '2': 3},
    {'1': 'CHECK_FOR_UPDATE', '2': 4},
    {'1': 'APPLY_UPDATE_WITH_RESTART', '2': 5},
    {'1': 'GET_SCREEN_DPI', '2': 6},
    {'1': 'CLEAR_NOTIFICATIONS', '2': 7},
    {'1': 'NOTIFICATIONS_ADD_FILTER', '2': 8},
    {'1': 'NOTIFICATIONS_CLEAR_FILTER', '2': 9},
  ],
};

/// Descriptor for `ServiceCmdType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List serviceCmdTypeDescriptor = $convert.base64Decode(
    'Cg5TZXJ2aWNlQ21kVHlwZRIPCgtDSEVDS19TVEFURRAAEg4KClJFSU5JVF9SRUcQAhIPCgtJTk'
    'lUX1VQREFURRADEhQKEENIRUNLX0ZPUl9VUERBVEUQBBIdChlBUFBMWV9VUERBVEVfV0lUSF9S'
    'RVNUQVJUEAUSEgoOR0VUX1NDUkVFTl9EUEkQBhIXChNDTEVBUl9OT1RJRklDQVRJT05TEAcSHA'
    'oYTk9USUZJQ0FUSU9OU19BRERfRklMVEVSEAgSHgoaTk9USUZJQ0FUSU9OU19DTEVBUl9GSUxU'
    'RVIQCQ==');

@$core.Deprecated('Use notificationTypeDescriptor instead')
const NotificationType$json = {
  '1': 'NotificationType',
  '2': [
    {'1': 'APP_STATUS', '2': 0},
    {'1': 'EVENTS_IN_LIST', '2': 1},
    {'1': 'EVENTS_TEXT', '2': 2},
  ],
};

/// Descriptor for `NotificationType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List notificationTypeDescriptor = $convert.base64Decode(
    'ChBOb3RpZmljYXRpb25UeXBlEg4KCkFQUF9TVEFUVVMQABISCg5FVkVOVFNfSU5fTElTVBABEg'
    '8KC0VWRU5UU19URVhUEAI=');

@$core.Deprecated('Use androidFlagDescriptor instead')
const AndroidFlag$json = {
  '1': 'AndroidFlag',
  '2': [
    {'1': 'FLAG_START_FROM_NOTIFICATION_MAIN', '2': 10},
    {'1': 'FLAG_START_FROM_NOTIFICATION_CHAT', '2': 11},
    {'1': 'FLAG_START_FROM_NOTIFICATION_MARK_CHAT_READ', '2': 12},
    {'1': 'FLAG_START_FROM_NOTIFICATION_CALL_HISTORY', '2': 16},
    {'1': 'FLAG_ANSWER_CALL', '2': 13},
    {'1': 'FLAG_DECLINE_CALL', '2': 14},
    {'1': 'FLAG_SHOW_CALL', '2': 15},
  ],
};

/// Descriptor for `AndroidFlag`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List androidFlagDescriptor = $convert.base64Decode(
    'CgtBbmRyb2lkRmxhZxIlCiFGTEFHX1NUQVJUX0ZST01fTk9USUZJQ0FUSU9OX01BSU4QChIlCi'
    'FGTEFHX1NUQVJUX0ZST01fTk9USUZJQ0FUSU9OX0NIQVQQCxIvCitGTEFHX1NUQVJUX0ZST01f'
    'Tk9USUZJQ0FUSU9OX01BUktfQ0hBVF9SRUFEEAwSLQopRkxBR19TVEFSVF9GUk9NX05PVElGSU'
    'NBVElPTl9DQUxMX0hJU1RPUlkQEBIUChBGTEFHX0FOU1dFUl9DQUxMEA0SFQoRRkxBR19ERUNM'
    'SU5FX0NBTEwQDhISCg5GTEFHX1NIT1dfQ0FMTBAP');

@$core.Deprecated('Use startLibParamDescriptor instead')
const StartLibParam$json = {
  '1': 'StartLibParam',
  '2': [
    {'1': 'cache_dir_path', '3': 1, '4': 1, '5': 9, '10': 'cacheDirPath'},
    {'1': 'reg_serv_addr', '3': 2, '4': 1, '5': 9, '10': 'regServAddr'},
    {'1': 'reg_serv_port', '3': 3, '4': 1, '5': 5, '10': 'regServPort'},
    {'1': 'net_serv_addr', '3': 4, '4': 1, '5': 9, '10': 'netServAddr'},
    {'1': 'net_serv_port', '3': 5, '4': 1, '5': 5, '10': 'netServPort'},
    {'1': 'fcm', '3': 6, '4': 1, '5': 9, '10': 'fcm'},
    {'1': 'native_log_path', '3': 7, '4': 1, '5': 9, '10': 'nativeLogPath'},
    {'1': 'use_mirror_cpp_log', '3': 8, '4': 1, '5': 8, '10': 'useMirrorCppLog'},
    {'1': 'start_time', '3': 9, '4': 1, '5': 4, '10': 'startTime'},
    {'1': 'notification_show_data', '3': 10, '4': 2, '5': 8, '10': 'notificationShowData'},
  ],
};

/// Descriptor for `StartLibParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List startLibParamDescriptor = $convert.base64Decode(
    'Cg1TdGFydExpYlBhcmFtEiQKDmNhY2hlX2Rpcl9wYXRoGAEgASgJUgxjYWNoZURpclBhdGgSIg'
    'oNcmVnX3NlcnZfYWRkchgCIAEoCVILcmVnU2VydkFkZHISIgoNcmVnX3NlcnZfcG9ydBgDIAEo'
    'BVILcmVnU2VydlBvcnQSIgoNbmV0X3NlcnZfYWRkchgEIAEoCVILbmV0U2VydkFkZHISIgoNbm'
    'V0X3NlcnZfcG9ydBgFIAEoBVILbmV0U2VydlBvcnQSEAoDZmNtGAYgASgJUgNmY20SJgoPbmF0'
    'aXZlX2xvZ19wYXRoGAcgASgJUg1uYXRpdmVMb2dQYXRoEisKEnVzZV9taXJyb3JfY3BwX2xvZx'
    'gIIAEoCFIPdXNlTWlycm9yQ3BwTG9nEh0KCnN0YXJ0X3RpbWUYCSABKARSCXN0YXJ0VGltZRI0'
    'ChZub3RpZmljYXRpb25fc2hvd19kYXRhGAogAigIUhRub3RpZmljYXRpb25TaG93RGF0YQ==');

@$core.Deprecated('Use callListDescriptor instead')
const CallList$json = {
  '1': 'CallList',
  '2': [
    {'1': 'call_list_changed', '3': 1, '4': 3, '5': 11, '6': '.netLib.CALL_LIST_REC', '10': 'callListChanged'},
  ],
};

/// Descriptor for `CallList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List callListDescriptor = $convert.base64Decode(
    'CghDYWxsTGlzdBJBChFjYWxsX2xpc3RfY2hhbmdlZBgBIAMoCzIVLm5ldExpYi5DQUxMX0xJU1'
    'RfUkVDUg9jYWxsTGlzdENoYW5nZWQ=');

@$core.Deprecated('Use activeCallListDescriptor instead')
const ActiveCallList$json = {
  '1': 'ActiveCallList',
  '2': [
    {'1': 'calls', '3': 1, '4': 3, '5': 11, '6': '.netLib.CALL_INFO', '10': 'calls'},
  ],
};

/// Descriptor for `ActiveCallList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List activeCallListDescriptor = $convert.base64Decode(
    'Cg5BY3RpdmVDYWxsTGlzdBInCgVjYWxscxgBIAMoCzIRLm5ldExpYi5DQUxMX0lORk9SBWNhbG'
    'xz');

@$core.Deprecated('Use activeCallHardwareDescriptor instead')
const ActiveCallHardware$json = {
  '1': 'ActiveCallHardware',
  '2': [
    {'1': 'device_changed', '3': 1, '4': 2, '5': 8, '10': 'deviceChanged'},
    {'1': 'speaker_on', '3': 2, '4': 2, '5': 8, '10': 'speakerOn'},
    {'1': 'is_muted', '3': 3, '4': 2, '5': 8, '10': 'isMuted'},
    {'1': 'use_video', '3': 4, '4': 2, '5': 8, '10': 'useVideo'},
    {'1': 'audio_codec', '3': 5, '4': 2, '5': 13, '10': 'audioCodec'},
    {'1': 'video_type', '3': 6, '4': 1, '5': 14, '6': '.apiProto.ActiveCallVideoType', '10': 'videoType'},
  ],
};

/// Descriptor for `ActiveCallHardware`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List activeCallHardwareDescriptor = $convert.base64Decode(
    'ChJBY3RpdmVDYWxsSGFyZHdhcmUSJQoOZGV2aWNlX2NoYW5nZWQYASACKAhSDWRldmljZUNoYW'
    '5nZWQSHQoKc3BlYWtlcl9vbhgCIAIoCFIJc3BlYWtlck9uEhkKCGlzX211dGVkGAMgAigIUgdp'
    'c011dGVkEhsKCXVzZV92aWRlbxgEIAIoCFIIdXNlVmlkZW8SHwoLYXVkaW9fY29kZWMYBSACKA'
    '1SCmF1ZGlvQ29kZWMSPAoKdmlkZW9fdHlwZRgGIAEoDjIdLmFwaVByb3RvLkFjdGl2ZUNhbGxW'
    'aWRlb1R5cGVSCXZpZGVvVHlwZQ==');

@$core.Deprecated('Use videoConfigRespDescriptor instead')
const VideoConfigResp$json = {
  '1': 'VideoConfigResp',
  '2': [
    {'1': 'width_primar', '3': 1, '4': 2, '5': 13, '10': 'widthPrimar'},
    {'1': 'height_primar', '3': 2, '4': 2, '5': 13, '10': 'heightPrimar'},
    {'1': 'pointer_primar', '3': 3, '4': 2, '5': 4, '10': 'pointerPrimar'},
    {'1': 'len_primar', '3': 4, '4': 2, '5': 13, '10': 'lenPrimar'},
    {'1': 'width_second', '3': 5, '4': 2, '5': 13, '10': 'widthSecond'},
    {'1': 'height_second', '3': 6, '4': 2, '5': 13, '10': 'heightSecond'},
    {'1': 'pointer_second', '3': 7, '4': 2, '5': 4, '10': 'pointerSecond'},
    {'1': 'len_second', '3': 8, '4': 2, '5': 13, '10': 'lenSecond'},
    {'1': 'rotate_send', '3': 9, '4': 2, '5': 13, '10': 'rotateSend'},
    {'1': 'rotate_receive', '3': 10, '4': 2, '5': 13, '10': 'rotateReceive'},
  ],
};

/// Descriptor for `VideoConfigResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List videoConfigRespDescriptor = $convert.base64Decode(
    'Cg9WaWRlb0NvbmZpZ1Jlc3ASIQoMd2lkdGhfcHJpbWFyGAEgAigNUgt3aWR0aFByaW1hchIjCg'
    '1oZWlnaHRfcHJpbWFyGAIgAigNUgxoZWlnaHRQcmltYXISJQoOcG9pbnRlcl9wcmltYXIYAyAC'
    'KARSDXBvaW50ZXJQcmltYXISHQoKbGVuX3ByaW1hchgEIAIoDVIJbGVuUHJpbWFyEiEKDHdpZH'
    'RoX3NlY29uZBgFIAIoDVILd2lkdGhTZWNvbmQSIwoNaGVpZ2h0X3NlY29uZBgGIAIoDVIMaGVp'
    'Z2h0U2Vjb25kEiUKDnBvaW50ZXJfc2Vjb25kGAcgAigEUg1wb2ludGVyU2Vjb25kEh0KCmxlbl'
    '9zZWNvbmQYCCACKA1SCWxlblNlY29uZBIfCgtyb3RhdGVfc2VuZBgJIAIoDVIKcm90YXRlU2Vu'
    'ZBIlCg5yb3RhdGVfcmVjZWl2ZRgKIAIoDVINcm90YXRlUmVjZWl2ZQ==');

@$core.Deprecated('Use sourceVideoDescriptor instead')
const SourceVideo$json = {
  '1': 'SourceVideo',
  '2': [
    {'1': 'width', '3': 1, '4': 2, '5': 13, '10': 'width'},
    {'1': 'height', '3': 2, '4': 2, '5': 13, '10': 'height'},
    {'1': 'description', '3': 3, '4': 2, '5': 9, '10': 'description'},
  ],
};

/// Descriptor for `SourceVideo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sourceVideoDescriptor = $convert.base64Decode(
    'CgtTb3VyY2VWaWRlbxIUCgV3aWR0aBgBIAIoDVIFd2lkdGgSFgoGaGVpZ2h0GAIgAigNUgZoZW'
    'lnaHQSIAoLZGVzY3JpcHRpb24YAyACKAlSC2Rlc2NyaXB0aW9u');

@$core.Deprecated('Use makeCallReqDescriptor instead')
const MakeCallReq$json = {
  '1': 'MakeCallReq',
  '2': [
    {'1': 'number', '3': 1, '4': 2, '5': 9, '10': 'number'},
    {'1': 'use_video', '3': 2, '4': 2, '5': 8, '10': 'useVideo'},
  ],
};

/// Descriptor for `MakeCallReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List makeCallReqDescriptor = $convert.base64Decode(
    'CgtNYWtlQ2FsbFJlcRIWCgZudW1iZXIYASACKAlSBm51bWJlchIbCgl1c2VfdmlkZW8YAiACKA'
    'hSCHVzZVZpZGVv');

@$core.Deprecated('Use makeCallRespDescriptor instead')
const MakeCallResp$json = {
  '1': 'MakeCallResp',
  '2': [
    {'1': 'success', '3': 1, '4': 2, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `MakeCallResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List makeCallRespDescriptor = $convert.base64Decode(
    'CgxNYWtlQ2FsbFJlc3ASGAoHc3VjY2VzcxgBIAIoCFIHc3VjY2Vzcw==');

@$core.Deprecated('Use answerCallReqDescriptor instead')
const AnswerCallReq$json = {
  '1': 'AnswerCallReq',
  '2': [
    {'1': 'call_id', '3': 1, '4': 1, '5': 4, '10': 'callId'},
    {'1': 'use_video', '3': 2, '4': 1, '5': 8, '10': 'useVideo'},
  ],
};

/// Descriptor for `AnswerCallReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List answerCallReqDescriptor = $convert.base64Decode(
    'Cg1BbnN3ZXJDYWxsUmVxEhcKB2NhbGxfaWQYASABKARSBmNhbGxJZBIbCgl1c2VfdmlkZW8YAi'
    'ABKAhSCHVzZVZpZGVv');

@$core.Deprecated('Use answerCallRespDescriptor instead')
const AnswerCallResp$json = {
  '1': 'AnswerCallResp',
  '2': [
    {'1': 'success', '3': 1, '4': 2, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `AnswerCallResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List answerCallRespDescriptor = $convert.base64Decode(
    'Cg5BbnN3ZXJDYWxsUmVzcBIYCgdzdWNjZXNzGAEgAigIUgdzdWNjZXNz');

@$core.Deprecated('Use closeCallRespDescriptor instead')
const CloseCallResp$json = {
  '1': 'CloseCallResp',
  '2': [
    {'1': 'success', '3': 1, '4': 2, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `CloseCallResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List closeCallRespDescriptor = $convert.base64Decode(
    'Cg1DbG9zZUNhbGxSZXNwEhgKB3N1Y2Nlc3MYASACKAhSB3N1Y2Nlc3M=');

@$core.Deprecated('Use callHoldOnOffRespDescriptor instead')
const CallHoldOnOffResp$json = {
  '1': 'CallHoldOnOffResp',
  '2': [
    {'1': 'success', '3': 1, '4': 2, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `CallHoldOnOffResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List callHoldOnOffRespDescriptor = $convert.base64Decode(
    'ChFDYWxsSG9sZE9uT2ZmUmVzcBIYCgdzdWNjZXNzGAEgAigIUgdzdWNjZXNz');

@$core.Deprecated('Use callSwitchRespDescriptor instead')
const CallSwitchResp$json = {
  '1': 'CallSwitchResp',
  '2': [
    {'1': 'result', '3': 1, '4': 2, '5': 13, '10': 'result'},
  ],
};

/// Descriptor for `CallSwitchResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List callSwitchRespDescriptor = $convert.base64Decode(
    'Cg5DYWxsU3dpdGNoUmVzcBIWCgZyZXN1bHQYASACKA1SBnJlc3VsdA==');

@$core.Deprecated('Use confCallUserActionReqDescriptor instead')
const ConfCallUserActionReq$json = {
  '1': 'ConfCallUserActionReq',
  '2': [
    {'1': 'dest_id', '3': 1, '4': 1, '5': 4, '10': 'destId'},
  ],
};

/// Descriptor for `ConfCallUserActionReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List confCallUserActionReqDescriptor = $convert.base64Decode(
    'ChVDb25mQ2FsbFVzZXJBY3Rpb25SZXESFwoHZGVzdF9pZBgBIAEoBFIGZGVzdElk');

@$core.Deprecated('Use confCallUserActionRespDescriptor instead')
const ConfCallUserActionResp$json = {
  '1': 'ConfCallUserActionResp',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `ConfCallUserActionResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List confCallUserActionRespDescriptor = $convert.base64Decode(
    'ChZDb25mQ2FsbFVzZXJBY3Rpb25SZXNwEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3M=');

@$core.Deprecated('Use confCallGetUserListReqDescriptor instead')
const ConfCallGetUserListReq$json = {
  '1': 'ConfCallGetUserListReq',
  '2': [
    {'1': 'dest_id', '3': 1, '4': 1, '5': 4, '10': 'destId'},
  ],
};

/// Descriptor for `ConfCallGetUserListReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List confCallGetUserListReqDescriptor = $convert.base64Decode(
    'ChZDb25mQ2FsbEdldFVzZXJMaXN0UmVxEhcKB2Rlc3RfaWQYASABKARSBmRlc3RJZA==');

@$core.Deprecated('Use confCallGetUserListRespDescriptor instead')
const ConfCallGetUserListResp$json = {
  '1': 'ConfCallGetUserListResp',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'list', '3': 2, '4': 3, '5': 11, '6': '.apiProto.ConfMemberRec', '10': 'list'},
  ],
};

/// Descriptor for `ConfCallGetUserListResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List confCallGetUserListRespDescriptor = $convert.base64Decode(
    'ChdDb25mQ2FsbEdldFVzZXJMaXN0UmVzcBIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEisKBG'
    'xpc3QYAiADKAsyFy5hcGlQcm90by5Db25mTWVtYmVyUmVjUgRsaXN0');

@$core.Deprecated('Use confMemberRecDescriptor instead')
const ConfMemberRec$json = {
  '1': 'ConfMemberRec',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 4, '10': 'userId'},
    {'1': 'device_Id', '3': 2, '4': 1, '5': 4, '10': 'deviceId'},
    {'1': 'state', '3': 3, '4': 1, '5': 13, '10': 'state'},
    {'1': 'rights', '3': 4, '4': 1, '5': 13, '10': 'rights'},
  ],
};

/// Descriptor for `ConfMemberRec`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List confMemberRecDescriptor = $convert.base64Decode(
    'Cg1Db25mTWVtYmVyUmVjEhcKB3VzZXJfaWQYASABKARSBnVzZXJJZBIbCglkZXZpY2VfSWQYAi'
    'ABKARSCGRldmljZUlkEhQKBXN0YXRlGAMgASgNUgVzdGF0ZRIWCgZyaWdodHMYBCABKA1SBnJp'
    'Z2h0cw==');

@$core.Deprecated('Use audioCommandInDescriptor instead')
const AudioCommandIn$json = {
  '1': 'AudioCommandIn',
  '2': [
    {'1': 'command', '3': 1, '4': 2, '5': 14, '6': '.apiProto.AudioCommandType', '10': 'command'},
    {'1': 'number', '3': 2, '4': 1, '5': 9, '10': 'number'},
    {'1': 'codec_type', '3': 3, '4': 1, '5': 13, '10': 'codecType'},
    {'1': 'video_type', '3': 4, '4': 1, '5': 14, '6': '.apiProto.ActiveCallVideoType', '10': 'videoType'},
    {'1': 'video_codec_type', '3': 5, '4': 1, '5': 14, '6': '.apiProto.VideoCodecType', '10': 'videoCodecType'},
    {'1': 'use_test_loop', '3': 6, '4': 1, '5': 8, '10': 'useTestLoop'},
    {'1': 'record_to_file', '3': 7, '4': 1, '5': 9, '10': 'recordToFile'},
    {'1': 'width', '3': 8, '4': 1, '5': 13, '10': 'width'},
    {'1': 'height', '3': 9, '4': 1, '5': 13, '10': 'height'},
    {'1': 'frame_rate', '3': 10, '4': 1, '5': 13, '10': 'frameRate'},
  ],
};

/// Descriptor for `AudioCommandIn`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List audioCommandInDescriptor = $convert.base64Decode(
    'Cg5BdWRpb0NvbW1hbmRJbhI0Cgdjb21tYW5kGAEgAigOMhouYXBpUHJvdG8uQXVkaW9Db21tYW'
    '5kVHlwZVIHY29tbWFuZBIWCgZudW1iZXIYAiABKAlSBm51bWJlchIdCgpjb2RlY190eXBlGAMg'
    'ASgNUgljb2RlY1R5cGUSPAoKdmlkZW9fdHlwZRgEIAEoDjIdLmFwaVByb3RvLkFjdGl2ZUNhbG'
    'xWaWRlb1R5cGVSCXZpZGVvVHlwZRJCChB2aWRlb19jb2RlY190eXBlGAUgASgOMhguYXBpUHJv'
    'dG8uVmlkZW9Db2RlY1R5cGVSDnZpZGVvQ29kZWNUeXBlEiIKDXVzZV90ZXN0X2xvb3AYBiABKA'
    'hSC3VzZVRlc3RMb29wEiQKDnJlY29yZF90b19maWxlGAcgASgJUgxyZWNvcmRUb0ZpbGUSFAoF'
    'd2lkdGgYCCABKA1SBXdpZHRoEhYKBmhlaWdodBgJIAEoDVIGaGVpZ2h0Eh0KCmZyYW1lX3JhdG'
    'UYCiABKA1SCWZyYW1lUmF0ZQ==');

@$core.Deprecated('Use audioCommandOutDescriptor instead')
const AudioCommandOut$json = {
  '1': 'AudioCommandOut',
  '2': [
    {'1': 'success', '3': 1, '4': 2, '5': 8, '10': 'success'},
    {'1': 'video_config', '3': 2, '4': 1, '5': 11, '6': '.apiProto.VideoConfigResp', '10': 'videoConfig'},
    {'1': 'sources', '3': 3, '4': 3, '5': 11, '6': '.apiProto.SourceVideo', '10': 'sources'},
  ],
};

/// Descriptor for `AudioCommandOut`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List audioCommandOutDescriptor = $convert.base64Decode(
    'Cg9BdWRpb0NvbW1hbmRPdXQSGAoHc3VjY2VzcxgBIAIoCFIHc3VjY2VzcxI8Cgx2aWRlb19jb2'
    '5maWcYAiABKAsyGS5hcGlQcm90by5WaWRlb0NvbmZpZ1Jlc3BSC3ZpZGVvQ29uZmlnEi8KB3Nv'
    'dXJjZXMYAyADKAsyFS5hcGlQcm90by5Tb3VyY2VWaWRlb1IHc291cmNlcw==');

@$core.Deprecated('Use getAudioCodeResDescriptor instead')
const GetAudioCodeRes$json = {
  '1': 'GetAudioCodeRes',
  '2': [
    {'1': 'codecType', '3': 1, '4': 2, '5': 13, '10': 'codecType'},
  ],
};

/// Descriptor for `GetAudioCodeRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAudioCodeResDescriptor = $convert.base64Decode(
    'Cg9HZXRBdWRpb0NvZGVSZXMSHAoJY29kZWNUeXBlGAEgAigNUgljb2RlY1R5cGU=');

@$core.Deprecated('Use eventMessageDescriptor instead')
const EventMessage$json = {
  '1': 'EventMessage',
  '2': [
    {'1': 'Id', '3': 1, '4': 2, '5': 4, '10': 'Id'},
    {'1': 'DestId', '3': 2, '4': 2, '5': 4, '10': 'DestId'},
    {'1': 'DestType', '3': 3, '4': 2, '5': 14, '6': '.netLib.DEST_TYPE', '10': 'DestType'},
    {'1': 'FromAbonentId', '3': 4, '4': 2, '5': 4, '10': 'FromAbonentId'},
    {'1': 'FromDeviceId', '3': 5, '4': 2, '5': 4, '10': 'FromDeviceId'},
    {'1': 'SendId', '3': 6, '4': 2, '5': 4, '10': 'SendId'},
    {'1': 'CTime', '3': 7, '4': 2, '5': 4, '10': 'CTime'},
    {'1': 'ETime', '3': 8, '4': 2, '5': 4, '10': 'ETime'},
    {'1': 'State', '3': 9, '4': 2, '5': 14, '6': '.netLib.MSG_STATE', '10': 'State'},
    {'1': 'MsgType', '3': 10, '4': 2, '5': 14, '6': '.netLib.MSG_TYPE', '10': 'MsgType'},
    {'1': 'Len', '3': 11, '4': 2, '5': 5, '10': 'Len'},
    {'1': 'is_new', '3': 12, '4': 2, '5': 8, '10': 'isNew'},
    {'1': 'message', '3': 13, '4': 1, '5': 11, '6': '.message.T_MessageRec', '10': 'message'},
  ],
};

/// Descriptor for `EventMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List eventMessageDescriptor = $convert.base64Decode(
    'CgxFdmVudE1lc3NhZ2USDgoCSWQYASACKARSAklkEhYKBkRlc3RJZBgCIAIoBFIGRGVzdElkEi'
    '0KCERlc3RUeXBlGAMgAigOMhEubmV0TGliLkRFU1RfVFlQRVIIRGVzdFR5cGUSJAoNRnJvbUFi'
    'b25lbnRJZBgEIAIoBFINRnJvbUFib25lbnRJZBIiCgxGcm9tRGV2aWNlSWQYBSACKARSDEZyb2'
    '1EZXZpY2VJZBIWCgZTZW5kSWQYBiACKARSBlNlbmRJZBIUCgVDVGltZRgHIAIoBFIFQ1RpbWUS'
    'FAoFRVRpbWUYCCACKARSBUVUaW1lEicKBVN0YXRlGAkgAigOMhEubmV0TGliLk1TR19TVEFURV'
    'IFU3RhdGUSKgoHTXNnVHlwZRgKIAIoDjIQLm5ldExpYi5NU0dfVFlQRVIHTXNnVHlwZRIQCgNM'
    'ZW4YCyACKAVSA0xlbhIVCgZpc19uZXcYDCACKAhSBWlzTmV3Ei8KB21lc3NhZ2UYDSABKAsyFS'
    '5tZXNzYWdlLlRfTWVzc2FnZVJlY1IHbWVzc2FnZQ==');

@$core.Deprecated('Use chatsListDescriptor instead')
const ChatsList$json = {
  '1': 'ChatsList',
  '2': [
    {'1': 'chat_list', '3': 1, '4': 3, '5': 11, '6': '.netLib.CHAT_LIST_REC', '10': 'chatList'},
  ],
};

/// Descriptor for `ChatsList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatsListDescriptor = $convert.base64Decode(
    'CglDaGF0c0xpc3QSMgoJY2hhdF9saXN0GAEgAygLMhUubmV0TGliLkNIQVRfTElTVF9SRUNSCG'
    'NoYXRMaXN0');

@$core.Deprecated('Use contactListDescriptor instead')
const ContactList$json = {
  '1': 'ContactList',
  '2': [
    {'1': 'contact_list', '3': 1, '4': 3, '5': 11, '6': '.netLib.CONTACT_LIST_REC', '10': 'contactList'},
  ],
};

/// Descriptor for `ContactList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List contactListDescriptor = $convert.base64Decode(
    'CgtDb250YWN0TGlzdBI7Cgxjb250YWN0X2xpc3QYASADKAsyGC5uZXRMaWIuQ09OVEFDVF9MSV'
    'NUX1JFQ1ILY29udGFjdExpc3Q=');

@$core.Deprecated('Use cONTACT_LIST_MSGDescriptor instead')
const CONTACT_LIST_MSG$json = {
  '1': 'CONTACT_LIST_MSG',
  '2': [
    {'1': 'MTime', '3': 1, '4': 3, '5': 11, '6': '.netLib.CONTACT_LIST_REC', '10': 'MTime'},
  ],
};

/// Descriptor for `CONTACT_LIST_MSG`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cONTACT_LIST_MSGDescriptor = $convert.base64Decode(
    'ChBDT05UQUNUX0xJU1RfTVNHEi4KBU1UaW1lGAEgAygLMhgubmV0TGliLkNPTlRBQ1RfTElTVF'
    '9SRUNSBU1UaW1l');

@$core.Deprecated('Use t_GetMsgResDescriptor instead')
const T_GetMsgRes$json = {
  '1': 'T_GetMsgRes',
  '2': [
    {'1': 'code', '3': 1, '4': 2, '5': 14, '6': '.netLib.ERROR_CODE', '10': 'code'},
    {'1': 'data', '3': 2, '4': 3, '5': 11, '6': '.message.T_MessageRec', '10': 'data'},
  ],
};

/// Descriptor for `T_GetMsgRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List t_GetMsgResDescriptor = $convert.base64Decode(
    'CgtUX0dldE1zZ1JlcxImCgRjb2RlGAEgAigOMhIubmV0TGliLkVSUk9SX0NPREVSBGNvZGUSKQ'
    'oEZGF0YRgCIAMoCzIVLm1lc3NhZ2UuVF9NZXNzYWdlUmVjUgRkYXRh');

@$core.Deprecated('Use testMemoryInOutDescriptor instead')
const TestMemoryInOut$json = {
  '1': 'TestMemoryInOut',
  '2': [
    {'1': 'useIn', '3': 1, '4': 2, '5': 8, '10': 'useIn'},
    {'1': 'useOut', '3': 2, '4': 2, '5': 8, '10': 'useOut'},
    {'1': 'testBuf', '3': 3, '4': 3, '5': 13, '10': 'testBuf'},
  ],
};

/// Descriptor for `TestMemoryInOut`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List testMemoryInOutDescriptor = $convert.base64Decode(
    'Cg9UZXN0TWVtb3J5SW5PdXQSFAoFdXNlSW4YASACKAhSBXVzZUluEhYKBnVzZU91dBgCIAIoCF'
    'IGdXNlT3V0EhgKB3Rlc3RCdWYYAyADKA1SB3Rlc3RCdWY=');

@$core.Deprecated('Use onlineEventDescriptor instead')
const OnlineEvent$json = {
  '1': 'OnlineEvent',
  '2': [
    {'1': 'state', '3': 2, '4': 2, '5': 14, '6': '.netLib.ClientState', '10': 'state'},
  ],
};

/// Descriptor for `OnlineEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List onlineEventDescriptor = $convert.base64Decode(
    'CgtPbmxpbmVFdmVudBIpCgVzdGF0ZRgCIAIoDjITLm5ldExpYi5DbGllbnRTdGF0ZVIFc3RhdG'
    'U=');

@$core.Deprecated('Use eventMsgWrapperDescriptor instead')
const EventMsgWrapper$json = {
  '1': 'EventMsgWrapper',
  '2': [
    {'1': 'type', '3': 1, '4': 2, '5': 14, '6': '.apiProto.ApiEvent', '10': 'type'},
    {'1': 'online_event', '3': 2, '4': 1, '5': 11, '6': '.apiProto.OnlineEvent', '9': 0, '10': 'onlineEvent'},
    {'1': 'net_err_code', '3': 3, '4': 1, '5': 5, '9': 0, '10': 'netErrCode'},
    {'1': 'event_msg', '3': 4, '4': 1, '5': 11, '6': '.apiProto.EventMessage', '9': 0, '10': 'eventMsg'},
    {'1': 'event_list_rec', '3': 5, '4': 1, '5': 11, '6': '.netLib.EventListRec', '9': 0, '10': 'eventListRec'},
    {'1': 'event_call', '3': 6, '4': 1, '5': 11, '6': '.netLib.EventCall', '9': 0, '10': 'eventCall'},
    {'1': 'active_call', '3': 21, '4': 1, '5': 11, '6': '.netLib.ActiveCallStatus', '9': 0, '10': 'activeCall'},
    {'1': 'active_call_hardware', '3': 22, '4': 1, '5': 11, '6': '.apiProto.ActiveCallHardware', '9': 0, '10': 'activeCallHardware'},
    {'1': 'event_chat_time', '3': 7, '4': 1, '5': 11, '6': '.netLib.EventChatTime', '9': 0, '10': 'eventChatTime'},
    {'1': 'event_online_status', '3': 8, '4': 1, '5': 14, '6': '.apiProto.OnlineStatus', '9': 0, '10': 'eventOnlineStatus'},
    {'1': 'event_chat_list', '3': 10, '4': 1, '5': 11, '6': '.apiProto.ChatsList', '9': 0, '10': 'eventChatList'},
    {'1': 'progress', '3': 11, '4': 1, '5': 11, '6': '.message.FileProgress', '9': 0, '10': 'progress'},
    {'1': 'reg_status_changed', '3': 12, '4': 1, '5': 11, '6': '.registration.RegStatusChangedRes', '9': 0, '10': 'regStatusChanged'},
    {'1': 'reg_profile_list_changed', '3': 13, '4': 1, '5': 11, '6': '.registration.RegProfileListChangedData', '9': 0, '10': 'regProfileListChanged'},
    {'1': 'reg_net_error_changed', '3': 15, '4': 1, '5': 11, '6': '.registration.RegNetErrorChangedData', '9': 0, '10': 'regNetErrorChanged'},
    {'1': 'event_contact_list', '3': 17, '4': 1, '5': 11, '6': '.apiProto.ContactList', '9': 0, '10': 'eventContactList'},
    {'1': 'event_call_list', '3': 18, '4': 1, '5': 11, '6': '.apiProto.CallList', '9': 0, '10': 'eventCallList'},
    {'1': 'log', '3': 19, '4': 1, '5': 9, '9': 0, '10': 'log'},
    {'1': 'iconChanged', '3': 20, '4': 1, '5': 11, '6': '.apiProto.Id', '9': 0, '10': 'iconChanged'},
    {'1': 'debug_video_frame', '3': 23, '4': 1, '5': 11, '6': '.apiProto.DebugVideoFrame', '9': 0, '10': 'debugVideoFrame'},
    {'1': 'local_msg_notification', '3': 24, '4': 1, '5': 11, '6': '.apiProto.NotificationReq', '9': 0, '10': 'localMsgNotification'},
    {'1': 'local_call_notification', '3': 25, '4': 1, '5': 11, '6': '.apiProto.NotificationCallStatusReq', '9': 0, '10': 'localCallNotification'},
    {'1': 'file_part', '3': 27, '4': 1, '5': 11, '6': '.message.FilePart', '9': 0, '10': 'filePart'},
    {'1': 'debugCount', '3': 29, '4': 1, '5': 4, '9': 0, '10': 'debugCount'},
    {'1': 'missed_call_count', '3': 30, '4': 1, '5': 13, '9': 0, '10': 'missedCallCount'},
  ],
  '8': [
    {'1': 'msg'},
  ],
};

/// Descriptor for `EventMsgWrapper`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List eventMsgWrapperDescriptor = $convert.base64Decode(
    'Cg9FdmVudE1zZ1dyYXBwZXISJgoEdHlwZRgBIAIoDjISLmFwaVByb3RvLkFwaUV2ZW50UgR0eX'
    'BlEjoKDG9ubGluZV9ldmVudBgCIAEoCzIVLmFwaVByb3RvLk9ubGluZUV2ZW50SABSC29ubGlu'
    'ZUV2ZW50EiIKDG5ldF9lcnJfY29kZRgDIAEoBUgAUgpuZXRFcnJDb2RlEjUKCWV2ZW50X21zZx'
    'gEIAEoCzIWLmFwaVByb3RvLkV2ZW50TWVzc2FnZUgAUghldmVudE1zZxI8Cg5ldmVudF9saXN0'
    'X3JlYxgFIAEoCzIULm5ldExpYi5FdmVudExpc3RSZWNIAFIMZXZlbnRMaXN0UmVjEjIKCmV2ZW'
    '50X2NhbGwYBiABKAsyES5uZXRMaWIuRXZlbnRDYWxsSABSCWV2ZW50Q2FsbBI7CgthY3RpdmVf'
    'Y2FsbBgVIAEoCzIYLm5ldExpYi5BY3RpdmVDYWxsU3RhdHVzSABSCmFjdGl2ZUNhbGwSUAoUYW'
    'N0aXZlX2NhbGxfaGFyZHdhcmUYFiABKAsyHC5hcGlQcm90by5BY3RpdmVDYWxsSGFyZHdhcmVI'
    'AFISYWN0aXZlQ2FsbEhhcmR3YXJlEj8KD2V2ZW50X2NoYXRfdGltZRgHIAEoCzIVLm5ldExpYi'
    '5FdmVudENoYXRUaW1lSABSDWV2ZW50Q2hhdFRpbWUSSAoTZXZlbnRfb25saW5lX3N0YXR1cxgI'
    'IAEoDjIWLmFwaVByb3RvLk9ubGluZVN0YXR1c0gAUhFldmVudE9ubGluZVN0YXR1cxI9Cg9ldm'
    'VudF9jaGF0X2xpc3QYCiABKAsyEy5hcGlQcm90by5DaGF0c0xpc3RIAFINZXZlbnRDaGF0TGlz'
    'dBIzCghwcm9ncmVzcxgLIAEoCzIVLm1lc3NhZ2UuRmlsZVByb2dyZXNzSABSCHByb2dyZXNzEl'
    'EKEnJlZ19zdGF0dXNfY2hhbmdlZBgMIAEoCzIhLnJlZ2lzdHJhdGlvbi5SZWdTdGF0dXNDaGFu'
    'Z2VkUmVzSABSEHJlZ1N0YXR1c0NoYW5nZWQSYgoYcmVnX3Byb2ZpbGVfbGlzdF9jaGFuZ2VkGA'
    '0gASgLMicucmVnaXN0cmF0aW9uLlJlZ1Byb2ZpbGVMaXN0Q2hhbmdlZERhdGFIAFIVcmVnUHJv'
    'ZmlsZUxpc3RDaGFuZ2VkElkKFXJlZ19uZXRfZXJyb3JfY2hhbmdlZBgPIAEoCzIkLnJlZ2lzdH'
    'JhdGlvbi5SZWdOZXRFcnJvckNoYW5nZWREYXRhSABSEnJlZ05ldEVycm9yQ2hhbmdlZBJFChJl'
    'dmVudF9jb250YWN0X2xpc3QYESABKAsyFS5hcGlQcm90by5Db250YWN0TGlzdEgAUhBldmVudE'
    'NvbnRhY3RMaXN0EjwKD2V2ZW50X2NhbGxfbGlzdBgSIAEoCzISLmFwaVByb3RvLkNhbGxMaXN0'
    'SABSDWV2ZW50Q2FsbExpc3QSEgoDbG9nGBMgASgJSABSA2xvZxIwCgtpY29uQ2hhbmdlZBgUIA'
    'EoCzIMLmFwaVByb3RvLklkSABSC2ljb25DaGFuZ2VkEkcKEWRlYnVnX3ZpZGVvX2ZyYW1lGBcg'
    'ASgLMhkuYXBpUHJvdG8uRGVidWdWaWRlb0ZyYW1lSABSD2RlYnVnVmlkZW9GcmFtZRJRChZsb2'
    'NhbF9tc2dfbm90aWZpY2F0aW9uGBggASgLMhkuYXBpUHJvdG8uTm90aWZpY2F0aW9uUmVxSABS'
    'FGxvY2FsTXNnTm90aWZpY2F0aW9uEl0KF2xvY2FsX2NhbGxfbm90aWZpY2F0aW9uGBkgASgLMi'
    'MuYXBpUHJvdG8uTm90aWZpY2F0aW9uQ2FsbFN0YXR1c1JlcUgAUhVsb2NhbENhbGxOb3RpZmlj'
    'YXRpb24SMAoJZmlsZV9wYXJ0GBsgASgLMhEubWVzc2FnZS5GaWxlUGFydEgAUghmaWxlUGFydB'
    'IgCgpkZWJ1Z0NvdW50GB0gASgESABSCmRlYnVnQ291bnQSLAoRbWlzc2VkX2NhbGxfY291bnQY'
    'HiABKA1IAFIPbWlzc2VkQ2FsbENvdW50QgUKA21zZw==');

@$core.Deprecated('Use memberListDescriptor instead')
const MemberList$json = {
  '1': 'MemberList',
  '2': [
    {'1': 'members', '3': 1, '4': 3, '5': 11, '6': '.netLib.MEMBER_LIST_REC', '10': 'members'},
    {'1': 'code', '3': 2, '4': 1, '5': 14, '6': '.netLib.ERROR_CODE', '10': 'code'},
  ],
};

/// Descriptor for `MemberList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List memberListDescriptor = $convert.base64Decode(
    'CgpNZW1iZXJMaXN0EjEKB21lbWJlcnMYASADKAsyFy5uZXRMaWIuTUVNQkVSX0xJU1RfUkVDUg'
    'dtZW1iZXJzEiYKBGNvZGUYAiABKA4yEi5uZXRMaWIuRVJST1JfQ09ERVIEY29kZQ==');

@$core.Deprecated('Use memberListReqDescriptor instead')
const MemberListReq$json = {
  '1': 'MemberListReq',
  '2': [
    {'1': 'gid', '3': 1, '4': 2, '5': 4, '10': 'gid'},
    {'1': 'gmask', '3': 2, '4': 2, '5': 14, '6': '.netLib.GMEMBER_LTYPE', '10': 'gmask'},
  ],
};

/// Descriptor for `MemberListReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List memberListReqDescriptor = $convert.base64Decode(
    'Cg1NZW1iZXJMaXN0UmVxEhAKA2dpZBgBIAIoBFIDZ2lkEisKBWdtYXNrGAIgAigOMhUubmV0TG'
    'liLkdNRU1CRVJfTFRZUEVSBWdtYXNr');

@$core.Deprecated('Use addContactReqDescriptor instead')
const AddContactReq$json = {
  '1': 'AddContactReq',
  '2': [
    {'1': 'id', '3': 1, '4': 2, '5': 4, '10': 'id'},
    {'1': 'name', '3': 2, '4': 2, '5': 9, '10': 'name'},
    {'1': 'ext_number', '3': 3, '4': 2, '5': 9, '10': 'extNumber'},
  ],
};

/// Descriptor for `AddContactReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addContactReqDescriptor = $convert.base64Decode(
    'Cg1BZGRDb250YWN0UmVxEg4KAmlkGAEgAigEUgJpZBISCgRuYW1lGAIgAigJUgRuYW1lEh0KCm'
    'V4dF9udW1iZXIYAyACKAlSCWV4dE51bWJlcg==');

@$core.Deprecated('Use addContactResDescriptor instead')
const AddContactRes$json = {
  '1': 'AddContactRes',
  '2': [
    {'1': 'id', '3': 1, '4': 2, '5': 4, '10': 'id'},
    {'1': 'success', '3': 2, '4': 2, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `AddContactRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addContactResDescriptor = $convert.base64Decode(
    'Cg1BZGRDb250YWN0UmVzEg4KAmlkGAEgAigEUgJpZBIYCgdzdWNjZXNzGAIgAigIUgdzdWNjZX'
    'Nz');

@$core.Deprecated('Use deleteContactResDescriptor instead')
const DeleteContactRes$json = {
  '1': 'DeleteContactRes',
  '2': [
    {'1': 'id', '3': 1, '4': 2, '5': 4, '10': 'id'},
    {'1': 'success', '3': 2, '4': 2, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `DeleteContactRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteContactResDescriptor = $convert.base64Decode(
    'ChBEZWxldGVDb250YWN0UmVzEg4KAmlkGAEgAigEUgJpZBIYCgdzdWNjZXNzGAIgAigIUgdzdW'
    'NjZXNz');

@$core.Deprecated('Use deleteContactReqDescriptor instead')
const DeleteContactReq$json = {
  '1': 'DeleteContactReq',
  '2': [
    {'1': 'id', '3': 1, '4': 2, '5': 4, '10': 'id'},
  ],
};

/// Descriptor for `DeleteContactReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteContactReqDescriptor = $convert.base64Decode(
    'ChBEZWxldGVDb250YWN0UmVxEg4KAmlkGAEgAigEUgJpZA==');

@$core.Deprecated('Use updateContactReqDescriptor instead')
const UpdateContactReq$json = {
  '1': 'UpdateContactReq',
  '2': [
    {'1': 'id', '3': 1, '4': 2, '5': 4, '10': 'id'},
    {'1': 'name', '3': 2, '4': 2, '5': 9, '10': 'name'},
    {'1': 'phoneNumber', '3': 3, '4': 2, '5': 9, '10': 'phoneNumber'},
  ],
};

/// Descriptor for `UpdateContactReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateContactReqDescriptor = $convert.base64Decode(
    'ChBVcGRhdGVDb250YWN0UmVxEg4KAmlkGAEgAigEUgJpZBISCgRuYW1lGAIgAigJUgRuYW1lEi'
    'AKC3Bob25lTnVtYmVyGAMgAigJUgtwaG9uZU51bWJlcg==');

@$core.Deprecated('Use updateContactResDescriptor instead')
const UpdateContactRes$json = {
  '1': 'UpdateContactRes',
  '2': [
    {'1': 'id', '3': 1, '4': 2, '5': 4, '10': 'id'},
    {'1': 'success', '3': 2, '4': 2, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `UpdateContactRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateContactResDescriptor = $convert.base64Decode(
    'ChBVcGRhdGVDb250YWN0UmVzEg4KAmlkGAEgAigEUgJpZBIYCgdzdWNjZXNzGAIgAigIUgdzdW'
    'NjZXNz');

@$core.Deprecated('Use createGroupReqDescriptor instead')
const CreateGroupReq$json = {
  '1': 'CreateGroupReq',
  '2': [
    {'1': 'name', '3': 1, '4': 2, '5': 9, '10': 'name'},
    {'1': 'description', '3': 2, '4': 2, '5': 9, '10': 'description'},
  ],
};

/// Descriptor for `CreateGroupReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createGroupReqDescriptor = $convert.base64Decode(
    'Cg5DcmVhdGVHcm91cFJlcRISCgRuYW1lGAEgAigJUgRuYW1lEiAKC2Rlc2NyaXB0aW9uGAIgAi'
    'gJUgtkZXNjcmlwdGlvbg==');

@$core.Deprecated('Use createGroupResDescriptor instead')
const CreateGroupRes$json = {
  '1': 'CreateGroupRes',
  '2': [
    {'1': 'id', '3': 1, '4': 2, '5': 4, '10': 'id'},
  ],
};

/// Descriptor for `CreateGroupRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createGroupResDescriptor = $convert.base64Decode(
    'Cg5DcmVhdGVHcm91cFJlcxIOCgJpZBgBIAIoBFICaWQ=');

@$core.Deprecated('Use deleteGroupReqDescriptor instead')
const DeleteGroupReq$json = {
  '1': 'DeleteGroupReq',
  '2': [
    {'1': 'id', '3': 1, '4': 2, '5': 4, '10': 'id'},
  ],
};

/// Descriptor for `DeleteGroupReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteGroupReqDescriptor = $convert.base64Decode(
    'Cg5EZWxldGVHcm91cFJlcRIOCgJpZBgBIAIoBFICaWQ=');

@$core.Deprecated('Use deleteGroupResDescriptor instead')
const DeleteGroupRes$json = {
  '1': 'DeleteGroupRes',
  '2': [
    {'1': 'id', '3': 1, '4': 2, '5': 4, '10': 'id'},
    {'1': 'success', '3': 2, '4': 2, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `DeleteGroupRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteGroupResDescriptor = $convert.base64Decode(
    'Cg5EZWxldGVHcm91cFJlcxIOCgJpZBgBIAIoBFICaWQSGAoHc3VjY2VzcxgCIAIoCFIHc3VjY2'
    'Vzcw==');

@$core.Deprecated('Use editGroupReqDescriptor instead')
const EditGroupReq$json = {
  '1': 'EditGroupReq',
  '2': [
    {'1': 'id', '3': 1, '4': 2, '5': 4, '10': 'id'},
    {'1': 'name', '3': 2, '4': 2, '5': 9, '10': 'name'},
    {'1': 'description', '3': 3, '4': 2, '5': 9, '10': 'description'},
  ],
};

/// Descriptor for `EditGroupReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List editGroupReqDescriptor = $convert.base64Decode(
    'CgxFZGl0R3JvdXBSZXESDgoCaWQYASACKARSAmlkEhIKBG5hbWUYAiACKAlSBG5hbWUSIAoLZG'
    'VzY3JpcHRpb24YAyACKAlSC2Rlc2NyaXB0aW9u');

@$core.Deprecated('Use editGroupResDescriptor instead')
const EditGroupRes$json = {
  '1': 'EditGroupRes',
  '2': [
    {'1': 'id', '3': 1, '4': 2, '5': 4, '10': 'id'},
    {'1': 'success', '3': 2, '4': 2, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `EditGroupRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List editGroupResDescriptor = $convert.base64Decode(
    'CgxFZGl0R3JvdXBSZXMSDgoCaWQYASACKARSAmlkEhgKB3N1Y2Nlc3MYAiACKAhSB3N1Y2Nlc3'
    'M=');

@$core.Deprecated('Use changeUserLevelInGroupReqDescriptor instead')
const ChangeUserLevelInGroupReq$json = {
  '1': 'ChangeUserLevelInGroupReq',
  '2': [
    {'1': 'groupId', '3': 1, '4': 2, '5': 4, '10': 'groupId'},
    {'1': 'userId', '3': 2, '4': 2, '5': 4, '10': 'userId'},
    {'1': 'level', '3': 3, '4': 2, '5': 14, '6': '.netLib.GMEMBER_LTYPE', '10': 'level'},
  ],
};

/// Descriptor for `ChangeUserLevelInGroupReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List changeUserLevelInGroupReqDescriptor = $convert.base64Decode(
    'ChlDaGFuZ2VVc2VyTGV2ZWxJbkdyb3VwUmVxEhgKB2dyb3VwSWQYASACKARSB2dyb3VwSWQSFg'
    'oGdXNlcklkGAIgAigEUgZ1c2VySWQSKwoFbGV2ZWwYAyACKA4yFS5uZXRMaWIuR01FTUJFUl9M'
    'VFlQRVIFbGV2ZWw=');

@$core.Deprecated('Use changeUserLevelInGroupResDescriptor instead')
const ChangeUserLevelInGroupRes$json = {
  '1': 'ChangeUserLevelInGroupRes',
  '2': [
    {'1': 'groupId', '3': 1, '4': 2, '5': 4, '10': 'groupId'},
    {'1': 'userId', '3': 2, '4': 2, '5': 4, '10': 'userId'},
    {'1': 'success', '3': 3, '4': 2, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `ChangeUserLevelInGroupRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List changeUserLevelInGroupResDescriptor = $convert.base64Decode(
    'ChlDaGFuZ2VVc2VyTGV2ZWxJbkdyb3VwUmVzEhgKB2dyb3VwSWQYASACKARSB2dyb3VwSWQSFg'
    'oGdXNlcklkGAIgAigEUgZ1c2VySWQSGAoHc3VjY2VzcxgDIAIoCFIHc3VjY2Vzcw==');

@$core.Deprecated('Use inviteUserToGroupReqDescriptor instead')
const InviteUserToGroupReq$json = {
  '1': 'InviteUserToGroupReq',
  '2': [
    {'1': 'groupId', '3': 1, '4': 2, '5': 4, '10': 'groupId'},
    {'1': 'userId', '3': 2, '4': 2, '5': 4, '10': 'userId'},
    {'1': 'level', '3': 3, '4': 2, '5': 14, '6': '.netLib.GMEMBER_LTYPE', '10': 'level'},
  ],
};

/// Descriptor for `InviteUserToGroupReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List inviteUserToGroupReqDescriptor = $convert.base64Decode(
    'ChRJbnZpdGVVc2VyVG9Hcm91cFJlcRIYCgdncm91cElkGAEgAigEUgdncm91cElkEhYKBnVzZX'
    'JJZBgCIAIoBFIGdXNlcklkEisKBWxldmVsGAMgAigOMhUubmV0TGliLkdNRU1CRVJfTFRZUEVS'
    'BWxldmVs');

@$core.Deprecated('Use inviteUserToGroupResDescriptor instead')
const InviteUserToGroupRes$json = {
  '1': 'InviteUserToGroupRes',
  '2': [
    {'1': 'groupId', '3': 1, '4': 2, '5': 4, '10': 'groupId'},
    {'1': 'userId', '3': 2, '4': 2, '5': 4, '10': 'userId'},
    {'1': 'success', '3': 3, '4': 2, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `InviteUserToGroupRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List inviteUserToGroupResDescriptor = $convert.base64Decode(
    'ChRJbnZpdGVVc2VyVG9Hcm91cFJlcxIYCgdncm91cElkGAEgAigEUgdncm91cElkEhYKBnVzZX'
    'JJZBgCIAIoBFIGdXNlcklkEhgKB3N1Y2Nlc3MYAyACKAhSB3N1Y2Nlc3M=');

@$core.Deprecated('Use removeUserFromGroupReqDescriptor instead')
const RemoveUserFromGroupReq$json = {
  '1': 'RemoveUserFromGroupReq',
  '2': [
    {'1': 'groupId', '3': 1, '4': 2, '5': 4, '10': 'groupId'},
    {'1': 'userId', '3': 2, '4': 2, '5': 4, '10': 'userId'},
  ],
};

/// Descriptor for `RemoveUserFromGroupReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removeUserFromGroupReqDescriptor = $convert.base64Decode(
    'ChZSZW1vdmVVc2VyRnJvbUdyb3VwUmVxEhgKB2dyb3VwSWQYASACKARSB2dyb3VwSWQSFgoGdX'
    'NlcklkGAIgAigEUgZ1c2VySWQ=');

@$core.Deprecated('Use removeUserFromGroupResDescriptor instead')
const RemoveUserFromGroupRes$json = {
  '1': 'RemoveUserFromGroupRes',
  '2': [
    {'1': 'groupId', '3': 1, '4': 2, '5': 4, '10': 'groupId'},
    {'1': 'userId', '3': 2, '4': 2, '5': 4, '10': 'userId'},
    {'1': 'success', '3': 3, '4': 2, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `RemoveUserFromGroupRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removeUserFromGroupResDescriptor = $convert.base64Decode(
    'ChZSZW1vdmVVc2VyRnJvbUdyb3VwUmVzEhgKB2dyb3VwSWQYASACKARSB2dyb3VwSWQSFgoGdX'
    'NlcklkGAIgAigEUgZ1c2VySWQSGAoHc3VjY2VzcxgDIAIoCFIHc3VjY2Vzcw==');

@$core.Deprecated('Use getInfoGroupReqDescriptor instead')
const GetInfoGroupReq$json = {
  '1': 'GetInfoGroupReq',
  '2': [
    {'1': 'groupId', '3': 1, '4': 2, '5': 4, '10': 'groupId'},
  ],
};

/// Descriptor for `GetInfoGroupReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getInfoGroupReqDescriptor = $convert.base64Decode(
    'Cg9HZXRJbmZvR3JvdXBSZXESGAoHZ3JvdXBJZBgBIAIoBFIHZ3JvdXBJZA==');

@$core.Deprecated('Use getInfoGroupResDescriptor instead')
const GetInfoGroupRes$json = {
  '1': 'GetInfoGroupRes',
  '2': [
    {'1': 'groupId', '3': 1, '4': 2, '5': 4, '10': 'groupId'},
    {'1': 'name', '3': 2, '4': 2, '5': 9, '10': 'name'},
    {'1': 'description', '3': 3, '4': 2, '5': 9, '10': 'description'},
    {'1': 'success', '3': 4, '4': 2, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `GetInfoGroupRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getInfoGroupResDescriptor = $convert.base64Decode(
    'Cg9HZXRJbmZvR3JvdXBSZXMSGAoHZ3JvdXBJZBgBIAIoBFIHZ3JvdXBJZBISCgRuYW1lGAIgAi'
    'gJUgRuYW1lEiAKC2Rlc2NyaXB0aW9uGAMgAigJUgtkZXNjcmlwdGlvbhIYCgdzdWNjZXNzGAQg'
    'AigIUgdzdWNjZXNz');

@$core.Deprecated('Use setIconReqDescriptor instead')
const SetIconReq$json = {
  '1': 'SetIconReq',
  '2': [
    {'1': 'destId', '3': 1, '4': 2, '5': 4, '10': 'destId'},
    {'1': 'dest_type', '3': 2, '4': 2, '5': 14, '6': '.netLib.DEST_TYPE', '10': 'destType'},
    {'1': 'img', '3': 3, '4': 3, '5': 13, '10': 'img'},
  ],
};

/// Descriptor for `SetIconReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setIconReqDescriptor = $convert.base64Decode(
    'CgpTZXRJY29uUmVxEhYKBmRlc3RJZBgBIAIoBFIGZGVzdElkEi4KCWRlc3RfdHlwZRgCIAIoDj'
    'IRLm5ldExpYi5ERVNUX1RZUEVSCGRlc3RUeXBlEhAKA2ltZxgDIAMoDVIDaW1n');

@$core.Deprecated('Use setIconResDescriptor instead')
const SetIconRes$json = {
  '1': 'SetIconRes',
  '2': [
    {'1': 'success', '3': 3, '4': 2, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `SetIconRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setIconResDescriptor = $convert.base64Decode(
    'CgpTZXRJY29uUmVzEhgKB3N1Y2Nlc3MYAyACKAhSB3N1Y2Nlc3M=');

@$core.Deprecated('Use getUserInfoReqDescriptor instead')
const GetUserInfoReq$json = {
  '1': 'GetUserInfoReq',
  '2': [
    {'1': 'id', '3': 1, '4': 2, '5': 4, '10': 'id'},
  ],
};

/// Descriptor for `GetUserInfoReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserInfoReqDescriptor = $convert.base64Decode(
    'Cg5HZXRVc2VySW5mb1JlcRIOCgJpZBgBIAIoBFICaWQ=');

@$core.Deprecated('Use getUserInfoResDescriptor instead')
const GetUserInfoRes$json = {
  '1': 'GetUserInfoRes',
  '2': [
    {'1': 'id', '3': 1, '4': 2, '5': 4, '10': 'id'},
    {'1': 'success', '3': 3, '4': 2, '5': 8, '10': 'success'},
    {'1': 'info', '3': 2, '4': 1, '5': 11, '6': '.netLib.ABONENT_INFO', '10': 'info'},
  ],
};

/// Descriptor for `GetUserInfoRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserInfoResDescriptor = $convert.base64Decode(
    'Cg5HZXRVc2VySW5mb1JlcxIOCgJpZBgBIAIoBFICaWQSGAoHc3VjY2VzcxgDIAIoCFIHc3VjY2'
    'VzcxIoCgRpbmZvGAIgASgLMhQubmV0TGliLkFCT05FTlRfSU5GT1IEaW5mbw==');

@$core.Deprecated('Use setUserInfoReqDescriptor instead')
const SetUserInfoReq$json = {
  '1': 'SetUserInfoReq',
  '2': [
    {'1': 'info', '3': 1, '4': 2, '5': 11, '6': '.netLib.ABONENT_INFO', '10': 'info'},
  ],
};

/// Descriptor for `SetUserInfoReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setUserInfoReqDescriptor = $convert.base64Decode(
    'Cg5TZXRVc2VySW5mb1JlcRIoCgRpbmZvGAEgAigLMhQubmV0TGliLkFCT05FTlRfSU5GT1IEaW'
    '5mbw==');

@$core.Deprecated('Use setUserInfoRespDescriptor instead')
const SetUserInfoResp$json = {
  '1': 'SetUserInfoResp',
  '2': [
    {'1': 'success', '3': 1, '4': 2, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `SetUserInfoResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setUserInfoRespDescriptor = $convert.base64Decode(
    'Cg9TZXRVc2VySW5mb1Jlc3ASGAoHc3VjY2VzcxgBIAIoCFIHc3VjY2Vzcw==');

@$core.Deprecated('Use findUserReqDescriptor instead')
const FindUserReq$json = {
  '1': 'FindUserReq',
  '2': [
    {'1': 'name_mask', '3': 1, '4': 1, '5': 9, '10': 'nameMask'},
    {'1': 'second_name_mask', '3': 2, '4': 1, '5': 9, '10': 'secondNameMask'},
  ],
};

/// Descriptor for `FindUserReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List findUserReqDescriptor = $convert.base64Decode(
    'CgtGaW5kVXNlclJlcRIbCgluYW1lX21hc2sYASABKAlSCG5hbWVNYXNrEigKEHNlY29uZF9uYW'
    '1lX21hc2sYAiABKAlSDnNlY29uZE5hbWVNYXNr');

@$core.Deprecated('Use findUserRespDescriptor instead')
const FindUserResp$json = {
  '1': 'FindUserResp',
  '2': [
    {'1': 'code_name_mask', '3': 1, '4': 2, '5': 14, '6': '.netLib.ERROR_CODE', '10': 'codeNameMask'},
    {'1': 'code_second_name_mask', '3': 2, '4': 2, '5': 14, '6': '.netLib.ERROR_CODE', '10': 'codeSecondNameMask'},
    {'1': 'user_by_name_mask', '3': 3, '4': 3, '5': 11, '6': '.apiProto.USER_REC', '10': 'userByNameMask'},
    {'1': 'user_by_second_name_mask', '3': 4, '4': 3, '5': 11, '6': '.apiProto.USER_REC', '10': 'userBySecondNameMask'},
  ],
};

/// Descriptor for `FindUserResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List findUserRespDescriptor = $convert.base64Decode(
    'CgxGaW5kVXNlclJlc3ASOAoOY29kZV9uYW1lX21hc2sYASACKA4yEi5uZXRMaWIuRVJST1JfQ0'
    '9ERVIMY29kZU5hbWVNYXNrEkUKFWNvZGVfc2Vjb25kX25hbWVfbWFzaxgCIAIoDjISLm5ldExp'
    'Yi5FUlJPUl9DT0RFUhJjb2RlU2Vjb25kTmFtZU1hc2sSPQoRdXNlcl9ieV9uYW1lX21hc2sYAy'
    'ADKAsyEi5hcGlQcm90by5VU0VSX1JFQ1IOdXNlckJ5TmFtZU1hc2sSSgoYdXNlcl9ieV9zZWNv'
    'bmRfbmFtZV9tYXNrGAQgAygLMhIuYXBpUHJvdG8uVVNFUl9SRUNSFHVzZXJCeVNlY29uZE5hbW'
    'VNYXNr');

@$core.Deprecated('Use uSER_RECDescriptor instead')
const USER_REC$json = {
  '1': 'USER_REC',
  '2': [
    {'1': 'Id', '3': 1, '4': 1, '5': 4, '10': 'Id'},
    {'1': 'Idi', '3': 2, '4': 1, '5': 4, '10': 'Idi'},
    {'1': 'CTime', '3': 3, '4': 1, '5': 4, '10': 'CTime'},
    {'1': 'Name', '3': 4, '4': 1, '5': 9, '10': 'Name'},
    {'1': 'SecondName', '3': 5, '4': 1, '5': 9, '10': 'SecondName'},
  ],
};

/// Descriptor for `USER_REC`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uSER_RECDescriptor = $convert.base64Decode(
    'CghVU0VSX1JFQxIOCgJJZBgBIAEoBFICSWQSEAoDSWRpGAIgASgEUgNJZGkSFAoFQ1RpbWUYAy'
    'ABKARSBUNUaW1lEhIKBE5hbWUYBCABKAlSBE5hbWUSHgoKU2Vjb25kTmFtZRgFIAEoCVIKU2Vj'
    'b25kTmFtZQ==');

@$core.Deprecated('Use serviceCmdReqDescriptor instead')
const ServiceCmdReq$json = {
  '1': 'ServiceCmdReq',
  '2': [
    {'1': 'command', '3': 1, '4': 2, '5': 14, '6': '.apiProto.ServiceCmdType', '10': 'command'},
    {'1': 'initUpdate', '3': 2, '4': 1, '5': 11, '6': '.apiProto.InitUpdateReq', '9': 0, '10': 'initUpdate'},
    {'1': 'id', '3': 3, '4': 1, '5': 11, '6': '.apiProto.Id', '9': 0, '10': 'id'},
  ],
  '8': [
    {'1': 'msg'},
  ],
};

/// Descriptor for `ServiceCmdReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List serviceCmdReqDescriptor = $convert.base64Decode(
    'Cg1TZXJ2aWNlQ21kUmVxEjIKB2NvbW1hbmQYASACKA4yGC5hcGlQcm90by5TZXJ2aWNlQ21kVH'
    'lwZVIHY29tbWFuZBI5Cgppbml0VXBkYXRlGAIgASgLMhcuYXBpUHJvdG8uSW5pdFVwZGF0ZVJl'
    'cUgAUgppbml0VXBkYXRlEh4KAmlkGAMgASgLMgwuYXBpUHJvdG8uSWRIAFICaWRCBQoDbXNn');

@$core.Deprecated('Use serviceCmdRespDescriptor instead')
const ServiceCmdResp$json = {
  '1': 'ServiceCmdResp',
  '2': [
    {'1': 'updateReady', '3': 1, '4': 1, '5': 11, '6': '.apiProto.UpdateReadyResp', '9': 0, '10': 'updateReady'},
    {'1': 'screenDpi', '3': 2, '4': 1, '5': 1, '9': 0, '10': 'screenDpi'},
  ],
  '8': [
    {'1': 'msg'},
  ],
};

/// Descriptor for `ServiceCmdResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List serviceCmdRespDescriptor = $convert.base64Decode(
    'Cg5TZXJ2aWNlQ21kUmVzcBI9Cgt1cGRhdGVSZWFkeRgBIAEoCzIZLmFwaVByb3RvLlVwZGF0ZV'
    'JlYWR5UmVzcEgAUgt1cGRhdGVSZWFkeRIeCglzY3JlZW5EcGkYAiABKAFIAFIJc2NyZWVuRHBp'
    'QgUKA21zZw==');

@$core.Deprecated('Use idDescriptor instead')
const Id$json = {
  '1': 'Id',
  '2': [
    {'1': 'id', '3': 1, '4': 2, '5': 4, '10': 'id'},
    {'1': 'type', '3': 2, '4': 2, '5': 14, '6': '.netLib.DEST_TYPE', '10': 'type'},
  ],
};

/// Descriptor for `Id`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List idDescriptor = $convert.base64Decode(
    'CgJJZBIOCgJpZBgBIAIoBFICaWQSJQoEdHlwZRgCIAIoDjIRLm5ldExpYi5ERVNUX1RZUEVSBH'
    'R5cGU=');

@$core.Deprecated('Use debugVideoFrameDescriptor instead')
const DebugVideoFrame$json = {
  '1': 'DebugVideoFrame',
  '2': [
    {'1': 'chan', '3': 1, '4': 2, '5': 4, '10': 'chan'},
    {'1': 'counter', '3': 2, '4': 2, '5': 4, '10': 'counter'},
    {'1': 'time', '3': 3, '4': 2, '5': 4, '10': 'time'},
    {'1': 'flags', '3': 4, '4': 2, '5': 4, '10': 'flags'},
    {'1': 'data', '3': 5, '4': 3, '5': 4, '10': 'data'},
    {'1': 'codec', '3': 6, '4': 2, '5': 4, '10': 'codec'},
    {'1': 'width', '3': 7, '4': 2, '5': 4, '10': 'width'},
    {'1': 'height', '3': 8, '4': 2, '5': 4, '10': 'height'},
    {'1': 'bitrate', '3': 9, '4': 2, '5': 4, '10': 'bitrate'},
    {'1': 'sample_rate', '3': 10, '4': 2, '5': 4, '10': 'sampleRate'},
    {'1': 'key_rate', '3': 11, '4': 2, '5': 4, '10': 'keyRate'},
  ],
};

/// Descriptor for `DebugVideoFrame`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List debugVideoFrameDescriptor = $convert.base64Decode(
    'Cg9EZWJ1Z1ZpZGVvRnJhbWUSEgoEY2hhbhgBIAIoBFIEY2hhbhIYCgdjb3VudGVyGAIgAigEUg'
    'djb3VudGVyEhIKBHRpbWUYAyACKARSBHRpbWUSFAoFZmxhZ3MYBCACKARSBWZsYWdzEhIKBGRh'
    'dGEYBSADKARSBGRhdGESFAoFY29kZWMYBiACKARSBWNvZGVjEhQKBXdpZHRoGAcgAigEUgV3aW'
    'R0aBIWCgZoZWlnaHQYCCACKARSBmhlaWdodBIYCgdiaXRyYXRlGAkgAigEUgdiaXRyYXRlEh8K'
    'C3NhbXBsZV9yYXRlGAogAigEUgpzYW1wbGVSYXRlEhkKCGtleV9yYXRlGAsgAigEUgdrZXlSYX'
    'Rl');

@$core.Deprecated('Use initUpdateReqDescriptor instead')
const InitUpdateReq$json = {
  '1': 'InitUpdateReq',
  '2': [
    {'1': 'host', '3': 1, '4': 2, '5': 9, '10': 'host'},
    {'1': 'path', '3': 2, '4': 2, '5': 9, '10': 'path'},
    {'1': 'check_interval', '3': 3, '4': 2, '5': 13, '10': 'checkInterval'},
  ],
};

/// Descriptor for `InitUpdateReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List initUpdateReqDescriptor = $convert.base64Decode(
    'Cg1Jbml0VXBkYXRlUmVxEhIKBGhvc3QYASACKAlSBGhvc3QSEgoEcGF0aBgCIAIoCVIEcGF0aB'
    'IlCg5jaGVja19pbnRlcnZhbBgDIAIoDVINY2hlY2tJbnRlcnZhbA==');

@$core.Deprecated('Use setChatMuteReqDescriptor instead')
const SetChatMuteReq$json = {
  '1': 'SetChatMuteReq',
  '2': [
    {'1': 'chat_id', '3': 1, '4': 1, '5': 4, '10': 'chatId'},
    {'1': 'mute', '3': 2, '4': 1, '5': 8, '10': 'mute'},
    {'1': 'time', '3': 3, '4': 1, '5': 4, '10': 'time'},
  ],
};

/// Descriptor for `SetChatMuteReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setChatMuteReqDescriptor = $convert.base64Decode(
    'Cg5TZXRDaGF0TXV0ZVJlcRIXCgdjaGF0X2lkGAEgASgEUgZjaGF0SWQSEgoEbXV0ZRgCIAEoCF'
    'IEbXV0ZRISCgR0aW1lGAMgASgEUgR0aW1l');

@$core.Deprecated('Use notificationReqDescriptor instead')
const NotificationReq$json = {
  '1': 'NotificationReq',
  '2': [
    {'1': 'notification_type', '3': 1, '4': 2, '5': 14, '6': '.apiProto.NotificationType', '10': 'notificationType'},
    {'1': 'state', '3': 2, '4': 1, '5': 14, '6': '.netLib.ClientState', '9': 0, '10': 'state'},
    {'1': 'event_list', '3': 3, '4': 1, '5': 11, '6': '.apiProto.NotificationList', '9': 0, '10': 'eventList'},
    {'1': 'event_text', '3': 4, '4': 1, '5': 11, '6': '.apiProto.NotificationText', '9': 0, '10': 'eventText'},
  ],
  '8': [
    {'1': 'body'},
  ],
};

/// Descriptor for `NotificationReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List notificationReqDescriptor = $convert.base64Decode(
    'Cg9Ob3RpZmljYXRpb25SZXESRwoRbm90aWZpY2F0aW9uX3R5cGUYASACKA4yGi5hcGlQcm90by'
    '5Ob3RpZmljYXRpb25UeXBlUhBub3RpZmljYXRpb25UeXBlEisKBXN0YXRlGAIgASgOMhMubmV0'
    'TGliLkNsaWVudFN0YXRlSABSBXN0YXRlEjsKCmV2ZW50X2xpc3QYAyABKAsyGi5hcGlQcm90by'
    '5Ob3RpZmljYXRpb25MaXN0SABSCWV2ZW50TGlzdBI7CgpldmVudF90ZXh0GAQgASgLMhouYXBp'
    'UHJvdG8uTm90aWZpY2F0aW9uVGV4dEgAUglldmVudFRleHRCBgoEYm9keQ==');

@$core.Deprecated('Use notificationCallStatusReqDescriptor instead')
const NotificationCallStatusReq$json = {
  '1': 'NotificationCallStatusReq',
  '2': [
    {'1': 'call_name', '3': 12, '4': 1, '5': 9, '10': 'callName'},
    {'1': 'call_dest_id', '3': 13, '4': 1, '5': 4, '10': 'callDestId'},
    {'1': 'call_id', '3': 17, '4': 1, '5': 4, '10': 'callId'},
    {'1': 'call_dest_type', '3': 14, '4': 1, '5': 14, '6': '.netLib.DEST_TYPE', '10': 'callDestType'},
    {'1': 'call_state', '3': 15, '4': 1, '5': 14, '6': '.netLib.CALL_STATE', '10': 'callState'},
    {'1': 'with_video', '3': 16, '4': 1, '5': 8, '10': 'withVideo'},
  ],
};

/// Descriptor for `NotificationCallStatusReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List notificationCallStatusReqDescriptor = $convert.base64Decode(
    'ChlOb3RpZmljYXRpb25DYWxsU3RhdHVzUmVxEhsKCWNhbGxfbmFtZRgMIAEoCVIIY2FsbE5hbW'
    'USIAoMY2FsbF9kZXN0X2lkGA0gASgEUgpjYWxsRGVzdElkEhcKB2NhbGxfaWQYESABKARSBmNh'
    'bGxJZBI3Cg5jYWxsX2Rlc3RfdHlwZRgOIAEoDjIRLm5ldExpYi5ERVNUX1RZUEVSDGNhbGxEZX'
    'N0VHlwZRIxCgpjYWxsX3N0YXRlGA8gASgOMhIubmV0TGliLkNBTExfU1RBVEVSCWNhbGxTdGF0'
    'ZRIdCgp3aXRoX3ZpZGVvGBAgASgIUgl3aXRoVmlkZW8=');

@$core.Deprecated('Use notificationListDescriptor instead')
const NotificationList$json = {
  '1': 'NotificationList',
  '2': [
    {'1': 'msg_items', '3': 1, '4': 3, '5': 11, '6': '.apiProto.NotificationItem', '10': 'msgItems'},
    {'1': 'call_items', '3': 2, '4': 3, '5': 11, '6': '.apiProto.NotificationItem', '10': 'callItems'},
  ],
};

/// Descriptor for `NotificationList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List notificationListDescriptor = $convert.base64Decode(
    'ChBOb3RpZmljYXRpb25MaXN0EjcKCW1zZ19pdGVtcxgBIAMoCzIaLmFwaVByb3RvLk5vdGlmaW'
    'NhdGlvbkl0ZW1SCG1zZ0l0ZW1zEjkKCmNhbGxfaXRlbXMYAiADKAsyGi5hcGlQcm90by5Ob3Rp'
    'ZmljYXRpb25JdGVtUgljYWxsSXRlbXM=');

@$core.Deprecated('Use notificationTextDescriptor instead')
const NotificationText$json = {
  '1': 'NotificationText',
  '2': [
    {'1': 'title', '3': 6, '4': 1, '5': 9, '10': 'title'},
    {'1': 'message', '3': 7, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `NotificationText`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List notificationTextDescriptor = $convert.base64Decode(
    'ChBOb3RpZmljYXRpb25UZXh0EhQKBXRpdGxlGAYgASgJUgV0aXRsZRIYCgdtZXNzYWdlGAcgAS'
    'gJUgdtZXNzYWdl');

@$core.Deprecated('Use notificationItemDescriptor instead')
const NotificationItem$json = {
  '1': 'NotificationItem',
  '2': [
    {'1': 'dest_id', '3': 1, '4': 1, '5': 4, '10': 'destId'},
    {'1': 'dest_type', '3': 2, '4': 1, '5': 14, '6': '.netLib.DEST_TYPE', '10': 'destType'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'body', '3': 4, '4': 1, '5': 9, '10': 'body'},
    {'1': 'time', '3': 5, '4': 1, '5': 4, '10': 'time'},
    {'1': 'chat_id', '3': 6, '4': 1, '5': 4, '10': 'chatId'},
  ],
};

/// Descriptor for `NotificationItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List notificationItemDescriptor = $convert.base64Decode(
    'ChBOb3RpZmljYXRpb25JdGVtEhcKB2Rlc3RfaWQYASABKARSBmRlc3RJZBIuCglkZXN0X3R5cG'
    'UYAiABKA4yES5uZXRMaWIuREVTVF9UWVBFUghkZXN0VHlwZRISCgRuYW1lGAMgASgJUgRuYW1l'
    'EhIKBGJvZHkYBCABKAlSBGJvZHkSEgoEdGltZRgFIAEoBFIEdGltZRIXCgdjaGF0X2lkGAYgAS'
    'gEUgZjaGF0SWQ=');

@$core.Deprecated('Use updateReadyRespDescriptor instead')
const UpdateReadyResp$json = {
  '1': 'UpdateReadyResp',
  '2': [
    {'1': 'version', '3': 1, '4': 2, '5': 9, '10': 'version'},
    {'1': 'note', '3': 2, '4': 2, '5': 9, '10': 'note'},
  ],
};

/// Descriptor for `UpdateReadyResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateReadyRespDescriptor = $convert.base64Decode(
    'Cg9VcGRhdGVSZWFkeVJlc3ASGAoHdmVyc2lvbhgBIAIoCVIHdmVyc2lvbhISCgRub3RlGAIgAi'
    'gJUgRub3Rl');


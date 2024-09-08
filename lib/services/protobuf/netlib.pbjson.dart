//
//  Generated code. Do not modify.
//  source: netlib.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use clientStateDescriptor instead')
const ClientState$json = {
  '1': 'ClientState',
  '2': [
    {'1': 'CLIENT_OFF', '2': 1},
    {'1': 'CLIENT_FAILED', '2': 2},
    {'1': 'CLIENT_DISCONNECTED', '2': 3},
    {'1': 'CLIENT_DISCONNECTING', '2': 4},
    {'1': 'CLIENT_RECONNECTING', '2': 5},
    {'1': 'CLIENT_CONNECTING', '2': 6},
    {'1': 'CLIENT_ONLINE', '2': 7},
  ],
};

/// Descriptor for `ClientState`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List clientStateDescriptor = $convert.base64Decode(
    'CgtDbGllbnRTdGF0ZRIOCgpDTElFTlRfT0ZGEAESEQoNQ0xJRU5UX0ZBSUxFRBACEhcKE0NMSU'
    'VOVF9ESVNDT05ORUNURUQQAxIYChRDTElFTlRfRElTQ09OTkVDVElORxAEEhcKE0NMSUVOVF9S'
    'RUNPTk5FQ1RJTkcQBRIVChFDTElFTlRfQ09OTkVDVElORxAGEhEKDUNMSUVOVF9PTkxJTkUQBw'
    '==');

@$core.Deprecated('Use dEST_TYPEDescriptor instead')
const DEST_TYPE$json = {
  '1': 'DEST_TYPE',
  '2': [
    {'1': 'ABONENT', '2': 0},
    {'1': 'GROUPE', '2': 1},
    {'1': 'DEVICE', '2': 2},
  ],
};

/// Descriptor for `DEST_TYPE`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List dEST_TYPEDescriptor = $convert.base64Decode(
    'CglERVNUX1RZUEUSCwoHQUJPTkVOVBAAEgoKBkdST1VQRRABEgoKBkRFVklDRRAC');

@$core.Deprecated('Use mSG_STATEDescriptor instead')
const MSG_STATE$json = {
  '1': 'MSG_STATE',
  '2': [
    {'1': 'MSG_UNSENT', '2': 0},
    {'1': 'MSG_SENT', '2': 1},
    {'1': 'MSG_DELIVERED', '2': 2},
    {'1': 'MSG_READED', '2': 3},
    {'1': 'MSG_DELETED', '2': 4},
    {'1': 'MSG_MAX_STATE', '2': 5},
  ],
};

/// Descriptor for `MSG_STATE`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List mSG_STATEDescriptor = $convert.base64Decode(
    'CglNU0dfU1RBVEUSDgoKTVNHX1VOU0VOVBAAEgwKCE1TR19TRU5UEAESEQoNTVNHX0RFTElWRV'
    'JFRBACEg4KCk1TR19SRUFERUQQAxIPCgtNU0dfREVMRVRFRBAEEhEKDU1TR19NQVhfU1RBVEUQ'
    'BQ==');

@$core.Deprecated('Use mSG_TYPEDescriptor instead')
const MSG_TYPE$json = {
  '1': 'MSG_TYPE',
  '2': [
    {'1': 'MSG_ANY', '2': 0},
    {'1': 'MSG_TEXT', '2': 1},
    {'1': 'MSG_INVITE', '2': 2},
    {'1': 'MSG_FLINK', '2': 3},
    {'1': 'MSG_IMGLINK', '2': 4},
    {'1': 'MSG_VIDEO', '2': 9},
    {'1': 'MSG_SERVICE', '2': 5},
    {'1': 'MSG_CHAT_EVENT', '2': 6},
    {'1': 'MSG_SOUND', '2': 7},
    {'1': 'MSG_OBJECT', '2': 8},
    {'1': 'MSG_ERROR', '2': 15},
  ],
};

/// Descriptor for `MSG_TYPE`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List mSG_TYPEDescriptor = $convert.base64Decode(
    'CghNU0dfVFlQRRILCgdNU0dfQU5ZEAASDAoITVNHX1RFWFQQARIOCgpNU0dfSU5WSVRFEAISDQ'
    'oJTVNHX0ZMSU5LEAMSDwoLTVNHX0lNR0xJTksQBBINCglNU0dfVklERU8QCRIPCgtNU0dfU0VS'
    'VklDRRAFEhIKDk1TR19DSEFUX0VWRU5UEAYSDQoJTVNHX1NPVU5EEAcSDgoKTVNHX09CSkVDVB'
    'AIEg0KCU1TR19FUlJPUhAP');

@$core.Deprecated('Use eRROR_CODEDescriptor instead')
const ERROR_CODE$json = {
  '1': 'ERROR_CODE',
  '2': [
    {'1': 'ERR_OK', '2': 0},
    {'1': 'ERR_FAIL', '2': 1},
    {'1': 'ERR_PARAMS', '2': 2},
    {'1': 'ERR_UNREGISTERED', '2': 3},
    {'1': 'ERR_TIMEOUT', '2': 4},
    {'1': 'ERR_DISCONNECTED', '2': 6},
    {'1': 'ERR_ABORT', '2': 7},
    {'1': 'ERR_DISABLED', '2': 8},
    {'1': 'ERR_RETRY', '2': 9},
    {'1': 'ERR_NOT_INIT', '2': 10},
    {'1': 'ERR_CANCEL', '2': 11},
    {'1': 'ERR_TEMPORALY_UNAVAIBLE', '2': 12},
    {'1': 'ERR_NOT_FOUND', '2': 256},
    {'1': 'ERR_EXIST', '2': 257},
    {'1': 'ERR_NO_SEND', '2': 258},
    {'1': 'ERR_RESYNC', '2': 260},
    {'1': 'ERR_BUSY', '2': 259},
    {'1': 'ERR_UNSUPPORTED', '2': 261},
    {'1': 'ERR_ACCESS_DENIED', '2': 262},
    {'1': 'ERR_NOT_CONNECTED', '2': 263},
    {'1': 'ERR_EMPTY', '2': 264},
    {'1': 'ERR_OVERFLOW', '2': 265},
    {'1': 'ERR_OVERLOAD', '2': 266},
    {'1': 'ERR_UNKNOWN_SERVICE', '2': 267},
    {'1': 'ERR_UNSUPPORTED_SERVICE', '2': 268},
    {'1': 'ERR_UNSUPPORTED_COMMAND', '2': 269},
    {'1': 'ERR_NOT_IMPLEMENTED', '2': 270},
    {'1': 'ERR_ALREADY_DONE', '2': 272},
    {'1': 'ERR_NOT_REGISTRED', '2': 273},
    {'1': 'ERR_NOT_READY', '2': 274},
    {'1': 'ERR_NOT_EXIST', '2': 275},
    {'1': 'ERR_WRONG_PASSWORD', '2': 276},
    {'1': 'ERR_NO_ACTIVE_PROFILE', '2': 277},
    {'1': 'ERR_CORRUPTED_DATA', '2': 278},
    {'1': 'ERR_TEMP_UNAVAILABLE', '2': 279},
    {'1': 'ERR_SEND', '2': 288},
    {'1': 'ERR_SPLIT_UNREADY', '2': 289},
    {'1': 'ERR_SPLIT', '2': 290},
    {'1': 'ERR_STRANGE_STREAM', '2': 304},
    {'1': 'ERR_CMD_STREAM', '2': 305},
    {'1': 'ERR_NOT_ACTIVE', '2': 306},
    {'1': 'ERR_NO_DATA', '2': 307},
    {'1': 'ERR_NO_CALLS', '2': 308},
    {'1': 'ERR_CLR_SKEY', '2': 320},
    {'1': 'ERR_SET_SKEY', '2': 321},
    {'1': 'ERR_GET_SKEY', '2': 322},
    {'1': 'ERR_CALL_REJECT', '2': 336},
    {'1': 'ERR_CALL_BUSY', '2': 337},
    {'1': 'ERR_CALL_WRONG_ANSWER', '2': 338},
    {'1': 'ERR_CALL_CLOSED', '2': 339},
    {'1': 'ERR_CALL_NOT_FOUND', '2': 340},
    {'1': 'ERR_CALL_USER_NOT_FOUND', '2': 341},
    {'1': 'ERR_CALL_DEVICE_NOT_FOUND', '2': 342},
    {'1': 'ERR_CALL_OFFLINE', '2': 343},
    {'1': 'ERR_CALL_FAIL', '2': 344},
    {'1': 'ERR_CALL_TAKEN', '2': 345},
    {'1': 'ERR_CHAT_NO_KEY', '2': 352},
    {'1': 'ERR_CHAT_CRC_ERROR', '2': 353},
    {'1': 'ERR_CHAT_NOT_FOUND', '2': 354},
    {'1': 'ERR_USER_NOT_FOUND', '2': 512},
    {'1': 'ERR_DEVICE_NOT_FOUND', '2': 513},
    {'1': 'ERR_CONNECT_SYNC', '2': 514},
    {'1': 'ERR_DEVICE_BLOCKED', '2': 515},
    {'1': 'ERR_KEY_NOT_FOUND', '2': 516},
    {'1': 'ERR_BAD_SERIA', '2': 517},
    {'1': 'ERR_PROT_VER', '2': 518},
    {'1': 'ERR_GET_MKEY', '2': 519},
    {'1': 'ERR_OBJ_PART_SAVE', '2': 520},
    {'1': 'ERR_SESSION', '2': 521},
    {'1': 'ERR_CHANNEL', '2': 522},
    {'1': 'ERR_USER_OFFLINE', '2': 528},
    {'1': 'ERR_DEVICE_OFFLINE', '2': 529},
    {'1': 'ERR_CRYPTO', '2': 1280},
    {'1': 'ERR_CRYPTO_FAIL', '2': 1281},
    {'1': 'ERR_CRYPTER_NEED_SEND', '2': 1282},
    {'1': 'ERR_NSD', '2': 1283},
    {'1': 'ERR_NEXT_KEY', '2': 1284},
    {'1': 'ERR_CRYPTO_ORK', '2': 1285},
    {'1': 'ERR_OPEN_CONTAINER', '2': 1286},
    {'1': 'ERR_CHANGE_SERIA', '2': 1287},
    {'1': 'ERR_UNKNOWN_DEVICE', '2': 1288},
    {'1': 'ERR_UNREGISTERED_DEVICE', '2': 1289},
    {'1': 'ERR_DEVICE_KEYS_EXPIRED', '2': 1290},
    {'1': 'ERR_MAC_ERROR', '2': 1291},
    {'1': 'ERR_CHAT_CRYPTO_FAIL', '2': 1292},
    {'1': 'ERR_UNSUPPORTED_PROTOCOL', '2': 1312},
    {'1': 'ERR_UNSUPPORTED_SUITE', '2': 1313},
    {'1': 'ERR_OKEY_NOT_FOUND', '2': 1360},
    {'1': 'ERR_WRONG_OKEY', '2': 1362},
    {'1': 'ERR_OKEY_EXIST', '2': 1363},
    {'1': 'ERR_OKEY_ADD', '2': 1364},
    {'1': 'ERR_OPEN_BASE', '2': 1537},
    {'1': 'ERR_CREATE_BASE', '2': 1538},
    {'1': 'ERR_SQL', '2': 1539},
    {'1': 'ERR_BASE_FAIL', '2': 1540},
    {'1': 'ERR_ADD_USER', '2': 8192},
    {'1': 'ERR_ADD_DEVICE', '2': 8193},
    {'1': 'ERR_ADD_CRYPTO', '2': 8194},
    {'1': 'ERR_EMAIL_EXIST', '2': 8195},
    {'1': 'ERR_PHONE_EXIST', '2': 8196},
    {'1': 'ERR_WRONG_FORMAT', '2': 8197},
    {'1': 'ERR_WRONG_CODE', '2': 8198},
    {'1': 'ERR_CODE_EXPIRE', '2': 8199},
    {'1': 'ERR_WRONG_CONFORMATION', '2': 8200},
    {'1': 'ERR_WRONG_USER_PASSWORD', '2': 8201},
    {'1': 'ERR_BAD_DEVICE_PIN', '2': 8202},
    {'1': 'ERR_PASS_MODE', '2': 8203},
    {'1': 'ERR_EMAIL_NOT_EXIST', '2': 8204},
    {'1': 'ERR_PHONE_NOT_EXIST', '2': 8205},
    {'1': 'ERR_REGPASS_NOT_EXIST', '2': 8206},
    {'1': 'ERR_PASSWORD_EXPIRED', '2': 8207},
    {'1': 'ERR_PASSWORD_TIME_EXPIRED', '2': 8208},
    {'1': 'ERR_TIME_EXPIRED', '2': 8209},
    {'1': 'ERR_TIME_NOT_EXPIRED', '2': 8210},
    {'1': 'ERR_REENTER', '2': 8211},
    {'1': 'ERR_UNKNOWN', '2': 2147483647},
  ],
};

/// Descriptor for `ERROR_CODE`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List eRROR_CODEDescriptor = $convert.base64Decode(
    'CgpFUlJPUl9DT0RFEgoKBkVSUl9PSxAAEgwKCEVSUl9GQUlMEAESDgoKRVJSX1BBUkFNUxACEh'
    'QKEEVSUl9VTlJFR0lTVEVSRUQQAxIPCgtFUlJfVElNRU9VVBAEEhQKEEVSUl9ESVNDT05ORUNU'
    'RUQQBhINCglFUlJfQUJPUlQQBxIQCgxFUlJfRElTQUJMRUQQCBINCglFUlJfUkVUUlkQCRIQCg'
    'xFUlJfTk9UX0lOSVQQChIOCgpFUlJfQ0FOQ0VMEAsSGwoXRVJSX1RFTVBPUkFMWV9VTkFWQUlC'
    'TEUQDBISCg1FUlJfTk9UX0ZPVU5EEIACEg4KCUVSUl9FWElTVBCBAhIQCgtFUlJfTk9fU0VORB'
    'CCAhIPCgpFUlJfUkVTWU5DEIQCEg0KCEVSUl9CVVNZEIMCEhQKD0VSUl9VTlNVUFBPUlRFRBCF'
    'AhIWChFFUlJfQUNDRVNTX0RFTklFRBCGAhIWChFFUlJfTk9UX0NPTk5FQ1RFRBCHAhIOCglFUl'
    'JfRU1QVFkQiAISEQoMRVJSX09WRVJGTE9XEIkCEhEKDEVSUl9PVkVSTE9BRBCKAhIYChNFUlJf'
    'VU5LTk9XTl9TRVJWSUNFEIsCEhwKF0VSUl9VTlNVUFBPUlRFRF9TRVJWSUNFEIwCEhwKF0VSUl'
    '9VTlNVUFBPUlRFRF9DT01NQU5EEI0CEhgKE0VSUl9OT1RfSU1QTEVNRU5URUQQjgISFQoQRVJS'
    'X0FMUkVBRFlfRE9ORRCQAhIWChFFUlJfTk9UX1JFR0lTVFJFRBCRAhISCg1FUlJfTk9UX1JFQU'
    'RZEJICEhIKDUVSUl9OT1RfRVhJU1QQkwISFwoSRVJSX1dST05HX1BBU1NXT1JEEJQCEhoKFUVS'
    'Ul9OT19BQ1RJVkVfUFJPRklMRRCVAhIXChJFUlJfQ09SUlVQVEVEX0RBVEEQlgISGQoURVJSX1'
    'RFTVBfVU5BVkFJTEFCTEUQlwISDQoIRVJSX1NFTkQQoAISFgoRRVJSX1NQTElUX1VOUkVBRFkQ'
    'oQISDgoJRVJSX1NQTElUEKICEhcKEkVSUl9TVFJBTkdFX1NUUkVBTRCwAhITCg5FUlJfQ01EX1'
    'NUUkVBTRCxAhITCg5FUlJfTk9UX0FDVElWRRCyAhIQCgtFUlJfTk9fREFUQRCzAhIRCgxFUlJf'
    'Tk9fQ0FMTFMQtAISEQoMRVJSX0NMUl9TS0VZEMACEhEKDEVSUl9TRVRfU0tFWRDBAhIRCgxFUl'
    'JfR0VUX1NLRVkQwgISFAoPRVJSX0NBTExfUkVKRUNUENACEhIKDUVSUl9DQUxMX0JVU1kQ0QIS'
    'GgoVRVJSX0NBTExfV1JPTkdfQU5TV0VSENICEhQKD0VSUl9DQUxMX0NMT1NFRBDTAhIXChJFUl'
    'JfQ0FMTF9OT1RfRk9VTkQQ1AISHAoXRVJSX0NBTExfVVNFUl9OT1RfRk9VTkQQ1QISHgoZRVJS'
    'X0NBTExfREVWSUNFX05PVF9GT1VORBDWAhIVChBFUlJfQ0FMTF9PRkZMSU5FENcCEhIKDUVSUl'
    '9DQUxMX0ZBSUwQ2AISEwoORVJSX0NBTExfVEFLRU4Q2QISFAoPRVJSX0NIQVRfTk9fS0VZEOAC'
    'EhcKEkVSUl9DSEFUX0NSQ19FUlJPUhDhAhIXChJFUlJfQ0hBVF9OT1RfRk9VTkQQ4gISFwoSRV'
    'JSX1VTRVJfTk9UX0ZPVU5EEIAEEhkKFEVSUl9ERVZJQ0VfTk9UX0ZPVU5EEIEEEhUKEEVSUl9D'
    'T05ORUNUX1NZTkMQggQSFwoSRVJSX0RFVklDRV9CTE9DS0VEEIMEEhYKEUVSUl9LRVlfTk9UX0'
    'ZPVU5EEIQEEhIKDUVSUl9CQURfU0VSSUEQhQQSEQoMRVJSX1BST1RfVkVSEIYEEhEKDEVSUl9H'
    'RVRfTUtFWRCHBBIWChFFUlJfT0JKX1BBUlRfU0FWRRCIBBIQCgtFUlJfU0VTU0lPThCJBBIQCg'
    'tFUlJfQ0hBTk5FTBCKBBIVChBFUlJfVVNFUl9PRkZMSU5FEJAEEhcKEkVSUl9ERVZJQ0VfT0ZG'
    'TElORRCRBBIPCgpFUlJfQ1JZUFRPEIAKEhQKD0VSUl9DUllQVE9fRkFJTBCBChIaChVFUlJfQ1'
    'JZUFRFUl9ORUVEX1NFTkQQggoSDAoHRVJSX05TRBCDChIRCgxFUlJfTkVYVF9LRVkQhAoSEwoO'
    'RVJSX0NSWVBUT19PUksQhQoSFwoSRVJSX09QRU5fQ09OVEFJTkVSEIYKEhUKEEVSUl9DSEFOR0'
    'VfU0VSSUEQhwoSFwoSRVJSX1VOS05PV05fREVWSUNFEIgKEhwKF0VSUl9VTlJFR0lTVEVSRURf'
    'REVWSUNFEIkKEhwKF0VSUl9ERVZJQ0VfS0VZU19FWFBJUkVEEIoKEhIKDUVSUl9NQUNfRVJST1'
    'IQiwoSGQoURVJSX0NIQVRfQ1JZUFRPX0ZBSUwQjAoSHQoYRVJSX1VOU1VQUE9SVEVEX1BST1RP'
    'Q09MEKAKEhoKFUVSUl9VTlNVUFBPUlRFRF9TVUlURRChChIXChJFUlJfT0tFWV9OT1RfRk9VTk'
    'QQ0AoSEwoORVJSX1dST05HX09LRVkQ0goSEwoORVJSX09LRVlfRVhJU1QQ0woSEQoMRVJSX09L'
    'RVlfQUREENQKEhIKDUVSUl9PUEVOX0JBU0UQgQwSFAoPRVJSX0NSRUFURV9CQVNFEIIMEgwKB0'
    'VSUl9TUUwQgwwSEgoNRVJSX0JBU0VfRkFJTBCEDBIRCgxFUlJfQUREX1VTRVIQgEASEwoORVJS'
    'X0FERF9ERVZJQ0UQgUASEwoORVJSX0FERF9DUllQVE8QgkASFAoPRVJSX0VNQUlMX0VYSVNUEI'
    'NAEhQKD0VSUl9QSE9ORV9FWElTVBCEQBIVChBFUlJfV1JPTkdfRk9STUFUEIVAEhMKDkVSUl9X'
    'Uk9OR19DT0RFEIZAEhQKD0VSUl9DT0RFX0VYUElSRRCHQBIbChZFUlJfV1JPTkdfQ09ORk9STU'
    'FUSU9OEIhAEhwKF0VSUl9XUk9OR19VU0VSX1BBU1NXT1JEEIlAEhcKEkVSUl9CQURfREVWSUNF'
    'X1BJThCKQBISCg1FUlJfUEFTU19NT0RFEItAEhgKE0VSUl9FTUFJTF9OT1RfRVhJU1QQjEASGA'
    'oTRVJSX1BIT05FX05PVF9FWElTVBCNQBIaChVFUlJfUkVHUEFTU19OT1RfRVhJU1QQjkASGQoU'
    'RVJSX1BBU1NXT1JEX0VYUElSRUQQj0ASHgoZRVJSX1BBU1NXT1JEX1RJTUVfRVhQSVJFRBCQQB'
    'IVChBFUlJfVElNRV9FWFBJUkVEEJFAEhkKFEVSUl9USU1FX05PVF9FWFBJUkVEEJJAEhAKC0VS'
    'Ul9SRUVOVEVSEJNAEhMKC0VSUl9VTktOT1dOEP////8H');

@$core.Deprecated('Use cALL_STATEDescriptor instead')
const CALL_STATE$json = {
  '1': 'CALL_STATE',
  '2': [
    {'1': 'CALL_IDLE', '2': 0},
    {'1': 'CALL_IN', '2': 1},
    {'1': 'CALL_OUT', '2': 2},
    {'1': 'CALL_OUT_WAIT', '2': 3},
    {'1': 'CALL_OUT_RING', '2': 4},
    {'1': 'CALL_CONNECTING', '2': 5},
    {'1': 'CALL_CONNECTING_ORK', '2': 7},
    {'1': 'CALL_CONNECTING_STRM', '2': 8},
    {'1': 'CALL_CONNECTED', '2': 9},
    {'1': 'CALL_CONNECT_ORK_STRM', '2': 10},
    {'1': 'CALL_GET_ADDRESS', '2': 14},
    {'1': 'CALL_SET_ADDRESS', '2': 15},
    {'1': 'CALL_CANCELING', '2': 16},
    {'1': 'CALL_CLOSED', '2': 128},
    {'1': 'CALL_DELETED', '2': 255},
  ],
};

/// Descriptor for `CALL_STATE`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List cALL_STATEDescriptor = $convert.base64Decode(
    'CgpDQUxMX1NUQVRFEg0KCUNBTExfSURMRRAAEgsKB0NBTExfSU4QARIMCghDQUxMX09VVBACEh'
    'EKDUNBTExfT1VUX1dBSVQQAxIRCg1DQUxMX09VVF9SSU5HEAQSEwoPQ0FMTF9DT05ORUNUSU5H'
    'EAUSFwoTQ0FMTF9DT05ORUNUSU5HX09SSxAHEhgKFENBTExfQ09OTkVDVElOR19TVFJNEAgSEg'
    'oOQ0FMTF9DT05ORUNURUQQCRIZChVDQUxMX0NPTk5FQ1RfT1JLX1NUUk0QChIUChBDQUxMX0dF'
    'VF9BRERSRVNTEA4SFAoQQ0FMTF9TRVRfQUREUkVTUxAPEhIKDkNBTExfQ0FOQ0VMSU5HEBASEA'
    'oLQ0FMTF9DTE9TRUQQgAESEQoMQ0FMTF9ERUxFVEVEEP8B');

@$core.Deprecated('Use dISCON_REASONDescriptor instead')
const DISCON_REASON$json = {
  '1': 'DISCON_REASON',
  '2': [
    {'1': 'CALL_ACTIVE', '2': 0},
    {'1': 'CALL_MISS', '2': 1},
    {'1': 'CALL_BREAK_OUT', '2': 2},
    {'1': 'CALL_BREAK_IN', '2': 3},
    {'1': 'CALL_CLOSE_OUT', '2': 4},
    {'1': 'CALL_CLOSE_IN', '2': 5},
    {'1': 'CALL_ABONENT_OFF', '2': 6},
    {'1': 'CALL_DEVICE_OFF', '2': 7},
    {'1': 'CALL_NO_IN_BASE', '2': 8},
    {'1': 'CALL_BUSY', '2': 9},
    {'1': 'CALL_NO_ANSWER', '2': 10},
    {'1': 'CALL_UNREGISTERED', '2': 11},
    {'1': 'CALL_ERROR', '2': 12},
    {'1': 'CALL_OFFLINE', '2': 13},
    {'1': 'CALL_BUSY_IN', '2': 14},
    {'1': 'CALL_STRAM_BREAK', '2': 15},
    {'1': 'CALL_CONF_REMOVE', '2': 16},
    {'1': 'CALL_CONF_CLOSED', '2': 17},
  ],
};

/// Descriptor for `DISCON_REASON`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List dISCON_REASONDescriptor = $convert.base64Decode(
    'Cg1ESVNDT05fUkVBU09OEg8KC0NBTExfQUNUSVZFEAASDQoJQ0FMTF9NSVNTEAESEgoOQ0FMTF'
    '9CUkVBS19PVVQQAhIRCg1DQUxMX0JSRUFLX0lOEAMSEgoOQ0FMTF9DTE9TRV9PVVQQBBIRCg1D'
    'QUxMX0NMT1NFX0lOEAUSFAoQQ0FMTF9BQk9ORU5UX09GRhAGEhMKD0NBTExfREVWSUNFX09GRh'
    'AHEhMKD0NBTExfTk9fSU5fQkFTRRAIEg0KCUNBTExfQlVTWRAJEhIKDkNBTExfTk9fQU5TV0VS'
    'EAoSFQoRQ0FMTF9VTlJFR0lTVEVSRUQQCxIOCgpDQUxMX0VSUk9SEAwSEAoMQ0FMTF9PRkZMSU'
    '5FEA0SEAoMQ0FMTF9CVVNZX0lOEA4SFAoQQ0FMTF9TVFJBTV9CUkVBSxAPEhQKEENBTExfQ09O'
    'Rl9SRU1PVkUQEBIUChBDQUxMX0NPTkZfQ0xPU0VEEBE=');

@$core.Deprecated('Use dEV_TYPEDescriptor instead')
const DEV_TYPE$json = {
  '1': 'DEV_TYPE',
  '2': [
    {'1': 'DEVICE_UNDEFINED', '2': 0},
    {'1': 'DEVICE_MOBILE', '2': 256},
    {'1': 'DEVICE_ANDROID', '2': 258},
    {'1': 'DEVICE_IOS', '2': 259},
    {'1': 'DEVICE_DESKTOP', '2': 512},
    {'1': 'DEVICE_DESKTOP_WIN', '2': 513},
    {'1': 'DEVICE_DESKTOP_LIN', '2': 514},
    {'1': 'DEVICE_DESKTOP_MAC', '2': 515},
    {'1': 'DEVICE_HW_PHONES', '2': 768},
    {'1': 'DEVICE_PHONE', '2': 769},
    {'1': 'DEVICE_DESKTOP_PHONE', '2': 770},
    {'1': 'DEVICE_BLE_PHONE', '2': 772},
    {'1': 'DEVICE_PC', '2': 1024},
    {'1': 'DEVICE_PC_SERVICE', '2': 268436480},
    {'1': 'DEVICE_SERVER', '2': 268436481},
    {'1': 'DEVICE_ECHO', '2': 268436482},
    {'1': 'DEVICE_CONFROOMS', '2': 268436483},
    {'1': 'DEVICE_ADMIN', '2': 268436485},
    {'1': 'DEVICE_CHAT', '2': 268436486},
    {'1': 'DEVICE_STORAGE', '2': 1342178311},
    {'1': 'DEVICE_REGISTER', '2': 268436488},
    {'1': 'DEVICE_GATE', '2': 268436736},
    {'1': 'DEVICE_GATE_UNSAFE', '2': 805307648},
    {'1': 'DEVICE_GATE_SHELTOR', '2': 268436737},
    {'1': 'DEVICE_GATE_SIP', '2': 805307650},
    {'1': 'DEVICE_GATE_MIR', '2': 268436739},
    {'1': 'DEVICE_UNKNOWN', '2': 2147483647},
  ],
};

/// Descriptor for `DEV_TYPE`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List dEV_TYPEDescriptor = $convert.base64Decode(
    'CghERVZfVFlQRRIUChBERVZJQ0VfVU5ERUZJTkVEEAASEgoNREVWSUNFX01PQklMRRCAAhITCg'
    '5ERVZJQ0VfQU5EUk9JRBCCAhIPCgpERVZJQ0VfSU9TEIMCEhMKDkRFVklDRV9ERVNLVE9QEIAE'
    'EhcKEkRFVklDRV9ERVNLVE9QX1dJThCBBBIXChJERVZJQ0VfREVTS1RPUF9MSU4QggQSFwoSRE'
    'VWSUNFX0RFU0tUT1BfTUFDEIMEEhUKEERFVklDRV9IV19QSE9ORVMQgAYSEQoMREVWSUNFX1BI'
    'T05FEIEGEhkKFERFVklDRV9ERVNLVE9QX1BIT05FEIIGEhUKEERFVklDRV9CTEVfUEhPTkUQhA'
    'YSDgoJREVWSUNFX1BDEIAIEhkKEURFVklDRV9QQ19TRVJWSUNFEICIgIABEhUKDURFVklDRV9T'
    'RVJWRVIQgYiAgAESEwoLREVWSUNFX0VDSE8QgoiAgAESGAoQREVWSUNFX0NPTkZST09NUxCDiI'
    'CAARIUCgxERVZJQ0VfQURNSU4QhYiAgAESEwoLREVWSUNFX0NIQVQQhoiAgAESFgoOREVWSUNF'
    'X1NUT1JBR0UQh4iAgAUSFwoPREVWSUNFX1JFR0lTVEVSEIiIgIABEhMKC0RFVklDRV9HQVRFEI'
    'CKgIABEhoKEkRFVklDRV9HQVRFX1VOU0FGRRCAioCAAxIbChNERVZJQ0VfR0FURV9TSEVMVE9S'
    'EIGKgIABEhcKD0RFVklDRV9HQVRFX1NJUBCCioCAAxIXCg9ERVZJQ0VfR0FURV9NSVIQg4qAgA'
    'ESFgoOREVWSUNFX1VOS05PV04Q/////wc=');

@$core.Deprecated('Use cALL_DIRECTDescriptor instead')
const CALL_DIRECT$json = {
  '1': 'CALL_DIRECT',
  '2': [
    {'1': 'Out', '2': 0},
    {'1': 'In', '2': 1},
  ],
};

/// Descriptor for `CALL_DIRECT`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List cALL_DIRECTDescriptor = $convert.base64Decode(
    'CgtDQUxMX0RJUkVDVBIHCgNPdXQQABIGCgJJbhAB');

@$core.Deprecated('Use gMEMBER_LTYPEDescriptor instead')
const GMEMBER_LTYPE$json = {
  '1': 'GMEMBER_LTYPE',
  '2': [
    {'1': 'GM_OWNER', '2': 0},
    {'1': 'GM_ADMIN', '2': 1},
    {'1': 'GM_WRITER', '2': 2},
    {'1': 'GM_READER', '2': 3},
    {'1': 'GM_ALLTYPE', '2': 255},
  ],
};

/// Descriptor for `GMEMBER_LTYPE`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List gMEMBER_LTYPEDescriptor = $convert.base64Decode(
    'Cg1HTUVNQkVSX0xUWVBFEgwKCEdNX09XTkVSEAASDAoIR01fQURNSU4QARINCglHTV9XUklURV'
    'IQAhINCglHTV9SRUFERVIQAxIPCgpHTV9BTExUWVBFEP8B');

@$core.Deprecated('Use cHAT_STATEDescriptor instead')
const CHAT_STATE$json = {
  '1': 'CHAT_STATE',
  '2': [
    {'1': 'CHAT_WAIT', '2': 0},
    {'1': 'CHAT_ACTIVE', '2': 1},
    {'1': 'CHAT_IGNOR', '2': 2},
    {'1': 'CHAT_DELETED', '2': 3},
  ],
};

/// Descriptor for `CHAT_STATE`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List cHAT_STATEDescriptor = $convert.base64Decode(
    'CgpDSEFUX1NUQVRFEg0KCUNIQVRfV0FJVBAAEg8KC0NIQVRfQUNUSVZFEAESDgoKQ0hBVF9JR0'
    '5PUhACEhAKDENIQVRfREVMRVRFRBAD');

@$core.Deprecated('Use memberLevelDescriptor instead')
const MemberLevel$json = {
  '1': 'MemberLevel',
  '2': [
    {'1': 'MEMBER_LEVEL_OWNER', '2': 0},
    {'1': 'MEMBER_LEVEL_ADMIN', '2': 1},
    {'1': 'MEMBER_LEVEL_WRITER', '2': 2},
    {'1': 'MEMBER_LEVEL_READER', '2': 3},
  ],
};

/// Descriptor for `MemberLevel`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List memberLevelDescriptor = $convert.base64Decode(
    'CgtNZW1iZXJMZXZlbBIWChJNRU1CRVJfTEVWRUxfT1dORVIQABIWChJNRU1CRVJfTEVWRUxfQU'
    'RNSU4QARIXChNNRU1CRVJfTEVWRUxfV1JJVEVSEAISFwoTTUVNQkVSX0xFVkVMX1JFQURFUhAD');

@$core.Deprecated('Use iconSizeTypeDescriptor instead')
const IconSizeType$json = {
  '1': 'IconSizeType',
  '2': [
    {'1': 'Small', '2': 0},
    {'1': 'Large', '2': 1},
  ],
};

/// Descriptor for `IconSizeType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List iconSizeTypeDescriptor = $convert.base64Decode(
    'CgxJY29uU2l6ZVR5cGUSCQoFU21hbGwQABIJCgVMYXJnZRAB');

@$core.Deprecated('Use defineDescriptor instead')
const Define$json = {
  '1': 'Define',
  '2': [
    {'1': 'DEFINE_CALL_FLAG_VIDEO', '2': 2},
    {'1': 'DEFINE_CALL_FLAG_MODE', '2': 32768},
    {'1': 'DEFINE_CALL_FLAG_MIR', '2': 16384},
    {'1': 'DEFINE_CALL_FLAG_DEV', '2': 8192},
  ],
};

/// Descriptor for `Define`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List defineDescriptor = $convert.base64Decode(
    'CgZEZWZpbmUSGgoWREVGSU5FX0NBTExfRkxBR19WSURFTxACEhsKFURFRklORV9DQUxMX0ZMQU'
    'dfTU9ERRCAgAISGgoUREVGSU5FX0NBTExfRkxBR19NSVIQgIABEhkKFERFRklORV9DQUxMX0ZM'
    'QUdfREVWEIBA');

@$core.Deprecated('Use eventCallDescriptor instead')
const EventCall$json = {
  '1': 'EventCall',
  '2': [
    {'1': 'LocalCallId', '3': 1, '4': 2, '5': 4, '10': 'LocalCallId'},
    {'1': 'State', '3': 2, '4': 2, '5': 14, '6': '.netLib.CALL_STATE', '10': 'State'},
    {'1': 'OldState', '3': 3, '4': 2, '5': 14, '6': '.netLib.CALL_STATE', '10': 'OldState'},
    {'1': 'AbonentId', '3': 4, '4': 2, '5': 4, '10': 'AbonentId'},
    {'1': 'DeviceId', '3': 5, '4': 2, '5': 4, '10': 'DeviceId'},
    {'1': 'DeviceType', '3': 6, '4': 2, '5': 13, '10': 'DeviceType'},
    {'1': 'Codec', '3': 7, '4': 2, '5': 13, '10': 'Codec'},
    {'1': 'Reason', '3': 8, '4': 2, '5': 14, '6': '.netLib.DISCON_REASON', '10': 'Reason'},
    {'1': 'Hold', '3': 9, '4': 2, '5': 8, '10': 'Hold'},
    {'1': 'BeforeCallId', '3': 10, '4': 2, '5': 4, '10': 'BeforeCallId'},
    {'1': 'activeCall', '3': 11, '4': 2, '5': 11, '6': '.netLib.ActiveCallStatus', '10': 'activeCall'},
  ],
};

/// Descriptor for `EventCall`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List eventCallDescriptor = $convert.base64Decode(
    'CglFdmVudENhbGwSIAoLTG9jYWxDYWxsSWQYASACKARSC0xvY2FsQ2FsbElkEigKBVN0YXRlGA'
    'IgAigOMhIubmV0TGliLkNBTExfU1RBVEVSBVN0YXRlEi4KCE9sZFN0YXRlGAMgAigOMhIubmV0'
    'TGliLkNBTExfU1RBVEVSCE9sZFN0YXRlEhwKCUFib25lbnRJZBgEIAIoBFIJQWJvbmVudElkEh'
    'oKCERldmljZUlkGAUgAigEUghEZXZpY2VJZBIeCgpEZXZpY2VUeXBlGAYgAigNUgpEZXZpY2VU'
    'eXBlEhQKBUNvZGVjGAcgAigNUgVDb2RlYxItCgZSZWFzb24YCCACKA4yFS5uZXRMaWIuRElTQ0'
    '9OX1JFQVNPTlIGUmVhc29uEhIKBEhvbGQYCSACKAhSBEhvbGQSIgoMQmVmb3JlQ2FsbElkGAog'
    'AigEUgxCZWZvcmVDYWxsSWQSOAoKYWN0aXZlQ2FsbBgLIAIoCzIYLm5ldExpYi5BY3RpdmVDYW'
    'xsU3RhdHVzUgphY3RpdmVDYWxs');

@$core.Deprecated('Use cALL_LIST_RECDescriptor instead')
const CALL_LIST_REC$json = {
  '1': 'CALL_LIST_REC',
  '2': [
    {'1': 'id', '3': 1, '4': 2, '5': 4, '10': 'id'},
    {'1': 'abonentId', '3': 2, '4': 2, '5': 4, '10': 'abonentId'},
    {'1': 'deviceId', '3': 3, '4': 2, '5': 4, '10': 'deviceId'},
    {'1': 'deviceType', '3': 4, '4': 2, '5': 14, '6': '.netLib.DEV_TYPE', '10': 'deviceType'},
    {'1': 'ownDeviceId', '3': 5, '4': 2, '5': 4, '10': 'ownDeviceId'},
    {'1': 'ownDeviceType', '3': 6, '4': 2, '5': 14, '6': '.netLib.DEV_TYPE', '10': 'ownDeviceType'},
    {'1': 'out', '3': 7, '4': 2, '5': 8, '10': 'out'},
    {'1': 'connected', '3': 8, '4': 2, '5': 8, '10': 'connected'},
    {'1': 'deviceDirect', '3': 9, '4': 2, '5': 8, '10': 'deviceDirect'},
    {'1': 'video', '3': 10, '4': 2, '5': 8, '10': 'video'},
    {'1': 'dReason', '3': 11, '4': 2, '5': 14, '6': '.netLib.DISCON_REASON', '10': 'dReason'},
    {'1': 'cTime', '3': 12, '4': 2, '5': 4, '10': 'cTime'},
    {'1': 'lastedTime', '3': 13, '4': 2, '5': 13, '10': 'lastedTime'},
    {'1': 'number', '3': 14, '4': 2, '5': 9, '10': 'number'},
  ],
};

/// Descriptor for `CALL_LIST_REC`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cALL_LIST_RECDescriptor = $convert.base64Decode(
    'Cg1DQUxMX0xJU1RfUkVDEg4KAmlkGAEgAigEUgJpZBIcCglhYm9uZW50SWQYAiACKARSCWFib2'
    '5lbnRJZBIaCghkZXZpY2VJZBgDIAIoBFIIZGV2aWNlSWQSMAoKZGV2aWNlVHlwZRgEIAIoDjIQ'
    'Lm5ldExpYi5ERVZfVFlQRVIKZGV2aWNlVHlwZRIgCgtvd25EZXZpY2VJZBgFIAIoBFILb3duRG'
    'V2aWNlSWQSNgoNb3duRGV2aWNlVHlwZRgGIAIoDjIQLm5ldExpYi5ERVZfVFlQRVINb3duRGV2'
    'aWNlVHlwZRIQCgNvdXQYByACKAhSA291dBIcCgljb25uZWN0ZWQYCCACKAhSCWNvbm5lY3RlZB'
    'IiCgxkZXZpY2VEaXJlY3QYCSACKAhSDGRldmljZURpcmVjdBIUCgV2aWRlbxgKIAIoCFIFdmlk'
    'ZW8SLwoHZFJlYXNvbhgLIAIoDjIVLm5ldExpYi5ESVNDT05fUkVBU09OUgdkUmVhc29uEhQKBW'
    'NUaW1lGAwgAigEUgVjVGltZRIeCgpsYXN0ZWRUaW1lGA0gAigNUgpsYXN0ZWRUaW1lEhYKBm51'
    'bWJlchgOIAIoCVIGbnVtYmVy');

@$core.Deprecated('Use cALL_INFODescriptor instead')
const CALL_INFO$json = {
  '1': 'CALL_INFO',
  '2': [
    {'1': 'CallId', '3': 1, '4': 2, '5': 4, '10': 'CallId'},
    {'1': 'CallIdServer', '3': 2, '4': 2, '5': 4, '10': 'CallIdServer'},
    {'1': 'User_Id', '3': 3, '4': 2, '5': 4, '10': 'UserId'},
    {'1': 'Device_Id', '3': 4, '4': 2, '5': 4, '10': 'DeviceId'},
    {'1': 'Device_Type', '3': 35, '4': 2, '5': 14, '6': '.netLib.DEV_TYPE', '10': 'DeviceType'},
    {'1': 'State', '3': 5, '4': 2, '5': 14, '6': '.netLib.CALL_STATE', '10': 'State'},
    {'1': 'Old_State', '3': 6, '4': 2, '5': 14, '6': '.netLib.CALL_STATE', '10': 'OldState'},
    {'1': 'Direction', '3': 7, '4': 2, '5': 14, '6': '.netLib.CALL_DIRECT', '10': 'Direction'},
    {'1': 'State_Time', '3': 8, '4': 2, '5': 4, '10': 'StateTime'},
    {'1': 'Start_Time', '3': 9, '4': 2, '5': 4, '10': 'StartTime'},
    {'1': 'Ring_Time', '3': 10, '4': 2, '5': 4, '10': 'RingTime'},
    {'1': 'Audio_Codec', '3': 11, '4': 2, '5': 13, '10': 'AudioCodec'},
    {'1': 'On_Hold', '3': 13, '4': 2, '5': 8, '10': 'OnHold'},
    {'1': 'Hold_Local', '3': 14, '4': 2, '5': 8, '10': 'HoldLocal'},
    {'1': 'Hold_Video_Local', '3': 15, '4': 2, '5': 8, '10': 'HoldVideoLocal'},
    {'1': 'Stream_Id', '3': 16, '4': 2, '5': 4, '10': 'StreamId'},
    {'1': 'Channel_Id', '3': 17, '4': 2, '5': 4, '10': 'ChannelId'},
    {'1': 'Number', '3': 18, '4': 2, '5': 9, '10': 'Number'},
    {'1': 'DReason', '3': 19, '4': 2, '5': 14, '6': '.netLib.DISCON_REASON', '10': 'DReason'},
    {'1': 'VideoMode', '3': 20, '4': 2, '5': 8, '10': 'VideoMode'},
    {'1': 'DirectMode', '3': 21, '4': 2, '5': 8, '10': 'DirectMode'},
    {'1': 'Error', '3': 22, '4': 2, '5': 13, '10': 'Error'},
    {'1': 'Conference_Id', '3': 23, '4': 2, '5': 4, '10': 'ConferenceId'},
    {'1': 'In_Count', '3': 24, '4': 2, '5': 13, '10': 'InCount'},
    {'1': 'Lost_In_Count', '3': 25, '4': 2, '5': 13, '10': 'LostInCount'},
    {'1': 'Recover_In_Count', '3': 26, '4': 2, '5': 13, '10': 'RecoverInCount'},
    {'1': 'Lost_Peer_Count', '3': 27, '4': 2, '5': 13, '10': 'LostPeerCount'},
    {'1': 'order_error', '3': 28, '4': 2, '5': 13, '10': 'orderError'},
    {'1': 'recv_sframe_cnt', '3': 29, '4': 2, '5': 13, '10': 'recvSframeCnt'},
    {'1': 'recv_vframe_cnt', '3': 30, '4': 2, '5': 13, '10': 'recvVframeCnt'},
    {'1': 'doub_send', '3': 31, '4': 2, '5': 13, '10': 'doubSend'},
    {'1': 'flush_cnt', '3': 32, '4': 2, '5': 13, '10': 'flushCnt'},
    {'1': 'recv_fifo_full', '3': 33, '4': 2, '5': 13, '10': 'recvFifoFull'},
    {'1': 'recv_max_size', '3': 34, '4': 2, '5': 13, '10': 'recvMaxSize'},
  ],
};

/// Descriptor for `CALL_INFO`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cALL_INFODescriptor = $convert.base64Decode(
    'CglDQUxMX0lORk8SFgoGQ2FsbElkGAEgAigEUgZDYWxsSWQSIgoMQ2FsbElkU2VydmVyGAIgAi'
    'gEUgxDYWxsSWRTZXJ2ZXISFwoHVXNlcl9JZBgDIAIoBFIGVXNlcklkEhsKCURldmljZV9JZBgE'
    'IAIoBFIIRGV2aWNlSWQSMQoLRGV2aWNlX1R5cGUYIyACKA4yEC5uZXRMaWIuREVWX1RZUEVSCk'
    'RldmljZVR5cGUSKAoFU3RhdGUYBSACKA4yEi5uZXRMaWIuQ0FMTF9TVEFURVIFU3RhdGUSLwoJ'
    'T2xkX1N0YXRlGAYgAigOMhIubmV0TGliLkNBTExfU1RBVEVSCE9sZFN0YXRlEjEKCURpcmVjdG'
    'lvbhgHIAIoDjITLm5ldExpYi5DQUxMX0RJUkVDVFIJRGlyZWN0aW9uEh0KClN0YXRlX1RpbWUY'
    'CCACKARSCVN0YXRlVGltZRIdCgpTdGFydF9UaW1lGAkgAigEUglTdGFydFRpbWUSGwoJUmluZ1'
    '9UaW1lGAogAigEUghSaW5nVGltZRIfCgtBdWRpb19Db2RlYxgLIAIoDVIKQXVkaW9Db2RlYxIX'
    'CgdPbl9Ib2xkGA0gAigIUgZPbkhvbGQSHQoKSG9sZF9Mb2NhbBgOIAIoCFIJSG9sZExvY2FsEi'
    'gKEEhvbGRfVmlkZW9fTG9jYWwYDyACKAhSDkhvbGRWaWRlb0xvY2FsEhsKCVN0cmVhbV9JZBgQ'
    'IAIoBFIIU3RyZWFtSWQSHQoKQ2hhbm5lbF9JZBgRIAIoBFIJQ2hhbm5lbElkEhYKBk51bWJlch'
    'gSIAIoCVIGTnVtYmVyEi8KB0RSZWFzb24YEyACKA4yFS5uZXRMaWIuRElTQ09OX1JFQVNPTlIH'
    'RFJlYXNvbhIcCglWaWRlb01vZGUYFCACKAhSCVZpZGVvTW9kZRIeCgpEaXJlY3RNb2RlGBUgAi'
    'gIUgpEaXJlY3RNb2RlEhQKBUVycm9yGBYgAigNUgVFcnJvchIjCg1Db25mZXJlbmNlX0lkGBcg'
    'AigEUgxDb25mZXJlbmNlSWQSGQoISW5fQ291bnQYGCACKA1SB0luQ291bnQSIgoNTG9zdF9Jbl'
    '9Db3VudBgZIAIoDVILTG9zdEluQ291bnQSKAoQUmVjb3Zlcl9Jbl9Db3VudBgaIAIoDVIOUmVj'
    'b3ZlckluQ291bnQSJgoPTG9zdF9QZWVyX0NvdW50GBsgAigNUg1Mb3N0UGVlckNvdW50Eh8KC2'
    '9yZGVyX2Vycm9yGBwgAigNUgpvcmRlckVycm9yEiYKD3JlY3Zfc2ZyYW1lX2NudBgdIAIoDVIN'
    'cmVjdlNmcmFtZUNudBImCg9yZWN2X3ZmcmFtZV9jbnQYHiACKA1SDXJlY3ZWZnJhbWVDbnQSGw'
    'oJZG91Yl9zZW5kGB8gAigNUghkb3ViU2VuZBIbCglmbHVzaF9jbnQYICACKA1SCGZsdXNoQ250'
    'EiQKDnJlY3ZfZmlmb19mdWxsGCEgAigNUgxyZWN2Rmlmb0Z1bGwSIgoNcmVjdl9tYXhfc2l6ZR'
    'giIAIoDVILcmVjdk1heFNpemU=');

@$core.Deprecated('Use activeCallStatusDescriptor instead')
const ActiveCallStatus$json = {
  '1': 'ActiveCallStatus',
  '2': [
    {'1': 'active', '3': 1, '4': 1, '5': 11, '6': '.netLib.CALL_INFO', '10': 'active'},
    {'1': 'calls', '3': 2, '4': 3, '5': 11, '6': '.netLib.CALL_INFO', '10': 'calls'},
  ],
};

/// Descriptor for `ActiveCallStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List activeCallStatusDescriptor = $convert.base64Decode(
    'ChBBY3RpdmVDYWxsU3RhdHVzEikKBmFjdGl2ZRgBIAEoCzIRLm5ldExpYi5DQUxMX0lORk9SBm'
    'FjdGl2ZRInCgVjYWxscxgCIAMoCzIRLm5ldExpYi5DQUxMX0lORk9SBWNhbGxz');

@$core.Deprecated('Use eventChatTimeDescriptor instead')
const EventChatTime$json = {
  '1': 'EventChatTime',
  '2': [
    {'1': 'Id', '3': 1, '4': 2, '5': 4, '10': 'Id'},
    {'1': 'Time', '3': 2, '4': 2, '5': 4, '10': 'Time'},
  ],
};

/// Descriptor for `EventChatTime`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List eventChatTimeDescriptor = $convert.base64Decode(
    'Cg1FdmVudENoYXRUaW1lEg4KAklkGAEgAigEUgJJZBISCgRUaW1lGAIgAigEUgRUaW1l');

@$core.Deprecated('Use cHAT_LIST_RECDescriptor instead')
const CHAT_LIST_REC$json = {
  '1': 'CHAT_LIST_REC',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 4, '10': 'id'},
    {'1': 'DestId', '3': 2, '4': 1, '5': 4, '10': 'DestId'},
    {'1': 'DestType', '3': 3, '4': 1, '5': 14, '6': '.netLib.DEST_TYPE', '10': 'DestType'},
    {'1': 'Idi', '3': 4, '4': 1, '5': 4, '10': 'Idi'},
    {'1': 'GType', '3': 5, '4': 1, '5': 13, '10': 'GType'},
    {'1': 'State', '3': 6, '4': 1, '5': 14, '6': '.netLib.CHAT_STATE', '10': 'State'},
    {'1': 'Level', '3': 7, '4': 1, '5': 14, '6': '.netLib.GMEMBER_LTYPE', '10': 'Level'},
    {'1': 'Name', '3': 8, '4': 1, '5': 9, '10': 'Name'},
    {'1': 'KeyId', '3': 9, '4': 1, '5': 4, '10': 'KeyId'},
    {'1': 'Online', '3': 10, '4': 1, '5': 8, '10': 'Online'},
    {'1': 'RTime', '3': 11, '4': 1, '5': 4, '10': 'RTime'},
    {'1': 'LTime', '3': 12, '4': 1, '5': 4, '10': 'LTime'},
    {'1': 'CTime', '3': 13, '4': 1, '5': 4, '10': 'CTime'},
    {'1': 'Muted', '3': 14, '4': 1, '5': 8, '10': 'Muted'},
    {'1': 'Muted_time', '3': 15, '4': 1, '5': 4, '10': 'MutedTime'},
    {'1': 'Draft', '3': 16, '4': 1, '5': 9, '10': 'Draft'},
  ],
};

/// Descriptor for `CHAT_LIST_REC`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cHAT_LIST_RECDescriptor = $convert.base64Decode(
    'Cg1DSEFUX0xJU1RfUkVDEg4KAmlkGAEgASgEUgJpZBIWCgZEZXN0SWQYAiABKARSBkRlc3RJZB'
    'ItCghEZXN0VHlwZRgDIAEoDjIRLm5ldExpYi5ERVNUX1RZUEVSCERlc3RUeXBlEhAKA0lkaRgE'
    'IAEoBFIDSWRpEhQKBUdUeXBlGAUgASgNUgVHVHlwZRIoCgVTdGF0ZRgGIAEoDjISLm5ldExpYi'
    '5DSEFUX1NUQVRFUgVTdGF0ZRIrCgVMZXZlbBgHIAEoDjIVLm5ldExpYi5HTUVNQkVSX0xUWVBF'
    'UgVMZXZlbBISCgROYW1lGAggASgJUgROYW1lEhQKBUtleUlkGAkgASgEUgVLZXlJZBIWCgZPbm'
    'xpbmUYCiABKAhSBk9ubGluZRIUCgVSVGltZRgLIAEoBFIFUlRpbWUSFAoFTFRpbWUYDCABKARS'
    'BUxUaW1lEhQKBUNUaW1lGA0gASgEUgVDVGltZRIUCgVNdXRlZBgOIAEoCFIFTXV0ZWQSHQoKTX'
    'V0ZWRfdGltZRgPIAEoBFIJTXV0ZWRUaW1lEhQKBURyYWZ0GBAgASgJUgVEcmFmdA==');

@$core.Deprecated('Use cHAT_UNREADDescriptor instead')
const CHAT_UNREAD$json = {
  '1': 'CHAT_UNREAD',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 4, '10': 'id'},
    {'1': 'rtime', '3': 2, '4': 1, '5': 4, '10': 'rtime'},
    {'1': 'count', '3': 3, '4': 1, '5': 13, '10': 'count'},
  ],
};

/// Descriptor for `CHAT_UNREAD`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cHAT_UNREADDescriptor = $convert.base64Decode(
    'CgtDSEFUX1VOUkVBRBIOCgJpZBgBIAEoBFICaWQSFAoFcnRpbWUYAiABKARSBXJ0aW1lEhQKBW'
    'NvdW50GAMgASgNUgVjb3VudA==');

@$core.Deprecated('Use cONTACT_LIST_RECDescriptor instead')
const CONTACT_LIST_REC$json = {
  '1': 'CONTACT_LIST_REC',
  '2': [
    {'1': 'Id', '3': 1, '4': 2, '5': 4, '10': 'Id'},
    {'1': 'DestId', '3': 2, '4': 2, '5': 4, '10': 'DestId'},
    {'1': 'DestType', '3': 3, '4': 2, '5': 14, '6': '.netLib.DEST_TYPE', '10': 'DestType'},
    {'1': 'Idi', '3': 4, '4': 2, '5': 4, '10': 'Idi'},
    {'1': 'Name', '3': 5, '4': 2, '5': 9, '10': 'Name'},
    {'1': 'Number', '3': 6, '4': 2, '5': 9, '10': 'Number'},
    {'1': 'Online', '3': 7, '4': 2, '5': 8, '10': 'Online'},
    {'1': 'CTime', '3': 8, '4': 2, '5': 4, '10': 'CTime'},
    {'1': 'MTime', '3': 9, '4': 2, '5': 4, '10': 'MTime'},
  ],
};

/// Descriptor for `CONTACT_LIST_REC`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cONTACT_LIST_RECDescriptor = $convert.base64Decode(
    'ChBDT05UQUNUX0xJU1RfUkVDEg4KAklkGAEgAigEUgJJZBIWCgZEZXN0SWQYAiACKARSBkRlc3'
    'RJZBItCghEZXN0VHlwZRgDIAIoDjIRLm5ldExpYi5ERVNUX1RZUEVSCERlc3RUeXBlEhAKA0lk'
    'aRgEIAIoBFIDSWRpEhIKBE5hbWUYBSACKAlSBE5hbWUSFgoGTnVtYmVyGAYgAigJUgZOdW1iZX'
    'ISFgoGT25saW5lGAcgAigIUgZPbmxpbmUSFAoFQ1RpbWUYCCACKARSBUNUaW1lEhQKBU1UaW1l'
    'GAkgAigEUgVNVGltZQ==');

@$core.Deprecated('Use eventListRecDescriptor instead')
const EventListRec$json = {
  '1': 'EventListRec',
  '2': [
    {'1': 'Id', '3': 1, '4': 2, '5': 4, '10': 'Id'},
    {'1': 'DestId', '3': 2, '4': 2, '5': 4, '10': 'DestId'},
    {'1': 'DestType', '3': 3, '4': 2, '5': 14, '6': '.netLib.DEST_TYPE', '10': 'DestType'},
  ],
};

/// Descriptor for `EventListRec`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List eventListRecDescriptor = $convert.base64Decode(
    'CgxFdmVudExpc3RSZWMSDgoCSWQYASACKARSAklkEhYKBkRlc3RJZBgCIAIoBFIGRGVzdElkEi'
    '0KCERlc3RUeXBlGAMgAigOMhEubmV0TGliLkRFU1RfVFlQRVIIRGVzdFR5cGU=');

@$core.Deprecated('Use aBONENT_INFODescriptor instead')
const ABONENT_INFO$json = {
  '1': 'ABONENT_INFO',
  '2': [
    {'1': 'Id', '3': 1, '4': 2, '5': 4, '10': 'Id'},
    {'1': 'Idi', '3': 2, '4': 2, '5': 4, '10': 'Idi'},
    {'1': 'CTime', '3': 3, '4': 2, '5': 4, '10': 'CTime'},
    {'1': 'MTime', '3': 4, '4': 2, '5': 4, '10': 'MTime'},
    {'1': 'Hide', '3': 5, '4': 2, '5': 8, '10': 'Hide'},
    {'1': 'PassMode', '3': 6, '4': 2, '5': 13, '10': 'PassMode'},
    {'1': 'PassLoginSet', '3': 7, '4': 2, '5': 8, '10': 'PassLoginSet'},
    {'1': 'PassMsgNotTrivial', '3': 8, '4': 2, '5': 8, '10': 'PassMsgNotTrivial'},
    {'1': 'MKey', '3': 9, '4': 2, '5': 4, '10': 'MKey'},
    {'1': 'Name', '3': 10, '4': 2, '5': 9, '10': 'Name'},
    {'1': 'SecondName', '3': 11, '4': 2, '5': 9, '10': 'SecondName'},
    {'1': 'Email', '3': 12, '4': 2, '5': 9, '10': 'Email'},
    {'1': 'EmailConfirmed', '3': 13, '4': 2, '5': 8, '10': 'EmailConfirmed'},
    {'1': 'Phone', '3': 14, '4': 2, '5': 9, '10': 'Phone'},
    {'1': 'PhoneConfirmed', '3': 15, '4': 2, '5': 8, '10': 'PhoneConfirmed'},
    {'1': 'Address', '3': 16, '4': 2, '5': 9, '10': 'Address'},
    {'1': 'About', '3': 17, '4': 2, '5': 9, '10': 'About'},
    {'1': 'Email2', '3': 18, '4': 2, '5': 9, '10': 'Email2'},
    {'1': 'Email2Confirmed', '3': 19, '4': 2, '5': 8, '10': 'Email2Confirmed'},
    {'1': 'Phone2', '3': 20, '4': 2, '5': 9, '10': 'Phone2'},
    {'1': 'Phone2Confirmed', '3': 21, '4': 2, '5': 8, '10': 'Phone2Confirmed'},
    {'1': 'Online', '3': 22, '4': 2, '5': 8, '10': 'Online'},
  ],
};

/// Descriptor for `ABONENT_INFO`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List aBONENT_INFODescriptor = $convert.base64Decode(
    'CgxBQk9ORU5UX0lORk8SDgoCSWQYASACKARSAklkEhAKA0lkaRgCIAIoBFIDSWRpEhQKBUNUaW'
    '1lGAMgAigEUgVDVGltZRIUCgVNVGltZRgEIAIoBFIFTVRpbWUSEgoESGlkZRgFIAIoCFIESGlk'
    'ZRIaCghQYXNzTW9kZRgGIAIoDVIIUGFzc01vZGUSIgoMUGFzc0xvZ2luU2V0GAcgAigIUgxQYX'
    'NzTG9naW5TZXQSLAoRUGFzc01zZ05vdFRyaXZpYWwYCCACKAhSEVBhc3NNc2dOb3RUcml2aWFs'
    'EhIKBE1LZXkYCSACKARSBE1LZXkSEgoETmFtZRgKIAIoCVIETmFtZRIeCgpTZWNvbmROYW1lGA'
    'sgAigJUgpTZWNvbmROYW1lEhQKBUVtYWlsGAwgAigJUgVFbWFpbBImCg5FbWFpbENvbmZpcm1l'
    'ZBgNIAIoCFIORW1haWxDb25maXJtZWQSFAoFUGhvbmUYDiACKAlSBVBob25lEiYKDlBob25lQ2'
    '9uZmlybWVkGA8gAigIUg5QaG9uZUNvbmZpcm1lZBIYCgdBZGRyZXNzGBAgAigJUgdBZGRyZXNz'
    'EhQKBUFib3V0GBEgAigJUgVBYm91dBIWCgZFbWFpbDIYEiACKAlSBkVtYWlsMhIoCg9FbWFpbD'
    'JDb25maXJtZWQYEyACKAhSD0VtYWlsMkNvbmZpcm1lZBIWCgZQaG9uZTIYFCACKAlSBlBob25l'
    'MhIoCg9QaG9uZTJDb25maXJtZWQYFSACKAhSD1Bob25lMkNvbmZpcm1lZBIWCgZPbmxpbmUYFi'
    'ACKAhSBk9ubGluZQ==');

@$core.Deprecated('Use iconResultDescriptor instead')
const IconResult$json = {
  '1': 'IconResult',
  '2': [
    {'1': 'bitmap', '3': 1, '4': 3, '5': 13, '10': 'bitmap'},
    {'1': 'id', '3': 2, '4': 2, '5': 4, '10': 'id'},
    {'1': 'type', '3': 3, '4': 2, '5': 14, '6': '.netLib.DEST_TYPE', '10': 'type'},
    {'1': 'size', '3': 4, '4': 2, '5': 14, '6': '.netLib.IconSizeType', '10': 'size'},
    {'1': 'code', '3': 5, '4': 2, '5': 14, '6': '.netLib.ERROR_CODE', '10': 'code'},
  ],
};

/// Descriptor for `IconResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List iconResultDescriptor = $convert.base64Decode(
    'CgpJY29uUmVzdWx0EhYKBmJpdG1hcBgBIAMoDVIGYml0bWFwEg4KAmlkGAIgAigEUgJpZBIlCg'
    'R0eXBlGAMgAigOMhEubmV0TGliLkRFU1RfVFlQRVIEdHlwZRIoCgRzaXplGAQgAigOMhQubmV0'
    'TGliLkljb25TaXplVHlwZVIEc2l6ZRImCgRjb2RlGAUgAigOMhIubmV0TGliLkVSUk9SX0NPRE'
    'VSBGNvZGU=');

@$core.Deprecated('Use iconRequstDescriptor instead')
const IconRequst$json = {
  '1': 'IconRequst',
  '2': [
    {'1': 'id', '3': 2, '4': 2, '5': 4, '10': 'id'},
    {'1': 'type', '3': 3, '4': 2, '5': 14, '6': '.netLib.DEST_TYPE', '10': 'type'},
    {'1': 'size', '3': 4, '4': 2, '5': 14, '6': '.netLib.IconSizeType', '10': 'size'},
  ],
};

/// Descriptor for `IconRequst`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List iconRequstDescriptor = $convert.base64Decode(
    'CgpJY29uUmVxdXN0Eg4KAmlkGAIgAigEUgJpZBIlCgR0eXBlGAMgAigOMhEubmV0TGliLkRFU1'
    'RfVFlQRVIEdHlwZRIoCgRzaXplGAQgAigOMhQubmV0TGliLkljb25TaXplVHlwZVIEc2l6ZQ==');

@$core.Deprecated('Use mEMBER_LIST_RECDescriptor instead')
const MEMBER_LIST_REC$json = {
  '1': 'MEMBER_LIST_REC',
  '2': [
    {'1': 'AbonentId', '3': 1, '4': 2, '5': 4, '10': 'AbonentId'},
    {'1': 'GMLevel', '3': 2, '4': 2, '5': 14, '6': '.netLib.GMEMBER_LTYPE', '10': 'GMLevel'},
    {'1': 'State', '3': 3, '4': 2, '5': 5, '10': 'State'},
    {'1': 'RTime', '3': 4, '4': 2, '5': 4, '10': 'RTime'},
  ],
};

/// Descriptor for `MEMBER_LIST_REC`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mEMBER_LIST_RECDescriptor = $convert.base64Decode(
    'Cg9NRU1CRVJfTElTVF9SRUMSHAoJQWJvbmVudElkGAEgAigEUglBYm9uZW50SWQSLwoHR01MZX'
    'ZlbBgCIAIoDjIVLm5ldExpYi5HTUVNQkVSX0xUWVBFUgdHTUxldmVsEhQKBVN0YXRlGAMgAigF'
    'UgVTdGF0ZRIUCgVSVGltZRgEIAIoBFIFUlRpbWU=');


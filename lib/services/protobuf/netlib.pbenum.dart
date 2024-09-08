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

import 'package:protobuf/protobuf.dart' as $pb;

class ClientState extends $pb.ProtobufEnum {
  static const ClientState CLIENT_OFF = ClientState._(1, _omitEnumNames ? '' : 'CLIENT_OFF');
  static const ClientState CLIENT_FAILED = ClientState._(2, _omitEnumNames ? '' : 'CLIENT_FAILED');
  static const ClientState CLIENT_DISCONNECTED = ClientState._(3, _omitEnumNames ? '' : 'CLIENT_DISCONNECTED');
  static const ClientState CLIENT_DISCONNECTING = ClientState._(4, _omitEnumNames ? '' : 'CLIENT_DISCONNECTING');
  static const ClientState CLIENT_RECONNECTING = ClientState._(5, _omitEnumNames ? '' : 'CLIENT_RECONNECTING');
  static const ClientState CLIENT_CONNECTING = ClientState._(6, _omitEnumNames ? '' : 'CLIENT_CONNECTING');
  static const ClientState CLIENT_ONLINE = ClientState._(7, _omitEnumNames ? '' : 'CLIENT_ONLINE');

  static const $core.List<ClientState> values = <ClientState> [
    CLIENT_OFF,
    CLIENT_FAILED,
    CLIENT_DISCONNECTED,
    CLIENT_DISCONNECTING,
    CLIENT_RECONNECTING,
    CLIENT_CONNECTING,
    CLIENT_ONLINE,
  ];

  static final $core.Map<$core.int, ClientState> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ClientState? valueOf($core.int value) => _byValue[value];

  const ClientState._($core.int v, $core.String n) : super(v, n);
}

class DEST_TYPE extends $pb.ProtobufEnum {
  static const DEST_TYPE ABONENT = DEST_TYPE._(0, _omitEnumNames ? '' : 'ABONENT');
  static const DEST_TYPE GROUPE = DEST_TYPE._(1, _omitEnumNames ? '' : 'GROUPE');
  static const DEST_TYPE DEVICE = DEST_TYPE._(2, _omitEnumNames ? '' : 'DEVICE');

  static const $core.List<DEST_TYPE> values = <DEST_TYPE> [
    ABONENT,
    GROUPE,
    DEVICE,
  ];

  static final $core.Map<$core.int, DEST_TYPE> _byValue = $pb.ProtobufEnum.initByValue(values);
  static DEST_TYPE? valueOf($core.int value) => _byValue[value];

  const DEST_TYPE._($core.int v, $core.String n) : super(v, n);
}

class MSG_STATE extends $pb.ProtobufEnum {
  static const MSG_STATE MSG_UNSENT = MSG_STATE._(0, _omitEnumNames ? '' : 'MSG_UNSENT');
  static const MSG_STATE MSG_SENT = MSG_STATE._(1, _omitEnumNames ? '' : 'MSG_SENT');
  static const MSG_STATE MSG_DELIVERED = MSG_STATE._(2, _omitEnumNames ? '' : 'MSG_DELIVERED');
  static const MSG_STATE MSG_READED = MSG_STATE._(3, _omitEnumNames ? '' : 'MSG_READED');
  static const MSG_STATE MSG_DELETED = MSG_STATE._(4, _omitEnumNames ? '' : 'MSG_DELETED');
  static const MSG_STATE MSG_MAX_STATE = MSG_STATE._(5, _omitEnumNames ? '' : 'MSG_MAX_STATE');

  static const $core.List<MSG_STATE> values = <MSG_STATE> [
    MSG_UNSENT,
    MSG_SENT,
    MSG_DELIVERED,
    MSG_READED,
    MSG_DELETED,
    MSG_MAX_STATE,
  ];

  static final $core.Map<$core.int, MSG_STATE> _byValue = $pb.ProtobufEnum.initByValue(values);
  static MSG_STATE? valueOf($core.int value) => _byValue[value];

  const MSG_STATE._($core.int v, $core.String n) : super(v, n);
}

class MSG_TYPE extends $pb.ProtobufEnum {
  static const MSG_TYPE MSG_ANY = MSG_TYPE._(0, _omitEnumNames ? '' : 'MSG_ANY');
  static const MSG_TYPE MSG_TEXT = MSG_TYPE._(1, _omitEnumNames ? '' : 'MSG_TEXT');
  static const MSG_TYPE MSG_INVITE = MSG_TYPE._(2, _omitEnumNames ? '' : 'MSG_INVITE');
  static const MSG_TYPE MSG_FLINK = MSG_TYPE._(3, _omitEnumNames ? '' : 'MSG_FLINK');
  static const MSG_TYPE MSG_IMGLINK = MSG_TYPE._(4, _omitEnumNames ? '' : 'MSG_IMGLINK');
  static const MSG_TYPE MSG_VIDEO = MSG_TYPE._(9, _omitEnumNames ? '' : 'MSG_VIDEO');
  static const MSG_TYPE MSG_SERVICE = MSG_TYPE._(5, _omitEnumNames ? '' : 'MSG_SERVICE');
  static const MSG_TYPE MSG_CHAT_EVENT = MSG_TYPE._(6, _omitEnumNames ? '' : 'MSG_CHAT_EVENT');
  static const MSG_TYPE MSG_SOUND = MSG_TYPE._(7, _omitEnumNames ? '' : 'MSG_SOUND');
  static const MSG_TYPE MSG_OBJECT = MSG_TYPE._(8, _omitEnumNames ? '' : 'MSG_OBJECT');
  static const MSG_TYPE MSG_ERROR = MSG_TYPE._(15, _omitEnumNames ? '' : 'MSG_ERROR');

  static const $core.List<MSG_TYPE> values = <MSG_TYPE> [
    MSG_ANY,
    MSG_TEXT,
    MSG_INVITE,
    MSG_FLINK,
    MSG_IMGLINK,
    MSG_VIDEO,
    MSG_SERVICE,
    MSG_CHAT_EVENT,
    MSG_SOUND,
    MSG_OBJECT,
    MSG_ERROR,
  ];

  static final $core.Map<$core.int, MSG_TYPE> _byValue = $pb.ProtobufEnum.initByValue(values);
  static MSG_TYPE? valueOf($core.int value) => _byValue[value];

  const MSG_TYPE._($core.int v, $core.String n) : super(v, n);
}

class ERROR_CODE extends $pb.ProtobufEnum {
  static const ERROR_CODE ERR_OK = ERROR_CODE._(0, _omitEnumNames ? '' : 'ERR_OK');
  static const ERROR_CODE ERR_FAIL = ERROR_CODE._(1, _omitEnumNames ? '' : 'ERR_FAIL');
  static const ERROR_CODE ERR_PARAMS = ERROR_CODE._(2, _omitEnumNames ? '' : 'ERR_PARAMS');
  static const ERROR_CODE ERR_UNREGISTERED = ERROR_CODE._(3, _omitEnumNames ? '' : 'ERR_UNREGISTERED');
  static const ERROR_CODE ERR_TIMEOUT = ERROR_CODE._(4, _omitEnumNames ? '' : 'ERR_TIMEOUT');
  static const ERROR_CODE ERR_DISCONNECTED = ERROR_CODE._(6, _omitEnumNames ? '' : 'ERR_DISCONNECTED');
  static const ERROR_CODE ERR_ABORT = ERROR_CODE._(7, _omitEnumNames ? '' : 'ERR_ABORT');
  static const ERROR_CODE ERR_DISABLED = ERROR_CODE._(8, _omitEnumNames ? '' : 'ERR_DISABLED');
  static const ERROR_CODE ERR_RETRY = ERROR_CODE._(9, _omitEnumNames ? '' : 'ERR_RETRY');
  static const ERROR_CODE ERR_NOT_INIT = ERROR_CODE._(10, _omitEnumNames ? '' : 'ERR_NOT_INIT');
  static const ERROR_CODE ERR_CANCEL = ERROR_CODE._(11, _omitEnumNames ? '' : 'ERR_CANCEL');
  static const ERROR_CODE ERR_TEMPORALY_UNAVAIBLE = ERROR_CODE._(12, _omitEnumNames ? '' : 'ERR_TEMPORALY_UNAVAIBLE');
  static const ERROR_CODE ERR_NOT_FOUND = ERROR_CODE._(256, _omitEnumNames ? '' : 'ERR_NOT_FOUND');
  static const ERROR_CODE ERR_EXIST = ERROR_CODE._(257, _omitEnumNames ? '' : 'ERR_EXIST');
  static const ERROR_CODE ERR_NO_SEND = ERROR_CODE._(258, _omitEnumNames ? '' : 'ERR_NO_SEND');
  static const ERROR_CODE ERR_RESYNC = ERROR_CODE._(260, _omitEnumNames ? '' : 'ERR_RESYNC');
  static const ERROR_CODE ERR_BUSY = ERROR_CODE._(259, _omitEnumNames ? '' : 'ERR_BUSY');
  static const ERROR_CODE ERR_UNSUPPORTED = ERROR_CODE._(261, _omitEnumNames ? '' : 'ERR_UNSUPPORTED');
  static const ERROR_CODE ERR_ACCESS_DENIED = ERROR_CODE._(262, _omitEnumNames ? '' : 'ERR_ACCESS_DENIED');
  static const ERROR_CODE ERR_NOT_CONNECTED = ERROR_CODE._(263, _omitEnumNames ? '' : 'ERR_NOT_CONNECTED');
  static const ERROR_CODE ERR_EMPTY = ERROR_CODE._(264, _omitEnumNames ? '' : 'ERR_EMPTY');
  static const ERROR_CODE ERR_OVERFLOW = ERROR_CODE._(265, _omitEnumNames ? '' : 'ERR_OVERFLOW');
  static const ERROR_CODE ERR_OVERLOAD = ERROR_CODE._(266, _omitEnumNames ? '' : 'ERR_OVERLOAD');
  static const ERROR_CODE ERR_UNKNOWN_SERVICE = ERROR_CODE._(267, _omitEnumNames ? '' : 'ERR_UNKNOWN_SERVICE');
  static const ERROR_CODE ERR_UNSUPPORTED_SERVICE = ERROR_CODE._(268, _omitEnumNames ? '' : 'ERR_UNSUPPORTED_SERVICE');
  static const ERROR_CODE ERR_UNSUPPORTED_COMMAND = ERROR_CODE._(269, _omitEnumNames ? '' : 'ERR_UNSUPPORTED_COMMAND');
  static const ERROR_CODE ERR_NOT_IMPLEMENTED = ERROR_CODE._(270, _omitEnumNames ? '' : 'ERR_NOT_IMPLEMENTED');
  static const ERROR_CODE ERR_ALREADY_DONE = ERROR_CODE._(272, _omitEnumNames ? '' : 'ERR_ALREADY_DONE');
  static const ERROR_CODE ERR_NOT_REGISTRED = ERROR_CODE._(273, _omitEnumNames ? '' : 'ERR_NOT_REGISTRED');
  static const ERROR_CODE ERR_NOT_READY = ERROR_CODE._(274, _omitEnumNames ? '' : 'ERR_NOT_READY');
  static const ERROR_CODE ERR_NOT_EXIST = ERROR_CODE._(275, _omitEnumNames ? '' : 'ERR_NOT_EXIST');
  static const ERROR_CODE ERR_WRONG_PASSWORD = ERROR_CODE._(276, _omitEnumNames ? '' : 'ERR_WRONG_PASSWORD');
  static const ERROR_CODE ERR_NO_ACTIVE_PROFILE = ERROR_CODE._(277, _omitEnumNames ? '' : 'ERR_NO_ACTIVE_PROFILE');
  static const ERROR_CODE ERR_CORRUPTED_DATA = ERROR_CODE._(278, _omitEnumNames ? '' : 'ERR_CORRUPTED_DATA');
  static const ERROR_CODE ERR_TEMP_UNAVAILABLE = ERROR_CODE._(279, _omitEnumNames ? '' : 'ERR_TEMP_UNAVAILABLE');
  static const ERROR_CODE ERR_SEND = ERROR_CODE._(288, _omitEnumNames ? '' : 'ERR_SEND');
  static const ERROR_CODE ERR_SPLIT_UNREADY = ERROR_CODE._(289, _omitEnumNames ? '' : 'ERR_SPLIT_UNREADY');
  static const ERROR_CODE ERR_SPLIT = ERROR_CODE._(290, _omitEnumNames ? '' : 'ERR_SPLIT');
  static const ERROR_CODE ERR_STRANGE_STREAM = ERROR_CODE._(304, _omitEnumNames ? '' : 'ERR_STRANGE_STREAM');
  static const ERROR_CODE ERR_CMD_STREAM = ERROR_CODE._(305, _omitEnumNames ? '' : 'ERR_CMD_STREAM');
  static const ERROR_CODE ERR_NOT_ACTIVE = ERROR_CODE._(306, _omitEnumNames ? '' : 'ERR_NOT_ACTIVE');
  static const ERROR_CODE ERR_NO_DATA = ERROR_CODE._(307, _omitEnumNames ? '' : 'ERR_NO_DATA');
  static const ERROR_CODE ERR_NO_CALLS = ERROR_CODE._(308, _omitEnumNames ? '' : 'ERR_NO_CALLS');
  static const ERROR_CODE ERR_CLR_SKEY = ERROR_CODE._(320, _omitEnumNames ? '' : 'ERR_CLR_SKEY');
  static const ERROR_CODE ERR_SET_SKEY = ERROR_CODE._(321, _omitEnumNames ? '' : 'ERR_SET_SKEY');
  static const ERROR_CODE ERR_GET_SKEY = ERROR_CODE._(322, _omitEnumNames ? '' : 'ERR_GET_SKEY');
  static const ERROR_CODE ERR_CALL_REJECT = ERROR_CODE._(336, _omitEnumNames ? '' : 'ERR_CALL_REJECT');
  static const ERROR_CODE ERR_CALL_BUSY = ERROR_CODE._(337, _omitEnumNames ? '' : 'ERR_CALL_BUSY');
  static const ERROR_CODE ERR_CALL_WRONG_ANSWER = ERROR_CODE._(338, _omitEnumNames ? '' : 'ERR_CALL_WRONG_ANSWER');
  static const ERROR_CODE ERR_CALL_CLOSED = ERROR_CODE._(339, _omitEnumNames ? '' : 'ERR_CALL_CLOSED');
  static const ERROR_CODE ERR_CALL_NOT_FOUND = ERROR_CODE._(340, _omitEnumNames ? '' : 'ERR_CALL_NOT_FOUND');
  static const ERROR_CODE ERR_CALL_USER_NOT_FOUND = ERROR_CODE._(341, _omitEnumNames ? '' : 'ERR_CALL_USER_NOT_FOUND');
  static const ERROR_CODE ERR_CALL_DEVICE_NOT_FOUND = ERROR_CODE._(342, _omitEnumNames ? '' : 'ERR_CALL_DEVICE_NOT_FOUND');
  static const ERROR_CODE ERR_CALL_OFFLINE = ERROR_CODE._(343, _omitEnumNames ? '' : 'ERR_CALL_OFFLINE');
  static const ERROR_CODE ERR_CALL_FAIL = ERROR_CODE._(344, _omitEnumNames ? '' : 'ERR_CALL_FAIL');
  static const ERROR_CODE ERR_CALL_TAKEN = ERROR_CODE._(345, _omitEnumNames ? '' : 'ERR_CALL_TAKEN');
  static const ERROR_CODE ERR_CHAT_NO_KEY = ERROR_CODE._(352, _omitEnumNames ? '' : 'ERR_CHAT_NO_KEY');
  static const ERROR_CODE ERR_CHAT_CRC_ERROR = ERROR_CODE._(353, _omitEnumNames ? '' : 'ERR_CHAT_CRC_ERROR');
  static const ERROR_CODE ERR_CHAT_NOT_FOUND = ERROR_CODE._(354, _omitEnumNames ? '' : 'ERR_CHAT_NOT_FOUND');
  static const ERROR_CODE ERR_USER_NOT_FOUND = ERROR_CODE._(512, _omitEnumNames ? '' : 'ERR_USER_NOT_FOUND');
  static const ERROR_CODE ERR_DEVICE_NOT_FOUND = ERROR_CODE._(513, _omitEnumNames ? '' : 'ERR_DEVICE_NOT_FOUND');
  static const ERROR_CODE ERR_CONNECT_SYNC = ERROR_CODE._(514, _omitEnumNames ? '' : 'ERR_CONNECT_SYNC');
  static const ERROR_CODE ERR_DEVICE_BLOCKED = ERROR_CODE._(515, _omitEnumNames ? '' : 'ERR_DEVICE_BLOCKED');
  static const ERROR_CODE ERR_KEY_NOT_FOUND = ERROR_CODE._(516, _omitEnumNames ? '' : 'ERR_KEY_NOT_FOUND');
  static const ERROR_CODE ERR_BAD_SERIA = ERROR_CODE._(517, _omitEnumNames ? '' : 'ERR_BAD_SERIA');
  static const ERROR_CODE ERR_PROT_VER = ERROR_CODE._(518, _omitEnumNames ? '' : 'ERR_PROT_VER');
  static const ERROR_CODE ERR_GET_MKEY = ERROR_CODE._(519, _omitEnumNames ? '' : 'ERR_GET_MKEY');
  static const ERROR_CODE ERR_OBJ_PART_SAVE = ERROR_CODE._(520, _omitEnumNames ? '' : 'ERR_OBJ_PART_SAVE');
  static const ERROR_CODE ERR_SESSION = ERROR_CODE._(521, _omitEnumNames ? '' : 'ERR_SESSION');
  static const ERROR_CODE ERR_CHANNEL = ERROR_CODE._(522, _omitEnumNames ? '' : 'ERR_CHANNEL');
  static const ERROR_CODE ERR_USER_OFFLINE = ERROR_CODE._(528, _omitEnumNames ? '' : 'ERR_USER_OFFLINE');
  static const ERROR_CODE ERR_DEVICE_OFFLINE = ERROR_CODE._(529, _omitEnumNames ? '' : 'ERR_DEVICE_OFFLINE');
  static const ERROR_CODE ERR_CRYPTO = ERROR_CODE._(1280, _omitEnumNames ? '' : 'ERR_CRYPTO');
  static const ERROR_CODE ERR_CRYPTO_FAIL = ERROR_CODE._(1281, _omitEnumNames ? '' : 'ERR_CRYPTO_FAIL');
  static const ERROR_CODE ERR_CRYPTER_NEED_SEND = ERROR_CODE._(1282, _omitEnumNames ? '' : 'ERR_CRYPTER_NEED_SEND');
  static const ERROR_CODE ERR_NSD = ERROR_CODE._(1283, _omitEnumNames ? '' : 'ERR_NSD');
  static const ERROR_CODE ERR_NEXT_KEY = ERROR_CODE._(1284, _omitEnumNames ? '' : 'ERR_NEXT_KEY');
  static const ERROR_CODE ERR_CRYPTO_ORK = ERROR_CODE._(1285, _omitEnumNames ? '' : 'ERR_CRYPTO_ORK');
  static const ERROR_CODE ERR_OPEN_CONTAINER = ERROR_CODE._(1286, _omitEnumNames ? '' : 'ERR_OPEN_CONTAINER');
  static const ERROR_CODE ERR_CHANGE_SERIA = ERROR_CODE._(1287, _omitEnumNames ? '' : 'ERR_CHANGE_SERIA');
  static const ERROR_CODE ERR_UNKNOWN_DEVICE = ERROR_CODE._(1288, _omitEnumNames ? '' : 'ERR_UNKNOWN_DEVICE');
  static const ERROR_CODE ERR_UNREGISTERED_DEVICE = ERROR_CODE._(1289, _omitEnumNames ? '' : 'ERR_UNREGISTERED_DEVICE');
  static const ERROR_CODE ERR_DEVICE_KEYS_EXPIRED = ERROR_CODE._(1290, _omitEnumNames ? '' : 'ERR_DEVICE_KEYS_EXPIRED');
  static const ERROR_CODE ERR_MAC_ERROR = ERROR_CODE._(1291, _omitEnumNames ? '' : 'ERR_MAC_ERROR');
  static const ERROR_CODE ERR_CHAT_CRYPTO_FAIL = ERROR_CODE._(1292, _omitEnumNames ? '' : 'ERR_CHAT_CRYPTO_FAIL');
  static const ERROR_CODE ERR_UNSUPPORTED_PROTOCOL = ERROR_CODE._(1312, _omitEnumNames ? '' : 'ERR_UNSUPPORTED_PROTOCOL');
  static const ERROR_CODE ERR_UNSUPPORTED_SUITE = ERROR_CODE._(1313, _omitEnumNames ? '' : 'ERR_UNSUPPORTED_SUITE');
  static const ERROR_CODE ERR_OKEY_NOT_FOUND = ERROR_CODE._(1360, _omitEnumNames ? '' : 'ERR_OKEY_NOT_FOUND');
  static const ERROR_CODE ERR_WRONG_OKEY = ERROR_CODE._(1362, _omitEnumNames ? '' : 'ERR_WRONG_OKEY');
  static const ERROR_CODE ERR_OKEY_EXIST = ERROR_CODE._(1363, _omitEnumNames ? '' : 'ERR_OKEY_EXIST');
  static const ERROR_CODE ERR_OKEY_ADD = ERROR_CODE._(1364, _omitEnumNames ? '' : 'ERR_OKEY_ADD');
  static const ERROR_CODE ERR_OPEN_BASE = ERROR_CODE._(1537, _omitEnumNames ? '' : 'ERR_OPEN_BASE');
  static const ERROR_CODE ERR_CREATE_BASE = ERROR_CODE._(1538, _omitEnumNames ? '' : 'ERR_CREATE_BASE');
  static const ERROR_CODE ERR_SQL = ERROR_CODE._(1539, _omitEnumNames ? '' : 'ERR_SQL');
  static const ERROR_CODE ERR_BASE_FAIL = ERROR_CODE._(1540, _omitEnumNames ? '' : 'ERR_BASE_FAIL');
  static const ERROR_CODE ERR_ADD_USER = ERROR_CODE._(8192, _omitEnumNames ? '' : 'ERR_ADD_USER');
  static const ERROR_CODE ERR_ADD_DEVICE = ERROR_CODE._(8193, _omitEnumNames ? '' : 'ERR_ADD_DEVICE');
  static const ERROR_CODE ERR_ADD_CRYPTO = ERROR_CODE._(8194, _omitEnumNames ? '' : 'ERR_ADD_CRYPTO');
  static const ERROR_CODE ERR_EMAIL_EXIST = ERROR_CODE._(8195, _omitEnumNames ? '' : 'ERR_EMAIL_EXIST');
  static const ERROR_CODE ERR_PHONE_EXIST = ERROR_CODE._(8196, _omitEnumNames ? '' : 'ERR_PHONE_EXIST');
  static const ERROR_CODE ERR_WRONG_FORMAT = ERROR_CODE._(8197, _omitEnumNames ? '' : 'ERR_WRONG_FORMAT');
  static const ERROR_CODE ERR_WRONG_CODE = ERROR_CODE._(8198, _omitEnumNames ? '' : 'ERR_WRONG_CODE');
  static const ERROR_CODE ERR_CODE_EXPIRE = ERROR_CODE._(8199, _omitEnumNames ? '' : 'ERR_CODE_EXPIRE');
  static const ERROR_CODE ERR_WRONG_CONFORMATION = ERROR_CODE._(8200, _omitEnumNames ? '' : 'ERR_WRONG_CONFORMATION');
  static const ERROR_CODE ERR_WRONG_USER_PASSWORD = ERROR_CODE._(8201, _omitEnumNames ? '' : 'ERR_WRONG_USER_PASSWORD');
  static const ERROR_CODE ERR_BAD_DEVICE_PIN = ERROR_CODE._(8202, _omitEnumNames ? '' : 'ERR_BAD_DEVICE_PIN');
  static const ERROR_CODE ERR_PASS_MODE = ERROR_CODE._(8203, _omitEnumNames ? '' : 'ERR_PASS_MODE');
  static const ERROR_CODE ERR_EMAIL_NOT_EXIST = ERROR_CODE._(8204, _omitEnumNames ? '' : 'ERR_EMAIL_NOT_EXIST');
  static const ERROR_CODE ERR_PHONE_NOT_EXIST = ERROR_CODE._(8205, _omitEnumNames ? '' : 'ERR_PHONE_NOT_EXIST');
  static const ERROR_CODE ERR_REGPASS_NOT_EXIST = ERROR_CODE._(8206, _omitEnumNames ? '' : 'ERR_REGPASS_NOT_EXIST');
  static const ERROR_CODE ERR_PASSWORD_EXPIRED = ERROR_CODE._(8207, _omitEnumNames ? '' : 'ERR_PASSWORD_EXPIRED');
  static const ERROR_CODE ERR_PASSWORD_TIME_EXPIRED = ERROR_CODE._(8208, _omitEnumNames ? '' : 'ERR_PASSWORD_TIME_EXPIRED');
  static const ERROR_CODE ERR_TIME_EXPIRED = ERROR_CODE._(8209, _omitEnumNames ? '' : 'ERR_TIME_EXPIRED');
  static const ERROR_CODE ERR_TIME_NOT_EXPIRED = ERROR_CODE._(8210, _omitEnumNames ? '' : 'ERR_TIME_NOT_EXPIRED');
  static const ERROR_CODE ERR_REENTER = ERROR_CODE._(8211, _omitEnumNames ? '' : 'ERR_REENTER');
  static const ERROR_CODE ERR_UNKNOWN = ERROR_CODE._(2147483647, _omitEnumNames ? '' : 'ERR_UNKNOWN');

  static const $core.List<ERROR_CODE> values = <ERROR_CODE> [
    ERR_OK,
    ERR_FAIL,
    ERR_PARAMS,
    ERR_UNREGISTERED,
    ERR_TIMEOUT,
    ERR_DISCONNECTED,
    ERR_ABORT,
    ERR_DISABLED,
    ERR_RETRY,
    ERR_NOT_INIT,
    ERR_CANCEL,
    ERR_TEMPORALY_UNAVAIBLE,
    ERR_NOT_FOUND,
    ERR_EXIST,
    ERR_NO_SEND,
    ERR_RESYNC,
    ERR_BUSY,
    ERR_UNSUPPORTED,
    ERR_ACCESS_DENIED,
    ERR_NOT_CONNECTED,
    ERR_EMPTY,
    ERR_OVERFLOW,
    ERR_OVERLOAD,
    ERR_UNKNOWN_SERVICE,
    ERR_UNSUPPORTED_SERVICE,
    ERR_UNSUPPORTED_COMMAND,
    ERR_NOT_IMPLEMENTED,
    ERR_ALREADY_DONE,
    ERR_NOT_REGISTRED,
    ERR_NOT_READY,
    ERR_NOT_EXIST,
    ERR_WRONG_PASSWORD,
    ERR_NO_ACTIVE_PROFILE,
    ERR_CORRUPTED_DATA,
    ERR_TEMP_UNAVAILABLE,
    ERR_SEND,
    ERR_SPLIT_UNREADY,
    ERR_SPLIT,
    ERR_STRANGE_STREAM,
    ERR_CMD_STREAM,
    ERR_NOT_ACTIVE,
    ERR_NO_DATA,
    ERR_NO_CALLS,
    ERR_CLR_SKEY,
    ERR_SET_SKEY,
    ERR_GET_SKEY,
    ERR_CALL_REJECT,
    ERR_CALL_BUSY,
    ERR_CALL_WRONG_ANSWER,
    ERR_CALL_CLOSED,
    ERR_CALL_NOT_FOUND,
    ERR_CALL_USER_NOT_FOUND,
    ERR_CALL_DEVICE_NOT_FOUND,
    ERR_CALL_OFFLINE,
    ERR_CALL_FAIL,
    ERR_CALL_TAKEN,
    ERR_CHAT_NO_KEY,
    ERR_CHAT_CRC_ERROR,
    ERR_CHAT_NOT_FOUND,
    ERR_USER_NOT_FOUND,
    ERR_DEVICE_NOT_FOUND,
    ERR_CONNECT_SYNC,
    ERR_DEVICE_BLOCKED,
    ERR_KEY_NOT_FOUND,
    ERR_BAD_SERIA,
    ERR_PROT_VER,
    ERR_GET_MKEY,
    ERR_OBJ_PART_SAVE,
    ERR_SESSION,
    ERR_CHANNEL,
    ERR_USER_OFFLINE,
    ERR_DEVICE_OFFLINE,
    ERR_CRYPTO,
    ERR_CRYPTO_FAIL,
    ERR_CRYPTER_NEED_SEND,
    ERR_NSD,
    ERR_NEXT_KEY,
    ERR_CRYPTO_ORK,
    ERR_OPEN_CONTAINER,
    ERR_CHANGE_SERIA,
    ERR_UNKNOWN_DEVICE,
    ERR_UNREGISTERED_DEVICE,
    ERR_DEVICE_KEYS_EXPIRED,
    ERR_MAC_ERROR,
    ERR_CHAT_CRYPTO_FAIL,
    ERR_UNSUPPORTED_PROTOCOL,
    ERR_UNSUPPORTED_SUITE,
    ERR_OKEY_NOT_FOUND,
    ERR_WRONG_OKEY,
    ERR_OKEY_EXIST,
    ERR_OKEY_ADD,
    ERR_OPEN_BASE,
    ERR_CREATE_BASE,
    ERR_SQL,
    ERR_BASE_FAIL,
    ERR_ADD_USER,
    ERR_ADD_DEVICE,
    ERR_ADD_CRYPTO,
    ERR_EMAIL_EXIST,
    ERR_PHONE_EXIST,
    ERR_WRONG_FORMAT,
    ERR_WRONG_CODE,
    ERR_CODE_EXPIRE,
    ERR_WRONG_CONFORMATION,
    ERR_WRONG_USER_PASSWORD,
    ERR_BAD_DEVICE_PIN,
    ERR_PASS_MODE,
    ERR_EMAIL_NOT_EXIST,
    ERR_PHONE_NOT_EXIST,
    ERR_REGPASS_NOT_EXIST,
    ERR_PASSWORD_EXPIRED,
    ERR_PASSWORD_TIME_EXPIRED,
    ERR_TIME_EXPIRED,
    ERR_TIME_NOT_EXPIRED,
    ERR_REENTER,
    ERR_UNKNOWN,
  ];

  static final $core.Map<$core.int, ERROR_CODE> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ERROR_CODE? valueOf($core.int value) => _byValue[value];

  const ERROR_CODE._($core.int v, $core.String n) : super(v, n);
}

class CALL_STATE extends $pb.ProtobufEnum {
  static const CALL_STATE CALL_IDLE = CALL_STATE._(0, _omitEnumNames ? '' : 'CALL_IDLE');
  static const CALL_STATE CALL_IN = CALL_STATE._(1, _omitEnumNames ? '' : 'CALL_IN');
  static const CALL_STATE CALL_OUT = CALL_STATE._(2, _omitEnumNames ? '' : 'CALL_OUT');
  static const CALL_STATE CALL_OUT_WAIT = CALL_STATE._(3, _omitEnumNames ? '' : 'CALL_OUT_WAIT');
  static const CALL_STATE CALL_OUT_RING = CALL_STATE._(4, _omitEnumNames ? '' : 'CALL_OUT_RING');
  static const CALL_STATE CALL_CONNECTING = CALL_STATE._(5, _omitEnumNames ? '' : 'CALL_CONNECTING');
  static const CALL_STATE CALL_CONNECTING_ORK = CALL_STATE._(7, _omitEnumNames ? '' : 'CALL_CONNECTING_ORK');
  static const CALL_STATE CALL_CONNECTING_STRM = CALL_STATE._(8, _omitEnumNames ? '' : 'CALL_CONNECTING_STRM');
  static const CALL_STATE CALL_CONNECTED = CALL_STATE._(9, _omitEnumNames ? '' : 'CALL_CONNECTED');
  static const CALL_STATE CALL_CONNECT_ORK_STRM = CALL_STATE._(10, _omitEnumNames ? '' : 'CALL_CONNECT_ORK_STRM');
  static const CALL_STATE CALL_GET_ADDRESS = CALL_STATE._(14, _omitEnumNames ? '' : 'CALL_GET_ADDRESS');
  static const CALL_STATE CALL_SET_ADDRESS = CALL_STATE._(15, _omitEnumNames ? '' : 'CALL_SET_ADDRESS');
  static const CALL_STATE CALL_CANCELING = CALL_STATE._(16, _omitEnumNames ? '' : 'CALL_CANCELING');
  static const CALL_STATE CALL_CLOSED = CALL_STATE._(128, _omitEnumNames ? '' : 'CALL_CLOSED');
  static const CALL_STATE CALL_DELETED = CALL_STATE._(255, _omitEnumNames ? '' : 'CALL_DELETED');

  static const $core.List<CALL_STATE> values = <CALL_STATE> [
    CALL_IDLE,
    CALL_IN,
    CALL_OUT,
    CALL_OUT_WAIT,
    CALL_OUT_RING,
    CALL_CONNECTING,
    CALL_CONNECTING_ORK,
    CALL_CONNECTING_STRM,
    CALL_CONNECTED,
    CALL_CONNECT_ORK_STRM,
    CALL_GET_ADDRESS,
    CALL_SET_ADDRESS,
    CALL_CANCELING,
    CALL_CLOSED,
    CALL_DELETED,
  ];

  static final $core.Map<$core.int, CALL_STATE> _byValue = $pb.ProtobufEnum.initByValue(values);
  static CALL_STATE? valueOf($core.int value) => _byValue[value];

  const CALL_STATE._($core.int v, $core.String n) : super(v, n);
}

class DISCON_REASON extends $pb.ProtobufEnum {
  static const DISCON_REASON CALL_ACTIVE = DISCON_REASON._(0, _omitEnumNames ? '' : 'CALL_ACTIVE');
  static const DISCON_REASON CALL_MISS = DISCON_REASON._(1, _omitEnumNames ? '' : 'CALL_MISS');
  static const DISCON_REASON CALL_BREAK_OUT = DISCON_REASON._(2, _omitEnumNames ? '' : 'CALL_BREAK_OUT');
  static const DISCON_REASON CALL_BREAK_IN = DISCON_REASON._(3, _omitEnumNames ? '' : 'CALL_BREAK_IN');
  static const DISCON_REASON CALL_CLOSE_OUT = DISCON_REASON._(4, _omitEnumNames ? '' : 'CALL_CLOSE_OUT');
  static const DISCON_REASON CALL_CLOSE_IN = DISCON_REASON._(5, _omitEnumNames ? '' : 'CALL_CLOSE_IN');
  static const DISCON_REASON CALL_ABONENT_OFF = DISCON_REASON._(6, _omitEnumNames ? '' : 'CALL_ABONENT_OFF');
  static const DISCON_REASON CALL_DEVICE_OFF = DISCON_REASON._(7, _omitEnumNames ? '' : 'CALL_DEVICE_OFF');
  static const DISCON_REASON CALL_NO_IN_BASE = DISCON_REASON._(8, _omitEnumNames ? '' : 'CALL_NO_IN_BASE');
  static const DISCON_REASON CALL_BUSY = DISCON_REASON._(9, _omitEnumNames ? '' : 'CALL_BUSY');
  static const DISCON_REASON CALL_NO_ANSWER = DISCON_REASON._(10, _omitEnumNames ? '' : 'CALL_NO_ANSWER');
  static const DISCON_REASON CALL_UNREGISTERED = DISCON_REASON._(11, _omitEnumNames ? '' : 'CALL_UNREGISTERED');
  static const DISCON_REASON CALL_ERROR = DISCON_REASON._(12, _omitEnumNames ? '' : 'CALL_ERROR');
  static const DISCON_REASON CALL_OFFLINE = DISCON_REASON._(13, _omitEnumNames ? '' : 'CALL_OFFLINE');
  static const DISCON_REASON CALL_BUSY_IN = DISCON_REASON._(14, _omitEnumNames ? '' : 'CALL_BUSY_IN');
  static const DISCON_REASON CALL_STRAM_BREAK = DISCON_REASON._(15, _omitEnumNames ? '' : 'CALL_STRAM_BREAK');
  static const DISCON_REASON CALL_CONF_REMOVE = DISCON_REASON._(16, _omitEnumNames ? '' : 'CALL_CONF_REMOVE');
  static const DISCON_REASON CALL_CONF_CLOSED = DISCON_REASON._(17, _omitEnumNames ? '' : 'CALL_CONF_CLOSED');

  static const $core.List<DISCON_REASON> values = <DISCON_REASON> [
    CALL_ACTIVE,
    CALL_MISS,
    CALL_BREAK_OUT,
    CALL_BREAK_IN,
    CALL_CLOSE_OUT,
    CALL_CLOSE_IN,
    CALL_ABONENT_OFF,
    CALL_DEVICE_OFF,
    CALL_NO_IN_BASE,
    CALL_BUSY,
    CALL_NO_ANSWER,
    CALL_UNREGISTERED,
    CALL_ERROR,
    CALL_OFFLINE,
    CALL_BUSY_IN,
    CALL_STRAM_BREAK,
    CALL_CONF_REMOVE,
    CALL_CONF_CLOSED,
  ];

  static final $core.Map<$core.int, DISCON_REASON> _byValue = $pb.ProtobufEnum.initByValue(values);
  static DISCON_REASON? valueOf($core.int value) => _byValue[value];

  const DISCON_REASON._($core.int v, $core.String n) : super(v, n);
}

class DEV_TYPE extends $pb.ProtobufEnum {
  static const DEV_TYPE DEVICE_UNDEFINED = DEV_TYPE._(0, _omitEnumNames ? '' : 'DEVICE_UNDEFINED');
  static const DEV_TYPE DEVICE_MOBILE = DEV_TYPE._(256, _omitEnumNames ? '' : 'DEVICE_MOBILE');
  static const DEV_TYPE DEVICE_ANDROID = DEV_TYPE._(258, _omitEnumNames ? '' : 'DEVICE_ANDROID');
  static const DEV_TYPE DEVICE_IOS = DEV_TYPE._(259, _omitEnumNames ? '' : 'DEVICE_IOS');
  static const DEV_TYPE DEVICE_DESKTOP = DEV_TYPE._(512, _omitEnumNames ? '' : 'DEVICE_DESKTOP');
  static const DEV_TYPE DEVICE_DESKTOP_WIN = DEV_TYPE._(513, _omitEnumNames ? '' : 'DEVICE_DESKTOP_WIN');
  static const DEV_TYPE DEVICE_DESKTOP_LIN = DEV_TYPE._(514, _omitEnumNames ? '' : 'DEVICE_DESKTOP_LIN');
  static const DEV_TYPE DEVICE_DESKTOP_MAC = DEV_TYPE._(515, _omitEnumNames ? '' : 'DEVICE_DESKTOP_MAC');
  static const DEV_TYPE DEVICE_HW_PHONES = DEV_TYPE._(768, _omitEnumNames ? '' : 'DEVICE_HW_PHONES');
  static const DEV_TYPE DEVICE_PHONE = DEV_TYPE._(769, _omitEnumNames ? '' : 'DEVICE_PHONE');
  static const DEV_TYPE DEVICE_DESKTOP_PHONE = DEV_TYPE._(770, _omitEnumNames ? '' : 'DEVICE_DESKTOP_PHONE');
  static const DEV_TYPE DEVICE_BLE_PHONE = DEV_TYPE._(772, _omitEnumNames ? '' : 'DEVICE_BLE_PHONE');
  static const DEV_TYPE DEVICE_PC = DEV_TYPE._(1024, _omitEnumNames ? '' : 'DEVICE_PC');
  static const DEV_TYPE DEVICE_PC_SERVICE = DEV_TYPE._(268436480, _omitEnumNames ? '' : 'DEVICE_PC_SERVICE');
  static const DEV_TYPE DEVICE_SERVER = DEV_TYPE._(268436481, _omitEnumNames ? '' : 'DEVICE_SERVER');
  static const DEV_TYPE DEVICE_ECHO = DEV_TYPE._(268436482, _omitEnumNames ? '' : 'DEVICE_ECHO');
  static const DEV_TYPE DEVICE_CONFROOMS = DEV_TYPE._(268436483, _omitEnumNames ? '' : 'DEVICE_CONFROOMS');
  static const DEV_TYPE DEVICE_ADMIN = DEV_TYPE._(268436485, _omitEnumNames ? '' : 'DEVICE_ADMIN');
  static const DEV_TYPE DEVICE_CHAT = DEV_TYPE._(268436486, _omitEnumNames ? '' : 'DEVICE_CHAT');
  static const DEV_TYPE DEVICE_STORAGE = DEV_TYPE._(1342178311, _omitEnumNames ? '' : 'DEVICE_STORAGE');
  static const DEV_TYPE DEVICE_REGISTER = DEV_TYPE._(268436488, _omitEnumNames ? '' : 'DEVICE_REGISTER');
  static const DEV_TYPE DEVICE_GATE = DEV_TYPE._(268436736, _omitEnumNames ? '' : 'DEVICE_GATE');
  static const DEV_TYPE DEVICE_GATE_UNSAFE = DEV_TYPE._(805307648, _omitEnumNames ? '' : 'DEVICE_GATE_UNSAFE');
  static const DEV_TYPE DEVICE_GATE_SHELTOR = DEV_TYPE._(268436737, _omitEnumNames ? '' : 'DEVICE_GATE_SHELTOR');
  static const DEV_TYPE DEVICE_GATE_SIP = DEV_TYPE._(805307650, _omitEnumNames ? '' : 'DEVICE_GATE_SIP');
  static const DEV_TYPE DEVICE_GATE_MIR = DEV_TYPE._(268436739, _omitEnumNames ? '' : 'DEVICE_GATE_MIR');
  static const DEV_TYPE DEVICE_UNKNOWN = DEV_TYPE._(2147483647, _omitEnumNames ? '' : 'DEVICE_UNKNOWN');

  static const $core.List<DEV_TYPE> values = <DEV_TYPE> [
    DEVICE_UNDEFINED,
    DEVICE_MOBILE,
    DEVICE_ANDROID,
    DEVICE_IOS,
    DEVICE_DESKTOP,
    DEVICE_DESKTOP_WIN,
    DEVICE_DESKTOP_LIN,
    DEVICE_DESKTOP_MAC,
    DEVICE_HW_PHONES,
    DEVICE_PHONE,
    DEVICE_DESKTOP_PHONE,
    DEVICE_BLE_PHONE,
    DEVICE_PC,
    DEVICE_PC_SERVICE,
    DEVICE_SERVER,
    DEVICE_ECHO,
    DEVICE_CONFROOMS,
    DEVICE_ADMIN,
    DEVICE_CHAT,
    DEVICE_STORAGE,
    DEVICE_REGISTER,
    DEVICE_GATE,
    DEVICE_GATE_UNSAFE,
    DEVICE_GATE_SHELTOR,
    DEVICE_GATE_SIP,
    DEVICE_GATE_MIR,
    DEVICE_UNKNOWN,
  ];

  static final $core.Map<$core.int, DEV_TYPE> _byValue = $pb.ProtobufEnum.initByValue(values);
  static DEV_TYPE? valueOf($core.int value) => _byValue[value];

  const DEV_TYPE._($core.int v, $core.String n) : super(v, n);
}

class CALL_DIRECT extends $pb.ProtobufEnum {
  static const CALL_DIRECT Out = CALL_DIRECT._(0, _omitEnumNames ? '' : 'Out');
  static const CALL_DIRECT In = CALL_DIRECT._(1, _omitEnumNames ? '' : 'In');

  static const $core.List<CALL_DIRECT> values = <CALL_DIRECT> [
    Out,
    In,
  ];

  static final $core.Map<$core.int, CALL_DIRECT> _byValue = $pb.ProtobufEnum.initByValue(values);
  static CALL_DIRECT? valueOf($core.int value) => _byValue[value];

  const CALL_DIRECT._($core.int v, $core.String n) : super(v, n);
}

class GMEMBER_LTYPE extends $pb.ProtobufEnum {
  static const GMEMBER_LTYPE GM_OWNER = GMEMBER_LTYPE._(0, _omitEnumNames ? '' : 'GM_OWNER');
  static const GMEMBER_LTYPE GM_ADMIN = GMEMBER_LTYPE._(1, _omitEnumNames ? '' : 'GM_ADMIN');
  static const GMEMBER_LTYPE GM_WRITER = GMEMBER_LTYPE._(2, _omitEnumNames ? '' : 'GM_WRITER');
  static const GMEMBER_LTYPE GM_READER = GMEMBER_LTYPE._(3, _omitEnumNames ? '' : 'GM_READER');
  static const GMEMBER_LTYPE GM_ALLTYPE = GMEMBER_LTYPE._(255, _omitEnumNames ? '' : 'GM_ALLTYPE');

  static const $core.List<GMEMBER_LTYPE> values = <GMEMBER_LTYPE> [
    GM_OWNER,
    GM_ADMIN,
    GM_WRITER,
    GM_READER,
    GM_ALLTYPE,
  ];

  static final $core.Map<$core.int, GMEMBER_LTYPE> _byValue = $pb.ProtobufEnum.initByValue(values);
  static GMEMBER_LTYPE? valueOf($core.int value) => _byValue[value];

  const GMEMBER_LTYPE._($core.int v, $core.String n) : super(v, n);
}

class CHAT_STATE extends $pb.ProtobufEnum {
  static const CHAT_STATE CHAT_WAIT = CHAT_STATE._(0, _omitEnumNames ? '' : 'CHAT_WAIT');
  static const CHAT_STATE CHAT_ACTIVE = CHAT_STATE._(1, _omitEnumNames ? '' : 'CHAT_ACTIVE');
  static const CHAT_STATE CHAT_IGNOR = CHAT_STATE._(2, _omitEnumNames ? '' : 'CHAT_IGNOR');
  static const CHAT_STATE CHAT_DELETED = CHAT_STATE._(3, _omitEnumNames ? '' : 'CHAT_DELETED');

  static const $core.List<CHAT_STATE> values = <CHAT_STATE> [
    CHAT_WAIT,
    CHAT_ACTIVE,
    CHAT_IGNOR,
    CHAT_DELETED,
  ];

  static final $core.Map<$core.int, CHAT_STATE> _byValue = $pb.ProtobufEnum.initByValue(values);
  static CHAT_STATE? valueOf($core.int value) => _byValue[value];

  const CHAT_STATE._($core.int v, $core.String n) : super(v, n);
}

class MemberLevel extends $pb.ProtobufEnum {
  static const MemberLevel MEMBER_LEVEL_OWNER = MemberLevel._(0, _omitEnumNames ? '' : 'MEMBER_LEVEL_OWNER');
  static const MemberLevel MEMBER_LEVEL_ADMIN = MemberLevel._(1, _omitEnumNames ? '' : 'MEMBER_LEVEL_ADMIN');
  static const MemberLevel MEMBER_LEVEL_WRITER = MemberLevel._(2, _omitEnumNames ? '' : 'MEMBER_LEVEL_WRITER');
  static const MemberLevel MEMBER_LEVEL_READER = MemberLevel._(3, _omitEnumNames ? '' : 'MEMBER_LEVEL_READER');

  static const $core.List<MemberLevel> values = <MemberLevel> [
    MEMBER_LEVEL_OWNER,
    MEMBER_LEVEL_ADMIN,
    MEMBER_LEVEL_WRITER,
    MEMBER_LEVEL_READER,
  ];

  static final $core.Map<$core.int, MemberLevel> _byValue = $pb.ProtobufEnum.initByValue(values);
  static MemberLevel? valueOf($core.int value) => _byValue[value];

  const MemberLevel._($core.int v, $core.String n) : super(v, n);
}

class IconSizeType extends $pb.ProtobufEnum {
  static const IconSizeType Small = IconSizeType._(0, _omitEnumNames ? '' : 'Small');
  static const IconSizeType Large = IconSizeType._(1, _omitEnumNames ? '' : 'Large');

  static const $core.List<IconSizeType> values = <IconSizeType> [
    Small,
    Large,
  ];

  static final $core.Map<$core.int, IconSizeType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static IconSizeType? valueOf($core.int value) => _byValue[value];

  const IconSizeType._($core.int v, $core.String n) : super(v, n);
}

class Define extends $pb.ProtobufEnum {
  static const Define DEFINE_CALL_FLAG_VIDEO = Define._(2, _omitEnumNames ? '' : 'DEFINE_CALL_FLAG_VIDEO');
  static const Define DEFINE_CALL_FLAG_MODE = Define._(32768, _omitEnumNames ? '' : 'DEFINE_CALL_FLAG_MODE');
  static const Define DEFINE_CALL_FLAG_MIR = Define._(16384, _omitEnumNames ? '' : 'DEFINE_CALL_FLAG_MIR');
  static const Define DEFINE_CALL_FLAG_DEV = Define._(8192, _omitEnumNames ? '' : 'DEFINE_CALL_FLAG_DEV');

  static const $core.List<Define> values = <Define> [
    DEFINE_CALL_FLAG_VIDEO,
    DEFINE_CALL_FLAG_MODE,
    DEFINE_CALL_FLAG_MIR,
    DEFINE_CALL_FLAG_DEV,
  ];

  static final $core.Map<$core.int, Define> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Define? valueOf($core.int value) => _byValue[value];

  const Define._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');

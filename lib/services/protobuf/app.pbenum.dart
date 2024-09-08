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

import 'package:protobuf/protobuf.dart' as $pb;

class ServiceTypes extends $pb.ProtobufEnum {
  static const ServiceTypes taskIdOfEvent = ServiceTypes._(16777215, _omitEnumNames ? '' : 'taskIdOfEvent');
  static const ServiceTypes ignoreTaskId = ServiceTypes._(0, _omitEnumNames ? '' : 'ignoreTaskId');

  static const $core.List<ServiceTypes> values = <ServiceTypes> [
    taskIdOfEvent,
    ignoreTaskId,
  ];

  static final $core.Map<$core.int, ServiceTypes> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ServiceTypes? valueOf($core.int value) => _byValue[value];

  const ServiceTypes._($core.int v, $core.String n) : super(v, n);
}

class ApiEvent extends $pb.ProtobufEnum {
  static const ApiEvent AllMessagesReady = ApiEvent._(1, _omitEnumNames ? '' : 'AllMessagesReady');
  static const ApiEvent OnlineChanged = ApiEvent._(2, _omitEnumNames ? '' : 'OnlineChanged');
  static const ApiEvent ChatListChanged = ApiEvent._(3, _omitEnumNames ? '' : 'ChatListChanged');
  static const ApiEvent ChatRead = ApiEvent._(4, _omitEnumNames ? '' : 'ChatRead');
  static const ApiEvent ChatAdded = ApiEvent._(5, _omitEnumNames ? '' : 'ChatAdded');
  static const ApiEvent ChatRemoved = ApiEvent._(6, _omitEnumNames ? '' : 'ChatRemoved');
  static const ApiEvent CallEvent = ApiEvent._(7, _omitEnumNames ? '' : 'CallEvent');
  static const ApiEvent CallListChanged = ApiEvent._(8, _omitEnumNames ? '' : 'CallListChanged');
  static const ApiEvent ActiveCallHardwareChanged = ApiEvent._(26, _omitEnumNames ? '' : 'ActiveCallHardwareChanged');
  static const ApiEvent BookOnlineChanged = ApiEvent._(9, _omitEnumNames ? '' : 'BookOnlineChanged');
  static const ApiEvent BookListChanged = ApiEvent._(10, _omitEnumNames ? '' : 'BookListChanged');
  static const ApiEvent RegProfileListChanged = ApiEvent._(13, _omitEnumNames ? '' : 'RegProfileListChanged');
  static const ApiEvent RegStatusChanged = ApiEvent._(14, _omitEnumNames ? '' : 'RegStatusChanged');
  static const ApiEvent RegNetErrorChanged = ApiEvent._(16, _omitEnumNames ? '' : 'RegNetErrorChanged');
  static const ApiEvent UserInfoChanged = ApiEvent._(18, _omitEnumNames ? '' : 'UserInfoChanged');
  static const ApiEvent UpdateMsg = ApiEvent._(19, _omitEnumNames ? '' : 'UpdateMsg');
  static const ApiEvent NetErrorCode = ApiEvent._(21, _omitEnumNames ? '' : 'NetErrorCode');
  static const ApiEvent FilePart = ApiEvent._(30, _omitEnumNames ? '' : 'FilePart');
  static const ApiEvent MirrorCppLog = ApiEvent._(24, _omitEnumNames ? '' : 'MirrorCppLog');
  static const ApiEvent IconChanged = ApiEvent._(25, _omitEnumNames ? '' : 'IconChanged');
  static const ApiEvent DebugCount = ApiEvent._(31, _omitEnumNames ? '' : 'DebugCount');
  static const ApiEvent OnLocalMsgNotification = ApiEvent._(28, _omitEnumNames ? '' : 'OnLocalMsgNotification');
  static const ApiEvent OnLocalCallNotification = ApiEvent._(29, _omitEnumNames ? '' : 'OnLocalCallNotification');
  static const ApiEvent MissedCallCountChanged = ApiEvent._(32, _omitEnumNames ? '' : 'MissedCallCountChanged');

  static const $core.List<ApiEvent> values = <ApiEvent> [
    AllMessagesReady,
    OnlineChanged,
    ChatListChanged,
    ChatRead,
    ChatAdded,
    ChatRemoved,
    CallEvent,
    CallListChanged,
    ActiveCallHardwareChanged,
    BookOnlineChanged,
    BookListChanged,
    RegProfileListChanged,
    RegStatusChanged,
    RegNetErrorChanged,
    UserInfoChanged,
    UpdateMsg,
    NetErrorCode,
    FilePart,
    MirrorCppLog,
    IconChanged,
    DebugCount,
    OnLocalMsgNotification,
    OnLocalCallNotification,
    MissedCallCountChanged,
  ];

  static final $core.Map<$core.int, ApiEvent> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ApiEvent? valueOf($core.int value) => _byValue[value];

  const ApiEvent._($core.int v, $core.String n) : super(v, n);
}

class OnlineStatus extends $pb.ProtobufEnum {
  static const OnlineStatus Connecting = OnlineStatus._(0, _omitEnumNames ? '' : 'Connecting');
  static const OnlineStatus Connected = OnlineStatus._(1, _omitEnumNames ? '' : 'Connected');
  static const OnlineStatus Error = OnlineStatus._(3, _omitEnumNames ? '' : 'Error');
  static const OnlineStatus Disconnected = OnlineStatus._(4, _omitEnumNames ? '' : 'Disconnected');

  static const $core.List<OnlineStatus> values = <OnlineStatus> [
    Connecting,
    Connected,
    Error,
    Disconnected,
  ];

  static final $core.Map<$core.int, OnlineStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static OnlineStatus? valueOf($core.int value) => _byValue[value];

  const OnlineStatus._($core.int v, $core.String n) : super(v, n);
}

class ActiveCallVideoType extends $pb.ProtobufEnum {
  static const ActiveCallVideoType Idle = ActiveCallVideoType._(0, _omitEnumNames ? '' : 'Idle');
  static const ActiveCallVideoType Camera1 = ActiveCallVideoType._(1, _omitEnumNames ? '' : 'Camera1');
  static const ActiveCallVideoType Camera2 = ActiveCallVideoType._(2, _omitEnumNames ? '' : 'Camera2');
  static const ActiveCallVideoType Screen = ActiveCallVideoType._(3, _omitEnumNames ? '' : 'Screen');

  static const $core.List<ActiveCallVideoType> values = <ActiveCallVideoType> [
    Idle,
    Camera1,
    Camera2,
    Screen,
  ];

  static final $core.Map<$core.int, ActiveCallVideoType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ActiveCallVideoType? valueOf($core.int value) => _byValue[value];

  const ActiveCallVideoType._($core.int v, $core.String n) : super(v, n);
}

class AudioCommandType extends $pb.ProtobufEnum {
  static const AudioCommandType START_CALL_MONITOR = AudioCommandType._(0, _omitEnumNames ? '' : 'START_CALL_MONITOR');
  static const AudioCommandType STOP_CALL_MONITOR = AudioCommandType._(1, _omitEnumNames ? '' : 'STOP_CALL_MONITOR');
  static const AudioCommandType SWITCH_TO_SPEAKERS = AudioCommandType._(3, _omitEnumNames ? '' : 'SWITCH_TO_SPEAKERS');
  static const AudioCommandType SWITCH_TO_VOICE = AudioCommandType._(4, _omitEnumNames ? '' : 'SWITCH_TO_VOICE');
  static const AudioCommandType MUTE = AudioCommandType._(5, _omitEnumNames ? '' : 'MUTE');
  static const AudioCommandType UNMUTE = AudioCommandType._(6, _omitEnumNames ? '' : 'UNMUTE');
  static const AudioCommandType START_VIDEO_RECEIVER = AudioCommandType._(7, _omitEnumNames ? '' : 'START_VIDEO_RECEIVER');
  static const AudioCommandType STOP_VIDEO_RECEIVER = AudioCommandType._(8, _omitEnumNames ? '' : 'STOP_VIDEO_RECEIVER');
  static const AudioCommandType START_VIDEO_SENDER = AudioCommandType._(9, _omitEnumNames ? '' : 'START_VIDEO_SENDER');
  static const AudioCommandType STOP_VIDEO_SENDER = AudioCommandType._(10, _omitEnumNames ? '' : 'STOP_VIDEO_SENDER');
  static const AudioCommandType VIDEO_GET_CONFIG = AudioCommandType._(11, _omitEnumNames ? '' : 'VIDEO_GET_CONFIG');
  static const AudioCommandType GET_VIDEO_SOURCE_SIZE = AudioCommandType._(12, _omitEnumNames ? '' : 'GET_VIDEO_SOURCE_SIZE');
  static const AudioCommandType FORCE_ACTIVE_CALL_HARDWARE_STATUS_CHANGED = AudioCommandType._(13, _omitEnumNames ? '' : 'FORCE_ACTIVE_CALL_HARDWARE_STATUS_CHANGED');

  static const $core.List<AudioCommandType> values = <AudioCommandType> [
    START_CALL_MONITOR,
    STOP_CALL_MONITOR,
    SWITCH_TO_SPEAKERS,
    SWITCH_TO_VOICE,
    MUTE,
    UNMUTE,
    START_VIDEO_RECEIVER,
    STOP_VIDEO_RECEIVER,
    START_VIDEO_SENDER,
    STOP_VIDEO_SENDER,
    VIDEO_GET_CONFIG,
    GET_VIDEO_SOURCE_SIZE,
    FORCE_ACTIVE_CALL_HARDWARE_STATUS_CHANGED,
  ];

  static final $core.Map<$core.int, AudioCommandType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AudioCommandType? valueOf($core.int value) => _byValue[value];

  const AudioCommandType._($core.int v, $core.String n) : super(v, n);
}

class VideoCodecType extends $pb.ProtobufEnum {
  static const VideoCodecType Codec3gp = VideoCodecType._(0, _omitEnumNames ? '' : 'Codec3gp');
  static const VideoCodecType CodecMP4 = VideoCodecType._(1, _omitEnumNames ? '' : 'CodecMP4');
  static const VideoCodecType CodecAVC = VideoCodecType._(2, _omitEnumNames ? '' : 'CodecAVC');
  static const VideoCodecType CodecHEVC = VideoCodecType._(3, _omitEnumNames ? '' : 'CodecHEVC');
  static const VideoCodecType CodecVP8 = VideoCodecType._(4, _omitEnumNames ? '' : 'CodecVP8');
  static const VideoCodecType CodecVP9 = VideoCodecType._(5, _omitEnumNames ? '' : 'CodecVP9');

  static const $core.List<VideoCodecType> values = <VideoCodecType> [
    Codec3gp,
    CodecMP4,
    CodecAVC,
    CodecHEVC,
    CodecVP8,
    CodecVP9,
  ];

  static final $core.Map<$core.int, VideoCodecType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static VideoCodecType? valueOf($core.int value) => _byValue[value];

  const VideoCodecType._($core.int v, $core.String n) : super(v, n);
}

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

class ServiceCmdType extends $pb.ProtobufEnum {
  static const ServiceCmdType CHECK_STATE = ServiceCmdType._(0, _omitEnumNames ? '' : 'CHECK_STATE');
  static const ServiceCmdType REINIT_REG = ServiceCmdType._(2, _omitEnumNames ? '' : 'REINIT_REG');
  static const ServiceCmdType INIT_UPDATE = ServiceCmdType._(3, _omitEnumNames ? '' : 'INIT_UPDATE');
  static const ServiceCmdType CHECK_FOR_UPDATE = ServiceCmdType._(4, _omitEnumNames ? '' : 'CHECK_FOR_UPDATE');
  static const ServiceCmdType APPLY_UPDATE_WITH_RESTART = ServiceCmdType._(5, _omitEnumNames ? '' : 'APPLY_UPDATE_WITH_RESTART');
  static const ServiceCmdType GET_SCREEN_DPI = ServiceCmdType._(6, _omitEnumNames ? '' : 'GET_SCREEN_DPI');
  static const ServiceCmdType CLEAR_NOTIFICATIONS = ServiceCmdType._(7, _omitEnumNames ? '' : 'CLEAR_NOTIFICATIONS');
  static const ServiceCmdType NOTIFICATIONS_ADD_FILTER = ServiceCmdType._(8, _omitEnumNames ? '' : 'NOTIFICATIONS_ADD_FILTER');
  static const ServiceCmdType NOTIFICATIONS_CLEAR_FILTER = ServiceCmdType._(9, _omitEnumNames ? '' : 'NOTIFICATIONS_CLEAR_FILTER');

  static const $core.List<ServiceCmdType> values = <ServiceCmdType> [
    CHECK_STATE,
    REINIT_REG,
    INIT_UPDATE,
    CHECK_FOR_UPDATE,
    APPLY_UPDATE_WITH_RESTART,
    GET_SCREEN_DPI,
    CLEAR_NOTIFICATIONS,
    NOTIFICATIONS_ADD_FILTER,
    NOTIFICATIONS_CLEAR_FILTER,
  ];

  static final $core.Map<$core.int, ServiceCmdType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ServiceCmdType? valueOf($core.int value) => _byValue[value];

  const ServiceCmdType._($core.int v, $core.String n) : super(v, n);
}

class NotificationType extends $pb.ProtobufEnum {
  static const NotificationType APP_STATUS = NotificationType._(0, _omitEnumNames ? '' : 'APP_STATUS');
  static const NotificationType EVENTS_IN_LIST = NotificationType._(1, _omitEnumNames ? '' : 'EVENTS_IN_LIST');
  static const NotificationType EVENTS_TEXT = NotificationType._(2, _omitEnumNames ? '' : 'EVENTS_TEXT');

  static const $core.List<NotificationType> values = <NotificationType> [
    APP_STATUS,
    EVENTS_IN_LIST,
    EVENTS_TEXT,
  ];

  static final $core.Map<$core.int, NotificationType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static NotificationType? valueOf($core.int value) => _byValue[value];

  const NotificationType._($core.int v, $core.String n) : super(v, n);
}

class AndroidFlag extends $pb.ProtobufEnum {
  static const AndroidFlag FLAG_START_FROM_NOTIFICATION_MAIN = AndroidFlag._(10, _omitEnumNames ? '' : 'FLAG_START_FROM_NOTIFICATION_MAIN');
  static const AndroidFlag FLAG_START_FROM_NOTIFICATION_CHAT = AndroidFlag._(11, _omitEnumNames ? '' : 'FLAG_START_FROM_NOTIFICATION_CHAT');
  static const AndroidFlag FLAG_START_FROM_NOTIFICATION_MARK_CHAT_READ = AndroidFlag._(12, _omitEnumNames ? '' : 'FLAG_START_FROM_NOTIFICATION_MARK_CHAT_READ');
  static const AndroidFlag FLAG_START_FROM_NOTIFICATION_CALL_HISTORY = AndroidFlag._(16, _omitEnumNames ? '' : 'FLAG_START_FROM_NOTIFICATION_CALL_HISTORY');
  static const AndroidFlag FLAG_ANSWER_CALL = AndroidFlag._(13, _omitEnumNames ? '' : 'FLAG_ANSWER_CALL');
  static const AndroidFlag FLAG_DECLINE_CALL = AndroidFlag._(14, _omitEnumNames ? '' : 'FLAG_DECLINE_CALL');
  static const AndroidFlag FLAG_SHOW_CALL = AndroidFlag._(15, _omitEnumNames ? '' : 'FLAG_SHOW_CALL');

  static const $core.List<AndroidFlag> values = <AndroidFlag> [
    FLAG_START_FROM_NOTIFICATION_MAIN,
    FLAG_START_FROM_NOTIFICATION_CHAT,
    FLAG_START_FROM_NOTIFICATION_MARK_CHAT_READ,
    FLAG_START_FROM_NOTIFICATION_CALL_HISTORY,
    FLAG_ANSWER_CALL,
    FLAG_DECLINE_CALL,
    FLAG_SHOW_CALL,
  ];

  static final $core.Map<$core.int, AndroidFlag> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AndroidFlag? valueOf($core.int value) => _byValue[value];

  const AndroidFlag._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');

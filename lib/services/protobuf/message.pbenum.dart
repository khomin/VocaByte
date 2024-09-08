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

import 'package:protobuf/protobuf.dart' as $pb;

class CHAT_EVENT extends $pb.ProtobufEnum {
  static const CHAT_EVENT CHEV_CREATE = CHAT_EVENT._(1, _omitEnumNames ? '' : 'CHEV_CREATE');
  static const CHAT_EVENT CHEV_ADDMBR = CHAT_EVENT._(2, _omitEnumNames ? '' : 'CHEV_ADDMBR');
  static const CHAT_EVENT CHEV_DELMBR = CHAT_EVENT._(3, _omitEnumNames ? '' : 'CHEV_DELMBR');
  static const CHAT_EVENT CHEV_CNGMBR = CHAT_EVENT._(4, _omitEnumNames ? '' : 'CHEV_CNGMBR');
  static const CHAT_EVENT CHEV_CNGNAME = CHAT_EVENT._(5, _omitEnumNames ? '' : 'CHEV_CNGNAME');
  static const CHAT_EVENT CHEV_CNGIMG = CHAT_EVENT._(6, _omitEnumNames ? '' : 'CHEV_CNGIMG');

  static const $core.List<CHAT_EVENT> values = <CHAT_EVENT> [
    CHEV_CREATE,
    CHEV_ADDMBR,
    CHEV_DELMBR,
    CHEV_CNGMBR,
    CHEV_CNGNAME,
    CHEV_CNGIMG,
  ];

  static final $core.Map<$core.int, CHAT_EVENT> _byValue = $pb.ProtobufEnum.initByValue(values);
  static CHAT_EVENT? valueOf($core.int value) => _byValue[value];

  const CHAT_EVENT._($core.int v, $core.String n) : super(v, n);
}

class GetMsgTypeReqType extends $pb.ProtobufEnum {
  static const GetMsgTypeReqType ID = GetMsgTypeReqType._(0, _omitEnumNames ? '' : 'ID');
  static const GetMsgTypeReqType TIME = GetMsgTypeReqType._(1, _omitEnumNames ? '' : 'TIME');
  static const GetMsgTypeReqType CACHED = GetMsgTypeReqType._(2, _omitEnumNames ? '' : 'CACHED');

  static const $core.List<GetMsgTypeReqType> values = <GetMsgTypeReqType> [
    ID,
    TIME,
    CACHED,
  ];

  static final $core.Map<$core.int, GetMsgTypeReqType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static GetMsgTypeReqType? valueOf($core.int value) => _byValue[value];

  const GetMsgTypeReqType._($core.int v, $core.String n) : super(v, n);
}

class MoveTo extends $pb.ProtobufEnum {
  static const MoveTo Up = MoveTo._(-1, _omitEnumNames ? '' : 'Up');
  static const MoveTo Down = MoveTo._(1, _omitEnumNames ? '' : 'Down');

  static const $core.List<MoveTo> values = <MoveTo> [
    Up,
    Down,
  ];

  static final $core.Map<$core.int, MoveTo> _byValue = $pb.ProtobufEnum.initByValue(values);
  static MoveTo? valueOf($core.int value) => _byValue[value];

  const MoveTo._($core.int v, $core.String n) : super(v, n);
}

class GetFileType extends $pb.ProtobufEnum {
  static const GetFileType FileToPath = GetFileType._(1, _omitEnumNames ? '' : 'FileToPath');
  static const GetFileType FileInMemory = GetFileType._(2, _omitEnumNames ? '' : 'FileInMemory');
  static const GetFileType Thumbnail = GetFileType._(3, _omitEnumNames ? '' : 'Thumbnail');

  static const $core.List<GetFileType> values = <GetFileType> [
    FileToPath,
    FileInMemory,
    Thumbnail,
  ];

  static final $core.Map<$core.int, GetFileType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static GetFileType? valueOf($core.int value) => _byValue[value];

  const GetFileType._($core.int v, $core.String n) : super(v, n);
}

class GetFileStateType extends $pb.ProtobufEnum {
  static const GetFileStateType FileStateSession = GetFileStateType._(0, _omitEnumNames ? '' : 'FileStateSession');
  static const GetFileStateType IsStorageFileLoaded = GetFileStateType._(1, _omitEnumNames ? '' : 'IsStorageFileLoaded');
  static const GetFileStateType IsStorageThumbnailLoaded = GetFileStateType._(2, _omitEnumNames ? '' : 'IsStorageThumbnailLoaded');

  static const $core.List<GetFileStateType> values = <GetFileStateType> [
    FileStateSession,
    IsStorageFileLoaded,
    IsStorageThumbnailLoaded,
  ];

  static final $core.Map<$core.int, GetFileStateType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static GetFileStateType? valueOf($core.int value) => _byValue[value];

  const GetFileStateType._($core.int v, $core.String n) : super(v, n);
}

class StorageState extends $pb.ProtobufEnum {
  static const StorageState FSTATE_WAIT = StorageState._(0, _omitEnumNames ? '' : 'FSTATE_WAIT');
  static const StorageState FSTATE_CONVERTING = StorageState._(1, _omitEnumNames ? '' : 'FSTATE_CONVERTING');
  static const StorageState FSTATE_PAUSED = StorageState._(2, _omitEnumNames ? '' : 'FSTATE_PAUSED');
  static const StorageState FSTATE_START = StorageState._(3, _omitEnumNames ? '' : 'FSTATE_START');
  static const StorageState FSTATE_RUN = StorageState._(4, _omitEnumNames ? '' : 'FSTATE_RUN');
  static const StorageState FSTATE_READY = StorageState._(5, _omitEnumNames ? '' : 'FSTATE_READY');
  static const StorageState FSTATE_CLOSED = StorageState._(6, _omitEnumNames ? '' : 'FSTATE_CLOSED');
  static const StorageState FSTATE_DELETED = StorageState._(7, _omitEnumNames ? '' : 'FSTATE_DELETED');
  static const StorageState FSTATE_FAIL = StorageState._(255, _omitEnumNames ? '' : 'FSTATE_FAIL');

  static const $core.List<StorageState> values = <StorageState> [
    FSTATE_WAIT,
    FSTATE_CONVERTING,
    FSTATE_PAUSED,
    FSTATE_START,
    FSTATE_RUN,
    FSTATE_READY,
    FSTATE_CLOSED,
    FSTATE_DELETED,
    FSTATE_FAIL,
  ];

  static final $core.Map<$core.int, StorageState> _byValue = $pb.ProtobufEnum.initByValue(values);
  static StorageState? valueOf($core.int value) => _byValue[value];

  const StorageState._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');

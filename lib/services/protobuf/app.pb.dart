// This is a generated file - do not edit.
//
// Generated from app.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class InitParams extends $pb.GeneratedMessage {
  factory InitParams({
    $core.String? localDir,
  }) {
    final result = create();
    if (localDir != null) result.localDir = localDir;
    return result;
  }

  InitParams._();

  factory InitParams.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InitParams.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InitParams',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'localDir')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InitParams clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InitParams copyWith(void Function(InitParams) updates) =>
      super.copyWith((message) => updates(message as InitParams)) as InitParams;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InitParams create() => InitParams._();
  @$core.override
  InitParams createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InitParams getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InitParams>(create);
  static InitParams? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get localDir => $_getSZ(0);
  @$pb.TagNumber(1)
  set localDir($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLocalDir() => $_has(0);
  @$pb.TagNumber(1)
  void clearLocalDir() => $_clearField(1);
}

class ReqRecentWords extends $pb.GeneratedMessage {
  factory ReqRecentWords({
    $core.String? desc,
    $core.String? version,
  }) {
    final result = create();
    if (desc != null) result.desc = desc;
    if (version != null) result.version = version;
    return result;
  }

  ReqRecentWords._();

  factory ReqRecentWords.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ReqRecentWords.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReqRecentWords',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'desc')
    ..aOS(2, _omitFieldNames ? '' : 'version')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReqRecentWords clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReqRecentWords copyWith(void Function(ReqRecentWords) updates) =>
      super.copyWith((message) => updates(message as ReqRecentWords))
          as ReqRecentWords;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReqRecentWords create() => ReqRecentWords._();
  @$core.override
  ReqRecentWords createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ReqRecentWords getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReqRecentWords>(create);
  static ReqRecentWords? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get desc => $_getSZ(0);
  @$pb.TagNumber(1)
  set desc($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDesc() => $_has(0);
  @$pb.TagNumber(1)
  void clearDesc() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get version => $_getSZ(1);
  @$pb.TagNumber(2)
  set version($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasVersion() => $_has(1);
  @$pb.TagNumber(2)
  void clearVersion() => $_clearField(2);
}

class RespRecentWords extends $pb.GeneratedMessage {
  factory RespRecentWords({
    $core.Iterable<$core.String>? word,
  }) {
    final result = create();
    if (word != null) result.word.addAll(word);
    return result;
  }

  RespRecentWords._();

  factory RespRecentWords.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RespRecentWords.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RespRecentWords',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'word')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RespRecentWords clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RespRecentWords copyWith(void Function(RespRecentWords) updates) =>
      super.copyWith((message) => updates(message as RespRecentWords))
          as RespRecentWords;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RespRecentWords create() => RespRecentWords._();
  @$core.override
  RespRecentWords createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RespRecentWords getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RespRecentWords>(create);
  static RespRecentWords? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get word => $_getList(0);
}

class ReqSearchWords extends $pb.GeneratedMessage {
  factory ReqSearchWords({
    $core.String? word,
    $core.bool? useLike,
  }) {
    final result = create();
    if (word != null) result.word = word;
    if (useLike != null) result.useLike = useLike;
    return result;
  }

  ReqSearchWords._();

  factory ReqSearchWords.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ReqSearchWords.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReqSearchWords',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'word')
    ..aOB(2, _omitFieldNames ? '' : 'useLike')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReqSearchWords clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReqSearchWords copyWith(void Function(ReqSearchWords) updates) =>
      super.copyWith((message) => updates(message as ReqSearchWords))
          as ReqSearchWords;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReqSearchWords create() => ReqSearchWords._();
  @$core.override
  ReqSearchWords createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ReqSearchWords getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReqSearchWords>(create);
  static ReqSearchWords? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get word => $_getSZ(0);
  @$pb.TagNumber(1)
  set word($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasWord() => $_has(0);
  @$pb.TagNumber(1)
  void clearWord() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get useLike => $_getBF(1);
  @$pb.TagNumber(2)
  set useLike($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUseLike() => $_has(1);
  @$pb.TagNumber(2)
  void clearUseLike() => $_clearField(2);
}

class RespSearchWords extends $pb.GeneratedMessage {
  factory RespSearchWords({
    $core.Iterable<Word>? item,
  }) {
    final result = create();
    if (item != null) result.item.addAll(item);
    return result;
  }

  RespSearchWords._();

  factory RespSearchWords.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RespSearchWords.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RespSearchWords',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
    ..pPM<Word>(1, _omitFieldNames ? '' : 'item', subBuilder: Word.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RespSearchWords clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RespSearchWords copyWith(void Function(RespSearchWords) updates) =>
      super.copyWith((message) => updates(message as RespSearchWords))
          as RespSearchWords;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RespSearchWords create() => RespSearchWords._();
  @$core.override
  RespSearchWords createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RespSearchWords getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RespSearchWords>(create);
  static RespSearchWords? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Word> get item => $_getList(0);
}

class ReqRandWords extends $pb.GeneratedMessage {
  factory ReqRandWords({
    $core.int? count,
  }) {
    final result = create();
    if (count != null) result.count = count;
    return result;
  }

  ReqRandWords._();

  factory ReqRandWords.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ReqRandWords.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReqRandWords',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'count', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReqRandWords clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReqRandWords copyWith(void Function(ReqRandWords) updates) =>
      super.copyWith((message) => updates(message as ReqRandWords))
          as ReqRandWords;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReqRandWords create() => ReqRandWords._();
  @$core.override
  ReqRandWords createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ReqRandWords getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReqRandWords>(create);
  static ReqRandWords? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get count => $_getIZ(0);
  @$pb.TagNumber(1)
  set count($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearCount() => $_clearField(1);
}

class RespRandWords extends $pb.GeneratedMessage {
  factory RespRandWords({
    $core.Iterable<Word>? words,
  }) {
    final result = create();
    if (words != null) result.words.addAll(words);
    return result;
  }

  RespRandWords._();

  factory RespRandWords.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RespRandWords.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RespRandWords',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
    ..pPM<Word>(1, _omitFieldNames ? '' : 'words', subBuilder: Word.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RespRandWords clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RespRandWords copyWith(void Function(RespRandWords) updates) =>
      super.copyWith((message) => updates(message as RespRandWords))
          as RespRandWords;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RespRandWords create() => RespRandWords._();
  @$core.override
  RespRandWords createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RespRandWords getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RespRandWords>(create);
  static RespRandWords? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Word> get words => $_getList(0);
}

class ReqWordInReview extends $pb.GeneratedMessage {
  factory ReqWordInReview({
    $core.String? word,
  }) {
    final result = create();
    if (word != null) result.word = word;
    return result;
  }

  ReqWordInReview._();

  factory ReqWordInReview.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ReqWordInReview.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReqWordInReview',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'word')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReqWordInReview clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReqWordInReview copyWith(void Function(ReqWordInReview) updates) =>
      super.copyWith((message) => updates(message as ReqWordInReview))
          as ReqWordInReview;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReqWordInReview create() => ReqWordInReview._();
  @$core.override
  ReqWordInReview createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ReqWordInReview getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReqWordInReview>(create);
  static ReqWordInReview? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get word => $_getSZ(0);
  @$pb.TagNumber(1)
  set word($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasWord() => $_has(0);
  @$pb.TagNumber(1)
  void clearWord() => $_clearField(1);
}

class WordInReview extends $pb.GeneratedMessage {
  factory WordInReview({
    $core.String? word,
    $core.int? successCount,
    $core.int? failCount,
    $fixnum.Int64? lastTmSuccess,
    $fixnum.Int64? lastTmFail,
    $fixnum.Int64? nextReviewTmMs,
    $core.String? meaningId,
  }) {
    final result = create();
    if (word != null) result.word = word;
    if (successCount != null) result.successCount = successCount;
    if (failCount != null) result.failCount = failCount;
    if (lastTmSuccess != null) result.lastTmSuccess = lastTmSuccess;
    if (lastTmFail != null) result.lastTmFail = lastTmFail;
    if (nextReviewTmMs != null) result.nextReviewTmMs = nextReviewTmMs;
    if (meaningId != null) result.meaningId = meaningId;
    return result;
  }

  WordInReview._();

  factory WordInReview.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WordInReview.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WordInReview',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'word')
    ..aI(2, _omitFieldNames ? '' : 'successCount',
        fieldType: $pb.PbFieldType.OU3)
    ..aI(3, _omitFieldNames ? '' : 'failCount', fieldType: $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(
        4, _omitFieldNames ? '' : 'lastTmSuccess', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        5, _omitFieldNames ? '' : 'lastTmFail', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        6, _omitFieldNames ? '' : 'nextReviewTmMs', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(7, _omitFieldNames ? '' : 'meaningId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WordInReview clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WordInReview copyWith(void Function(WordInReview) updates) =>
      super.copyWith((message) => updates(message as WordInReview))
          as WordInReview;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WordInReview create() => WordInReview._();
  @$core.override
  WordInReview createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static WordInReview getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WordInReview>(create);
  static WordInReview? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get word => $_getSZ(0);
  @$pb.TagNumber(1)
  set word($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasWord() => $_has(0);
  @$pb.TagNumber(1)
  void clearWord() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get successCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set successCount($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSuccessCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearSuccessCount() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get failCount => $_getIZ(2);
  @$pb.TagNumber(3)
  set failCount($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFailCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearFailCount() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get lastTmSuccess => $_getI64(3);
  @$pb.TagNumber(4)
  set lastTmSuccess($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLastTmSuccess() => $_has(3);
  @$pb.TagNumber(4)
  void clearLastTmSuccess() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get lastTmFail => $_getI64(4);
  @$pb.TagNumber(5)
  set lastTmFail($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasLastTmFail() => $_has(4);
  @$pb.TagNumber(5)
  void clearLastTmFail() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get nextReviewTmMs => $_getI64(5);
  @$pb.TagNumber(6)
  set nextReviewTmMs($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasNextReviewTmMs() => $_has(5);
  @$pb.TagNumber(6)
  void clearNextReviewTmMs() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get meaningId => $_getSZ(6);
  @$pb.TagNumber(7)
  set meaningId($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasMeaningId() => $_has(6);
  @$pb.TagNumber(7)
  void clearMeaningId() => $_clearField(7);
}

class ReqAddWordInReview extends $pb.GeneratedMessage {
  factory ReqAddWordInReview({
    $core.String? word,
    $core.bool? useExtraFields,
    $core.int? successCount,
    $core.int? failCount,
    $fixnum.Int64? lastTmSuccess,
    $fixnum.Int64? lastTmFail,
    $fixnum.Int64? nextReviewTmMs,
    $core.String? meaningId,
  }) {
    final result = create();
    if (word != null) result.word = word;
    if (useExtraFields != null) result.useExtraFields = useExtraFields;
    if (successCount != null) result.successCount = successCount;
    if (failCount != null) result.failCount = failCount;
    if (lastTmSuccess != null) result.lastTmSuccess = lastTmSuccess;
    if (lastTmFail != null) result.lastTmFail = lastTmFail;
    if (nextReviewTmMs != null) result.nextReviewTmMs = nextReviewTmMs;
    if (meaningId != null) result.meaningId = meaningId;
    return result;
  }

  ReqAddWordInReview._();

  factory ReqAddWordInReview.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ReqAddWordInReview.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReqAddWordInReview',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'word')
    ..aOB(2, _omitFieldNames ? '' : 'useExtraFields')
    ..aI(3, _omitFieldNames ? '' : 'successCount',
        fieldType: $pb.PbFieldType.OU3)
    ..aI(4, _omitFieldNames ? '' : 'failCount', fieldType: $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(
        5, _omitFieldNames ? '' : 'lastTmSuccess', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        6, _omitFieldNames ? '' : 'lastTmFail', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        7, _omitFieldNames ? '' : 'nextReviewTmMs', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(8, _omitFieldNames ? '' : 'meaningId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReqAddWordInReview clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReqAddWordInReview copyWith(void Function(ReqAddWordInReview) updates) =>
      super.copyWith((message) => updates(message as ReqAddWordInReview))
          as ReqAddWordInReview;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReqAddWordInReview create() => ReqAddWordInReview._();
  @$core.override
  ReqAddWordInReview createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ReqAddWordInReview getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReqAddWordInReview>(create);
  static ReqAddWordInReview? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get word => $_getSZ(0);
  @$pb.TagNumber(1)
  set word($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasWord() => $_has(0);
  @$pb.TagNumber(1)
  void clearWord() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get useExtraFields => $_getBF(1);
  @$pb.TagNumber(2)
  set useExtraFields($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUseExtraFields() => $_has(1);
  @$pb.TagNumber(2)
  void clearUseExtraFields() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get successCount => $_getIZ(2);
  @$pb.TagNumber(3)
  set successCount($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSuccessCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearSuccessCount() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get failCount => $_getIZ(3);
  @$pb.TagNumber(4)
  set failCount($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasFailCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearFailCount() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get lastTmSuccess => $_getI64(4);
  @$pb.TagNumber(5)
  set lastTmSuccess($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasLastTmSuccess() => $_has(4);
  @$pb.TagNumber(5)
  void clearLastTmSuccess() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get lastTmFail => $_getI64(5);
  @$pb.TagNumber(6)
  set lastTmFail($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasLastTmFail() => $_has(5);
  @$pb.TagNumber(6)
  void clearLastTmFail() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get nextReviewTmMs => $_getI64(6);
  @$pb.TagNumber(7)
  set nextReviewTmMs($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasNextReviewTmMs() => $_has(6);
  @$pb.TagNumber(7)
  void clearNextReviewTmMs() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get meaningId => $_getSZ(7);
  @$pb.TagNumber(8)
  set meaningId($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasMeaningId() => $_has(7);
  @$pb.TagNumber(8)
  void clearMeaningId() => $_clearField(8);
}

class RespAddWordInCurrent extends $pb.GeneratedMessage {
  factory RespAddWordInCurrent() => create();

  RespAddWordInCurrent._();

  factory RespAddWordInCurrent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RespAddWordInCurrent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RespAddWordInCurrent',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RespAddWordInCurrent clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RespAddWordInCurrent copyWith(void Function(RespAddWordInCurrent) updates) =>
      super.copyWith((message) => updates(message as RespAddWordInCurrent))
          as RespAddWordInCurrent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RespAddWordInCurrent create() => RespAddWordInCurrent._();
  @$core.override
  RespAddWordInCurrent createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RespAddWordInCurrent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RespAddWordInCurrent>(create);
  static RespAddWordInCurrent? _defaultInstance;
}

class ReqRemoveWordFromCurrent extends $pb.GeneratedMessage {
  factory ReqRemoveWordFromCurrent({
    $core.String? word,
  }) {
    final result = create();
    if (word != null) result.word = word;
    return result;
  }

  ReqRemoveWordFromCurrent._();

  factory ReqRemoveWordFromCurrent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ReqRemoveWordFromCurrent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReqRemoveWordFromCurrent',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'word')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReqRemoveWordFromCurrent clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReqRemoveWordFromCurrent copyWith(
          void Function(ReqRemoveWordFromCurrent) updates) =>
      super.copyWith((message) => updates(message as ReqRemoveWordFromCurrent))
          as ReqRemoveWordFromCurrent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReqRemoveWordFromCurrent create() => ReqRemoveWordFromCurrent._();
  @$core.override
  ReqRemoveWordFromCurrent createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ReqRemoveWordFromCurrent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReqRemoveWordFromCurrent>(create);
  static ReqRemoveWordFromCurrent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get word => $_getSZ(0);
  @$pb.TagNumber(1)
  set word($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasWord() => $_has(0);
  @$pb.TagNumber(1)
  void clearWord() => $_clearField(1);
}

class RespRemoveWordFromCurrent extends $pb.GeneratedMessage {
  factory RespRemoveWordFromCurrent() => create();

  RespRemoveWordFromCurrent._();

  factory RespRemoveWordFromCurrent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RespRemoveWordFromCurrent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RespRemoveWordFromCurrent',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RespRemoveWordFromCurrent clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RespRemoveWordFromCurrent copyWith(
          void Function(RespRemoveWordFromCurrent) updates) =>
      super.copyWith((message) => updates(message as RespRemoveWordFromCurrent))
          as RespRemoveWordFromCurrent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RespRemoveWordFromCurrent create() => RespRemoveWordFromCurrent._();
  @$core.override
  RespRemoveWordFromCurrent createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RespRemoveWordFromCurrent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RespRemoveWordFromCurrent>(create);
  static RespRemoveWordFromCurrent? _defaultInstance;
}

class ReqUpdateWordInCurrent extends $pb.GeneratedMessage {
  factory ReqUpdateWordInCurrent({
    $core.String? word,
    $core.int? successCount,
    $core.int? failCount,
    $fixnum.Int64? lastTmSuccess,
    $fixnum.Int64? lastTmFail,
    $fixnum.Int64? nextReviewTmMs,
    $core.String? meaningId,
  }) {
    final result = create();
    if (word != null) result.word = word;
    if (successCount != null) result.successCount = successCount;
    if (failCount != null) result.failCount = failCount;
    if (lastTmSuccess != null) result.lastTmSuccess = lastTmSuccess;
    if (lastTmFail != null) result.lastTmFail = lastTmFail;
    if (nextReviewTmMs != null) result.nextReviewTmMs = nextReviewTmMs;
    if (meaningId != null) result.meaningId = meaningId;
    return result;
  }

  ReqUpdateWordInCurrent._();

  factory ReqUpdateWordInCurrent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ReqUpdateWordInCurrent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReqUpdateWordInCurrent',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'word')
    ..aI(2, _omitFieldNames ? '' : 'successCount',
        fieldType: $pb.PbFieldType.OU3)
    ..aI(3, _omitFieldNames ? '' : 'failCount', fieldType: $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(
        4, _omitFieldNames ? '' : 'lastTmSuccess', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        5, _omitFieldNames ? '' : 'lastTmFail', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        6, _omitFieldNames ? '' : 'nextReviewTmMs', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(7, _omitFieldNames ? '' : 'meaningId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReqUpdateWordInCurrent clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReqUpdateWordInCurrent copyWith(
          void Function(ReqUpdateWordInCurrent) updates) =>
      super.copyWith((message) => updates(message as ReqUpdateWordInCurrent))
          as ReqUpdateWordInCurrent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReqUpdateWordInCurrent create() => ReqUpdateWordInCurrent._();
  @$core.override
  ReqUpdateWordInCurrent createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ReqUpdateWordInCurrent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReqUpdateWordInCurrent>(create);
  static ReqUpdateWordInCurrent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get word => $_getSZ(0);
  @$pb.TagNumber(1)
  set word($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasWord() => $_has(0);
  @$pb.TagNumber(1)
  void clearWord() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get successCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set successCount($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSuccessCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearSuccessCount() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get failCount => $_getIZ(2);
  @$pb.TagNumber(3)
  set failCount($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFailCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearFailCount() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get lastTmSuccess => $_getI64(3);
  @$pb.TagNumber(4)
  set lastTmSuccess($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLastTmSuccess() => $_has(3);
  @$pb.TagNumber(4)
  void clearLastTmSuccess() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get lastTmFail => $_getI64(4);
  @$pb.TagNumber(5)
  set lastTmFail($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasLastTmFail() => $_has(4);
  @$pb.TagNumber(5)
  void clearLastTmFail() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get nextReviewTmMs => $_getI64(5);
  @$pb.TagNumber(6)
  set nextReviewTmMs($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasNextReviewTmMs() => $_has(5);
  @$pb.TagNumber(6)
  void clearNextReviewTmMs() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get meaningId => $_getSZ(6);
  @$pb.TagNumber(7)
  set meaningId($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasMeaningId() => $_has(6);
  @$pb.TagNumber(7)
  void clearMeaningId() => $_clearField(7);
}

class RespUpdateWordInCurrent extends $pb.GeneratedMessage {
  factory RespUpdateWordInCurrent() => create();

  RespUpdateWordInCurrent._();

  factory RespUpdateWordInCurrent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RespUpdateWordInCurrent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RespUpdateWordInCurrent',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RespUpdateWordInCurrent clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RespUpdateWordInCurrent copyWith(
          void Function(RespUpdateWordInCurrent) updates) =>
      super.copyWith((message) => updates(message as RespUpdateWordInCurrent))
          as RespUpdateWordInCurrent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RespUpdateWordInCurrent create() => RespUpdateWordInCurrent._();
  @$core.override
  RespUpdateWordInCurrent createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RespUpdateWordInCurrent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RespUpdateWordInCurrent>(create);
  static RespUpdateWordInCurrent? _defaultInstance;
}

class Word extends $pb.GeneratedMessage {
  factory Word({
    $core.String? value,
    $fixnum.Int64? frequency,
    $core.String? json,
    $core.String? transcript,
  }) {
    final result = create();
    if (value != null) result.value = value;
    if (frequency != null) result.frequency = frequency;
    if (json != null) result.json = json;
    if (transcript != null) result.transcript = transcript;
    return result;
  }

  Word._();

  factory Word.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Word.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Word',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'value')
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'frequency', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(3, _omitFieldNames ? '' : 'json')
    ..aOS(4, _omitFieldNames ? '' : 'transcript')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Word clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Word copyWith(void Function(Word) updates) =>
      super.copyWith((message) => updates(message as Word)) as Word;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Word create() => Word._();
  @$core.override
  Word createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Word getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Word>(create);
  static Word? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get value => $_getSZ(0);
  @$pb.TagNumber(1)
  set value($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get frequency => $_getI64(1);
  @$pb.TagNumber(2)
  set frequency($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFrequency() => $_has(1);
  @$pb.TagNumber(2)
  void clearFrequency() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get json => $_getSZ(2);
  @$pb.TagNumber(3)
  set json($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasJson() => $_has(2);
  @$pb.TagNumber(3)
  void clearJson() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get transcript => $_getSZ(3);
  @$pb.TagNumber(4)
  set transcript($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTranscript() => $_has(3);
  @$pb.TagNumber(4)
  void clearTranscript() => $_clearField(4);
}

class ReqReviewForToday extends $pb.GeneratedMessage {
  factory ReqReviewForToday({
    $fixnum.Int64? now,
  }) {
    final result = create();
    if (now != null) result.now = now;
    return result;
  }

  ReqReviewForToday._();

  factory ReqReviewForToday.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ReqReviewForToday.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReqReviewForToday',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'now', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReqReviewForToday clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReqReviewForToday copyWith(void Function(ReqReviewForToday) updates) =>
      super.copyWith((message) => updates(message as ReqReviewForToday))
          as ReqReviewForToday;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReqReviewForToday create() => ReqReviewForToday._();
  @$core.override
  ReqReviewForToday createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ReqReviewForToday getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReqReviewForToday>(create);
  static ReqReviewForToday? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get now => $_getI64(0);
  @$pb.TagNumber(1)
  set now($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasNow() => $_has(0);
  @$pb.TagNumber(1)
  void clearNow() => $_clearField(1);
}

class RespReviewForToday extends $pb.GeneratedMessage {
  factory RespReviewForToday({
    $core.Iterable<WordInReview>? firstNWord,
    $core.int? countAll,
  }) {
    final result = create();
    if (firstNWord != null) result.firstNWord.addAll(firstNWord);
    if (countAll != null) result.countAll = countAll;
    return result;
  }

  RespReviewForToday._();

  factory RespReviewForToday.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RespReviewForToday.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RespReviewForToday',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
    ..pPM<WordInReview>(1, _omitFieldNames ? '' : 'firstNWord',
        subBuilder: WordInReview.create)
    ..aI(2, _omitFieldNames ? '' : 'countAll', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RespReviewForToday clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RespReviewForToday copyWith(void Function(RespReviewForToday) updates) =>
      super.copyWith((message) => updates(message as RespReviewForToday))
          as RespReviewForToday;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RespReviewForToday create() => RespReviewForToday._();
  @$core.override
  RespReviewForToday createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RespReviewForToday getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RespReviewForToday>(create);
  static RespReviewForToday? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<WordInReview> get firstNWord => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get countAll => $_getIZ(1);
  @$pb.TagNumber(2)
  set countAll($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCountAll() => $_has(1);
  @$pb.TagNumber(2)
  void clearCountAll() => $_clearField(2);
}

class ReqSearchInReviewList extends $pb.GeneratedMessage {
  factory ReqSearchInReviewList({
    $core.int? limit,
    $core.int? offset,
    $core.int? useSuccessCount,
  }) {
    final result = create();
    if (limit != null) result.limit = limit;
    if (offset != null) result.offset = offset;
    if (useSuccessCount != null) result.useSuccessCount = useSuccessCount;
    return result;
  }

  ReqSearchInReviewList._();

  factory ReqSearchInReviewList.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ReqSearchInReviewList.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReqSearchInReviewList',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'limit', fieldType: $pb.PbFieldType.OU3)
    ..aI(2, _omitFieldNames ? '' : 'offset', fieldType: $pb.PbFieldType.OU3)
    ..aI(3, _omitFieldNames ? '' : 'useSuccessCount',
        fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReqSearchInReviewList clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReqSearchInReviewList copyWith(
          void Function(ReqSearchInReviewList) updates) =>
      super.copyWith((message) => updates(message as ReqSearchInReviewList))
          as ReqSearchInReviewList;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReqSearchInReviewList create() => ReqSearchInReviewList._();
  @$core.override
  ReqSearchInReviewList createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ReqSearchInReviewList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReqSearchInReviewList>(create);
  static ReqSearchInReviewList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get limit => $_getIZ(0);
  @$pb.TagNumber(1)
  set limit($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLimit() => $_has(0);
  @$pb.TagNumber(1)
  void clearLimit() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get offset => $_getIZ(1);
  @$pb.TagNumber(2)
  set offset($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOffset() => $_has(1);
  @$pb.TagNumber(2)
  void clearOffset() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get useSuccessCount => $_getIZ(2);
  @$pb.TagNumber(3)
  set useSuccessCount($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUseSuccessCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearUseSuccessCount() => $_clearField(3);
}

class RespSearchInReviewList extends $pb.GeneratedMessage {
  factory RespSearchInReviewList({
    $core.Iterable<WordInReview>? word,
  }) {
    final result = create();
    if (word != null) result.word.addAll(word);
    return result;
  }

  RespSearchInReviewList._();

  factory RespSearchInReviewList.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RespSearchInReviewList.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RespSearchInReviewList',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
    ..pPM<WordInReview>(1, _omitFieldNames ? '' : 'word',
        subBuilder: WordInReview.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RespSearchInReviewList clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RespSearchInReviewList copyWith(
          void Function(RespSearchInReviewList) updates) =>
      super.copyWith((message) => updates(message as RespSearchInReviewList))
          as RespSearchInReviewList;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RespSearchInReviewList create() => RespSearchInReviewList._();
  @$core.override
  RespSearchInReviewList createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RespSearchInReviewList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RespSearchInReviewList>(create);
  static RespSearchInReviewList? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<WordInReview> get word => $_getList(0);
}

class ReqDeleteProfile extends $pb.GeneratedMessage {
  factory ReqDeleteProfile() => create();

  ReqDeleteProfile._();

  factory ReqDeleteProfile.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ReqDeleteProfile.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReqDeleteProfile',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReqDeleteProfile clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReqDeleteProfile copyWith(void Function(ReqDeleteProfile) updates) =>
      super.copyWith((message) => updates(message as ReqDeleteProfile))
          as ReqDeleteProfile;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReqDeleteProfile create() => ReqDeleteProfile._();
  @$core.override
  ReqDeleteProfile createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ReqDeleteProfile getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReqDeleteProfile>(create);
  static ReqDeleteProfile? _defaultInstance;
}

class RespDeleteProfile extends $pb.GeneratedMessage {
  factory RespDeleteProfile() => create();

  RespDeleteProfile._();

  factory RespDeleteProfile.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RespDeleteProfile.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RespDeleteProfile',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RespDeleteProfile clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RespDeleteProfile copyWith(void Function(RespDeleteProfile) updates) =>
      super.copyWith((message) => updates(message as RespDeleteProfile))
          as RespDeleteProfile;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RespDeleteProfile create() => RespDeleteProfile._();
  @$core.override
  RespDeleteProfile createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RespDeleteProfile getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RespDeleteProfile>(create);
  static RespDeleteProfile? _defaultInstance;
}

class ReqSentences extends $pb.GeneratedMessage {
  factory ReqSentences({
    $core.String? word,
    $core.int? limit,
    $core.int? offset,
  }) {
    final result = create();
    if (word != null) result.word = word;
    if (limit != null) result.limit = limit;
    if (offset != null) result.offset = offset;
    return result;
  }

  ReqSentences._();

  factory ReqSentences.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ReqSentences.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReqSentences',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'word')
    ..aI(2, _omitFieldNames ? '' : 'limit', fieldType: $pb.PbFieldType.OU3)
    ..aI(3, _omitFieldNames ? '' : 'offset', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReqSentences clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReqSentences copyWith(void Function(ReqSentences) updates) =>
      super.copyWith((message) => updates(message as ReqSentences))
          as ReqSentences;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReqSentences create() => ReqSentences._();
  @$core.override
  ReqSentences createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ReqSentences getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReqSentences>(create);
  static ReqSentences? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get word => $_getSZ(0);
  @$pb.TagNumber(1)
  set word($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasWord() => $_has(0);
  @$pb.TagNumber(1)
  void clearWord() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get limit => $_getIZ(1);
  @$pb.TagNumber(2)
  set limit($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLimit() => $_has(1);
  @$pb.TagNumber(2)
  void clearLimit() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get offset => $_getIZ(2);
  @$pb.TagNumber(3)
  set offset($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasOffset() => $_has(2);
  @$pb.TagNumber(3)
  void clearOffset() => $_clearField(3);
}

class GetReviewLimitOut extends $pb.GeneratedMessage {
  factory GetReviewLimitOut({
    $core.bool? limit,
  }) {
    final result = create();
    if (limit != null) result.limit = limit;
    return result;
  }

  GetReviewLimitOut._();

  factory GetReviewLimitOut.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetReviewLimitOut.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetReviewLimitOut',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'limit')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetReviewLimitOut clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetReviewLimitOut copyWith(void Function(GetReviewLimitOut) updates) =>
      super.copyWith((message) => updates(message as GetReviewLimitOut))
          as GetReviewLimitOut;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetReviewLimitOut create() => GetReviewLimitOut._();
  @$core.override
  GetReviewLimitOut createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetReviewLimitOut getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetReviewLimitOut>(create);
  static GetReviewLimitOut? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get limit => $_getBF(0);
  @$pb.TagNumber(1)
  set limit($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLimit() => $_has(0);
  @$pb.TagNumber(1)
  void clearLimit() => $_clearField(1);
}

class RespDefault extends $pb.GeneratedMessage {
  factory RespDefault({
    $core.bool? value,
  }) {
    final result = create();
    if (value != null) result.value = value;
    return result;
  }

  RespDefault._();

  factory RespDefault.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RespDefault.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RespDefault',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'value')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RespDefault clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RespDefault copyWith(void Function(RespDefault) updates) =>
      super.copyWith((message) => updates(message as RespDefault))
          as RespDefault;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RespDefault create() => RespDefault._();
  @$core.override
  RespDefault createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RespDefault getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RespDefault>(create);
  static RespDefault? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get value => $_getBF(0);
  @$pb.TagNumber(1)
  set value($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => $_clearField(1);
}

class GetMetaDataIn extends $pb.GeneratedMessage {
  factory GetMetaDataIn() => create();

  GetMetaDataIn._();

  factory GetMetaDataIn.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetMetaDataIn.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetMetaDataIn',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMetaDataIn clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMetaDataIn copyWith(void Function(GetMetaDataIn) updates) =>
      super.copyWith((message) => updates(message as GetMetaDataIn))
          as GetMetaDataIn;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMetaDataIn create() => GetMetaDataIn._();
  @$core.override
  GetMetaDataIn createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetMetaDataIn getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetMetaDataIn>(create);
  static GetMetaDataIn? _defaultInstance;
}

class GetMetaDataOut extends $pb.GeneratedMessage {
  factory GetMetaDataOut({
    $core.int? version,
  }) {
    final result = create();
    if (version != null) result.version = version;
    return result;
  }

  GetMetaDataOut._();

  factory GetMetaDataOut.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetMetaDataOut.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetMetaDataOut',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'version')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMetaDataOut clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMetaDataOut copyWith(void Function(GetMetaDataOut) updates) =>
      super.copyWith((message) => updates(message as GetMetaDataOut))
          as GetMetaDataOut;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMetaDataOut create() => GetMetaDataOut._();
  @$core.override
  GetMetaDataOut createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetMetaDataOut getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetMetaDataOut>(create);
  static GetMetaDataOut? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get version => $_getIZ(0);
  @$pb.TagNumber(1)
  set version($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearVersion() => $_clearField(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

//
//  Generated code. Do not modify.
//  source: proto.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class InitParams extends $pb.GeneratedMessage {
  factory InitParams({
    $core.String? localDir,
  }) {
    final $result = create();
    if (localDir != null) {
      $result.localDir = localDir;
    }
    return $result;
  }
  InitParams._() : super();
  factory InitParams.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InitParams.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'InitParams', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'localDir')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InitParams clone() => InitParams()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InitParams copyWith(void Function(InitParams) updates) => super.copyWith((message) => updates(message as InitParams)) as InitParams;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InitParams create() => InitParams._();
  InitParams createEmptyInstance() => create();
  static $pb.PbList<InitParams> createRepeated() => $pb.PbList<InitParams>();
  @$core.pragma('dart2js:noInline')
  static InitParams getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InitParams>(create);
  static InitParams? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get localDir => $_getSZ(0);
  @$pb.TagNumber(1)
  set localDir($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLocalDir() => $_has(0);
  @$pb.TagNumber(1)
  void clearLocalDir() => clearField(1);
}

class ReqRecentWords extends $pb.GeneratedMessage {
  factory ReqRecentWords({
    $core.String? desc,
    $core.String? version,
  }) {
    final $result = create();
    if (desc != null) {
      $result.desc = desc;
    }
    if (version != null) {
      $result.version = version;
    }
    return $result;
  }
  ReqRecentWords._() : super();
  factory ReqRecentWords.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReqRecentWords.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReqRecentWords', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'desc')
    ..aOS(2, _omitFieldNames ? '' : 'version')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReqRecentWords clone() => ReqRecentWords()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReqRecentWords copyWith(void Function(ReqRecentWords) updates) => super.copyWith((message) => updates(message as ReqRecentWords)) as ReqRecentWords;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReqRecentWords create() => ReqRecentWords._();
  ReqRecentWords createEmptyInstance() => create();
  static $pb.PbList<ReqRecentWords> createRepeated() => $pb.PbList<ReqRecentWords>();
  @$core.pragma('dart2js:noInline')
  static ReqRecentWords getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReqRecentWords>(create);
  static ReqRecentWords? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get desc => $_getSZ(0);
  @$pb.TagNumber(1)
  set desc($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDesc() => $_has(0);
  @$pb.TagNumber(1)
  void clearDesc() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get version => $_getSZ(1);
  @$pb.TagNumber(2)
  set version($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasVersion() => $_has(1);
  @$pb.TagNumber(2)
  void clearVersion() => clearField(2);
}

class RespRecentWords extends $pb.GeneratedMessage {
  factory RespRecentWords({
    $core.Iterable<$core.String>? word,
  }) {
    final $result = create();
    if (word != null) {
      $result.word.addAll(word);
    }
    return $result;
  }
  RespRecentWords._() : super();
  factory RespRecentWords.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RespRecentWords.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RespRecentWords', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'word')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RespRecentWords clone() => RespRecentWords()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RespRecentWords copyWith(void Function(RespRecentWords) updates) => super.copyWith((message) => updates(message as RespRecentWords)) as RespRecentWords;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RespRecentWords create() => RespRecentWords._();
  RespRecentWords createEmptyInstance() => create();
  static $pb.PbList<RespRecentWords> createRepeated() => $pb.PbList<RespRecentWords>();
  @$core.pragma('dart2js:noInline')
  static RespRecentWords getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RespRecentWords>(create);
  static RespRecentWords? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get word => $_getList(0);
}

class ReqSearchWords extends $pb.GeneratedMessage {
  factory ReqSearchWords({
    $core.String? word,
    $core.bool? useLike,
  }) {
    final $result = create();
    if (word != null) {
      $result.word = word;
    }
    if (useLike != null) {
      $result.useLike = useLike;
    }
    return $result;
  }
  ReqSearchWords._() : super();
  factory ReqSearchWords.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReqSearchWords.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReqSearchWords', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'word')
    ..aOB(2, _omitFieldNames ? '' : 'useLike')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReqSearchWords clone() => ReqSearchWords()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReqSearchWords copyWith(void Function(ReqSearchWords) updates) => super.copyWith((message) => updates(message as ReqSearchWords)) as ReqSearchWords;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReqSearchWords create() => ReqSearchWords._();
  ReqSearchWords createEmptyInstance() => create();
  static $pb.PbList<ReqSearchWords> createRepeated() => $pb.PbList<ReqSearchWords>();
  @$core.pragma('dart2js:noInline')
  static ReqSearchWords getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReqSearchWords>(create);
  static ReqSearchWords? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get word => $_getSZ(0);
  @$pb.TagNumber(1)
  set word($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasWord() => $_has(0);
  @$pb.TagNumber(1)
  void clearWord() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get useLike => $_getBF(1);
  @$pb.TagNumber(2)
  set useLike($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUseLike() => $_has(1);
  @$pb.TagNumber(2)
  void clearUseLike() => clearField(2);
}

class RespSearchWords extends $pb.GeneratedMessage {
  factory RespSearchWords({
    $core.Iterable<Word>? item,
  }) {
    final $result = create();
    if (item != null) {
      $result.item.addAll(item);
    }
    return $result;
  }
  RespSearchWords._() : super();
  factory RespSearchWords.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RespSearchWords.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RespSearchWords', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..pc<Word>(1, _omitFieldNames ? '' : 'item', $pb.PbFieldType.PM, subBuilder: Word.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RespSearchWords clone() => RespSearchWords()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RespSearchWords copyWith(void Function(RespSearchWords) updates) => super.copyWith((message) => updates(message as RespSearchWords)) as RespSearchWords;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RespSearchWords create() => RespSearchWords._();
  RespSearchWords createEmptyInstance() => create();
  static $pb.PbList<RespSearchWords> createRepeated() => $pb.PbList<RespSearchWords>();
  @$core.pragma('dart2js:noInline')
  static RespSearchWords getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RespSearchWords>(create);
  static RespSearchWords? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Word> get item => $_getList(0);
}

class ReqRandWords extends $pb.GeneratedMessage {
  factory ReqRandWords({
    $core.int? count,
  }) {
    final $result = create();
    if (count != null) {
      $result.count = count;
    }
    return $result;
  }
  ReqRandWords._() : super();
  factory ReqRandWords.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReqRandWords.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReqRandWords', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'count', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReqRandWords clone() => ReqRandWords()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReqRandWords copyWith(void Function(ReqRandWords) updates) => super.copyWith((message) => updates(message as ReqRandWords)) as ReqRandWords;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReqRandWords create() => ReqRandWords._();
  ReqRandWords createEmptyInstance() => create();
  static $pb.PbList<ReqRandWords> createRepeated() => $pb.PbList<ReqRandWords>();
  @$core.pragma('dart2js:noInline')
  static ReqRandWords getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReqRandWords>(create);
  static ReqRandWords? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get count => $_getIZ(0);
  @$pb.TagNumber(1)
  set count($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearCount() => clearField(1);
}

class RespRandWords extends $pb.GeneratedMessage {
  factory RespRandWords({
    $core.Iterable<Word>? words,
  }) {
    final $result = create();
    if (words != null) {
      $result.words.addAll(words);
    }
    return $result;
  }
  RespRandWords._() : super();
  factory RespRandWords.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RespRandWords.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RespRandWords', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..pc<Word>(1, _omitFieldNames ? '' : 'words', $pb.PbFieldType.PM, subBuilder: Word.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RespRandWords clone() => RespRandWords()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RespRandWords copyWith(void Function(RespRandWords) updates) => super.copyWith((message) => updates(message as RespRandWords)) as RespRandWords;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RespRandWords create() => RespRandWords._();
  RespRandWords createEmptyInstance() => create();
  static $pb.PbList<RespRandWords> createRepeated() => $pb.PbList<RespRandWords>();
  @$core.pragma('dart2js:noInline')
  static RespRandWords getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RespRandWords>(create);
  static RespRandWords? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Word> get words => $_getList(0);
}

class ReqWordInReview extends $pb.GeneratedMessage {
  factory ReqWordInReview({
    $core.String? word,
  }) {
    final $result = create();
    if (word != null) {
      $result.word = word;
    }
    return $result;
  }
  ReqWordInReview._() : super();
  factory ReqWordInReview.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReqWordInReview.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReqWordInReview', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'word')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReqWordInReview clone() => ReqWordInReview()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReqWordInReview copyWith(void Function(ReqWordInReview) updates) => super.copyWith((message) => updates(message as ReqWordInReview)) as ReqWordInReview;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReqWordInReview create() => ReqWordInReview._();
  ReqWordInReview createEmptyInstance() => create();
  static $pb.PbList<ReqWordInReview> createRepeated() => $pb.PbList<ReqWordInReview>();
  @$core.pragma('dart2js:noInline')
  static ReqWordInReview getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReqWordInReview>(create);
  static ReqWordInReview? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get word => $_getSZ(0);
  @$pb.TagNumber(1)
  set word($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasWord() => $_has(0);
  @$pb.TagNumber(1)
  void clearWord() => clearField(1);
}

class WordInReview extends $pb.GeneratedMessage {
  factory WordInReview({
    $core.String? word,
    $core.int? successCount,
    $core.int? failCount,
    $fixnum.Int64? lastTmSuccess,
    $fixnum.Int64? lastTmFail,
    $fixnum.Int64? nextReviewTmMs,
  }) {
    final $result = create();
    if (word != null) {
      $result.word = word;
    }
    if (successCount != null) {
      $result.successCount = successCount;
    }
    if (failCount != null) {
      $result.failCount = failCount;
    }
    if (lastTmSuccess != null) {
      $result.lastTmSuccess = lastTmSuccess;
    }
    if (lastTmFail != null) {
      $result.lastTmFail = lastTmFail;
    }
    if (nextReviewTmMs != null) {
      $result.nextReviewTmMs = nextReviewTmMs;
    }
    return $result;
  }
  WordInReview._() : super();
  factory WordInReview.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WordInReview.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'WordInReview', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'word')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'successCount', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'failCount', $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : 'lastTmSuccess', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(5, _omitFieldNames ? '' : 'lastTmFail', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(6, _omitFieldNames ? '' : 'nextReviewTmMs', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WordInReview clone() => WordInReview()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WordInReview copyWith(void Function(WordInReview) updates) => super.copyWith((message) => updates(message as WordInReview)) as WordInReview;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WordInReview create() => WordInReview._();
  WordInReview createEmptyInstance() => create();
  static $pb.PbList<WordInReview> createRepeated() => $pb.PbList<WordInReview>();
  @$core.pragma('dart2js:noInline')
  static WordInReview getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WordInReview>(create);
  static WordInReview? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get word => $_getSZ(0);
  @$pb.TagNumber(1)
  set word($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasWord() => $_has(0);
  @$pb.TagNumber(1)
  void clearWord() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get successCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set successCount($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSuccessCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearSuccessCount() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get failCount => $_getIZ(2);
  @$pb.TagNumber(3)
  set failCount($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFailCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearFailCount() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get lastTmSuccess => $_getI64(3);
  @$pb.TagNumber(4)
  set lastTmSuccess($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLastTmSuccess() => $_has(3);
  @$pb.TagNumber(4)
  void clearLastTmSuccess() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get lastTmFail => $_getI64(4);
  @$pb.TagNumber(5)
  set lastTmFail($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasLastTmFail() => $_has(4);
  @$pb.TagNumber(5)
  void clearLastTmFail() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get nextReviewTmMs => $_getI64(5);
  @$pb.TagNumber(6)
  set nextReviewTmMs($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasNextReviewTmMs() => $_has(5);
  @$pb.TagNumber(6)
  void clearNextReviewTmMs() => clearField(6);
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
  }) {
    final $result = create();
    if (word != null) {
      $result.word = word;
    }
    if (useExtraFields != null) {
      $result.useExtraFields = useExtraFields;
    }
    if (successCount != null) {
      $result.successCount = successCount;
    }
    if (failCount != null) {
      $result.failCount = failCount;
    }
    if (lastTmSuccess != null) {
      $result.lastTmSuccess = lastTmSuccess;
    }
    if (lastTmFail != null) {
      $result.lastTmFail = lastTmFail;
    }
    if (nextReviewTmMs != null) {
      $result.nextReviewTmMs = nextReviewTmMs;
    }
    return $result;
  }
  ReqAddWordInReview._() : super();
  factory ReqAddWordInReview.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReqAddWordInReview.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReqAddWordInReview', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'word')
    ..aOB(2, _omitFieldNames ? '' : 'useExtraFields')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'successCount', $pb.PbFieldType.OU3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'failCount', $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(5, _omitFieldNames ? '' : 'lastTmSuccess', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(6, _omitFieldNames ? '' : 'lastTmFail', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(7, _omitFieldNames ? '' : 'nextReviewTmMs', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReqAddWordInReview clone() => ReqAddWordInReview()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReqAddWordInReview copyWith(void Function(ReqAddWordInReview) updates) => super.copyWith((message) => updates(message as ReqAddWordInReview)) as ReqAddWordInReview;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReqAddWordInReview create() => ReqAddWordInReview._();
  ReqAddWordInReview createEmptyInstance() => create();
  static $pb.PbList<ReqAddWordInReview> createRepeated() => $pb.PbList<ReqAddWordInReview>();
  @$core.pragma('dart2js:noInline')
  static ReqAddWordInReview getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReqAddWordInReview>(create);
  static ReqAddWordInReview? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get word => $_getSZ(0);
  @$pb.TagNumber(1)
  set word($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasWord() => $_has(0);
  @$pb.TagNumber(1)
  void clearWord() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get useExtraFields => $_getBF(1);
  @$pb.TagNumber(2)
  set useExtraFields($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUseExtraFields() => $_has(1);
  @$pb.TagNumber(2)
  void clearUseExtraFields() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get successCount => $_getIZ(2);
  @$pb.TagNumber(3)
  set successCount($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSuccessCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearSuccessCount() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get failCount => $_getIZ(3);
  @$pb.TagNumber(4)
  set failCount($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFailCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearFailCount() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get lastTmSuccess => $_getI64(4);
  @$pb.TagNumber(5)
  set lastTmSuccess($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasLastTmSuccess() => $_has(4);
  @$pb.TagNumber(5)
  void clearLastTmSuccess() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get lastTmFail => $_getI64(5);
  @$pb.TagNumber(6)
  set lastTmFail($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasLastTmFail() => $_has(5);
  @$pb.TagNumber(6)
  void clearLastTmFail() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get nextReviewTmMs => $_getI64(6);
  @$pb.TagNumber(7)
  set nextReviewTmMs($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasNextReviewTmMs() => $_has(6);
  @$pb.TagNumber(7)
  void clearNextReviewTmMs() => clearField(7);
}

class RespAddWordInCurrent extends $pb.GeneratedMessage {
  factory RespAddWordInCurrent() => create();
  RespAddWordInCurrent._() : super();
  factory RespAddWordInCurrent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RespAddWordInCurrent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RespAddWordInCurrent', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RespAddWordInCurrent clone() => RespAddWordInCurrent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RespAddWordInCurrent copyWith(void Function(RespAddWordInCurrent) updates) => super.copyWith((message) => updates(message as RespAddWordInCurrent)) as RespAddWordInCurrent;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RespAddWordInCurrent create() => RespAddWordInCurrent._();
  RespAddWordInCurrent createEmptyInstance() => create();
  static $pb.PbList<RespAddWordInCurrent> createRepeated() => $pb.PbList<RespAddWordInCurrent>();
  @$core.pragma('dart2js:noInline')
  static RespAddWordInCurrent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RespAddWordInCurrent>(create);
  static RespAddWordInCurrent? _defaultInstance;
}

class ReqRemoveWordFromCurrent extends $pb.GeneratedMessage {
  factory ReqRemoveWordFromCurrent({
    $core.String? word,
  }) {
    final $result = create();
    if (word != null) {
      $result.word = word;
    }
    return $result;
  }
  ReqRemoveWordFromCurrent._() : super();
  factory ReqRemoveWordFromCurrent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReqRemoveWordFromCurrent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReqRemoveWordFromCurrent', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'word')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReqRemoveWordFromCurrent clone() => ReqRemoveWordFromCurrent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReqRemoveWordFromCurrent copyWith(void Function(ReqRemoveWordFromCurrent) updates) => super.copyWith((message) => updates(message as ReqRemoveWordFromCurrent)) as ReqRemoveWordFromCurrent;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReqRemoveWordFromCurrent create() => ReqRemoveWordFromCurrent._();
  ReqRemoveWordFromCurrent createEmptyInstance() => create();
  static $pb.PbList<ReqRemoveWordFromCurrent> createRepeated() => $pb.PbList<ReqRemoveWordFromCurrent>();
  @$core.pragma('dart2js:noInline')
  static ReqRemoveWordFromCurrent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReqRemoveWordFromCurrent>(create);
  static ReqRemoveWordFromCurrent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get word => $_getSZ(0);
  @$pb.TagNumber(1)
  set word($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasWord() => $_has(0);
  @$pb.TagNumber(1)
  void clearWord() => clearField(1);
}

class RespRemoveWordFromCurrent extends $pb.GeneratedMessage {
  factory RespRemoveWordFromCurrent() => create();
  RespRemoveWordFromCurrent._() : super();
  factory RespRemoveWordFromCurrent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RespRemoveWordFromCurrent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RespRemoveWordFromCurrent', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RespRemoveWordFromCurrent clone() => RespRemoveWordFromCurrent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RespRemoveWordFromCurrent copyWith(void Function(RespRemoveWordFromCurrent) updates) => super.copyWith((message) => updates(message as RespRemoveWordFromCurrent)) as RespRemoveWordFromCurrent;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RespRemoveWordFromCurrent create() => RespRemoveWordFromCurrent._();
  RespRemoveWordFromCurrent createEmptyInstance() => create();
  static $pb.PbList<RespRemoveWordFromCurrent> createRepeated() => $pb.PbList<RespRemoveWordFromCurrent>();
  @$core.pragma('dart2js:noInline')
  static RespRemoveWordFromCurrent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RespRemoveWordFromCurrent>(create);
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
  }) {
    final $result = create();
    if (word != null) {
      $result.word = word;
    }
    if (successCount != null) {
      $result.successCount = successCount;
    }
    if (failCount != null) {
      $result.failCount = failCount;
    }
    if (lastTmSuccess != null) {
      $result.lastTmSuccess = lastTmSuccess;
    }
    if (lastTmFail != null) {
      $result.lastTmFail = lastTmFail;
    }
    if (nextReviewTmMs != null) {
      $result.nextReviewTmMs = nextReviewTmMs;
    }
    return $result;
  }
  ReqUpdateWordInCurrent._() : super();
  factory ReqUpdateWordInCurrent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReqUpdateWordInCurrent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReqUpdateWordInCurrent', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'word')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'successCount', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'failCount', $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : 'lastTmSuccess', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(5, _omitFieldNames ? '' : 'lastTmFail', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(6, _omitFieldNames ? '' : 'nextReviewTmMs', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReqUpdateWordInCurrent clone() => ReqUpdateWordInCurrent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReqUpdateWordInCurrent copyWith(void Function(ReqUpdateWordInCurrent) updates) => super.copyWith((message) => updates(message as ReqUpdateWordInCurrent)) as ReqUpdateWordInCurrent;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReqUpdateWordInCurrent create() => ReqUpdateWordInCurrent._();
  ReqUpdateWordInCurrent createEmptyInstance() => create();
  static $pb.PbList<ReqUpdateWordInCurrent> createRepeated() => $pb.PbList<ReqUpdateWordInCurrent>();
  @$core.pragma('dart2js:noInline')
  static ReqUpdateWordInCurrent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReqUpdateWordInCurrent>(create);
  static ReqUpdateWordInCurrent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get word => $_getSZ(0);
  @$pb.TagNumber(1)
  set word($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasWord() => $_has(0);
  @$pb.TagNumber(1)
  void clearWord() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get successCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set successCount($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSuccessCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearSuccessCount() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get failCount => $_getIZ(2);
  @$pb.TagNumber(3)
  set failCount($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFailCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearFailCount() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get lastTmSuccess => $_getI64(3);
  @$pb.TagNumber(4)
  set lastTmSuccess($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLastTmSuccess() => $_has(3);
  @$pb.TagNumber(4)
  void clearLastTmSuccess() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get lastTmFail => $_getI64(4);
  @$pb.TagNumber(5)
  set lastTmFail($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasLastTmFail() => $_has(4);
  @$pb.TagNumber(5)
  void clearLastTmFail() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get nextReviewTmMs => $_getI64(5);
  @$pb.TagNumber(6)
  set nextReviewTmMs($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasNextReviewTmMs() => $_has(5);
  @$pb.TagNumber(6)
  void clearNextReviewTmMs() => clearField(6);
}

class RespUpdateWordInCurrent extends $pb.GeneratedMessage {
  factory RespUpdateWordInCurrent() => create();
  RespUpdateWordInCurrent._() : super();
  factory RespUpdateWordInCurrent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RespUpdateWordInCurrent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RespUpdateWordInCurrent', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RespUpdateWordInCurrent clone() => RespUpdateWordInCurrent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RespUpdateWordInCurrent copyWith(void Function(RespUpdateWordInCurrent) updates) => super.copyWith((message) => updates(message as RespUpdateWordInCurrent)) as RespUpdateWordInCurrent;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RespUpdateWordInCurrent create() => RespUpdateWordInCurrent._();
  RespUpdateWordInCurrent createEmptyInstance() => create();
  static $pb.PbList<RespUpdateWordInCurrent> createRepeated() => $pb.PbList<RespUpdateWordInCurrent>();
  @$core.pragma('dart2js:noInline')
  static RespUpdateWordInCurrent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RespUpdateWordInCurrent>(create);
  static RespUpdateWordInCurrent? _defaultInstance;
}

class Word extends $pb.GeneratedMessage {
  factory Word({
    $core.String? value,
    $fixnum.Int64? frequency,
    $core.String? json,
    $core.String? transcript,
  }) {
    final $result = create();
    if (value != null) {
      $result.value = value;
    }
    if (frequency != null) {
      $result.frequency = frequency;
    }
    if (json != null) {
      $result.json = json;
    }
    if (transcript != null) {
      $result.transcript = transcript;
    }
    return $result;
  }
  Word._() : super();
  factory Word.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Word.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Word', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'value')
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'frequency', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(3, _omitFieldNames ? '' : 'json')
    ..aOS(4, _omitFieldNames ? '' : 'transcript')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Word clone() => Word()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Word copyWith(void Function(Word) updates) => super.copyWith((message) => updates(message as Word)) as Word;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Word create() => Word._();
  Word createEmptyInstance() => create();
  static $pb.PbList<Word> createRepeated() => $pb.PbList<Word>();
  @$core.pragma('dart2js:noInline')
  static Word getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Word>(create);
  static Word? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get value => $_getSZ(0);
  @$pb.TagNumber(1)
  set value($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get frequency => $_getI64(1);
  @$pb.TagNumber(2)
  set frequency($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFrequency() => $_has(1);
  @$pb.TagNumber(2)
  void clearFrequency() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get json => $_getSZ(2);
  @$pb.TagNumber(3)
  set json($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasJson() => $_has(2);
  @$pb.TagNumber(3)
  void clearJson() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get transcript => $_getSZ(3);
  @$pb.TagNumber(4)
  set transcript($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTranscript() => $_has(3);
  @$pb.TagNumber(4)
  void clearTranscript() => clearField(4);
}

class ReqReviewForToday extends $pb.GeneratedMessage {
  factory ReqReviewForToday() => create();
  ReqReviewForToday._() : super();
  factory ReqReviewForToday.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReqReviewForToday.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReqReviewForToday', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReqReviewForToday clone() => ReqReviewForToday()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReqReviewForToday copyWith(void Function(ReqReviewForToday) updates) => super.copyWith((message) => updates(message as ReqReviewForToday)) as ReqReviewForToday;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReqReviewForToday create() => ReqReviewForToday._();
  ReqReviewForToday createEmptyInstance() => create();
  static $pb.PbList<ReqReviewForToday> createRepeated() => $pb.PbList<ReqReviewForToday>();
  @$core.pragma('dart2js:noInline')
  static ReqReviewForToday getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReqReviewForToday>(create);
  static ReqReviewForToday? _defaultInstance;
}

class RespReviewForToday extends $pb.GeneratedMessage {
  factory RespReviewForToday({
    $core.Iterable<WordInReview>? firstNWord,
    $core.int? countAll,
  }) {
    final $result = create();
    if (firstNWord != null) {
      $result.firstNWord.addAll(firstNWord);
    }
    if (countAll != null) {
      $result.countAll = countAll;
    }
    return $result;
  }
  RespReviewForToday._() : super();
  factory RespReviewForToday.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RespReviewForToday.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RespReviewForToday', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..pc<WordInReview>(1, _omitFieldNames ? '' : 'firstNWord', $pb.PbFieldType.PM, subBuilder: WordInReview.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'countAll', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RespReviewForToday clone() => RespReviewForToday()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RespReviewForToday copyWith(void Function(RespReviewForToday) updates) => super.copyWith((message) => updates(message as RespReviewForToday)) as RespReviewForToday;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RespReviewForToday create() => RespReviewForToday._();
  RespReviewForToday createEmptyInstance() => create();
  static $pb.PbList<RespReviewForToday> createRepeated() => $pb.PbList<RespReviewForToday>();
  @$core.pragma('dart2js:noInline')
  static RespReviewForToday getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RespReviewForToday>(create);
  static RespReviewForToday? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<WordInReview> get firstNWord => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get countAll => $_getIZ(1);
  @$pb.TagNumber(2)
  set countAll($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCountAll() => $_has(1);
  @$pb.TagNumber(2)
  void clearCountAll() => clearField(2);
}

class ReqSearchInReviewList extends $pb.GeneratedMessage {
  factory ReqSearchInReviewList({
    $core.int? limit,
    $core.int? offset,
    $core.int? useSuccessCount,
  }) {
    final $result = create();
    if (limit != null) {
      $result.limit = limit;
    }
    if (offset != null) {
      $result.offset = offset;
    }
    if (useSuccessCount != null) {
      $result.useSuccessCount = useSuccessCount;
    }
    return $result;
  }
  ReqSearchInReviewList._() : super();
  factory ReqSearchInReviewList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReqSearchInReviewList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReqSearchInReviewList', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'offset', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'useSuccessCount', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReqSearchInReviewList clone() => ReqSearchInReviewList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReqSearchInReviewList copyWith(void Function(ReqSearchInReviewList) updates) => super.copyWith((message) => updates(message as ReqSearchInReviewList)) as ReqSearchInReviewList;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReqSearchInReviewList create() => ReqSearchInReviewList._();
  ReqSearchInReviewList createEmptyInstance() => create();
  static $pb.PbList<ReqSearchInReviewList> createRepeated() => $pb.PbList<ReqSearchInReviewList>();
  @$core.pragma('dart2js:noInline')
  static ReqSearchInReviewList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReqSearchInReviewList>(create);
  static ReqSearchInReviewList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get limit => $_getIZ(0);
  @$pb.TagNumber(1)
  set limit($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLimit() => $_has(0);
  @$pb.TagNumber(1)
  void clearLimit() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get offset => $_getIZ(1);
  @$pb.TagNumber(2)
  set offset($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOffset() => $_has(1);
  @$pb.TagNumber(2)
  void clearOffset() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get useSuccessCount => $_getIZ(2);
  @$pb.TagNumber(3)
  set useSuccessCount($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUseSuccessCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearUseSuccessCount() => clearField(3);
}

class RespSearchInReviewList extends $pb.GeneratedMessage {
  factory RespSearchInReviewList({
    $core.Iterable<WordInReview>? word,
  }) {
    final $result = create();
    if (word != null) {
      $result.word.addAll(word);
    }
    return $result;
  }
  RespSearchInReviewList._() : super();
  factory RespSearchInReviewList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RespSearchInReviewList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RespSearchInReviewList', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..pc<WordInReview>(1, _omitFieldNames ? '' : 'word', $pb.PbFieldType.PM, subBuilder: WordInReview.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RespSearchInReviewList clone() => RespSearchInReviewList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RespSearchInReviewList copyWith(void Function(RespSearchInReviewList) updates) => super.copyWith((message) => updates(message as RespSearchInReviewList)) as RespSearchInReviewList;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RespSearchInReviewList create() => RespSearchInReviewList._();
  RespSearchInReviewList createEmptyInstance() => create();
  static $pb.PbList<RespSearchInReviewList> createRepeated() => $pb.PbList<RespSearchInReviewList>();
  @$core.pragma('dart2js:noInline')
  static RespSearchInReviewList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RespSearchInReviewList>(create);
  static RespSearchInReviewList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<WordInReview> get word => $_getList(0);
}

class ReqDeleteProfile extends $pb.GeneratedMessage {
  factory ReqDeleteProfile() => create();
  ReqDeleteProfile._() : super();
  factory ReqDeleteProfile.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReqDeleteProfile.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReqDeleteProfile', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReqDeleteProfile clone() => ReqDeleteProfile()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReqDeleteProfile copyWith(void Function(ReqDeleteProfile) updates) => super.copyWith((message) => updates(message as ReqDeleteProfile)) as ReqDeleteProfile;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReqDeleteProfile create() => ReqDeleteProfile._();
  ReqDeleteProfile createEmptyInstance() => create();
  static $pb.PbList<ReqDeleteProfile> createRepeated() => $pb.PbList<ReqDeleteProfile>();
  @$core.pragma('dart2js:noInline')
  static ReqDeleteProfile getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReqDeleteProfile>(create);
  static ReqDeleteProfile? _defaultInstance;
}

class RespDeleteProfile extends $pb.GeneratedMessage {
  factory RespDeleteProfile() => create();
  RespDeleteProfile._() : super();
  factory RespDeleteProfile.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RespDeleteProfile.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RespDeleteProfile', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RespDeleteProfile clone() => RespDeleteProfile()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RespDeleteProfile copyWith(void Function(RespDeleteProfile) updates) => super.copyWith((message) => updates(message as RespDeleteProfile)) as RespDeleteProfile;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RespDeleteProfile create() => RespDeleteProfile._();
  RespDeleteProfile createEmptyInstance() => create();
  static $pb.PbList<RespDeleteProfile> createRepeated() => $pb.PbList<RespDeleteProfile>();
  @$core.pragma('dart2js:noInline')
  static RespDeleteProfile getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RespDeleteProfile>(create);
  static RespDeleteProfile? _defaultInstance;
}

class ReqSentences extends $pb.GeneratedMessage {
  factory ReqSentences({
    $core.String? word,
    $core.int? limit,
    $core.int? offset,
  }) {
    final $result = create();
    if (word != null) {
      $result.word = word;
    }
    if (limit != null) {
      $result.limit = limit;
    }
    if (offset != null) {
      $result.offset = offset;
    }
    return $result;
  }
  ReqSentences._() : super();
  factory ReqSentences.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReqSentences.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReqSentences', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'word')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'offset', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReqSentences clone() => ReqSentences()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReqSentences copyWith(void Function(ReqSentences) updates) => super.copyWith((message) => updates(message as ReqSentences)) as ReqSentences;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReqSentences create() => ReqSentences._();
  ReqSentences createEmptyInstance() => create();
  static $pb.PbList<ReqSentences> createRepeated() => $pb.PbList<ReqSentences>();
  @$core.pragma('dart2js:noInline')
  static ReqSentences getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReqSentences>(create);
  static ReqSentences? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get word => $_getSZ(0);
  @$pb.TagNumber(1)
  set word($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasWord() => $_has(0);
  @$pb.TagNumber(1)
  void clearWord() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get limit => $_getIZ(1);
  @$pb.TagNumber(2)
  set limit($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLimit() => $_has(1);
  @$pb.TagNumber(2)
  void clearLimit() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get offset => $_getIZ(2);
  @$pb.TagNumber(3)
  set offset($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOffset() => $_has(2);
  @$pb.TagNumber(3)
  void clearOffset() => clearField(3);
}

class RespSentences extends $pb.GeneratedMessage {
  factory RespSentences({
    $core.Iterable<$core.String>? data,
  }) {
    final $result = create();
    if (data != null) {
      $result.data.addAll(data);
    }
    return $result;
  }
  RespSentences._() : super();
  factory RespSentences.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RespSentences.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RespSentences', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'data')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RespSentences clone() => RespSentences()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RespSentences copyWith(void Function(RespSentences) updates) => super.copyWith((message) => updates(message as RespSentences)) as RespSentences;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RespSentences create() => RespSentences._();
  RespSentences createEmptyInstance() => create();
  static $pb.PbList<RespSentences> createRepeated() => $pb.PbList<RespSentences>();
  @$core.pragma('dart2js:noInline')
  static RespSentences getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RespSentences>(create);
  static RespSentences? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get data => $_getList(0);
}

class RespDefault extends $pb.GeneratedMessage {
  factory RespDefault({
    $core.bool? value,
  }) {
    final $result = create();
    if (value != null) {
      $result.value = value;
    }
    return $result;
  }
  RespDefault._() : super();
  factory RespDefault.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RespDefault.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RespDefault', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'value')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RespDefault clone() => RespDefault()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RespDefault copyWith(void Function(RespDefault) updates) => super.copyWith((message) => updates(message as RespDefault)) as RespDefault;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RespDefault create() => RespDefault._();
  RespDefault createEmptyInstance() => create();
  static $pb.PbList<RespDefault> createRepeated() => $pb.PbList<RespDefault>();
  @$core.pragma('dart2js:noInline')
  static RespDefault getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RespDefault>(create);
  static RespDefault? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get value => $_getBF(0);
  @$pb.TagNumber(1)
  set value($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');

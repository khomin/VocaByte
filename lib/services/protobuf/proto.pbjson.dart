//
//  Generated code. Do not modify.
//  source: proto.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use initParamsDescriptor instead')
const InitParams$json = {
  '1': 'InitParams',
  '2': [
    {'1': 'local_dir', '3': 1, '4': 1, '5': 9, '10': 'localDir'},
  ],
};

/// Descriptor for `InitParams`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List initParamsDescriptor = $convert.base64Decode(
    'CgpJbml0UGFyYW1zEhsKCWxvY2FsX2RpchgBIAEoCVIIbG9jYWxEaXI=');

@$core.Deprecated('Use reqRecentWordsDescriptor instead')
const ReqRecentWords$json = {
  '1': 'ReqRecentWords',
  '2': [
    {'1': 'desc', '3': 1, '4': 1, '5': 9, '10': 'desc'},
    {'1': 'version', '3': 2, '4': 1, '5': 9, '10': 'version'},
  ],
};

/// Descriptor for `ReqRecentWords`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reqRecentWordsDescriptor = $convert.base64Decode(
    'Cg5SZXFSZWNlbnRXb3JkcxISCgRkZXNjGAEgASgJUgRkZXNjEhgKB3ZlcnNpb24YAiABKAlSB3'
    'ZlcnNpb24=');

@$core.Deprecated('Use respRecentWordsDescriptor instead')
const RespRecentWords$json = {
  '1': 'RespRecentWords',
  '2': [
    {'1': 'word', '3': 1, '4': 3, '5': 9, '10': 'word'},
  ],
};

/// Descriptor for `RespRecentWords`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List respRecentWordsDescriptor = $convert.base64Decode(
    'Cg9SZXNwUmVjZW50V29yZHMSEgoEd29yZBgBIAMoCVIEd29yZA==');

@$core.Deprecated('Use reqSearchWordsDescriptor instead')
const ReqSearchWords$json = {
  '1': 'ReqSearchWords',
  '2': [
    {'1': 'word', '3': 1, '4': 1, '5': 9, '10': 'word'},
    {'1': 'use_like', '3': 2, '4': 1, '5': 8, '10': 'useLike'},
  ],
};

/// Descriptor for `ReqSearchWords`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reqSearchWordsDescriptor = $convert.base64Decode(
    'Cg5SZXFTZWFyY2hXb3JkcxISCgR3b3JkGAEgASgJUgR3b3JkEhkKCHVzZV9saWtlGAIgASgIUg'
    'd1c2VMaWtl');

@$core.Deprecated('Use respSearchWordsDescriptor instead')
const RespSearchWords$json = {
  '1': 'RespSearchWords',
  '2': [
    {'1': 'item', '3': 1, '4': 3, '5': 11, '6': '.api.Word', '10': 'item'},
  ],
};

/// Descriptor for `RespSearchWords`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List respSearchWordsDescriptor = $convert.base64Decode(
    'Cg9SZXNwU2VhcmNoV29yZHMSHQoEaXRlbRgBIAMoCzIJLmFwaS5Xb3JkUgRpdGVt');

@$core.Deprecated('Use reqRandWordsDescriptor instead')
const ReqRandWords$json = {
  '1': 'ReqRandWords',
  '2': [
    {'1': 'count', '3': 1, '4': 1, '5': 13, '10': 'count'},
  ],
};

/// Descriptor for `ReqRandWords`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reqRandWordsDescriptor = $convert.base64Decode(
    'CgxSZXFSYW5kV29yZHMSFAoFY291bnQYASABKA1SBWNvdW50');

@$core.Deprecated('Use respRandWordsDescriptor instead')
const RespRandWords$json = {
  '1': 'RespRandWords',
  '2': [
    {'1': 'words', '3': 1, '4': 3, '5': 11, '6': '.api.Word', '10': 'words'},
  ],
};

/// Descriptor for `RespRandWords`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List respRandWordsDescriptor = $convert.base64Decode(
    'Cg1SZXNwUmFuZFdvcmRzEh8KBXdvcmRzGAEgAygLMgkuYXBpLldvcmRSBXdvcmRz');

@$core.Deprecated('Use reqWordInReviewDescriptor instead')
const ReqWordInReview$json = {
  '1': 'ReqWordInReview',
  '2': [
    {'1': 'word', '3': 1, '4': 1, '5': 9, '10': 'word'},
  ],
};

/// Descriptor for `ReqWordInReview`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reqWordInReviewDescriptor = $convert.base64Decode(
    'Cg9SZXFXb3JkSW5SZXZpZXcSEgoEd29yZBgBIAEoCVIEd29yZA==');

@$core.Deprecated('Use wordInReviewDescriptor instead')
const WordInReview$json = {
  '1': 'WordInReview',
  '2': [
    {'1': 'word', '3': 1, '4': 1, '5': 9, '10': 'word'},
    {'1': 'success_count', '3': 2, '4': 1, '5': 13, '10': 'successCount'},
    {'1': 'fail_count', '3': 3, '4': 1, '5': 13, '10': 'failCount'},
    {'1': 'last_tm_success', '3': 4, '4': 1, '5': 4, '10': 'lastTmSuccess'},
    {'1': 'last_tm_fail', '3': 5, '4': 1, '5': 4, '10': 'lastTmFail'},
    {'1': 'next_review_tm_ms', '3': 6, '4': 1, '5': 4, '10': 'nextReviewTmMs'},
  ],
};

/// Descriptor for `WordInReview`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List wordInReviewDescriptor = $convert.base64Decode(
    'CgxXb3JkSW5SZXZpZXcSEgoEd29yZBgBIAEoCVIEd29yZBIjCg1zdWNjZXNzX2NvdW50GAIgAS'
    'gNUgxzdWNjZXNzQ291bnQSHQoKZmFpbF9jb3VudBgDIAEoDVIJZmFpbENvdW50EiYKD2xhc3Rf'
    'dG1fc3VjY2VzcxgEIAEoBFINbGFzdFRtU3VjY2VzcxIgCgxsYXN0X3RtX2ZhaWwYBSABKARSCm'
    'xhc3RUbUZhaWwSKQoRbmV4dF9yZXZpZXdfdG1fbXMYBiABKARSDm5leHRSZXZpZXdUbU1z');

@$core.Deprecated('Use reqAddWordInReviewDescriptor instead')
const ReqAddWordInReview$json = {
  '1': 'ReqAddWordInReview',
  '2': [
    {'1': 'word', '3': 1, '4': 1, '5': 9, '10': 'word'},
    {'1': 'use_extra_fields', '3': 2, '4': 1, '5': 8, '10': 'useExtraFields'},
    {'1': 'success_count', '3': 3, '4': 1, '5': 13, '10': 'successCount'},
    {'1': 'fail_count', '3': 4, '4': 1, '5': 13, '10': 'failCount'},
    {'1': 'last_tm_success', '3': 5, '4': 1, '5': 4, '10': 'lastTmSuccess'},
    {'1': 'last_tm_fail', '3': 6, '4': 1, '5': 4, '10': 'lastTmFail'},
    {'1': 'next_review_tm_ms', '3': 7, '4': 1, '5': 4, '10': 'nextReviewTmMs'},
  ],
};

/// Descriptor for `ReqAddWordInReview`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reqAddWordInReviewDescriptor = $convert.base64Decode(
    'ChJSZXFBZGRXb3JkSW5SZXZpZXcSEgoEd29yZBgBIAEoCVIEd29yZBIoChB1c2VfZXh0cmFfZm'
    'llbGRzGAIgASgIUg51c2VFeHRyYUZpZWxkcxIjCg1zdWNjZXNzX2NvdW50GAMgASgNUgxzdWNj'
    'ZXNzQ291bnQSHQoKZmFpbF9jb3VudBgEIAEoDVIJZmFpbENvdW50EiYKD2xhc3RfdG1fc3VjY2'
    'VzcxgFIAEoBFINbGFzdFRtU3VjY2VzcxIgCgxsYXN0X3RtX2ZhaWwYBiABKARSCmxhc3RUbUZh'
    'aWwSKQoRbmV4dF9yZXZpZXdfdG1fbXMYByABKARSDm5leHRSZXZpZXdUbU1z');

@$core.Deprecated('Use respAddWordInCurrentDescriptor instead')
const RespAddWordInCurrent$json = {
  '1': 'RespAddWordInCurrent',
};

/// Descriptor for `RespAddWordInCurrent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List respAddWordInCurrentDescriptor = $convert.base64Decode(
    'ChRSZXNwQWRkV29yZEluQ3VycmVudA==');

@$core.Deprecated('Use reqRemoveWordFromCurrentDescriptor instead')
const ReqRemoveWordFromCurrent$json = {
  '1': 'ReqRemoveWordFromCurrent',
  '2': [
    {'1': 'word', '3': 1, '4': 1, '5': 9, '10': 'word'},
  ],
};

/// Descriptor for `ReqRemoveWordFromCurrent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reqRemoveWordFromCurrentDescriptor = $convert.base64Decode(
    'ChhSZXFSZW1vdmVXb3JkRnJvbUN1cnJlbnQSEgoEd29yZBgBIAEoCVIEd29yZA==');

@$core.Deprecated('Use respRemoveWordFromCurrentDescriptor instead')
const RespRemoveWordFromCurrent$json = {
  '1': 'RespRemoveWordFromCurrent',
};

/// Descriptor for `RespRemoveWordFromCurrent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List respRemoveWordFromCurrentDescriptor = $convert.base64Decode(
    'ChlSZXNwUmVtb3ZlV29yZEZyb21DdXJyZW50');

@$core.Deprecated('Use reqUpdateWordInCurrentDescriptor instead')
const ReqUpdateWordInCurrent$json = {
  '1': 'ReqUpdateWordInCurrent',
  '2': [
    {'1': 'word', '3': 1, '4': 1, '5': 9, '10': 'word'},
    {'1': 'success_count', '3': 2, '4': 1, '5': 13, '10': 'successCount'},
    {'1': 'fail_count', '3': 3, '4': 1, '5': 13, '10': 'failCount'},
    {'1': 'last_tm_success', '3': 4, '4': 1, '5': 4, '10': 'lastTmSuccess'},
    {'1': 'last_tm_fail', '3': 5, '4': 1, '5': 4, '10': 'lastTmFail'},
    {'1': 'next_review_tm_ms', '3': 6, '4': 1, '5': 4, '10': 'nextReviewTmMs'},
  ],
};

/// Descriptor for `ReqUpdateWordInCurrent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reqUpdateWordInCurrentDescriptor = $convert.base64Decode(
    'ChZSZXFVcGRhdGVXb3JkSW5DdXJyZW50EhIKBHdvcmQYASABKAlSBHdvcmQSIwoNc3VjY2Vzc1'
    '9jb3VudBgCIAEoDVIMc3VjY2Vzc0NvdW50Eh0KCmZhaWxfY291bnQYAyABKA1SCWZhaWxDb3Vu'
    'dBImCg9sYXN0X3RtX3N1Y2Nlc3MYBCABKARSDWxhc3RUbVN1Y2Nlc3MSIAoMbGFzdF90bV9mYW'
    'lsGAUgASgEUgpsYXN0VG1GYWlsEikKEW5leHRfcmV2aWV3X3RtX21zGAYgASgEUg5uZXh0UmV2'
    'aWV3VG1Ncw==');

@$core.Deprecated('Use respUpdateWordInCurrentDescriptor instead')
const RespUpdateWordInCurrent$json = {
  '1': 'RespUpdateWordInCurrent',
};

/// Descriptor for `RespUpdateWordInCurrent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List respUpdateWordInCurrentDescriptor = $convert.base64Decode(
    'ChdSZXNwVXBkYXRlV29yZEluQ3VycmVudA==');

@$core.Deprecated('Use wordDescriptor instead')
const Word$json = {
  '1': 'Word',
  '2': [
    {'1': 'value', '3': 1, '4': 1, '5': 9, '10': 'value'},
    {'1': 'frequency', '3': 2, '4': 1, '5': 4, '10': 'frequency'},
    {'1': 'json', '3': 3, '4': 1, '5': 9, '10': 'json'},
    {'1': 'transcript', '3': 4, '4': 1, '5': 9, '10': 'transcript'},
  ],
};

/// Descriptor for `Word`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List wordDescriptor = $convert.base64Decode(
    'CgRXb3JkEhQKBXZhbHVlGAEgASgJUgV2YWx1ZRIcCglmcmVxdWVuY3kYAiABKARSCWZyZXF1ZW'
    '5jeRISCgRqc29uGAMgASgJUgRqc29uEh4KCnRyYW5zY3JpcHQYBCABKAlSCnRyYW5zY3JpcHQ=');

@$core.Deprecated('Use reqReviewForTodayDescriptor instead')
const ReqReviewForToday$json = {
  '1': 'ReqReviewForToday',
};

/// Descriptor for `ReqReviewForToday`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reqReviewForTodayDescriptor = $convert.base64Decode(
    'ChFSZXFSZXZpZXdGb3JUb2RheQ==');

@$core.Deprecated('Use respReviewForTodayDescriptor instead')
const RespReviewForToday$json = {
  '1': 'RespReviewForToday',
  '2': [
    {'1': 'first_n_word', '3': 1, '4': 3, '5': 11, '6': '.api.WordInReview', '10': 'firstNWord'},
    {'1': 'count_all', '3': 2, '4': 1, '5': 13, '10': 'countAll'},
  ],
};

/// Descriptor for `RespReviewForToday`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List respReviewForTodayDescriptor = $convert.base64Decode(
    'ChJSZXNwUmV2aWV3Rm9yVG9kYXkSMwoMZmlyc3Rfbl93b3JkGAEgAygLMhEuYXBpLldvcmRJbl'
    'Jldmlld1IKZmlyc3ROV29yZBIbCgljb3VudF9hbGwYAiABKA1SCGNvdW50QWxs');

@$core.Deprecated('Use reqSearchInReviewListDescriptor instead')
const ReqSearchInReviewList$json = {
  '1': 'ReqSearchInReviewList',
  '2': [
    {'1': 'limit', '3': 1, '4': 1, '5': 13, '10': 'limit'},
    {'1': 'offset', '3': 2, '4': 1, '5': 13, '10': 'offset'},
    {'1': 'use_success_count', '3': 3, '4': 1, '5': 13, '10': 'useSuccessCount'},
  ],
};

/// Descriptor for `ReqSearchInReviewList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reqSearchInReviewListDescriptor = $convert.base64Decode(
    'ChVSZXFTZWFyY2hJblJldmlld0xpc3QSFAoFbGltaXQYASABKA1SBWxpbWl0EhYKBm9mZnNldB'
    'gCIAEoDVIGb2Zmc2V0EioKEXVzZV9zdWNjZXNzX2NvdW50GAMgASgNUg91c2VTdWNjZXNzQ291'
    'bnQ=');

@$core.Deprecated('Use respSearchInReviewListDescriptor instead')
const RespSearchInReviewList$json = {
  '1': 'RespSearchInReviewList',
  '2': [
    {'1': 'word', '3': 1, '4': 3, '5': 11, '6': '.api.WordInReview', '10': 'word'},
  ],
};

/// Descriptor for `RespSearchInReviewList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List respSearchInReviewListDescriptor = $convert.base64Decode(
    'ChZSZXNwU2VhcmNoSW5SZXZpZXdMaXN0EiUKBHdvcmQYASADKAsyES5hcGkuV29yZEluUmV2aW'
    'V3UgR3b3Jk');

@$core.Deprecated('Use reqDeleteProfileDescriptor instead')
const ReqDeleteProfile$json = {
  '1': 'ReqDeleteProfile',
};

/// Descriptor for `ReqDeleteProfile`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reqDeleteProfileDescriptor = $convert.base64Decode(
    'ChBSZXFEZWxldGVQcm9maWxl');

@$core.Deprecated('Use respDeleteProfileDescriptor instead')
const RespDeleteProfile$json = {
  '1': 'RespDeleteProfile',
};

/// Descriptor for `RespDeleteProfile`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List respDeleteProfileDescriptor = $convert.base64Decode(
    'ChFSZXNwRGVsZXRlUHJvZmlsZQ==');

@$core.Deprecated('Use reqSentencesDescriptor instead')
const ReqSentences$json = {
  '1': 'ReqSentences',
  '2': [
    {'1': 'word', '3': 1, '4': 1, '5': 9, '10': 'word'},
    {'1': 'limit', '3': 2, '4': 1, '5': 13, '10': 'limit'},
    {'1': 'offset', '3': 3, '4': 1, '5': 13, '10': 'offset'},
  ],
};

/// Descriptor for `ReqSentences`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reqSentencesDescriptor = $convert.base64Decode(
    'CgxSZXFTZW50ZW5jZXMSEgoEd29yZBgBIAEoCVIEd29yZBIUCgVsaW1pdBgCIAEoDVIFbGltaX'
    'QSFgoGb2Zmc2V0GAMgASgNUgZvZmZzZXQ=');

@$core.Deprecated('Use respSentencesDescriptor instead')
const RespSentences$json = {
  '1': 'RespSentences',
  '2': [
    {'1': 'data', '3': 1, '4': 3, '5': 9, '10': 'data'},
  ],
};

/// Descriptor for `RespSentences`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List respSentencesDescriptor = $convert.base64Decode(
    'Cg1SZXNwU2VudGVuY2VzEhIKBGRhdGEYASADKAlSBGRhdGE=');

@$core.Deprecated('Use respDefaultDescriptor instead')
const RespDefault$json = {
  '1': 'RespDefault',
  '2': [
    {'1': 'value', '3': 1, '4': 1, '5': 8, '10': 'value'},
  ],
};

/// Descriptor for `RespDefault`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List respDefaultDescriptor = $convert.base64Decode(
    'CgtSZXNwRGVmYXVsdBIUCgV2YWx1ZRgBIAEoCFIFdmFsdWU=');


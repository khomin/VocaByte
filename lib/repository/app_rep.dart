import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:collection/collection.dart';
import 'package:fixnum/fixnum.dart' as fixnum;
import 'package:fixnum/fixnum.dart';
import 'package:loggy/loggy.dart';
import 'package:rxdart/rxdart.dart';
import 'package:share_plus/share_plus.dart';
import 'package:vocabyte/main.dart';
import 'package:vocabyte/pages/models/search_word_model.dart';
import 'package:vocabyte/pages/word_details/next_review_panel.dart';
import 'package:vocabyte/repository/settings_rep.dart';
import 'package:vocabyte/resource/constants.dart';
import 'package:vocabyte/pages/card_review/card_review_nav.dart';
import 'package:vocabyte/pages/models/word_data.dart';
import 'package:vocabyte/app/ui_helper.dart';
import 'package:vocabyte/repository/review_task.dart';
import 'package:vocabyte/repository/review_task_base.dart';
import 'package:vocabyte/repository/review_task_mock.dart';
import 'package:vocabyte/services/protobuf/proto.pb.dart';
import 'package:vocabyte/services/service_api.dart';

class NumeralsStage {
  NumeralsStage({this.stage = 0, this.all = 0});
  int stage = 0;
  int all = 0;
}

class AppRep {
  final onRecentWords = BehaviorSubject<List<SearchInfo>>();
  final onReviewProgress = BehaviorSubject<double>.seeded(0);
  final onManageWordChanged = BehaviorSubject<List<WordInReview>?>();
  final onNumeralsProgress = BehaviorSubject<double>.seeded(0);
  final onNumeralsStage = BehaviorSubject.seeded(NumeralsStage());

  late final ReviewTaskBase reviewTask;
  late final BehaviorSubject<ReviewTaskBase> onReviewTaskChanged;
  FullInfo? cachedWord;
  static const tag = 'appRep';

  AppRep() {
    if (Constants.isMock) {
      reviewTask = ReviewTaskMock();
    } else {
      reviewTask = ReviewTask();
    }
    onReviewTaskChanged = BehaviorSubject.seeded(reviewTask);
  }

  Future<void> updateRecent() async {
    var v = await ServiceApi().getRecent();
    var list = <SearchInfo>[];
    var manageList = getIt<AppRep>().onManageWordChanged.valueOrNull ?? [];
    for (var it in v.word) {
      var word = UiHelper.toFormatText(it);
      list.add(SearchInfo(
          word: word,
          transcript: '',
          meaning: [],
          freq: -1,
          examples: [],
          isInStudy: manageList.firstWhereOrNull((manage) {
                return manage.word.toLowerCase() == word.toLowerCase();
              }) !=
              null));
    }
    onRecentWords.add(list);
  }

  Future<FullInfo?> wordToInfo(Word word) async {
    try {
      Map? json;
      json = jsonDecode(word.json) as Map;
      var objWord = (json['word'] as String);
      var meanings = <Meaning>[];
      var examples = <String>[];
      var examplesJson = json['examples'] as List<dynamic>? ?? [];
      for (var it in examplesJson) {
        examples.add(it);
      }
      if (json['meanings'] != null) {
        var meaningJson = (json['meanings'] as List<dynamic>);
        for (var it in meaningJson) {
          var it2 = it as Map;
          var definition = it2['def'] as String;
          var speechPart = it2['speech_part'] as String;
          var synonyms = it2['synonyms'] as List?;
          var example = it2['example'] as String?;
          var meaningId = it2['id'] as String?;
          var meaning = Meaning(
              id: meaningId,
              definition: UiHelper.toFormatText(definition),
              example: UiHelper.toFormatText(example ?? ''),
              speechPart: speechPart,
              synonyms: []);
          if (synonyms != null) {
            for (var it in synonyms) {
              meaning.synonyms.add(UiHelper.toFormatText(it ?? ''));
            }
          }
          meanings.add(meaning);
        }
        // meaning with example/synonyms - higher in list
        meanings.sort((a, b) {
          var va = 0;
          var vb = 0;
          if (a.example != null && a.example?.isNotEmpty == true) {
            va += 1;
          }
          if (a.synonyms.isNotEmpty) {
            va += 1;
          }
          if (b.example != null && b.example?.isNotEmpty == true) {
            vb += 1;
          }
          if (b.synonyms.isNotEmpty) {
            vb += 1;
          }
          return vb.compareTo(va);
        });
      }
      return FullInfo(
          word: UiHelper.toFormatText(objWord),
          transcript: UiHelper.toFormatText(word.transcript),
          meaning: meanings,
          freq: word.frequency.toInt(),
          examples: examples);
    } catch (ex) {
      logError('$tag: search ex: $ex');
    }
    logError('$tag: cannot get info $word');
    return null;
  }

  Future updateReviewTime(String? word, Int64 time) async {
    if (word == null) return;
    var current =
        await getIt<AppRep>().reviewTask.getWordReviewStatus(word: word);
    if (current != null) {
      current.nextReviewTmMs = time;
      current.lastTmSuccess = Int64(DateTime.now().millisecondsSinceEpoch);
      await ServiceApi().updateCurrent(
          req: ReqUpdateWordInCurrent(
              word: current.word,
              successCount: current.successCount,
              failCount: current.failCount,
              lastTmSuccess: current.lastTmSuccess,
              lastTmFail: current.lastTmFail,
              nextReviewTmMs: current.nextReviewTmMs,
              meaningId: current.meaningId));
    } else {
      logWarning('$tag: update review time empty current');
    }
    return null;
  }

  Future updateMeaningId(
      {required String word, required String meaningId}) async {
    var current =
        await getIt<AppRep>().reviewTask.getWordReviewStatus(word: word);
    if (current != null) {
      current.meaningId = meaningId;
      await ServiceApi().updateCurrent(
          req: ReqUpdateWordInCurrent(
              word: current.word,
              successCount: current.successCount,
              failCount: current.failCount,
              lastTmSuccess: current.lastTmSuccess,
              lastTmFail: current.lastTmFail,
              nextReviewTmMs: current.nextReviewTmMs,
              meaningId: current.meaningId));
    } else {
      logWarning('$tag: update review time empty current');
    }
    return null;
  }

  Duration reviewTimeInDuration(WordInReview current) {
    var now = DateTime.now();
    var lastTm = max(current.lastTmFail.toInt(), current.lastTmSuccess.toInt());
    var nextReviewTm = DateTime.fromMillisecondsSinceEpoch(
        lastTm + current.nextReviewTmMs.toInt());
    var diff = nextReviewTm.difference(now);
    return diff;
  }

  ReviewTime reviewTimeToEnum(WordInReview? current) {
    if (current == null) {
      return ReviewTime.today;
    }
    var dur = getIt<AppRep>().reviewTimeInDuration(current);
    if (dur.isNegative) {
      return ReviewTime.today;
    } else {
      // more or 1 month
      if (dur.inDays > 26) {
        var month = dur.inDays ~/ 26;
        switch (month) {
          case 1:
          case 2:
            return ReviewTime.month1;
          default:
            return ReviewTime.month3;
        }
      } else if (dur.inDays >= 6) {
        // more or 1 week
        var week = dur.inDays ~/ 7;
        switch (week) {
          case 0:
          case 1:
            return ReviewTime.week1;
          default:
            return ReviewTime.month1;
        }
      } else {
        // day up to 7
        var day = dur.inDays;
        if (day > 1) {
          return ReviewTime.day1;
        }
        return ReviewTime.today;
      }
    }
  }

  void refreshWordToLearn() async {
    var v = reviewTask;
    await v.refresh();
    getIt<AppRep>().onReviewTaskChanged.add(v);
  }

  static fixnum.Int64 reviewTimeToInt(ReviewTime review) {
    switch (review) {
      case ReviewTime.today:
        return fixnum.Int64(0);
      case ReviewTime.day1:
        return fixnum.Int64(const Duration(days: 1).inMilliseconds);
      case ReviewTime.week1:
        return fixnum.Int64(const Duration(days: 7).inMilliseconds);
      case ReviewTime.month1:
        return fixnum.Int64(const Duration(days: 26).inMilliseconds);
      case ReviewTime.month3:
        return fixnum.Int64(const Duration(days: 26 * 3).inMilliseconds);
    }
  }

  String? reviewInToString(Duration reviewIn) {
    reviewIn += const Duration(hours: 1);
    if (reviewIn.isNegative || reviewIn.inDays == 0 && reviewIn.inHours < 24) {
      if (reviewIn.inHours < 24 && reviewIn.inHours >= 1) {
        return 'in ${reviewIn.inHours} hours';
      }
      return 'Today';
    } else if (reviewIn.inDays >= 25) {
      // more or 1 month
      var month = reviewIn.inDays ~/ 25;
      if (month == 1) {
        return 'in ${month.round()} month';
      } else {
        return 'in ${month.round()} months';
      }
    } else if (reviewIn.inDays >= 7) {
      // more or 1 week
      var week = reviewIn.inDays / 7;
      if (week == 1) {
        return 'in ${week.round()} week';
      } else {
        return 'in ${week.round()} weeks';
      }
    } else if (reviewIn.inDays >= 1) {
      // day up to 7
      var day = reviewIn.inDays;
      if (day == 1) {
        return 'in ${day.round()} day';
      } else {
        return 'in ${day.round()} days';
      }
    } else {
      if (reviewIn.inHours >= 2) {
        return 'in ${reviewIn.inHours} hours';
      } else {
        return 'in ${reviewIn.inHours} hour';
      }
    }
  }

  Future<CardData?> buildReview(
      {required String v,
      required String? meaningId,
      required CardPageType type}) async {
    var search = await ServiceApi().getDictionary(word: v, useLike: false);
    var info = await getIt<AppRep>().wordToInfo(search.item.first);
    var randList = await ServiceApi().getDictionaryRand(3);
    if (randList.words.isEmpty) {
      logWarning('$tag: no rand words: [$v]');
      return null;
    }
    if (info == null || info.meaning.isEmpty) {
      logWarning('$tag: no meanings: [$v]');
      return null;
    }
    switch (type) {
      case CardPageType.wordToDef:
      case CardPageType.audioToDef:
        var card = CardData(data: info, pageType: type);
        for (var i = 0; i < 3; i++) {
          var randInfo = await getIt<AppRep>().wordToInfo(randList.words[i]);
          card.options?.add({
            'value': UiHelper.toFormatText(randInfo == null
                ? 'undefined'
                : randInfo.meaning.first.definition),
            'correct': false
          });
        }
        Meaning meaning;
        var found = info.meaning.firstWhereOrNull((i) => i.id == meaningId);
        if (found != null) {
          meaning = found;
        } else {
          meaning = info.meaning.first;
        }
        card.options?.add({'value': meaning.definition, 'correct': true});
        card.options?.shuffle();
        return card;
      case CardPageType.defToWords:
        var card = CardData(data: info, pageType: type);
        for (var i = 0; i < 3; i++) {
          var randWord = randList.words[i];
          card.options?.add({
            'value': UiHelper.toFormatText(randWord.value),
            'correct': false
          });
        }
        card.options?.add({'value': info.word, 'correct': true});
        card.options?.shuffle();
        return card;
      case CardPageType.wordRemeberOrNot:
        break;
      default:
        break;
    }
    return null;
  }

  Future<void> play(SoundType type) async {
    if (!await SettingsRep().getUseSound()) {
      return;
    }
    switch (type) {
      case SoundType.successShort:
        ServiceApi().playAsset('click-pop-02.wav');
        break;
      case SoundType.successLong:
        ServiceApi().playAsset('tada.flac');
        break;
      case SoundType.failedShort:
        ServiceApi().playAsset('bone1.wav');
        break;
      case SoundType.failedLong:
        ServiceApi().playAsset('trumpet.wav');
        break;
    }
  }

  Future<List<WordInReview>> refreshManageList() async {
    var offset = 0;
    const limit = 5;
    final list = <WordInReview>[];
    var hasData = true;
    while (hasData) {
      var r = await ServiceApi().searchInReviewList(
          limit: limit, offset: offset, useSuccessCount: null);
      if (r.word.length >= limit) {
        offset += limit;
      } else {
        hasData = false;
      }
      for (var it in r.word) {
        list.add(it);
      }
    }
    list.sort((a, b) {
      return a.successCount.compareTo(b.successCount);
    });
    onManageWordChanged.add(list);
    updateRecent();
    return list;
  }

  void shareApp() {
    Share.shareUri(Uri.parse(Constants.appLink));
  }
}

enum SoundType { successShort, successLong, failedShort, failedLong }

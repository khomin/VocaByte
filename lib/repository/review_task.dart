import 'dart:math';
import 'package:collection/collection.dart';
import 'package:fixnum/fixnum.dart';
import 'package:loggy/loggy.dart';
import 'package:vocabyte/app_runner.dart';
import 'package:vocabyte/models/review_model.dart';
import 'package:vocabyte/repository/app_rep.dart';
import 'package:vocabyte/repository/review_task_base.dart';
import 'package:vocabyte/services/protobuf/app.pb.dart';
import 'package:vocabyte/services/service_api.dart';

class ReviewTask extends ReviewTaskBase {
  @override
  Future refresh() async {
    var cards = <CardData>[];
    randomPages.shuffle();

    var current = await ServiceApi().getCurrentToStudy();
    for (var it in current.firstNWord) {
      var r = await getIt<AppRep>().buildReview(
          v: it.word, meaningId: it.meaningId, type: randomPages.first);
      if (r != null) {
        // remove double
        if (cards.firstWhereOrNull(
                (v) => v.data.word.toLowerCase() == it.word.toLowerCase()) ==
            null) {
          cards.add(r);
        }
      }
    }
    wordToReviewCnt.add(current.countAll);
    cardData.clear();
    cardData.addAll(cards);
  }

  @override
  Future getMore() async {
    var current = await ServiceApi().getCurrentToStudy();
    for (var it in current.firstNWord) {
      var r = await getIt<AppRep>().buildReview(
          v: it.word, meaningId: it.meaningId, type: CardPageType.defToWords);
      if (r != null) {
        // remove double
        if (cardData.firstWhereOrNull((it2) =>
                it2.data.word.toLowerCase() == it.word.toLowerCase()) ==
            null) {
          cardData.add(r);
        }
      }
    }
    wordToReviewCnt.add(current.countAll);
    getIt<AppRep>().onReviewTaskChanged.add(this);
  }

  @override
  Future<CardData?> pop({required bool success}) async {
    lastAnswerRight = success;
    if (cardData.isEmpty) {
      return null;
    }
    var item = cardData.removeAt(0);
    // get current
    var current = await ServiceApi().getCurrentExact(word: item.data.word);
    // update
    if (current != null) {
      if (success) {
        current.successCount++;
        current.lastTmSuccess = Int64(DateTime.now().millisecondsSinceEpoch);
        if (current.successCount >= 10) {
          current.nextReviewTmMs = Int64(0);
        } else {
          var intValDays = pow(current.successCount, 2);
          current.nextReviewTmMs = Int64(
            Duration(days: intValDays.toInt()).inMilliseconds,
          );
        }
      } else {
        current.failCount++;
        current.lastTmFail = Int64(DateTime.now().millisecondsSinceEpoch);
        current.nextReviewTmMs = Int64(const Duration(days: 1).inMilliseconds);
      }
      await ServiceApi().updateCurrent(
          req: ReqUpdateWordInCurrent(
        word: current.word,
        successCount: current.successCount,
        failCount: current.failCount,
        lastTmSuccess: current.lastTmSuccess,
        lastTmFail: current.lastTmFail,
        nextReviewTmMs: current.nextReviewTmMs,
        meaningId: current.meaningId,
      ));
      ServiceApi().logReview();
    } else {
      logWarning('$tag: update card result empty current');
    }
    var doneCnt = (wordDoneCount.valueOrNull ?? 0) + 1;
    var reviewCnt = wordToReviewCnt.valueOrNull ?? 0;
    var percent = 0.0;
    if (reviewCnt > 0) {
      percent = doneCnt * 100 / reviewCnt;
    }
    // TODO: check progress for errors
    getIt<AppRep>().onReviewProgress.add(percent / 100);
    getIt<AppRep>().onReviewTaskChanged.add(this);
    wordDoneCount.add(doneCnt);
    if (cardData.length <= 3) {
      await getMore();
    }
    return null;
  }

  @override
  Future<WordInReview?> getWordReviewStatus({required String word}) {
    return ServiceApi().getCurrentExact(word: word);
  }
}

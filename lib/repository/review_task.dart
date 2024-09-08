import 'dart:math';
import 'package:collection/collection.dart';
import 'package:fixnum/fixnum.dart';
import 'package:loggy/loggy.dart';
import 'package:vocabyte/domains/card_review/card_review_nav.dart';
import 'package:vocabyte/repository/app_rep.dart';
import 'package:vocabyte/repository/review_task_base.dart';
import 'package:vocabyte/services/protobuf/proto.pb.dart';
import 'package:vocabyte/services/service_api.dart';

class ReviewTask extends ReviewTaskBase {
  @override
  Future refresh() async {
    var cards = <CardData>[];
    randomPages.shuffle();

    var current = await ServiceApi().getReviewForToday();
    for (var it in current.firstNWord) {
      var r = await AppRep().buildReview(it.word, randomPages.first);
      if (r != null) {
        // remove double
        if (cards.firstWhereOrNull((it2) =>
                it2.data.word.toLowerCase() == it.word.toLowerCase()) ==
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
    var current = await ServiceApi().getReviewForToday();
    for (var it in current.firstNWord) {
      var r = await AppRep().buildReview(it.word, CardPageType.defToWords);
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
    AppRep().onReviewTaskChanged.add(this);
  }

  @override
  Future<CardData?> pop({required bool success}) async {
    lastAnswerRight = success;
    if (cardData.isEmpty) {
      return null;
    }
    var item = cardData.removeAt(0);
    // get current
    var cur = await ServiceApi().getWordReviewStatus(word: item.data.word);
    // update
    if (cur != null) {
      if (success) {
        cur.successCount++;
        cur.lastTmSuccess = Int64(DateTime.now().millisecondsSinceEpoch);
        if (cur.successCount >= 10) {
          cur.nextReviewTmMs = Int64(0);
        } else {
          var intValDays = pow(cur.successCount, 2);
          cur.nextReviewTmMs =
              Int64(Duration(days: intValDays.toInt()).inMilliseconds);
        }
      } else {
        cur.failCount++;
        cur.lastTmFail = Int64(DateTime.now().millisecondsSinceEpoch);
        cur.nextReviewTmMs = Int64(const Duration(days: 1).inMilliseconds);
      }
      await ServiceApi().updateWordInCurrent(
          req: ReqUpdateWordInCurrent(
              word: cur.word,
              successCount: cur.successCount,
              failCount: cur.failCount,
              lastTmSuccess: cur.lastTmSuccess,
              lastTmFail: cur.lastTmFail,
              nextReviewTmMs: cur.nextReviewTmMs));
    } else {
      logWarning('$tag: update card result empty current');
    }
    var doneCnt = (wordDoneCount.valueOrNull ?? 0) + 1;
    var reviewCnt = wordToReviewCnt.valueOrNull ?? 0;
    var percent = 0.0;
    if (reviewCnt > 0) {
      percent = doneCnt * 100 / reviewCnt;
    }
    AppRep().onProgressChanged.add(percent / 100);
    AppRep().onReviewTaskChanged.add(this);
    wordDoneCount.add(doneCnt);
    if (cardData.length <= 3) {
      await getMore();
    }
    return null;
  }

  @override
  Future<WordInReview?> getWordReviewStatus({required String word}) {
    return ServiceApi().getWordReviewStatus(word: word);
  }
}

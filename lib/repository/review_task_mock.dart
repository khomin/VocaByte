import 'package:vocabyte/domains/card_review/card_review_nav.dart';
import 'package:vocabyte/repository/app_rep.dart';
import 'package:vocabyte/repository/review_task_base.dart';
import 'package:collection/collection.dart';
import 'package:vocabyte/services/protobuf/proto.pb.dart';
import 'package:fixnum/fixnum.dart' as fixnum;

class ReviewTaskMock extends ReviewTaskBase {
  @override
  Future refresh() async {
    var cards = <CardData>[];
    randomPages.shuffle();
    var i = 0;
    for (var it in mockList) {
      var r = await AppRep().buildReview(it, randomPages.first);
      if (r != null) {
        cards.add(r);
      }
      if (i++ > cacheSize) {
        break;
      }
    }
    wordToReviewCnt.add(mockList.length);
    for (var it in cards) {
      mockList.remove(it.data.word.toLowerCase());
    }
    cardData.clear();
    cardData.addAll(cards);
  }

  @override
  Future getMore() async {
    for (var it in mockList) {
      var r = await AppRep().buildReview(it, CardPageType.defToWords);
      if (r != null) {
        cardData.add(r);
      }
      if (cardData.length > cacheSize) {
        break;
      }
    }
    for (var it in cardData) {
      mockList.remove(it.data.word.toLowerCase());
    }
    if (mockList.length < cardData.length) {
      wordToReviewCnt.add(cardData.length);
    } else {
      wordToReviewCnt.add(mockList.length);
    }
    AppRep().onReviewTaskChanged.add(this);
  }

  @override
  Future<CardData?> pop({required bool success}) async {
    lastAnswerRight = success;
    if (cardData.isEmpty) {
      return null;
    }
    cardData.removeAt(0);
    var doneCnt = (wordDoneCount.valueOrNull ?? 0) + 1;
    var reviewCnt = wordToReviewCnt.valueOrNull ?? 0;
    var percent = 0.0;
    if (reviewCnt > 0) {
      percent = doneCnt * 100 / reviewCnt;
    }
    AppRep().onProgressChanged.add(percent / 100);
    AppRep().onReviewTaskChanged.add(this);
    wordDoneCount.add(doneCnt);

    if (cardData.length < cacheSize) {
      await getMore();
    }
    return null;
  }

  @override
  Future<WordInReview?> getWordReviewStatus({required String word}) async {
    var it = mockList.firstWhereOrNull((element) {
      return element == word;
    });
    var tm = DateTime.now();
    var tm2 = DateTime.fromMillisecondsSinceEpoch(
        tm.millisecondsSinceEpoch - const Duration(days: 2).inMilliseconds);
    return WordInReview(
        word: it,
        failCount: 2,
        successCount: 3,
        lastTmFail: fixnum.Int64(tm2.millisecondsSinceEpoch),
        lastTmSuccess: fixnum.Int64(tm2.millisecondsSinceEpoch),
        nextReviewTmMs: fixnum.Int64(const Duration(days: 1).inMilliseconds));
  }

  final mockList = <String>[
    'insipid',
    'drown',
    'effect',
    'effective',
    'effectively',
    'emergency',
    'equivalent',
    'equivalence',
    'especially',
    'estimate',
    'estimation',
    'evident',
    'evidence',
    'evidently',
    'excellence',
    'excellent',
    'exhale',
    'expend',
    'expendable',
    'experience',
    'experiential',
    'explain',
    'explanation',
    'explosive',
    'extremely',
    'factor',
    'final',
    'forbid',
    'forbidden',
    'forecast',
    'forecaster',
    'funnel',
    'gap',
    'gentle',
    'grade',
    'hide',
    'ignore',
    'ignorance',
    'illustrate',
    'injure',
    'innovate',
    'innovation',
    'leak',
    'least',
    'liberal',
    'locate',
    'lotion',
    'major',
    'material',
    'missing',
    'negate',
    'normal',
    'obedience',
    'obedient',
    'objective',
    'outcome',
    'owe',
    'passenger',
    'patience',
    'pay',
    'pearl',
    'perceive',
    'perception',
    'pertain',
    'pertinent',
    'pinch',
    'plus',
    'potential',
    'predict',
    'prediction',
    'presence',
    'profession',
    'professional',
    'proficient',
    'proficiency',
    'receipt',
    'resurgent',
    'resurgence',
    'resuscitate',
    'resuscitation',
    'scare',
    'search',
    'scent',
    'section',
    'select',
    'selection',
    'selective',
    'selectively',
    'sequence',
    'sequential',
    'series',
    'shark',
    'shelter',
    'site',
    'slide',
    'spinach',
    'sufficient',
    'sufficiency',
    'suitable',
    'suppress',
    'surge',
    'survive',
    'survival',
    'tame',
    'thunderstorm',
    'tornado',
    'unaided',
    'unaware',
    'underestimate',
    'unpredictability',
    'usage',
    'vehicle',
    'vehicular',
    'victim',
    'victimize',
    'wave',
    'weak',
    'weakness'
  ];
}

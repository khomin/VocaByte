import 'package:rxdart/rxdart.dart';
import 'package:vocabyte/domains/card_review/card_review_nav.dart';
import 'package:vocabyte/repository/app_rep.dart';
import 'package:vocabyte/services/protobuf/proto.pb.dart';

class ReviewTaskBase {
  final cardData = <CardData>[];
  final wordToReviewCnt = BehaviorSubject<int>.seeded(0);
  final wordDoneCount = BehaviorSubject<int>.seeded(0);
  final cacheSize = 5;
  bool lastAnswerRight = false;

  final randomPages = <CardPageType>[
    CardPageType.defToWords,
    CardPageType.audioToDef,
    CardPageType.wordToDef
  ];
  final tag = 'reviewTask';

  void resetProgress() {
    wordDoneCount.add(0);
    AppRep().onProgressChanged.add(0);
  }

  Future refresh() {
    throw 'implement';
  }

  Future getMore() {
    throw 'implement';
  }

  CardData? current() {
    try {
      return cardData.first;
    } catch (_) {
      return null;
    }
  }

  Future<CardData?> pop({required bool success}) {
    throw 'implement';
  }

  Future<WordInReview?> getWordReviewStatus({required String word}) {
    throw 'implement';
  }
}

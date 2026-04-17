import 'package:flutter/material.dart';
import 'package:vocabyte/app_runner.dart';
import 'package:vocabyte/components/disposable_stream.dart';
import 'package:vocabyte/models/word_data.dart';
import 'package:vocabyte/repository/app_rep.dart';
import 'package:vocabyte/repository/payment_service.dart';
import 'package:vocabyte/resource/constants.dart';
import 'package:vocabyte/services/service_api.dart';

class CardData {
  CardData({required this.data, required this.pageType, this.options}) {
    options ??= [];
  }
  FullInfo data;
  CardPageType pageType;
  List<dynamic>? options;
}

enum CardPageType {
  idle,
  noWords,
  wordToDef,
  defToWords,
  wordRemeberOrNot,
  learnNewWord,
  learnDone,
  wordDetails,
  audioToDef
}

enum NextCardResultType { ok, noWords, freeLimitExceeded }

class ReviewModel with ChangeNotifier {
  final navKey = GlobalKey<NavigatorState>();
  var learnedCntSinceBreak = 0;
  var learnedCntAll = 0;
  final _dispStream = DisposableStream();
  var _disposed = false;

  ReviewModel() {
    getIt<AppRep>().reviewTask.resetProgress();
    learnedCntAll = getIt<AppRep>().reviewTask.wordDoneCount.valueOrNull ?? 0;
  }

  @override
  void dispose() {
    _dispStream.dispose();
    _disposed = true;
    super.dispose();
  }

  void notify() {
    if (_disposed) return;
    notifyListeners();
  }

  Future<void> handleAnswer({required bool success}) async {
    var review = getIt<AppRep>().reviewTask;
    var last = review.current();
    await review.pop(success: success);
    if (last != null) {
      getIt<AppRep>().cachedWord = last.data;
    }
    learnedCntAll++;
    learnedCntSinceBreak++;
    var nav = navKey.currentState;
    nav?.pushReplacementNamed(CardPageType.wordDetails.name);
  }

  Future<NextCardResultType> nextCard() async {
    var v = getIt<AppRep>().reviewTask;
    var current = v.current();
    var nav = navKey.currentState;
    if (!await getIt<PaymentService>().isPremium(cached: true)) {
      if (!await ServiceApi().checkReviewLimit(Constants.freeLimit)) {
        return NextCardResultType.freeLimitExceeded;
      }
    }
    //
    if (current == null) {
      // no more cards to learn
      getIt<AppRep>().play(SoundType.successShort);
      nav?.pushReplacementNamed(
        CardPageType.noWords.name,
        arguments: {'word': current},
      );
      return NextCardResultType.noWords;
    }
    nav?.pushReplacementNamed(
      current.pageType.name,
      arguments: {'word': current},
    );
    return NextCardResultType.ok;
  }

  void pop(BuildContext context) {
    var nav = navKey.currentState;
    var pop = nav?.canPop();
    if (pop == true) {
      nav?.pop();
    } else {
      Navigator.of(context).pop();
    }
  }
}

import 'package:flutter/foundation.dart';
import 'package:vocabyte/components/disposable_stream.dart';
import 'package:vocabyte/domains/card_review/card_page.dart';
import 'package:vocabyte/domains/card_review/cards_done.dart';
import 'package:flutter/material.dart';
import 'package:vocabyte/domains/models/word_data.dart';
import 'package:vocabyte/domains/word_details/page_word_details.dart';
import 'package:vocabyte/repository/app_rep.dart';
import 'package:vocabyte/repository/settings_rep.dart';
import 'package:vocabyte/app/app_theme.dart';
import 'package:vocabyte/app/ui_helper.dart';

class CardReviewNav extends StatefulWidget {
  const CardReviewNav({required this.onBack, super.key});
  final Function onBack;
  @override
  CardReviewNavState createState() => CardReviewNavState();
}

enum CardPageType {
  idle,
  wordToDef,
  defToWords,
  wordRemeberOrNot,
  learnNewWord,
  learnDone,
  wordDetails,
  audioToDef
}

class CardData {
  CardData({required this.data, required this.pageType, this.options}) {
    options ??= [];
  }
  FullInfo data;
  CardPageType pageType;
  List<dynamic>? options;
}

class CardReviewNavState extends State<CardReviewNav> {
  final _dispStream = DisposableStream();
  final _navKey = GlobalKey<NavigatorState>();
  final tag = 'cardReview';

  @override
  void initState() {
    super.initState();

    AppRep().reviewTask.resetProgress();
    Future.microtask(() {
      _nextCard();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _dispStream.dispose();
  }

  void _handleAnswer({required bool success}) async {
    var review = AppRep().reviewTask;
    var last = review.current();
    await review.pop(success: success);
    if (last != null) {
      AppRep().cachedWord = last.data;
    }
    _navKey.currentState?.pushReplacementNamed(CardPageType.wordDetails.name);
  }

  void _nextCard() async {
    var v = AppRep().reviewTask;
    var current = v.current();
    if (current == null) {
      _navKey.currentState?.pushReplacementNamed(CardPageType.learnDone.name);
      AppRep().play(SoundType.successShort);
      // no more cards to learn
      return;
    }
    _navKey.currentState?.pushReplacementNamed(current.pageType.name,
        arguments: {'word': current});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        color: Theme.of(context).colorScheme.page,
        width: size.width,
        height: size.height,
        child: Column(children: [
          //
          // debug info
          if (kDebugMode)
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              StreamBuilder(
                  stream: AppRep().reviewTask.wordToReviewCnt,
                  builder: (context, snapshot) {
                    return Text('reviewCnt=${snapshot.data}, ');
                  }),
              StreamBuilder(
                  stream: AppRep().reviewTask.wordDoneCount,
                  builder: (context, snapshot) {
                    return Text('doneCount=${snapshot.data}, ');
                  }),
              StreamBuilder(
                  stream: AppRep().onReviewTaskChanged,
                  builder: (context, snapshot) {
                    return Text(
                        'cur=${snapshot.data?.cardData.firstOrNull?.data.word}');
                  })
            ]),
          //
          // nav
          _navigator(),
        ]));
  }

  Widget _navigator() {
    return Expanded(
        child: Navigator(
            key: _navKey,
            onGenerateRoute: (RouteSettings settings) {
              var review = AppRep().reviewTask;
              var cardData = review.current();
              var type = UiHelper().routeCardNameToType(settings.name);
              switch (type) {
                //
                // empty
                case CardPageType.idle:
                  return PageRouteBuilder(
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                      settings: RouteSettings(name: type.name),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return child;
                      },
                      pageBuilder: (_, __, ___) => const SizedBox());
                //
                // cards
                case CardPageType.defToWords:
                case CardPageType.audioToDef:
                case CardPageType.wordToDef:
                case CardPageType.wordRemeberOrNot:
                case CardPageType.learnNewWord:
                  return PageRouteBuilder(
                      settings: RouteSettings(name: type.name),
                      transitionDuration: const Duration(seconds: 1),
                      pageBuilder: (_, __, ___) => cardData != null
                          ? CardPage(
                              data: cardData,
                              onDone: (success) {
                                _handleAnswer(success: success);
                              })
                          : const Text('error: card data is null'));
                case CardPageType.learnDone:
                  return PageRouteBuilder(
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                      settings: RouteSettings(name: type.name),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return child;
                      },
                      pageBuilder: (_, __, ___) => CardsDone(
                          number:
                              AppRep().reviewTask.wordDoneCount.valueOrNull ??
                                  0,
                          isEnd: review.current() == null,
                          onDone: () {
                            widget.onBack();
                          },
                          onContinue: () {
                            _nextCard();
                          }));
                case CardPageType.wordDetails:
                  return PageRouteBuilder(
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                      settings: RouteSettings(name: type.name),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return child;
                      },
                      pageBuilder: (_, __, ___) => PageWordDetails(
                          playWordAtStart: !review.lastAnswerRight,
                          onBack: () async {
                            if (AppRep().reviewTask.wordDoneCount.valueOrNull ==
                                await SettingsRep().getDailyGoal()) {
                              _navKey.currentState?.pushReplacementNamed(
                                  CardPageType.learnDone.name);
                              AppRep().play(SoundType.successShort);
                            } else {
                              _nextCard();
                            }
                          }));
              }
            }));
  }
}

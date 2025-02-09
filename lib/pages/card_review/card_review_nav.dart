import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:vocabyte/components/circle_button.dart';
import 'package:vocabyte/components/disposable_stream.dart';
import 'package:vocabyte/components/round_button.dart';
import 'package:vocabyte/pages/card_review/card_page.dart';
import 'package:vocabyte/pages/card_review/cards_done.dart';
import 'package:flutter/material.dart';
import 'package:vocabyte/pages/models/word_data.dart';
import 'package:vocabyte/pages/word_details/page_word_details.dart';
import 'package:vocabyte/repository/app_rep.dart';
import 'package:vocabyte/repository/settings_rep.dart';
import 'package:vocabyte/app/app_theme.dart';
import 'package:vocabyte/app/ui_helper.dart';

class CardReviewNav extends StatefulWidget {
  const CardReviewNav({super.key});
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

  Future<void> _handleAnswer({required bool success}) async {
    var review = AppRep().reviewTask;
    var last = review.current();
    await review.pop(success: success);
    if (last != null) {
      AppRep().cachedWord = last.data;
    }
    _navKey.currentState?.pushReplacementNamed(CardPageType.wordDetails.name);
  }

  Future<void> _nextCard() async {
    var v = AppRep().reviewTask;
    var current = v.current();
    var nav = _navKey.currentState;
    if (current == null) {
      // _navKey.currentState?.pushReplacementNamed(CardPageType.learnDone.name);
      // _navKey.currentState?.pushNamed(CardPageType.learnDone.name);
      AppRep().play(SoundType.successShort);
      // nav?.push(CupertinoPageRoute(
      //     settings: RouteSettings(name: type.name),
      //     builder: (context) {
      //       return const NumeralsNav();
      //     }));
      // no more cards to learn
      return;
    }
    while (nav?.canPop() == true) {
      nav?.pop();
    }
    // nav?.pushNamed(current.pageType.name, arguments: {'word': current});
    // _navKey.currentState?.pushReplacementNamed(current.pageType.name,
    //     arguments: {'word': current});
    //     var nav = _navKey.currentState;
    // nav?.push(CupertinoPageRoute(
    //     settings: RouteSettings(name: type.name),
    //     builder: (context) {
    //       return const NumeralsNav();
    //     }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            shadowColor: Theme.of(context).colorScheme.titel3,
            foregroundColor: Theme.of(context).colorScheme.iconColor,
            automaticallyImplyLeading: false,
            titleSpacing: 0,
            title: SizedBox(
                // color: Theme.of(context).colorScheme.page,
                child: Row(children: [
              CircleButton(
                  iconData: Icons.close,
                  color: Colors.transparent,
                  onPressed: (_) {
                    Navigator.of(context).pop();
                  }),
              const Spacer(),
              Container(
                  width: 35,
                  height: 35,
                  decoration: const BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
              const SizedBox(width: 15)
            ]))),
        body: Stack(children: [
          Navigator(
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
                              Navigator.of(context).pop();
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
                              if (AppRep()
                                      .reviewTask
                                      .wordDoneCount
                                      .valueOrNull ==
                                  await SettingsRep().getDailyGoal()) {
                                _navKey.currentState?.pushReplacementNamed(
                                    CardPageType.learnDone.name);
                                AppRep().play(SoundType.successShort);
                              } else {
                                _nextCard();
                              }
                            }));
                }
              }),
          Positioned(
              bottom: 100,
              left: 10,
              child: RoundButton(
                  color: Colors.white.withOpacity(0.05),
                  iconColor: Theme.of(context).colorScheme.white,
                  size: const Size(50, 50),
                  iconSize: 22,
                  radius: 20,
                  iconData: Icons.insert_photo_sharp,
                  onPressed: (p0) async {
                    // TODO: next
                    await _handleAnswer(success: false);
                    // _nextCard();
                  }))
        ]));
  }
}

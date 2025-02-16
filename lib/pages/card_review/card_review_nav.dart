import 'dart:async';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:vocabyte/components/app_bar2.dart';
import 'package:vocabyte/components/circle_button.dart';
import 'package:vocabyte/components/disposable_stream.dart';
import 'package:vocabyte/components/round_button.dart';
import 'package:vocabyte/pages/card_review/card_no_words.dart';
import 'package:vocabyte/pages/card_review/card_page.dart';
import 'package:vocabyte/pages/card_review/cards_done.dart';
import 'package:flutter/material.dart';
import 'package:vocabyte/pages/models/word_data.dart';
import 'package:vocabyte/pages/word_details/page_word_details.dart';
import 'package:vocabyte/repository/app_rep.dart';
import 'package:vocabyte/repository/nav_rep.dart';
import 'package:vocabyte/repository/settings_rep.dart';
import 'package:vocabyte/app/app_theme.dart';
import 'package:vocabyte/app/ui_helper.dart';
import 'package:vocabyte/resource/constants.dart';

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
  var _leanedCountSinceBreak = 0;
  var _leanedCountAll = 0;
  final tag = 'cardReview';

  @override
  void initState() {
    super.initState();
    AppRep().reviewTask.resetProgress();
    Future.microtask(() {
      _nextCard();
    });
    _leanedCountAll = AppRep().reviewTask.wordDoneCount.valueOrNull ?? 0;
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
    _leanedCountAll++;
    _leanedCountSinceBreak++;
    var nav = _navKey.currentState;
    nav?.pushReplacementNamed(CardPageType.wordDetails.name);
  }

  Future<void> _nextCard() async {
    var v = AppRep().reviewTask;
    var current = v.current();
    var nav = _navKey.currentState;
    if (current == null) {
      // no more cards to learn
      AppRep().play(SoundType.successShort);
      return;
    }
    nav?.pushReplacementNamed(current.pageType.name,
        arguments: {'word': current});
  }

  void _pop() {
    var nav = _navKey.currentState;
    var pop = nav?.canPop();
    if (pop == true) {
      nav?.pop();
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.page,
            leadingWidth: double.infinity,
            leading: AppBar2(
                type: Type.close,
                child: StreamBuilder(
                    stream: AppRep().onReviewProgress,
                    initialData: AppRep().onReviewProgress.valueOrNull,
                    builder: (context, snapshot) {
                      var percent = snapshot.data ?? 0.0;
                      var step = (percent * 10).toInt();
                      return Flexible(
                          child: Row(children: [
                        const Spacer(),
                        CircularStepProgressIndicator(
                            totalSteps: 10,
                            currentStep: step,
                            width: 30,
                            height: 30,
                            roundedCap: (_, isSelected) => isSelected)
                      ]));
                    }))),
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
                        pageBuilder: (_, __, ___) => CardNoWords(onBack: () {
                              _pop();
                            }, onBackOpenSearch: () {
                              _pop();
                              Timer(const Duration(milliseconds: 50), () {
                                NavigatorRep().routeBloc.goto(Panel(
                                    type: PageType.searchWord, fullPop: true));
                              });
                            }));
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
                            number: _leanedCountAll,
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
                              var goal = await SettingsRep().getDailyGoal();
                              if (_leanedCountSinceBreak == goal) {
                                _leanedCountSinceBreak = 0;
                                var nav = _navKey.currentState;
                                nav?.pushReplacementNamed(
                                    CardPageType.learnDone.name);
                                AppRep().play(SoundType.successShort);
                              } else {
                                _nextCard();
                              }
                            }));
                }
              }),
          if (Constants.isDev)
            Positioned(
                bottom: 100,
                left: 10,
                child: Row(children: [
                  Text(
                      'CountaAll=$_leanedCountAll,countBreak=$_leanedCountSinceBreak'),
                  RoundButton(
                      color: Colors.white.withOpacity(0.05),
                      iconColor: Theme.of(context).colorScheme.white,
                      size: const Size(50, 50),
                      iconSize: 22,
                      radius: 20,
                      iconData: Icons.insert_photo_sharp,
                      onPressed: (p0) async {
                        await _handleAnswer(success: false);
                      })
                ]))
        ]));
  }
}

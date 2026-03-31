import 'dart:async';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:vocabyte/components/app_bar2.dart';
import 'package:vocabyte/components/disposable_stream.dart';
import 'package:vocabyte/main.dart';
import 'package:vocabyte/pages/card_review/card_no_words.dart';
import 'package:vocabyte/pages/card_review/card_page.dart';
import 'package:vocabyte/pages/card_review/cards_done.dart';
import 'package:flutter/material.dart';
import 'package:vocabyte/pages/models/word_data.dart';
import 'package:vocabyte/pages/word_details/page_word_details.dart';
import 'package:vocabyte/repository/app_rep.dart';
import 'package:vocabyte/repository/nav_rep.dart';
import 'package:vocabyte/repository/settings_rep.dart';
import 'package:vocabyte/repository/app_theme.dart';
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
  var _leanedCountSinceBreak = 0;
  var _leanedCountAll = 0;
  final tag = 'cardReview';

  @override
  void initState() {
    super.initState();
    getIt<AppRep>().reviewTask.resetProgress();
    Future.microtask(() {
      _nextCard();
    });
    _leanedCountAll = getIt<AppRep>().reviewTask.wordDoneCount.valueOrNull ?? 0;
  }

  @override
  void dispose() {
    _dispStream.dispose();
    getIt<AppRep>().refreshWordToLearn();
    super.dispose();
  }

  Future<void> _handleAnswer({required bool success}) async {
    var review = getIt<AppRep>().reviewTask;
    var last = review.current();
    await review.pop(success: success);
    if (last != null) {
      getIt<AppRep>().cachedWord = last.data;
    }
    _leanedCountAll++;
    _leanedCountSinceBreak++;
    var nav = _navKey.currentState;
    nav?.pushReplacementNamed(CardPageType.wordDetails.name);
  }

  Future<bool> _nextCard() async {
    var v = getIt<AppRep>().reviewTask;
    var current = v.current();
    var nav = _navKey.currentState;
    if (current == null) {
      // no more cards to learn
      getIt<AppRep>().play(SoundType.successShort);
      return false;
    }
    nav?.pushReplacementNamed(current.pageType.name,
        arguments: {'word': current});
    return true;
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
    return PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) async {
          if (didPop) return;
          // var nav = NavigatorRep().routeBloc.navKey;
          // if (nav.currentState?.canPop() == true) {
          //   nav.currentState?.pop();
          //   return;
          // } else {
          //   SystemNavigator.pop();
          // }
        },
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.page,
                leadingWidth: double.infinity,
                elevation: 1,
                shadowColor: Theme.of(context).colorScheme.title4,
                leading: AppBar2(
                    type: Type.close,
                    child: StreamBuilder(
                        stream: getIt<AppRep>().onReviewProgress,
                        initialData:
                            getIt<AppRep>().onReviewProgress.valueOrNull,
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
                    var review = getIt<AppRep>().reviewTask;
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
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              return child;
                            },
                            pageBuilder: (_, __, ___) =>
                                CardNoWords(onBack: () {
                                  _pop();
                                }, onBackOpenSearch: () {
                                  _pop();
                                  // Timer(const Duration(milliseconds: 50), () {
                                  //   NavigatorRep().routeBloc.goto(Panel(
                                  //       type: PageType.searchWord, fullPop: true));
                                  // });
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
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              return child;
                            },
                            pageBuilder: (_, __, ___) => CardsDone(
                                number: _leanedCountAll,
                                isEnd: review.current() == null,
                                onDone: () {
                                  Navigator.of(context).pop();
                                },
                                onContinue: () async {
                                  if (!await _nextCard()) {
                                    if (context.mounted) {
                                      Navigator.of(context).pop();
                                    }
                                  }
                                }));
                      case CardPageType.wordDetails:
                        return PageRouteBuilder(
                            transitionDuration: Duration.zero,
                            reverseTransitionDuration: Duration.zero,
                            settings: RouteSettings(name: type.name),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
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
                                    getIt<AppRep>()
                                        .play(SoundType.successShort);
                                  } else {
                                    if (!await _nextCard()) {
                                      if (context.mounted) {
                                        Navigator.of(context).pop();
                                      }
                                    }
                                  }
                                }));
                    }
                  }),
              // if (Constants.isDev)
              //   Positioned(
              //       bottom: 100,
              //       left: 10,
              //       child: ThemeSwitcher(
              //           clipper: const ThemeSwitcherCircleClipper(),
              //           builder: (context) {
              //             return Row(children: [
              //               // Text(
              //               //     'CountaAll=$_leanedCountAll,countBreak=$_leanedCountSinceBreak'),
              //               RoundButton(
              //                   color: Theme.of(context)
              //                       .colorScheme
              //                       .buttonOption1
              //                       .withValues(alpha: 0.4),
              //                   iconColor:
              //                       Theme.of(context).colorScheme.title1.color,
              //                   size: const Size(50, 50),
              //                   iconSize: 22,
              //                   radius: 20,
              //                   iconData: Icons.switch_right,
              //                   onPressed: (p0) async {
              //                     var theme = await SettingsRep().getTheme();
              //                     if (!context.mounted) return;
              //                     ThemeSwitcher.of(context).changeTheme(
              //                         theme: theme == ThemeMode.dark
              //                             ? lightTheme
              //                             : darkTheme);
              //                     await SettingsRep().setTheme(theme);
              //                   })
              //             ]);
              //           }))
            ])));
  }
}

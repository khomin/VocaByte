import 'dart:async';
import 'package:flutter/services.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:vocabyte/components/app_bar2.dart';
import 'package:vocabyte/app_runner.dart';
import 'package:vocabyte/models/review_model.dart';
import 'package:vocabyte/pages/card_review/card_no_words.dart';
import 'package:vocabyte/pages/card_review/card_page.dart';
import 'package:vocabyte/pages/card_review/cards_done.dart';
import 'package:flutter/material.dart';
import 'package:vocabyte/pages/word_details/page_word_details.dart';
import 'package:vocabyte/repository/app_rep.dart';
import 'package:vocabyte/repository/settings_rep.dart';
import 'package:vocabyte/repository/app_theme.dart';
import 'package:vocabyte/app/ui_helper.dart';
import 'package:vocabyte/resource/constants.dart';

class CardReviewMain extends StatefulWidget {
  const CardReviewMain({super.key});

  @override
  CardReviewMainState createState() => CardReviewMainState();
}

class CardReviewMainState extends State<CardReviewMain> {
  final _model = ReviewModel();
  final tag = 'cardReview';

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      _model.nextCard();
    });
  }

  @override
  void dispose() {
    _model.dispose();
    getIt<AppRep>().refreshWordToLearn();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) async {
          if (didPop) return;
          if (Navigator.of(context).canPop() == true) {
            Navigator.of(context).pop();
            return;
          } else {
            SystemNavigator.pop();
          }
        },
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.page,
                leadingWidth: double.infinity,
                elevation: 1,
                shadowColor: Theme.of(context).colorScheme.title4,
                leading: AppBarExtra(
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
                  key: _model.navKey,
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
                                  _model.pop(context);
                                }, onBackOpenSearch: () {
                                  _model.pop(context);
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
                                      _model.handleAnswer(success: success);
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
                                number: _model.learnedCntAll,
                                isEnd: review.current() == null,
                                onDone: () {
                                  Navigator.of(context).pop();
                                },
                                onContinue: () async {
                                  if (!await _model.nextCard()) {
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
                                primary: false,
                                onBack: () async {
                                  var nav = _model.navKey.currentState;
                                  var goal = Constants.useDailyGoal
                                      ? await SettingsRep().getDailyGoal()
                                      : Constants.goalDefaultBreakCount;
                                  if (_model.learnedCntSinceBreak >= goal) {
                                    _model.learnedCntSinceBreak = 0;
                                    _model.notify();
                                    nav?.pushReplacementNamed(
                                      CardPageType.learnDone.name,
                                    );
                                    getIt<AppRep>()
                                        .play(SoundType.successShort);
                                  } else {
                                    if (!await _model.nextCard()) {
                                      if (context.mounted) {
                                        Navigator.of(context).pop();
                                      }
                                    }
                                  }
                                }));
                    }
                  }),
            ])));
  }
}

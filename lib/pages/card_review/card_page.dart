import 'dart:async';
import 'package:vocabyte/components/button2_animated.dart';
import 'package:vocabyte/components/button_round_corner.dart';
import 'package:vocabyte/components/disposable_stream.dart';
import 'package:vocabyte/components/round_button.dart';
import 'package:vocabyte/pages/card_review/card_item.dart';
import 'package:vocabyte/pages/card_review/card_review_nav.dart';
import 'package:flutter/material.dart';
import 'package:vocabyte/app/app_theme.dart';
import 'package:vocabyte/resource/constants.dart';
import 'package:vocabyte/repository/app_rep.dart';
import 'package:vocabyte/services/tts.dart';

enum SlideDirection { left, right }

class CardPage extends StatefulWidget {
  const CardPage({required this.onDone, super.key, required this.data});
  final Function(bool success) onDone;
  final CardData data;

  @override
  CardPageState createState() => CardPageState();
}

class CardPageState extends State<CardPage> with TickerProviderStateMixin {
  static var _slideDirection = SlideDirection.left;
  late AnimationController _animateController;
  late AnimationController _animateController2;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _scaleAnimation1;
  late final Animation<double> _scaleAnimation2;
  late final Animation<double> _opacityAnimation;
  late final Animation<double> _turnAnimation;
  final _dispStream = DisposableStream();
  // var _animateTurns = 0.0;
  // var _onAnimate = false;
  final tag = 'cardPage';

  @override
  void initState() {
    super.initState();

    _animateController =
        AnimationController(vsync: this, duration: Constants.animDurationLong);

    _animateController2 =
        AnimationController(vsync: this, duration: Constants.animDurationLong);

    _slideAnimation = Tween<Offset>(
      begin: _slideDirection == SlideDirection.left
          ? const Offset(1.0, 0.0)
          : const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animateController,
      curve: Curves.easeInOut,
    ));

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: _animateController.view,
            curve: const Interval(0.000, 0.50, curve: Curves.easeInOut)));

    _scaleAnimation1 = Tween<double>(
      begin: 0.2,
      end: 1.0,
    ).animate(CurvedAnimation(
        parent: _animateController.view,
        curve: const Interval(0.00, 0.50, curve: Curves.easeInOut)));

    _scaleAnimation2 = Tween<double>(
      begin: 0.2,
      end: 1.0,
    ).animate(CurvedAnimation(
        parent: _animateController2.view,
        curve: const Interval(0.00, 0.50, curve: Curves.easeInOut)));

    switch (_slideDirection) {
      case SlideDirection.left:
        _turnAnimation = Tween<double>(
          begin: 0.8,
          end: 1.0,
        ).animate(CurvedAnimation(
            parent: _animateController.view,
            curve: const Interval(0.20, 0.70, curve: Curves.easeInOut)));
        _slideDirection = SlideDirection.right;
        break;
      case SlideDirection.right:
        _turnAnimation = Tween<double>(
          begin: 1.2,
          end: 1.0,
        ).animate(CurvedAnimation(
            parent: _animateController.view,
            curve: const Interval(0.20, 0.70, curve: Curves.easeInOut)));
        _slideDirection = SlideDirection.left;
        break;
    }

    _animateController.forward(from: 0.0);
    Future.microtask(() {
      switch (widget.data.pageType) {
        case CardPageType.wordToDef:
          TextToSpeach().onChange(widget.data.data.word);
          TextToSpeach().speak();
          break;
        case CardPageType.defToWords:
          TextToSpeach().onChange(widget.data.data.meaning.first.definition);
          TextToSpeach().speak();
          break;
        case CardPageType.wordRemeberOrNot:
          TextToSpeach().onChange(widget.data.data.word);
          TextToSpeach().speak();
          break;
        case CardPageType.learnNewWord:
          TextToSpeach().onChange(widget.data.data.word);
          TextToSpeach().speak();
          break;
        case CardPageType.wordDetails:
          TextToSpeach().onChange(widget.data.data.word);
          TextToSpeach().speak();
          break;
        case CardPageType.audioToDef:
          TextToSpeach().onChange(widget.data.data.word);
          TextToSpeach().speak();
          break;
        default:
          break;
      }
    });
    Future.delayed(const Duration(milliseconds: 300), () {
      _animateController2.forward(from: 0.0);
    });
  }

  @override
  void dispose() {
    super.dispose();
    TextToSpeach().stop();
    _dispStream.dispose();
    _animateController.dispose();
  }

  void _onDone(bool success) {
    AppRep().play(success ? SoundType.successShort : SoundType.failedShort);
    Timer(Constants.animDurationMid, () {
      widget.onDone(success);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      var size = MediaQuery.of(context).size;
      var pageType = widget.data.pageType;
      return Container(
          width: size.width,
          height: size.height,
          color: Theme.of(context).colorScheme.page,
          child: AnimatedBuilder(
              animation: _animateController,
              builder: (context, child) {
                return Stack(alignment: Alignment.center, children: [
                  Positioned(
                      // duration: Constants.animDurationMid,
                      // bottom: _onAnimate ? 0 : size.height / 2,
                      bottom: 0,
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Opacity(
                          opacity: _opacityAnimation.value,
                          child: Container(
                              margin: const EdgeInsets.only(top: 20),
                              width: size.width,
                              height: size.height,
                              padding: const EdgeInsets.only(bottom: 20),
                              child: SlideTransition(
                                  position: _slideAnimation,
                                  child: RotationTransition(
                                      turns: _turnAnimation,
                                      child: ScaleTransition(
                                          scale: _scaleAnimation1,
                                          child: Container(
                                              // color: Theme.of(context).colorScheme.card,
                                              color: Colors.transparent,
                                              child: Column(children: [
                                                if (pageType ==
                                                    CardPageType.defToWords)
                                                  Expanded(
                                                      child: _defToWords()),
                                                if (pageType ==
                                                    CardPageType.wordToDef)
                                                  Expanded(child: _wordToDef()),
                                                if (pageType ==
                                                    CardPageType.learnNewWord)
                                                  Expanded(child: _learnNew()),
                                                if (pageType ==
                                                    CardPageType
                                                        .wordRemeberOrNot)
                                                  Expanded(
                                                      child: _rememberOrNot()),
                                                if (pageType ==
                                                    CardPageType.audioToDef)
                                                  Expanded(
                                                      child: _audioToDef()),
                                                //
                                                // button
                                                ButtonRoundCorner(
                                                    text: 'Not sure',
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 15,
                                                            bottom: 5,
                                                            left: 5,
                                                            right: 5),
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .buttonOption1,
                                                    colorText: Theme.of(context)
                                                        .colorScheme
                                                        .cardText,
                                                    direction:
                                                        TextDirection.rtl,
                                                    radious: const BorderRadius
                                                        .all(
                                                        Radius.circular(10)),
                                                    onPressed: () {
                                                      _onDone(false);
                                                    })
                                              ])))))))),
                  Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: RoundButton(
                          color: Colors.white,
                          iconData: Icons.abc,
                          size: const Size(50, 50),
                          onPressed: (p0) {
                            // if (_onAnimate) {
                            //   setState(() {
                            //     _onAnimate = false;
                            //     _animateTurns = 1.0;
                            //   });
                            // } else {
                            //   setState(() {
                            //     _onAnimate = true;
                            //     _animateTurns = 0.0;
                            //   });
                            // }
                            _animateController.forward(from: 0.0);
                          }))
                ]);
              }));
    });
  }

  Widget _defToWords() {
    return AnimatedBuilder(
        animation: _animateController2,
        builder: (context, child) {
          return Column(children: [
            Expanded(
                child: Column(children: [
              //
              // word
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(children: [
                        Expanded(
                            child: ScaleTransition(
                                scale: _scaleAnimation2,
                                child: Text(
                                    widget.data.data.meaning[0].definition,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .textInCard))))
                      ])))
            ])),
            _options()
          ]);
        });
  }

  Widget _wordToDef() {
    return AnimatedBuilder(
        animation: _animateController2,
        builder: (context, child) {
          return Column(children: [
            Expanded(
                child: Column(children: [
              //
              // word
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ScaleTransition(
                                scale: _scaleAnimation2,
                                child: Text(widget.data.data.word,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .textInCard)))
                          ])))
            ])),
            _options()
          ]);
        });
  }

  Widget _learnNew() {
    return const Text('learnNew');
  }

  Widget _rememberOrNot() {
    return const Text('rememberOrNot');
  }

  Widget _audioToDef() {
    return AnimatedBuilder(
        animation: _animateController2,
        builder: (context, child) {
          return Column(children: [
            Expanded(
                child: Column(children: [
              //
              // play
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 20),
                                child: ScaleTransition(
                                    scale: _scaleAnimation2,
                                    child: Button2Animated(
                                        iconData: Icons.play_arrow,
                                        size: 50,
                                        color:
                                            Theme.of(context).colorScheme.text5,
                                        onClicked: () async {
                                          var word = widget.data.data.word;
                                          TextToSpeach().onChange(word);
                                          await TextToSpeach().speak();
                                        })))
                          ])))
            ])),
            _options()
          ]);
        });
  }

  Widget _options() {
    return AnimatedBuilder(
        animation: _animateController,
        builder: (context, child) {
          const v = 200;
          return Expanded(
              flex: 2,
              child: ScaleTransition(
                  scale: _scaleAnimation1,
                  child: Column(children: [
                    Expanded(
                        child: Row(children: [
                      CardItem(
                          letter: 'A',
                          delayMs: v,
                          text: widget.data.options?[0]['value'],
                          isRight: widget.data.options?[0]['correct'],
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.zero,
                              topRight: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8)),
                          onClicked: () {
                            _onDone(widget.data.options?[0]['correct']);
                          }),
                      CardItem(
                          delayMs: v * 2,
                          letter: 'B',
                          text: widget.data.options?[1]['value'],
                          isRight: widget.data.options?[1]['correct'],
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.zero,
                              topRight: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8)),
                          onClicked: () {
                            _onDone(widget.data.options?[1]['correct']);
                          })
                    ])),
                    Expanded(
                        child: Row(children: [
                      CardItem(
                          letter: 'C',
                          delayMs: v * 3,
                          text: widget.data.options?[2]['value'],
                          isRight: widget.data.options?[2]['correct'],
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.zero,
                              topRight: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8)),
                          onClicked: () {
                            _onDone(widget.data.options?[2]['correct']);
                          }),
                      CardItem(
                          letter: 'D',
                          delayMs: v * 4,
                          text: widget.data.options?[3]['value'],
                          isRight: widget.data.options?[3]['correct'],
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.zero,
                              topRight: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8)),
                          onClicked: () {
                            _onDone(widget.data.options?[3]['correct']);
                          })
                    ]))
                  ])));
        });
  }
}

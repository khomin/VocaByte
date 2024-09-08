import 'dart:async';
import 'package:vocabyte/components/button2_animated.dart';
import 'package:vocabyte/components/button_fixed_down.dart';
import 'package:vocabyte/components/button_round_corner.dart';
import 'package:vocabyte/components/disposable_stream.dart';
import 'package:vocabyte/domains/card_review/card_item.dart';
import 'package:vocabyte/domains/card_review/card_review_nav.dart';
import 'package:flutter/material.dart';
import 'package:vocabyte/app/app_theme.dart';
import 'package:vocabyte/app/const_values.dart';
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
  late Animation<Offset> _animateScale;
  late AnimationController _animateController;
  final _dispStream = DisposableStream();
  var _animateTurns = 0.0;
  var _onAnimate = false;
  final tag = 'cardPage';

  @override
  void initState() {
    super.initState();

    _animateController = AnimationController(
        vsync: this, duration: ConstValues.animDurationMedium);

    _animateScale = Tween<Offset>(
      begin: _slideDirection == SlideDirection.left
          ? const Offset(-1.0, 0.0)
          : const Offset(0.0, -1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animateController,
      curve: Curves.easeInOut,
    ));

    switch (_slideDirection) {
      case SlideDirection.left:
        _animateTurns = 0.8;
        _slideDirection = SlideDirection.right;
        break;
      case SlideDirection.right:
        _animateTurns = 1.2;
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
    Future.delayed(ConstValues.animDurationFast, () {
      if (mounted) {
        setState(() {
          _onAnimate = true;
          _animateTurns = 1.0;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    TextToSpeach().stop();
    _dispStream.dispose();
  }

  void _onDone(bool success) {
    AppRep().play(success ? SoundType.successShort : SoundType.failedShort);
    Timer(ConstValues.animDurationMid, () {
      widget.onDone(success);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      var size = MediaQuery.of(context).size;
      var pageType = widget.data.pageType;
      return SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(alignment: Alignment.center, children: [
            AnimatedPositioned(
                duration: ConstValues.animDurationMid,
                bottom: _onAnimate ? 0 : size.height / 2,
                top: 0,
                left: 0,
                right: 0,
                child: AnimatedOpacity(
                    duration: ConstValues.animDurationMedium,
                    opacity: _onAnimate ? 1.0 : 0.0,
                    child: Container(
                        margin: const EdgeInsets.only(top: 20),
                        width: size.width,
                        height: size.height,
                        padding: const EdgeInsets.only(bottom: 70),
                        child: SlideTransition(
                            position: _animateScale,
                            child: AnimatedRotation(
                                turns: _animateTurns,
                                duration: ConstValues.animDurationMid,
                                child: Container(
                                    color: Theme.of(context).colorScheme.card,
                                    child: Column(children: [
                                      if (pageType == CardPageType.defToWords)
                                        Expanded(child: _defToWords()),
                                      if (pageType == CardPageType.wordToDef)
                                        Expanded(child: _wordToDef()),
                                      if (pageType == CardPageType.learnNewWord)
                                        Expanded(child: _learnNew()),
                                      if (pageType ==
                                          CardPageType.wordRemeberOrNot)
                                        Expanded(child: _rememberOrNot()),
                                      if (pageType == CardPageType.audioToDef)
                                        Expanded(child: _audioToDef())
                                    ]))))))),
            //
            // don't know answer
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: FixedFooterBottom(
                    child1: ButtonRoundCorner(
                        text: "Don't know",
                        color: Theme.of(context).colorScheme.buttonOption1,
                        colorText: Theme.of(context).colorScheme.cardText,
                        direction: TextDirection.rtl,
                        radious: const BorderRadius.all(Radius.circular(10)),
                        onPressed: () {
                          _onDone(false);
                        })))
          ]));
    });
  }

  Widget _defToWords() {
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
                      child: Text(widget.data.data.meaning[0].definition,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Theme.of(context).colorScheme.textInCard)))
                ])))
      ])),
      _options()
    ]);
  }

  Widget _wordToDef() {
    return Column(children: [
      Expanded(
          child: Column(children: [
        //
        // word
        Expanded(
            child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(widget.data.data.word,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.textInCard)),
                ])))
      ])),
      _options()
    ]);
  }

  Widget _learnNew() {
    return const Text('learnNew');
  }

  Widget _rememberOrNot() {
    return const Text('rememberOrNot');
  }

  Widget _audioToDef() {
    return Column(children: [
      Expanded(
          child: Column(children: [
        //
        // play
        Expanded(
            child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 10, right: 20),
                      child: Button2Animated(
                          iconData: Icons.play_arrow,
                          size: 50,
                          color: Theme.of(context).colorScheme.text5,
                          onClicked: () async {
                            var word = widget.data.data.word;
                            TextToSpeach().onChange(word);
                            await TextToSpeach().speak();
                          }))
                ])))
      ])),
      _options()
    ]);
  }

  Widget _options() {
    return Expanded(
        flex: 2,
        child: Column(children: [
          Expanded(
              child: Row(children: [
            CardItem(
                letter: 'A',
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
        ]));
  }
}

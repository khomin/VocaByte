import 'dart:async';
import 'package:vocabyte/components/disposable_stream.dart';
import 'package:flutter/material.dart';
import 'package:vocabyte/pages/settings/theme/app_theme.dart';
import 'package:vocabyte/components/round_button.dart';
import 'package:vocabyte/resource/constants.dart';
import 'package:vocabyte/services/tts.dart';

class CardNoWords extends StatefulWidget {
  const CardNoWords(
      {required this.onBack, required this.onBackOpenSearch, super.key});
  final Function() onBack;
  final Function() onBackOpenSearch;
  @override
  CardNoWordsState createState() => CardNoWordsState();
}

class CardNoWordsState extends State<CardNoWords>
    with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late AnimationController _shakeControlller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotateAnimation;
  final _dispStream = DisposableStream();
  final tag = 'cardNoWords';

  @override
  void initState() {
    super.initState();

    _scaleController =
        AnimationController(vsync: this, duration: Constants.animDurationLong);

    _scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
        parent: _scaleController.view,
        curve: const Interval(0.00, 0.50, curve: Curves.easeInOut)));

    _shakeControlller = AnimationController(
      duration: Constants.animDurationLong,
      vsync: this,
    );

    _rotateAnimation = TweenSequence<double>([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0, end: 0.005), weight: 1),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.005, end: 0), weight: 1),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0, end: -0.005), weight: 1),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: -0.005, end: 0), weight: 1),
    ]).animate(CurvedAnimation(
      parent: _shakeControlller.view,
      curve: Curves
          .linear, // Use a linear curve for a consistent back-and-forth movement
    ));

    Future.delayed(const Duration(milliseconds: 100), () {
      _scaleController.forward(from: 0.0);
      _shakeControlller.forward();
    });
  }

  @override
  void dispose() {
    TextToSpeach().stop();
    _dispStream.dispose();
    _scaleController.dispose();
    _shakeControlller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      var size = MediaQuery.of(context).size;
      return Container(
          width: size.width,
          height: size.height,
          color: Theme.of(context).colorScheme.page,
          child: AnimatedBuilder(
              animation: _scaleController,
              builder: (context, child) {
                return RotationTransition(
                    turns: _rotateAnimation,
                    child: SizedBox(
                        height: size.height / 1.5,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              RoundButton(
                                  iconData: Icons.search,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .buttonOption1,
                                  iconColor: Theme.of(context)
                                      .colorScheme
                                      .button3TextInversed,
                                  size: Size((size.width / 5) + 15,
                                      (size.width / 5) + 15),
                                  iconSize: size.width / 5,
                                  useScaleAnimation: true,
                                  useShadow: true,
                                  margin: const EdgeInsets.only(bottom: 20),
                                  onPressed: (p0) {
                                    if (_shakeControlller
                                        .isForwardOrCompleted) {
                                      _shakeControlller.reverse().orCancel;
                                    } else {
                                      _shakeControlller.forward().orCancel;
                                    }
                                    widget.onBackOpenSearch();
                                  }),
                              ScaleTransition(
                                  scale: _scaleAnimation,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                            'No words to review\nAdd words using search',
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 20,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .title2
                                                    .color))
                                      ]))
                            ])));
              }));
    });
  }
}

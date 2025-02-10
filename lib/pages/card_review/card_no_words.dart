import 'dart:async';
import 'package:vocabyte/components/disposable_stream.dart';
import 'package:flutter/material.dart';
import 'package:vocabyte/app/app_theme.dart';
import 'package:vocabyte/resource/constants.dart';
import 'package:vocabyte/services/tts.dart';

class CardNoWords extends StatefulWidget {
  const CardNoWords({super.key});

  @override
  CardNoWordsState createState() => CardNoWordsState();
}

class CardNoWordsState extends State<CardNoWords>
    with TickerProviderStateMixin {
  late AnimationController _animateController;
  late final Animation<double> _scaleAnimation1;
  final _dispStream = DisposableStream();
  final tag = 'cardNoWords';

  @override
  void initState() {
    super.initState();

    _animateController =
        AnimationController(vsync: this, duration: Constants.animDurationLong);

    _scaleAnimation1 = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
        parent: _animateController.view,
        curve: const Interval(0.00, 0.50, curve: Curves.easeInOut)));

    Future.delayed(const Duration(milliseconds: 100), () {
      _animateController.forward(from: 0.0);
    });
  }

  @override
  void dispose() {
    super.dispose();
    TextToSpeach().stop();
    _dispStream.dispose();
    _animateController.dispose();
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
              animation: _animateController,
              builder: (context, child) {
                return ScaleTransition(
                    scale: _scaleAnimation1,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('No words to review',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                  color:
                                      Theme.of(context).colorScheme.textInCard))
                        ]));
              }));
    });
  }
}

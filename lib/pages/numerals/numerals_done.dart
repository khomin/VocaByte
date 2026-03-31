import 'dart:ui' as ui;
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter/material.dart';
import 'package:vocabyte/components/button3.dart';
import 'package:vocabyte/pages/numerals/numerals_page.dart';
import 'package:vocabyte/repository/app_theme.dart';
import 'package:vocabyte/app/ui_helper.dart';
import 'package:vocabyte/resource/constants.dart';

class NumeralsCompleted extends StatefulWidget {
  const NumeralsCompleted({
    required this.result,
    required this.onCompleted,
    super.key,
  });
  final Function() onCompleted;
  final NumeralsResult result;

  @override
  State<NumeralsCompleted> createState() => NumeralsCompletedState();
}

class TabInfo {
  const TabInfo({required this.icon, required this.label});
  final IconData icon;
  final String label;
}

class NumeralsCompletedState extends State<NumeralsCompleted> {
  String _line1 = '';
  String _line2 = '';
  var _items = <Widget>[];

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      var result = widget.result;
      var correctCnt = result.correctCnt;

      if (result.failedValue.isNotEmpty) {
        _line1 = 'Sorry!\nCorrect value is ${result.failedValue}';
      } else if (correctCnt == result.allCnt) {
        _line1 =
            'Geat job!\nYou have completed!\n${result.correctCnt} corect answers';
      } else {
        _line1 = 'You have ${result.correctCnt} corect answers!';
      }
      var duration = UiHelper().durationFormat(
        DateTime.now().difference(widget.result.started),
      );
      _line2 = 'Your time $duration';

      _items = [
        Text(_line1,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontFamily: Constants.fontFredoka,
              fontWeight: FontWeight.bold,
              foreground: Paint()
                ..shader = ui.Gradient.linear(
                  const Offset(0, 0),
                  const Offset(300, 0),
                  [
                    if (mounted) Theme.of(context).colorScheme.textResultGrad1,
                    if (mounted) Theme.of(context).colorScheme.textResultGrad2,
                  ],
                ),
            )),
        const SizedBox(height: 10),
        Text(_line2,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                fontFamily: Constants.fontFredoka,
                fontWeight: FontWeight.bold,
                foreground: Paint()
                  ..shader = ui.Gradient.linear(
                      const Offset(0, 0), const Offset(300, 0), <Color>[
                    if (mounted) Theme.of(context).colorScheme.textResultGrad1,
                    if (mounted) Theme.of(context).colorScheme.textResultGrad2
                  ])))
      ];

      _items = _items
          .animate(interval: 100.ms)
          .fadeIn(duration: 300.ms, delay: 50.ms)
          .blurY(end: 0.0, duration: 300.ms)
          .move(begin: const Offset(-16, 0), curve: Curves.easeOutQuad);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).colorScheme.page,
        child: Column(children: [
          Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _items),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(
                              top: 50, left: 20, right: 20),
                          child: Button3(
                              text: 'Continue',
                              color:
                                  Theme.of(context).colorScheme.buttonOption1,
                              colorText: Theme.of(context)
                                  .colorScheme
                                  .buttonOptionText,
                              onPressed: () {
                                widget.onCompleted();
                              })))
                ])
              ])),
        ]));
  }
}

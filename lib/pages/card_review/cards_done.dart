import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:vocabyte/components/button_fixed_down.dart';
import 'package:vocabyte/components/button_round_corner.dart';
import 'package:vocabyte/pages/settings/theme/app_theme.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CardsDone extends StatefulWidget {
  const CardsDone(
      {required this.number,
      required this.isEnd,
      required this.onDone,
      required this.onContinue,
      super.key});
  final Function() onDone;
  final Function() onContinue;
  final int number;
  final bool isEnd;
  @override
  State<CardsDone> createState() => CardsDoneState();
}

class TabInfo {
  const TabInfo({required this.icon, required this.label});
  final IconData icon;
  final String label;
}

class CardsDoneState extends State<CardsDone> {
  String _line1 = '';
  String _line2 = '';
  var _items = <Widget>[];

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      var num = widget.number;
      if (!widget.isEnd) {
        _line1 = 'Great job!';
      } else {
        _line1 = 'Well done!';
      }
      _line2 = 'You have learned $num ${num > 1 ? 'words' : 'word'}';
      _items = [
        Text(_line1,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                shadows: [
                  if (mounted)
                    BoxShadow(
                        color: Theme.of(context).colorScheme.shadow2,
                        blurRadius: 25,
                        offset: const Offset(0, 0))
                ],
                foreground: Paint()
                  ..shader = ui.Gradient.linear(
                      const Offset(0, 20), const Offset(150, 20), <Color>[
                    if (mounted) Theme.of(context).colorScheme.textResultGrad1,
                    if (mounted) Theme.of(context).colorScheme.textResultGrad2
                  ]))),
        const SizedBox(height: 10),
        Text(_line2,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                shadows: [
                  if (mounted)
                    BoxShadow(
                        color: Theme.of(context).colorScheme.shadow2,
                        blurRadius: 25,
                        offset: const Offset(0, 0))
                ],
                foreground: Paint()
                  ..shader = ui.Gradient.linear(
                      const Offset(0, 20), const Offset(150, 20), <Color>[
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
              child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                        Image.asset('assets/pig_pos_2.png', width: 150),
                        //
                        // line1
                        const SizedBox(height: 50),
                        SizedBox(
                            height: 80,
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: _items)),
                        const SizedBox(height: 10),
                        const Spacer(flex: 2),
                        FixedFooterBottom(
                            child1: ButtonRoundCorner(
                                text: 'Enough for today',
                                direction: TextDirection.ltr,
                                radious:
                                    const BorderRadius.all(Radius.circular(10)),
                                color:
                                    Theme.of(context).colorScheme.buttonOption2,
                                colorText: Theme.of(context)
                                    .colorScheme
                                    .buttonOptionText,
                                onPressed: () {
                                  widget.onDone();
                                }),
                            child2: ButtonRoundCorner(
                                text: "Continue",
                                direction: TextDirection.ltr,
                                radious:
                                    const BorderRadius.all(Radius.circular(10)),
                                color:
                                    Theme.of(context).colorScheme.buttonOption1,
                                colorText: Theme.of(context)
                                    .colorScheme
                                    .buttonOptionText,
                                onPressed: () {
                                  if (widget.isEnd) {
                                    widget.onDone();
                                  } else {
                                    widget.onContinue();
                                  }
                                }))
                      ])))
        ]));
  }
}

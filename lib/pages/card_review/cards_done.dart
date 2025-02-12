import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:vocabyte/components/button_fixed_down.dart';
import 'package:vocabyte/components/button_round_corner.dart';
import 'package:vocabyte/app/app_theme.dart';
import 'package:vocabyte/components/round_button.dart';
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

final List<TabInfo> tabs = [
  const TabInfo(
    icon: Icons.info_outline,
    label: 'Mode',
  ),
  const TabInfo(icon: Icons.palette_outlined, label: 'Take image'),
  const TabInfo(icon: Icons.palette_outlined, label: 'Flip'),
];

class CardsDoneState extends State<CardsDone> {
  String _line1 = '';
  String _line2 = '';
  var tabInfoItems = <Widget>[];

  @override
  void initState() {
    super.initState();

    var num = widget.number;
    if (!widget.isEnd) {
      _line1 = 'Great job!';
    } else {
      _line1 = 'Well done!';
    }
    _line2 = 'You have learned $num ${num > 1 ? 'words' : 'word'}';

    tabInfoItems = [
      Text(_line1,
          style: TextStyle(
              fontSize: 20,
              foreground: Paint()
                ..shader = ui.Gradient.linear(
                    const Offset(0, 20), const Offset(150, 20), <Color>[
                  const ui.Color.fromARGB(255, 255, 102, 6),
                  Colors.yellow,
                ]))),
      const SizedBox(height: 10),
      Text(_line2,
          style: TextStyle(
              fontSize: 20,
              foreground: Paint()
                ..shader = ui.Gradient.linear(
                    const Offset(0, 20), const Offset(150, 20), <Color>[
                  const ui.Color.fromARGB(255, 255, 102, 6),
                  Colors.yellow,
                ])))
    ];

    tabInfoItems = tabInfoItems
        .animate(interval: 100.ms)
        .fadeIn(duration: 300.ms, delay: 50.ms)
        .shimmer(blendMode: BlendMode.srcOver, color: Colors.white12)
        .move(begin: const Offset(-16, 0), curve: Curves.easeOutQuad);
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Container(
          color: Theme.of(context).colorScheme.page,
          child: Column(children: [
            Expanded(
                child: Padding(
                    padding:
                        const EdgeInsets.only(top: 50, left: 20, right: 20),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Spacer(),
                          Image.asset('assets/pig_pos_2.png', width: 150),
                          //
                          // line1
                          const SizedBox(height: 50),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: tabInfoItems),
                          const SizedBox(height: 10),
                          const Spacer(flex: 2),
                          FixedFooterBottom(
                              child1: ButtonRoundCorner(
                                  text: "Enough for now",
                                  direction: TextDirection.ltr,
                                  radious: const BorderRadius.all(
                                      Radius.circular(10)),
                                  color: Theme.of(context)
                                      .colorScheme
                                      .buttonOption2,
                                  colorText:
                                      Theme.of(context).colorScheme.textInCard2,
                                  onPressed: () {
                                    widget.onDone();
                                  }),
                              child2: ButtonRoundCorner(
                                  text: "Continue",
                                  direction: TextDirection.ltr,
                                  radious: const BorderRadius.all(
                                      Radius.circular(10)),
                                  color: Theme.of(context)
                                      .colorScheme
                                      .buttonOption1,
                                  colorText:
                                      Theme.of(context).colorScheme.cardText,
                                  onPressed: () {
                                    if (widget.isEnd) {
                                      widget.onDone();
                                    } else {
                                      widget.onContinue();
                                    }
                                  }))
                        ])))
          ]));
    });
  }
}

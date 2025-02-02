import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:vocabyte/components/button_fixed_down.dart';
import 'package:vocabyte/components/button_round_corner.dart';
import 'package:vocabyte/app/app_theme.dart';

class CardsDone extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Container(
          color: Theme.of(context).colorScheme.card,
          child: Column(children: [
            Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  const Spacer(),
                  Image.asset('assets/pig_pos_2.png', width: 150),
                  // 1
                  Padding(
                      padding:
                          const EdgeInsets.only(top: 50, left: 20, right: 20),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                !isEnd
                                    ? 'Congratulations!\nYou have learned $number ${number > 1 ? 'words' : 'word'}'
                                    : number > 1
                                        ? 'You have learned $number words!'
                                        : 'You have learned $number word!',
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 20,
                                    foreground: Paint()
                                      ..shader = ui.Gradient.linear(
                                        const Offset(0, 20),
                                        const Offset(150, 20),
                                        <Color>[
                                          Colors.red,
                                          Colors.yellow,
                                        ],
                                      )))
                          ])),
                  const Spacer(flex: 2),
                  FixedFooterBottom(
                      child1: ButtonRoundCorner(
                          text: "Enough for now",
                          direction: TextDirection.ltr,
                          radious: const BorderRadius.all(Radius.circular(10)),
                          color: Theme.of(context).colorScheme.buttonOption2,
                          colorText: Theme.of(context).colorScheme.textInCard2,
                          onPressed: () {
                            onDone();
                          }),
                      child2: ButtonRoundCorner(
                          text: "Continue",
                          direction: TextDirection.ltr,
                          radious: const BorderRadius.all(Radius.circular(10)),
                          color: Theme.of(context).colorScheme.buttonOption1,
                          colorText: Theme.of(context).colorScheme.cardText,
                          onPressed: () {
                            if (isEnd) {
                              onDone();
                            } else {
                              onContinue();
                            }
                          }))
                ]))
          ]));
    });
  }
}

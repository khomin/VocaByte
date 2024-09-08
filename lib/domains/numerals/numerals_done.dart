import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:vocabyte/components/button3.dart';
import 'package:vocabyte/domains/numerals/numerals_page.dart';
import 'package:vocabyte/app/app_theme.dart';
import 'package:vocabyte/app/ui_helper.dart';

class NumeralsDone extends StatelessWidget {
  const NumeralsDone({required this.result, required this.onDone, super.key});
  final Function() onDone;
  final NumeralsResult result;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      var duration =
          UiHelper().durationFormat(DateTime.now().difference(result.started));
      return Container(
          color: Theme.of(context).colorScheme.card,
          child: Column(children: [
            Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    if (result.failedValue.isNotEmpty)
                      Text('Correct value is ${result.failedValue}',
                          maxLines: 1,
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
                  ]),
                  //
                  // legend correct all
                  result.correctCnt == result.allCnt
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              Text(
                                  'You have completed!\n${result.correctCnt} corect answers',
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 20,
                                      foreground: Paint()
                                        ..shader = ui.Gradient.linear(
                                          const Offset(0, 50),
                                          const Offset(150, 20),
                                          <Color>[
                                            const Color.fromARGB(
                                                255, 89, 215, 131),
                                            const Color.fromARGB(
                                                255, 139, 215, 89)
                                          ],
                                        ))),
                            ])
                      :
                      //
                      // legend with fail
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              Text(
                                  'You have ${result.correctCnt} corect answers!',
                                  maxLines: 1,
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
                                        ))),
                            ]),
                  //
                  // legend
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(duration,
                        maxLines: 1,
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
                              ))),
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Expanded(
                        child: Padding(
                            padding: const EdgeInsets.only(
                                top: 50, left: 20, right: 20),
                            child: Button3(
                                text: "Continue",
                                color:
                                    Theme.of(context).colorScheme.buttonOption1,
                                colorText:
                                    Theme.of(context).colorScheme.cardText,
                                onPressed: () {
                                  onDone();
                                })))
                  ])
                ])),
          ]));
    });
  }
}

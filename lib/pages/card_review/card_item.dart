import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vocabyte/pages/settings/theme/app_theme.dart';
import 'package:vocabyte/components/round_button.dart';
import 'package:vocabyte/resource/constants.dart';

class CardItem extends StatefulWidget {
  const CardItem(
      {super.key,
      required this.letter,
      required this.text,
      required this.isRight,
      required this.borderRadius,
      required this.onClicked,
      required this.delayMs});

  final String letter;
  final String text;
  final bool isRight;
  final BorderRadius borderRadius;
  final int delayMs;
  final Function() onClicked;

  @override
  CardItemState createState() => CardItemState();
}

class CardItemState extends State<CardItem> {
  var _finished = false;
  var _visible = false;

  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: widget.delayMs), () {
      setState(() {
        _visible = true;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            opacity: _visible ? 1 : 0,
            child: Padding(
                padding: const EdgeInsets.all(4),
                child: RoundButton(
                    color: _finished
                        ? (widget.isRight
                            ? Theme.of(context).colorScheme.cardSuccess
                            : Theme.of(context).colorScheme.cardError)
                        : Theme.of(context).colorScheme.cardHome,
                    iconColor: Colors.transparent,
                    useShadow: true,
                    useScaleAnimation: true,
                    radius: 15,
                    onPressed: (p0) {
                      if (_finished) return;
                      _finished = true;
                      setState(() {});
                      widget.onClicked();
                    },
                    child: IgnorePointer(
                        child: Column(children: [
                      Expanded(
                          child: Stack(children: [
                        Positioned(
                            child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                ),
                                child: Container(
                                    width: 20,
                                    height: 20,
                                    color: Colors.black12,
                                    child: Center(
                                        child: Text(
                                      widget.letter,
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .title1
                                              .color),
                                    ))))),
                        Align(
                            alignment: Alignment.center,
                            child: Row(children: [
                              Expanded(
                                  child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(widget.text,
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 6,
                                          style: TextStyle(
                                              fontSize: 14.5,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .cardText))))
                            ])),
                        if (Constants.isDev)
                          Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                  width: 20,
                                  height: 20,
                                  color: widget.isRight
                                      ? Colors.green
                                      : Colors.transparent)),
                      ]))
                    ]))))));
  }
}

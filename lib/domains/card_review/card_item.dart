import 'package:vocabyte/components/container_click.dart';
import 'package:flutter/material.dart';
import 'package:vocabyte/app/app_theme.dart';
import 'package:vocabyte/app/const_values.dart';

class CardItem extends StatefulWidget {
  const CardItem(
      {super.key,
      required this.letter,
      required this.text,
      required this.isRight,
      required this.borderRadius,
      required this.onClicked});

  final String letter;
  final String text;
  final bool isRight;
  final BorderRadius borderRadius;
  final Function() onClicked;

  @override
  CardItemState createState() => CardItemState();
}

class CardItemState extends State<CardItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ContainerClick(
            onClicked: () {
              widget.onClicked();
            },
            boxColor: Theme.of(context).colorScheme.page,
            borderRadius: widget.borderRadius,
            clickedColor: (widget.isRight
                ? Theme.of(context).colorScheme.cardSuccess
                : Theme.of(context).colorScheme.cardError),
            child: Column(children: [
              Expanded(
                  child: Stack(children: [
                Container(
                    width: 20,
                    height: 20,
                    color: Colors.black,
                    child: Center(
                        child: Text(
                      widget.letter,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.titel1),
                    ))),
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
                if (ConstValues.isDev)
                  Align(
                      alignment: Alignment.topRight,
                      child: Container(
                          width: 20,
                          height: 20,
                          color: widget.isRight
                              ? Colors.green
                              : Colors.transparent)),
              ]))
            ])));
  }
}

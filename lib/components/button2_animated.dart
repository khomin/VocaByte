import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vocabyte/components/hover_click_component.dart';

class Button2Animated extends StatefulWidget {
  const Button2Animated(
      {super.key,
      required this.iconData,
      required this.size,
      required this.onClicked,
      this.padding,
      this.color});
  final IconData iconData;
  final Function() onClicked;
  final double size;
  final Color? color;
  final EdgeInsets? padding;

  @override
  Button2AnimatedState createState() => Button2AnimatedState();
}

class Button2AnimatedState extends State<Button2Animated> {
  var _active = false;

  @override
  Widget build(BuildContext context) {
    return HoverClickComponent(
        onClick: () async {
          setState(() {
            _active = true;
          });
          Timer(const Duration(milliseconds: 200), () {
            setState(() {
              _active = false;
            });
          });
          widget.onClicked();
        },
        child: Padding(
            padding: widget.padding ??
                const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              //
              // play
              Padding(
                  padding: const EdgeInsets.only(left: 10, right: 20),
                  child: SizedBox(
                      width: widget.size + 10,
                      height: widget.size + 10,
                      child: AnimatedSize(
                          duration: const Duration(milliseconds: 200),
                          child: Icon(widget.iconData,
                              color: widget.color,
                              size: _active ? widget.size + 5 : widget.size))))
            ])));
  }
}

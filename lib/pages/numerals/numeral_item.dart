import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vocabyte/pages/settings/theme/app_theme.dart';
import 'package:vocabyte/components/round_button.dart';

class NumeralItem extends StatefulWidget {
  const NumeralItem(
      {super.key, required this.number, this.child, required this.onClicked});

  final int number;
  final Function(int num) onClicked;
  final Widget? child;

  @override
  NumeralItemState createState() => NumeralItemState();
}

class NumeralItemState extends State<NumeralItem> {
  var _clicked = false;

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
        child: Padding(
            padding: const EdgeInsets.all(2),
            child: RoundButton(
                radius: 12,
                useScaleAnimation: true,
                onPressed: (_) {
                  setState(() {
                    _clicked = true;
                  });
                  Timer(const Duration(milliseconds: 100), () {
                    if (mounted) {
                      setState(() {
                        _clicked = false;
                      });
                    }
                  });
                  widget.onClicked(widget.number);
                },
                color: _clicked
                    ? widget.child == null
                        ? Theme.of(context).colorScheme.card
                        : Theme.of(context).colorScheme.transparent
                    : widget.child == null
                        ? Theme.of(context).colorScheme.card
                        : Theme.of(context).colorScheme.transparent,
                child: IgnorePointer(
                    child: Column(children: [
                  Expanded(
                      child: Row(children: [
                    Expanded(
                        child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: widget.child != null
                                ? Center(child: widget.child)
                                : Text('${widget.number}',
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 5)))
                  ]))
                ])))));
  }
}

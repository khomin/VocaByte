import 'package:flutter/material.dart';
import 'package:vocabyte/app/app_theme.dart';
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
  var _finished = false;

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
        child: RoundButton(
            onPressed: (_) {
              setState(() {
                _finished = true;
              });
              widget.onClicked(widget.number);
            },
            color: _finished
                ? widget.child == null
                    ? Theme.of(context).colorScheme.cardSuccess
                    : Theme.of(context).colorScheme.transparent
                : widget.child == null
                    ? Theme.of(context).colorScheme.page
                    : Theme.of(context).colorScheme.transparent,
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
              ])),
            ])));
  }
}

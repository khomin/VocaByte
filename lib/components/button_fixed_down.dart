import 'package:flutter/material.dart';

class FixedFooterBottom extends StatelessWidget {
  const FixedFooterBottom({this.child1, this.child2, super.key});
  final Widget? child1;
  final Widget? child2;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 15, top: 15),
        child: Row(children: [
          if (child1 != null)
            Expanded(
                flex: 10,
                child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: child1!)),
          if (child2 != null)
            Expanded(
                flex: 10,
                child: Padding(
                    padding: const EdgeInsets.only(right: 10), child: child2!))
        ]));
  }
}

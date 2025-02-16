import 'package:flutter/material.dart';

class FixedFooterBottom extends StatelessWidget {
  const FixedFooterBottom(
      {this.child1,
      this.child2,
      this.childFlex1 = 10,
      this.childFlex2 = 10,
      super.key});
  final Widget? child1;
  final Widget? child2;
  final int childFlex1;
  final int childFlex2;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 15, top: 15),
        child: Row(children: [
          if (child1 != null)
            Expanded(
                flex: childFlex1,
                child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: child1!)),
          if (child2 != null)
            Expanded(
                flex: childFlex2,
                child: Padding(
                    padding: EdgeInsets.only(
                        left: child1 == null ? 10 : 0, right: 10),
                    child: child2!))
        ]));
  }
}

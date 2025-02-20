import 'package:flutter/material.dart';
import 'package:vocabyte/components/round_button.dart';
import 'package:vocabyte/pages/settings/theme/app_theme.dart';

enum Type { close, back }

class AppBar2 extends StatelessWidget {
  const AppBar2({required this.type, this.child, super.key});
  final Type type;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: Theme.of(context).colorScheme.menuBorderColor,
                    width: 1))),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          const SizedBox(width: 5),
          RoundButton(
              color: type == Type.close
                  ? Colors.white.withOpacity(0.08)
                  : Colors.transparent,
              iconColor: Theme.of(context).colorScheme.appBarText.color,
              size: const Size(50, 50),
              iconSize: 22,
              radius: 20,
              iconData: type == Type.close ? Icons.close : Icons.arrow_back_ios,
              onPressed: (p0) {
                Navigator.of(context).pop();
              }),
          if (child != null) child!,
          if (child != null) const SizedBox(width: 20)
        ]));
  }
}

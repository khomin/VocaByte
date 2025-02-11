import 'package:flutter/material.dart';
import 'package:vocabyte/components/round_button.dart';
import 'package:vocabyte/app/app_theme.dart';

enum Type { close, back }

class AppBar2 extends StatelessWidget {
  const AppBar2({required this.type, this.child, super.key});
  final Type type;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
        // color: Theme.of(context).colorScheme.page,
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      const SizedBox(width: 5),
      RoundButton(
          color: type == Type.close
              ? Colors.white.withOpacity(0.05)
              : Colors.transparent,
          iconColor: Theme.of(context).colorScheme.white,
          size: const Size(50, 50),
          iconSize: 22,
          radius: 20,
          iconData: type == Type.close ? Icons.close : Icons.arrow_back_ios,
          onPressed: (p0) {
            Navigator.of(context).pop();
          }),
      if (child != null) const Spacer(),
      // if (child != null) const SizedBox(width: 50),
      // if (child != null) Flexible(child: child!),
      child!,
      if (child != null) const SizedBox(width: 20)
      // if (child != null) const Spacer()
    ]));
  }
}

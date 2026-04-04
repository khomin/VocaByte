import 'package:flutter/material.dart';
import 'package:vocabyte/components/round_button.dart';
import 'package:vocabyte/repository/app_theme.dart';
import 'package:vocabyte/resource/constants.dart';

enum Type { close, back }

class AppBarExtra extends StatelessWidget {
  const AppBarExtra({required this.type, this.child, super.key});
  final Type type;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Theme.of(context).colorScheme.menuBorderColor,
                  width: 1)),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Stack(children: [
            Container(
                height: Constants.appBarButton,
                width: Constants.appBarButton,
                margin: const EdgeInsets.only(left: 8),
                child: RoundButton(
                    color: type == Type.close
                        ? Theme.of(context).colorScheme.roundButton
                        : Colors.transparent,
                    iconColor: Theme.of(context).colorScheme.appBarText.color,
                    width: Constants.appBarButton,
                    iconSize: 22,
                    radius: 20,
                    iconData:
                        type == Type.close ? Icons.close : Icons.arrow_back_ios,
                    onPressed: (_) {
                      Navigator.of(context).pop();
                    })),
          ]),
          if (child != null) child!,
          if (child != null) const SizedBox(width: 18)
        ]));
  }
}

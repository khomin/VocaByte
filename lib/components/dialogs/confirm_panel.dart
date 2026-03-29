import 'package:flutter/material.dart';
import 'package:vocabyte/components/round_button.dart';
import 'package:vocabyte/repository/app_theme.dart';
import 'package:vocabyte/resource/constants.dart';

class ConfirmPanel extends StatelessWidget {
  const ConfirmPanel(
      {required this.title,
      this.text,
      this.textNo,
      this.textOk,
      required this.onOk,
      this.iconNo,
      this.iconOk,
      super.key});
  final String title;
  final String? text;
  final String? textNo;
  final String? textOk;
  final IconData? iconNo;
  final IconData? iconOk;
  final Function() onOk;

  @override
  Widget build(BuildContext context) {
    var text2 = text;
    return Container(
        height: 200,
        color: Theme.of(context).colorScheme.page,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Theme.of(context).colorScheme.title1.color)),
          if (text2 != null)
            Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(text2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Theme.of(context).colorScheme.title1.color))),
          const SizedBox(height: 30),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            RoundButton(
                color: Theme.of(context)
                    .colorScheme
                    .titleErr
                    .withValues(alpha: 0.8),
                iconColor:
                    Theme.of(context).colorScheme.white.withValues(alpha: 0.8),
                height: Constants.baseButton,
                width: Constants.baseButton,
                radius: 20,
                useScaleAnimation: true,
                iconData: iconNo,
                onPressed: (v) async {
                  onOk();
                }),
            const SizedBox(width: 15),
            RoundButton(
                color: Theme.of(context).colorScheme.roundButton,
                height: Constants.baseButton,
                width: Constants.baseButton,
                radius: 20,
                useScaleAnimation: true,
                iconData: iconOk,
                onPressed: (v) async {
                  Navigator.of(context).pop();
                })
          ])
        ]));
  }
}

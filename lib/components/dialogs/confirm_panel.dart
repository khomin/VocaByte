import 'package:flutter/material.dart';
import 'package:vocabyte/components/round_button.dart';
import 'package:vocabyte/repository/app_theme.dart';
import 'package:vocabyte/resource/constants.dart';

class ConfirmPanel extends StatelessWidget {
  const ConfirmPanel({
    required this.title,
    this.text,
    this.textNo,
    this.textOk,
    required this.onOk,
    this.iconNo,
    this.iconOk,
    super.key,
  });
  final String title;
  final String? text;
  final String? textNo;
  final String? textOk;
  final IconData? iconNo;
  final IconData? iconOk;
  final Function() onOk;

  @override
  Widget build(BuildContext context) {
    var text = this.text;
    var padding = MediaQuery.paddingOf(context);
    return Container(
        height: 300,
        padding: EdgeInsets.only(bottom: padding.bottom),
        color: Theme.of(context).colorScheme.page,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).colorScheme.title1,
          ),
          if (text != null)
            Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).colorScheme.title1,
                )),
          const SizedBox(height: 50),
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
            const SizedBox(width: 25),
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

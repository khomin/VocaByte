import 'package:flutter/material.dart';
import 'package:vocabyte/components/round_button.dart';
import 'package:vocabyte/pages/settings/theme/app_theme.dart';

class ConfirmPanel extends StatelessWidget {
  const ConfirmPanel(
      {required this.title,
      this.textNo,
      this.textOk,
      required this.onOk,
      this.iconNo,
      this.iconOk,
      super.key});
  final String title;
  final String? textNo;
  final String? textOk;
  final IconData? iconNo;
  final IconData? iconOk;
  final Function() onOk;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        color: Theme.of(context).colorScheme.page,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w400)),
          const SizedBox(height: 30),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            RoundButton(
                color: Theme.of(context)
                    .colorScheme
                    .errorContainer
                    .withOpacity(0.8),
                iconColor: Theme.of(context).colorScheme.white.withOpacity(0.4),
                size: const Size(55, 55),
                radius: 20,
                useScaleAnimation: true,
                iconData: iconNo,
                onPressed: (v) async {
                  onOk();
                }),
            const SizedBox(width: 15),
            RoundButton(
                color: Theme.of(context).colorScheme.button2.withOpacity(0.8),
                iconColor:
                    Theme.of(context).colorScheme.button2Text.withOpacity(0.8),
                size: const Size(55, 55),
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

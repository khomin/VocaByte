import 'package:flutter/material.dart';
import 'package:vocabyte/repository/app_theme.dart';

class SplashWithText extends StatelessWidget {
  const SplashWithText({required this.text, super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.pageHome,
      child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
            width: 100,
            height: 100,
            margin: const EdgeInsets.only(bottom: 50),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                boxShadow: [
                  BoxShadow(
                      color: Theme.of(context).colorScheme.shadowBox,
                      blurRadius: 10,
                      offset: const Offset(0, 0))
                ],
                color: Theme.of(context).colorScheme.cardHome),
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.title5))),
        Text(text,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18,
                color: Theme.of(context).colorScheme.appBarText.color)),
      ])),
    );
  }
}

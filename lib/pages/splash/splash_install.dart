import 'package:flutter/material.dart';
import 'package:vocabyte/app/app_theme.dart';

class SplashInstall extends StatefulWidget {
  const SplashInstall({super.key});

  @override
  State<SplashInstall> createState() => SplashInstallState();
}

class SplashInstallState extends State<SplashInstall> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).colorScheme.baseColor1,
        child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              width: 100,
              height: 100,
              margin: const EdgeInsets.only(bottom: 50),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  color: Theme.of(context).colorScheme.button2Hover),
              child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.titel4))),
          Text('Copying database...',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.titel4)),
        ])));
  }
}

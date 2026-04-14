// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vocabyte/components/button3.dart';
import 'package:vocabyte/app_runner.dart';
import 'package:vocabyte/models/app_model.dart';
import 'package:vocabyte/repository/app_rep.dart';
import 'package:vocabyte/repository/nav_rep.dart';

class DevPanel extends StatefulWidget {
  const DevPanel({super.key});

  @override
  State<DevPanel> createState() => _State();
}

class _State extends State<DevPanel> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.amber.withValues(alpha: 0.5),
        height: 100,
        width: 100,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          _theme(),
          //
          Opacity(
              opacity: 0.5,
              child: Row(children: [
                // Button3(
                //     text: 'UPDATE',
                //     color: Colors.black26,
                //     onPressed: () async {
                //       appRep.refreshWordToLearn();
                //     }),
                // Button3(
                //     text: 'POP',
                //     color: Colors.black26,
                //     onPressed: () async {
                //       var v = appRep.reviewTask;
                //       await v.pop(success: false);
                //     }),
                // Button3(
                //     text: 'A1',
                //     color: Colors.black26,
                //     onPressed: () async {
                //       widget.onGoTo(PageType.reviewCard);
                //     }),
                // Button3(
                //     text: 'A2',
                //     color: Colors.black26,
                //     onPressed: () async {
                //       widget.onGoTo(PageType.reviewCard);
                //     })
              ]))
        ]));
  }

  Widget _theme() {
    return Builder(builder: (context) {
      var appModel = context.read<AppModel>();
      return Button3(
          text: 'Theme',
          color: Colors.black26,
          onPressed: () {
            appModel.setTheme(appModel.theme == ThemeMode.light
                ? ThemeMode.dark
                : ThemeMode.light);
          });
    });
  }
}

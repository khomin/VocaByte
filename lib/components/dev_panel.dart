import 'package:flutter/material.dart';
import 'package:vocabyte/components/button3.dart';
import 'package:vocabyte/main.dart';
import 'package:vocabyte/repository/app_rep.dart';
import 'package:vocabyte/repository/nav_rep.dart';

class DevPanel extends StatefulWidget {
  const DevPanel({required this.onGoTo, super.key});

  final Function(PageType name) onGoTo;
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
    var appRep = getIt<AppRep>();
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Opacity(
          opacity: 0.5,
          child: Row(children: [
            Button3(
                text: 'UPDATE',
                color: Colors.black26,
                onPressed: () async {
                  appRep.refreshWordToLearn();
                }),
            Button3(
                text: 'POP',
                color: Colors.black26,
                onPressed: () async {
                  var v = appRep.reviewTask;
                  await v.pop(success: false);
                }),
            Button3(
                text: 'A1',
                color: Colors.black26,
                onPressed: () async {
                  widget.onGoTo(PageType.reviewCard);
                }),
            Button3(
                text: 'A2',
                color: Colors.black26,
                onPressed: () async {
                  widget.onGoTo(PageType.reviewCard);
                })
          ]))
    ]);
  }
}

import 'package:flutter/material.dart';
import 'package:vocabyte/components/button3.dart';
import 'package:vocabyte/domains/drawer/drawer_menu.dart';
import 'package:vocabyte/repository/app_rep.dart';
import 'package:provider/provider.dart';

class DevPanel extends StatefulWidget {
  const DevPanel({required this.onGoTo, super.key});

  final Function(MenuPageType name) onGoTo;
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
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Opacity(
          opacity: 0.5,
          child: Row(children: [
            Button3(
                text: 'UPDATE',
                color: Colors.black26,
                onPressed: () async {
                  context.read<AppRep>().updateWordToLearn();
                }),
            Button3(
                text: 'POP',
                color: Colors.black26,
                onPressed: () async {
                  var v = context.read<AppRep>().reviewTask;
                  await v.pop(success: false);
                }),
            Button3(
                text: 'A1',
                color: Colors.black26,
                onPressed: () async {
                  widget.onGoTo(MenuPageType.reviewCard);
                }),
            Button3(
                text: 'A2',
                color: Colors.black26,
                onPressed: () async {
                  widget.onGoTo(MenuPageType.reviewCard);
                })
          ]))
    ]);
  }
}

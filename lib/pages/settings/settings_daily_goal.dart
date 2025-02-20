import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vocabyte/components/round_button.dart';
import 'package:vocabyte/repository/settings_rep.dart';
import 'package:vocabyte/pages/settings/theme/app_theme.dart';
import 'package:vocabyte/resource/constants.dart';

class SettingsDailiyGoal extends StatefulWidget {
  const SettingsDailiyGoal({required this.onChanged, super.key});

  final Function(int value) onChanged;
  @override
  State<SettingsDailiyGoal> createState() => _State();
}

class _State extends State<SettingsDailiyGoal> {
  int? _dailyGoal;
  final _values = <int>[
    Constants.isDev ? 1 : 10,
    20,
    30,
    40,
    50,
    60,
    70,
    80,
    90,
    100,
    150,
    200
  ];

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      _dailyGoal = await SettingsRep().getDailyGoal();
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(body: Builder(builder: (BuildContext context) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: _card(Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(top: 40, bottom: 40),
                          child: ListView.builder(
                              itemCount: _values.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                var value = _values[index];
                                return Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 10),
                                          child: RoundButton(
                                              color: value == _dailyGoal
                                                  ? Theme.of(context)
                                                      .colorScheme
                                                      .cardSuccess
                                                  : Theme.of(context)
                                                      .colorScheme
                                                      .page,
                                              iconColor: Colors.pink,
                                              size: const Size(200, 80),
                                              radius: 15,
                                              useScaleAnimation: true,
                                              child: IgnorePointer(
                                                  child: Center(
                                                      child: Text(value == 1
                                                          ? '$value word a day'
                                                          : '$value words a day'))),
                                              onPressed: (p0) async {
                                                Timer(
                                                    const Duration(
                                                        milliseconds: 200),
                                                    () async {
                                                  widget.onChanged(value);
                                                  Navigator.of(context).pop();
                                                });
                                              }))
                                    ]);
                              })))
                ])))
          ]);
    })));
  }

  Widget _card(Widget child) {
    return Container(
        margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6))),
        child: child);
  }
}

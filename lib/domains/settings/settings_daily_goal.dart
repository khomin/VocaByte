import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vocabyte/components/container_click.dart';
import 'package:vocabyte/repository/settings_rep.dart';
import 'package:vocabyte/app/app_theme.dart';
import 'package:vocabyte/app/const_values.dart';

class SettingsDailiyGoal extends StatefulWidget {
  const SettingsDailiyGoal(
      {required this.onBack, required this.onChanged, super.key});

  final Function onBack;
  final Function onChanged;
  @override
  State<SettingsDailiyGoal> createState() => _State();
}

class _State extends State<SettingsDailiyGoal> {
  int? _dailyGoal;
  final _values = <int>[
    ConstValues.isDev ? 1 : 10,
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
    return Builder(builder: (BuildContext context) {
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
                                      Expanded(
                                          child: ContainerClick(
                                              height: 100,
                                              onClicked: () async {
                                                SettingsRep()
                                                    .setDailyGoal(value);
                                                Timer(
                                                    const Duration(
                                                        milliseconds: 300),
                                                    () async {
                                                  widget.onChanged();
                                                });
                                              },
                                              boxColor: value == _dailyGoal
                                                  ? Theme.of(context)
                                                      .colorScheme
                                                      .cardSuccess
                                                  : Theme.of(context)
                                                      .colorScheme
                                                      .page,
                                              clickedColor: Theme.of(context)
                                                  .colorScheme
                                                  .cardSuccess,
                                              child: Center(
                                                  child: Text(
                                                      '$value words a day'))))
                                    ]);
                              })))
                ])))
          ]);
    });
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

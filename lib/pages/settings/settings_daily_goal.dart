import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vocabyte/components/app_bar2.dart';
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
        child: Scaffold(
            appBar: AppBar(
                leadingWidth: double.infinity,
                elevation: 0,
                scrolledUnderElevation: 0,
                backgroundColor: Colors.transparent,
                leading: AppBar2(
                    type: Type.back,
                    child: Flexible(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                          Text('Daily goal',
                              style: Theme.of(context).colorScheme.appBarText)
                        ])))),
            body: Column(
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
                                              size: const Size(200, 60),
                                              radius: 10,
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
                ])));
  }
}

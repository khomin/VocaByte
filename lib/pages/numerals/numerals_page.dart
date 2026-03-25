import 'dart:async';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:vocabyte/components/disposable_stream.dart';
import 'package:flutter/material.dart';
import 'package:vocabyte/components/round_button.dart';
import 'package:vocabyte/pages/numerals/numeral_item.dart';
import 'package:vocabyte/repository/app_rep.dart';
import 'package:vocabyte/repository/settings_rep.dart';
import 'package:vocabyte/pages/settings/theme/app_theme.dart';
import 'package:vocabyte/services/tts.dart';

class NumeralsResult {
  NumeralsResult(this.success, this.correctCnt, this.allCnt, this.failedValue);
  bool success;
  int correctCnt;
  int allCnt;
  String failedValue;
  DateTime started = DateTime.now();
}

enum NumeralsLevel { easy, medium, hard }

class NumeralsPage extends StatefulWidget {
  const NumeralsPage({required this.onCompleted, super.key});
  final Function(NumeralsResult) onCompleted;

  @override
  NumeralsPageState createState() => NumeralsPageState();
}

class Range {
  Range(this.min, this.max);
  int min;
  int max;
}

class NumeralsPageState extends State<NumeralsPage> {
  final _dispStream = DisposableStream();
  final _inputCtr = TextEditingController();
  final _rand = Random();
  var _stage = 0;
  var _number = 0;
  var _level = NumeralsLevel.easy;
  var _backpressVisible = false;
  final _result = NumeralsResult(false, 0, 0, '');
  final _ranges = {
    NumeralsLevel.easy: <Range>[
      Range(0, 10),
      Range(10, 50),
      Range(50, 100),
      Range(100, 500),
      Range(100, 500),
      Range(100, 500),
      Range(0, 100),
      Range(1000, 10000),
      Range(1000, 10000),
      Range(1000, 10000),
      Range(0, 100),
      Range(10000, 100000),
      Range(10000, 100000),
      Range(10000, 100000),
      Range(0, 100),
      Range(100000, 10000000),
      Range(100000, 10000000),
      Range(100000, 10000000),
      Range(0, 100),
      Range(100000, 10000000),
      Range(100000, 10000000),
      Range(100000, 10000000)
    ],
    NumeralsLevel.medium: <Range>[
      Range(0, 10),
      Range(10, 50),
      Range(50, 100),
      Range(100, 500),
      Range(100, 500),
      Range(100, 500),
      Range(100, 500),
      Range(100, 500),
      Range(1000, 10000),
      Range(1000, 10000),
      Range(1000, 10000),
      Range(0, 100),
      Range(1000, 10000),
      Range(1000, 10000),
      Range(10000, 100000),
      Range(0, 100),
      Range(10000, 100000),
      Range(10000, 100000),
      Range(10000, 100000),
      Range(10000, 100000),
      Range(0, 100),
      Range(100000, 10000000),
      Range(100000, 10000000),
      Range(100000, 10000000),
      Range(100000, 10000000),
      Range(0, 100),
      Range(100000, 10000000),
      Range(100000, 10000000),
      Range(100000, 10000000),
      Range(100000, 10000000),
      Range(100000, 10000000)
    ],
    NumeralsLevel.hard: <Range>[
      Range(0, 10),
      Range(10, 50),
      Range(50, 100),
      Range(100, 500),
      Range(100, 500),
      Range(100, 500),
      Range(100, 500),
      Range(100, 500),
      Range(100, 500),
      Range(100, 500),
      Range(100, 500),
      Range(1000, 10000),
      Range(1000, 10000),
      Range(1000, 10000),
      Range(1000, 10000),
      Range(1000, 10000),
      Range(1000, 10000),
      Range(1000, 10000),
      Range(1000, 10000),
      Range(10000, 100000),
      Range(10000, 100000),
      Range(10000, 100000),
      Range(10000, 100000),
      Range(10000, 100000),
      Range(10000, 100000),
      Range(10000, 100000),
      Range(10000, 100000),
      Range(100000, 10000000),
      Range(100000, 10000000),
      Range(100000, 10000000),
      Range(100000, 10000000),
      Range(100000, 10000000),
      Range(100000, 10000000),
      Range(100000, 10000000),
      Range(100000, 10000000),
      Range(100000, 10000000),
      Range(100000, 10000000),
      Range(100000, 10000000),
      Range(100000, 10000000)
    ]
  };
  final tag = 'numerals';

  @override
  void initState() {
    super.initState();

    Future.microtask(() async {
      _level = await SettingsRep().getNumeralsLevel();
      _inputCtr.text = '';
      _inputCtr.addListener(_inputChanged);
      _genNextNumber();
    });
  }

  @override
  void dispose() {
    super.dispose();
    TextToSpeach().stop();
    _inputCtr.removeListener(_inputChanged);
    _dispStream.dispose();
  }

  void _genNextNumber() {
    var range = _ranges[_level]![_stage];
    _number = range.min + _rand.nextInt(range.max - range.min);
    _result.allCnt = _ranges[_level]?.length ?? 0;
    TextToSpeach().onChange(_number.toString());
    TextToSpeach().speak();
    var pg = _result.correctCnt * 100 / _result.allCnt;
    AppRep().onNumeralsProgress.add(pg / 100);
    AppRep()
        .onNumeralsStage
        .add(NumeralsStage(stage: _stage, all: _getStageAll()));
  }

  int _getStageAll() {
    var range = _ranges[_level];
    return range?.length ?? 0;
  }

  void _inputChanged() {
    try {
      var v = int.parse(_inputCtr.text);
      if (_inputCtr.text.length >= _number.toString().length) {
        if (_number == v) {
          _result.correctCnt++;
          _result.success = true;
          Timer(const Duration(milliseconds: 500), () {
            _inputCtr.text = '';
            if (_stage + 1 < _getStageAll()) {
              setState(() {
                _stage++;
              });
              _genNextNumber();
            } else {
              _result.success = true;
              AppRep().play(SoundType.successLong);
              AppRep().onNumeralsProgress.add(1);
              Timer(const Duration(milliseconds: 200), () {
                widget.onCompleted(_result);
              });
            }
          });
        } else {
          _result.success = false;
          _result.failedValue = _number.toString();
          AppRep().play(SoundType.failedLong);
          Timer(const Duration(milliseconds: 200), () {
            widget.onCompleted(_result);
          });
        }
      }
    } catch (_) {}
    setState(() {
      _backpressVisible = _inputCtr.text.isNotEmpty;
    });
  }

  void _onNumber(int num) {
    AppRep().play(SoundType.successShort);
    _inputCtr.text = _inputCtr.text + num.toString();
  }

  void _playNumber() {
    TextToSpeach().onChange(_number.toString());
    TextToSpeach().speak();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).colorScheme.page,
        child: Column(children: [
          Expanded(
              child: Column(children: [
            Expanded(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 10),
                      child: TextField(
                          controller: _inputCtr,
                          enabled: false,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 30,
                              color: Theme.of(context)
                                  .colorScheme
                                  .appBarText
                                  .color)))),
              if (_backpressVisible)
                RoundButton(
                    iconData: Icons.backspace,
                    size: const Size(30, 30),
                    useScaleAnimation: true,
                    iconColor: Theme.of(context).colorScheme.title5,
                    margin: const EdgeInsets.only(right: 20),
                    color: Colors.transparent,
                    onPressed: (_) {
                      if (_inputCtr.text.isNotEmpty) {
                        _inputCtr.text = _inputCtr.text
                            .substring(0, _inputCtr.text.length - 1);
                      }
                      _inputChanged();
                    })
            ]))
          ])),
          Expanded(
              flex: 2,
              child: Column(children: [
                Expanded(
                    child: Row(children: [
                  NumeralItem(
                      number: 1,
                      onClicked: (n) {
                        _onNumber(n);
                      }),
                  NumeralItem(
                      number: 2,
                      onClicked: (n) {
                        _onNumber(n);
                      }),
                  NumeralItem(
                      number: 3,
                      onClicked: (n) {
                        _onNumber(n);
                      }),
                ])),
                Expanded(
                    child: Row(children: [
                  NumeralItem(
                      number: 4,
                      onClicked: (n) {
                        _onNumber(n);
                      }),
                  NumeralItem(
                      number: 5,
                      onClicked: (n) {
                        _onNumber(n);
                      }),
                  NumeralItem(
                      number: 6,
                      onClicked: (n) {
                        _onNumber(n);
                      }),
                ])),
                Expanded(
                    child: Row(children: [
                  NumeralItem(
                      number: 7,
                      onClicked: (n) {
                        _onNumber(n);
                      }),
                  NumeralItem(
                      number: 8,
                      onClicked: (n) {
                        _onNumber(n);
                      }),
                  NumeralItem(
                      number: 9,
                      onClicked: (n) {
                        _onNumber(n);
                      })
                ])),
                Expanded(
                    child: Row(children: [
                  NumeralItem(
                      number: 0,
                      child: const Icon(Icons.play_arrow, size: 40),
                      onClicked: (n) {
                        _playNumber();
                      }),
                  NumeralItem(
                      number: 0,
                      onClicked: (n) {
                        _onNumber(n);
                      }),
                  NumeralItem(
                      number: 0, child: const SizedBox(), onClicked: (n) {}),
                ]))
              ]))
        ]));
  }
}

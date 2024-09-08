import 'dart:async';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:vocabyte/components/button2_animated.dart';
import 'package:vocabyte/components/disposable_stream.dart';
import 'package:flutter/material.dart';
import 'package:vocabyte/domains/numerals/numeral_item.dart';
import 'package:vocabyte/repository/app_rep.dart';
import 'package:vocabyte/repository/settings_rep.dart';
import 'package:vocabyte/app/app_theme.dart';
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
  const NumeralsPage({required this.onDone, super.key});

  final Function(NumeralsResult) onDone;

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
    AppRep().onProgressChanged.add(pg / 100);
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
              AppRep().onProgressChanged.add(1);
              Timer(const Duration(seconds: 1), () {
                widget.onDone(_result);
              });
            }
          });
        } else {
          _result.success = false;
          _result.failedValue = _number.toString();
          AppRep().play(SoundType.failedLong);
          Timer(const Duration(seconds: 1), () {
            widget.onDone(_result);
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
    return Builder(builder: (context) {
      return Container(
          color: Theme.of(context).colorScheme.card,
          child: Column(children: [
            Expanded(
                child: Column(children: [
              Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
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
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        decimal: true),
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 30,
                                    color:
                                        Theme.of(context).colorScheme.text5)))),
                    if (_backpressVisible)
                      Button2Animated(
                          iconData: Icons.backspace,
                          size: 30,
                          color: Theme.of(context).colorScheme.text5,
                          onClicked: () {
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
                        child: Button2Animated(
                            size: 40,
                            iconData: Icons.play_arrow,
                            onClicked: () {
                              _playNumber();
                            }),
                        onClicked: (n) {
                          _onNumber(n);
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
    });
  }
}

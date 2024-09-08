import 'dart:convert';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:loggy/loggy.dart';
import 'package:vocabyte/components/button2_animated.dart';
import 'package:vocabyte/components/dialogs/confirm_dialog.dart';
import 'package:vocabyte/components/disposable_stream.dart';
import 'package:vocabyte/components/hover_click_component.dart';
import 'package:vocabyte/domains/numerals/numerals_page.dart';
import 'package:vocabyte/repository/settings_rep.dart';
import 'package:vocabyte/app/app_theme.dart';
import 'package:vocabyte/app/file_utils.dart';
import 'package:vocabyte/app/ui_helper.dart';
import 'package:vocabyte/services/protobuf/proto.pb.dart';
import 'package:vocabyte/services/service_api.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({required this.onChangeGoal, super.key});
  final Function onChangeGoal;
  @override
  State<SettingsPage> createState() => _State();
}

class _State extends State<SettingsPage> {
  NumeralsLevel? _numLevel;
  int? _dailyGoal;
  var _importProfileBusy = false;
  var _exportBusy = false;
  var _importBusy = false;
  var _exportProfileBusy = false;
  final _dispStream = DisposableStream();

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      _dispStream.add(SettingsRep().onChanged.stream.listen((_) {
        _update();
      }));
      _update();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _update() async {
    _numLevel = await SettingsRep().getNumeralsLevel();
    _dailyGoal = await SettingsRep().getDailyGoal();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (BuildContext context) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _profile(),
        _numComplexity(),
      ]);
    });
  }

  Widget _profile() {
    return Builder(builder: (context) {
      return _card(
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Profile',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Theme.of(context).colorScheme.text2,
            )),
        const SizedBox(height: 10),
        //
        // dayly goal
        Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Row(children: [
              Text('Daily goal',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.iconColor,
                  )),
              const Spacer(),
              HoverClickComponent(
                  onClick: () {
                    widget.onChangeGoal();
                  },
                  child: Row(children: [
                    Text('${_dailyGoal ?? 0} words day',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.iconColor,
                        )),
                    const Icon(Icons.keyboard_arrow_right)
                  ]))
            ])),
        //
        // export words
        Row(children: [
          Text('Export words',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Theme.of(context).colorScheme.button3Text,
              )),
          const Spacer(),
          if (_exportBusy)
            SizedBox(
                width: 15,
                height: 15,
                child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.titel4)),
          Button2Animated(
              iconData: Icons.drive_folder_upload_sharp,
              size: 20,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              color: Theme.of(context).colorScheme.text5,
              onClicked: () async {
                var offset = 0;
                const limit = 5;
                final list = <String>[];
                var hasData = true;
                busy(bool v) {
                  setState(() {
                    _exportBusy = v;
                  });
                }

                busy(true);
                while (hasData) {
                  var r = await ServiceApi().searchInReviewList(
                      limit: limit, offset: offset, useSuccessCount: null);
                  if (r.word.length >= limit) {
                    offset += limit;
                  } else {
                    hasData = false;
                  }
                  for (var it in r.word) {
                    list.add(it.word);
                  }
                }
                if (list.isEmpty) {
                  if (context.mounted) {
                    UiHelper.showToast(context, 'Nothing to export');
                  }
                  busy(false);
                  return;
                }
                try {
                  final List<int> codeUnits = list.join('\n').codeUnits;
                  var path = await FilePicker.platform.saveFile(
                      fileName: 'export.txt',
                      allowedExtensions: ['txt'],
                      dialogTitle: 'Export',
                      type: FileType.custom,
                      bytes: Uint8List.fromList(codeUnits));
                  if (UiHelper.isDesktop() && path != null) {
                    await FileUtils.saveBufToFile(codeUnits, path);
                  }
                } catch (ex) {
                  logWarning('$ex: export words ex [$ex]');
                }
                busy(false);
              })
        ]),
        //
        // import words
        Row(children: [
          Text('Import words',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Theme.of(context).colorScheme.iconColor,
              )),
          const Spacer(),
          if (_importBusy)
            SizedBox(
                width: 15,
                height: 15,
                child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.titel4)),
          Button2Animated(
              iconData: Icons.folder_zip_sharp,
              size: 20,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              color: Theme.of(context).colorScheme.text5,
              onClicked: () async {
                busy(bool v) {
                  setState(() {
                    _importBusy = v;
                  });
                }

                try {
                  var res =
                      await FilePicker.platform.pickFiles(allowMultiple: true);
                  if (res == null || res.files.isEmpty) {
                    return;
                  }
                  busy(true);
                  var addedCnt = 0;
                  for (var it in res.files) {
                    var path = it.path;
                    if (path == null) continue;
                    var data = await FileUtils.readFileToStringLine(path);
                    for (var it2 in data) {
                      if (await ServiceApi().addWordInReview(
                          req: ReqAddWordInReview(
                              word: it2, useExtraFields: false))) {
                        addedCnt++;
                      }
                    }
                  }
                  if (context.mounted) {
                    UiHelper.showToast(context, 'Done $addedCnt words');
                  }
                } catch (ex) {
                  logWarning('$ex');
                }
                busy(false);
              })
        ]),
        Row(children: [
          Text('Export profile',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Theme.of(context).colorScheme.iconColor,
              )),
          const Spacer(),
          if (_exportProfileBusy)
            SizedBox(
                width: 15,
                height: 15,
                child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.titel4)),
          Button2Animated(
              iconData: Icons.upload_sharp,
              size: 20,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              color: Theme.of(context).colorScheme.text5,
              onClicked: () async {
                var offset = 0;
                const limit = 5;
                final list = <dynamic>[];
                var hasData = true;
                busy(bool v) {
                  setState(() {
                    _exportProfileBusy = v;
                  });
                }

                busy(true);
                while (hasData) {
                  var r = await ServiceApi().searchInReviewList(
                      limit: limit, offset: offset, useSuccessCount: null);
                  if (r.word.length >= limit) {
                    offset += limit;
                  } else {
                    hasData = false;
                  }
                  for (var it in r.word) {
                    list.add({
                      'word': it.word,
                      'success_count': it.successCount.toInt(),
                      'fail_count': it.failCount.toInt(),
                      'last_tm_success': it.lastTmSuccess.toInt(),
                      'last_tm_fail': it.lastTmFail.toInt(),
                      'next_review_tm_ms': it.nextReviewTmMs.toInt()
                    });
                  }
                }
                if (list.isEmpty) {
                  if (context.mounted) {
                    UiHelper.showToast(context, 'No words to export');
                  }
                  busy(false);
                  return;
                }
                try {
                  var js = jsonEncode({'review': list});
                  var js2 = js.codeUnits;
                  var path = await FilePicker.platform.saveFile(
                      fileName: 'profile.json',
                      allowedExtensions: ['txt'],
                      dialogTitle: 'Export',
                      type: FileType.custom,
                      bytes: Uint8List.fromList(js2));
                  if (UiHelper.isDesktop() && path != null) {
                    await FileUtils.saveBufToFile(js2, path);
                    if (context.mounted) {
                      UiHelper.showToast(context, 'Done');
                    }
                  }
                } catch (ex) {
                  logWarning('$ex: export words ex [$ex]');
                }
                busy(false);
              })
        ]),
        Row(children: [
          Text('Import profile',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Theme.of(context).colorScheme.iconColor,
              )),
          const Spacer(),
          if (_importProfileBusy)
            SizedBox(
                width: 15,
                height: 15,
                child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.titel4)),
          Button2Animated(
              iconData: Icons.download_sharp,
              size: 20,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              color: Theme.of(context).colorScheme.text5,
              onClicked: () async {
                busy(bool v) {
                  setState(() {
                    _importProfileBusy = v;
                  });
                }

                try {
                  var res = await FilePicker.platform.pickFiles(
                      allowMultiple: false,
                      type: FileType.custom,
                      allowedExtensions: ['json']);
                  if (res == null || res.files.isEmpty) {
                    return;
                  }
                  busy(true);
                  for (var it in res.files) {
                    var path = it.path;
                    if (path == null) continue;
                    var data = await FileUtils.readFileToStringLine(path);
                    var json = jsonDecode(data.join());
                    var review = json['review'];
                    if (review != null) {
                      for (var it in review) {
                        await ServiceApi().addWordInReview(
                            req: ReqAddWordInReview(
                                word: it['word'],
                                successCount: it['success_count'],
                                failCount: it['fail_count'],
                                lastTmSuccess: Int64(it['last_tm_success']),
                                lastTmFail: Int64(it['last_tm_fail']),
                                nextReviewTmMs: Int64(it['next_review_tm_ms']),
                                useExtraFields: true));
                      }
                    }
                  }
                  if (context.mounted) {
                    UiHelper.showToast(context, 'Done');
                  }
                } catch (ex) {
                  if (context.mounted) {
                    UiHelper.showToast(context, 'Error');
                  }
                  logWarning('$ex');
                }
                busy(false);
              })
        ]),
        Row(children: [
          Text('Delete data',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Theme.of(context).colorScheme.titelErr,
              )),
          const Spacer(),
          Button2Animated(
              iconData: Icons.delete_sharp,
              size: 20,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              color: Theme.of(context).colorScheme.titelErr,
              onClicked: () async {
                ConfirmDialog().show(
                    context: context,
                    header: 'Sure?',
                    label: 'You will lose all progress',
                    button: 'Yes',
                    onDone: () async {
                      await ServiceApi().deleteProfile();
                      if (context.mounted) {
                        UiHelper.showToast(context, 'Done');
                      }
                    });
              })
        ])
      ]));
    });
  }

  Widget _numComplexity() {
    return _card(
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Numerals',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Theme.of(context).colorScheme.text2,
          )),
      const SizedBox(height: 10),
      Row(children: [
        Text('Complexity level',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Theme.of(context).colorScheme.iconColor,
            )),
        const Spacer(),
        DropdownButton<String>(
            value: UiHelper.toFormatText(
                _numLevel?.name ?? NumeralsLevel.easy.name),
            focusColor: Theme.of(context).colorScheme.iconColor,
            dropdownColor: Theme.of(context).colorScheme.baseColor1,
            onChanged: (String? value) async {
              if (value == null) return;
              var newVal = NumeralsLevel.values.firstWhere(
                  (it) => it.name.toLowerCase() == value.toLowerCase());
              SettingsRep().setNumeralsLevel(newVal);
              setState(() {
                _numLevel = newVal;
              });
            },
            items: [
              UiHelper.toFormatText(NumeralsLevel.easy.name),
              UiHelper.toFormatText(NumeralsLevel.medium.name),
              UiHelper.toFormatText(NumeralsLevel.hard.name)
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.iconColor,
                    )),
              );
            }).toList())
      ])
    ]));
  }

  Widget _card(Widget child) {
    return Container(
        margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(6)),
            color: Theme.of(context).colorScheme.baseColor1),
        child: child);
  }

  // Widget _getLogs() {
  //   return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
  //     Row(children: [
  //       Text('Logs',
  //           textAlign: TextAlign.center,
  //           style: TextStyle(
  //             fontWeight: FontWeight.w500,
  //             fontSize: 14,
  //             color: Theme.of(context).colorScheme.iconColor,
  //           ))
  //     ]),
  //     const SizedBox(height: 10),
  //     Row(mainAxisAlignment: MainAxisAlignment.start, children: [
  //       Button3(
  //           iconData: Icons.download,
  //           text: 'Copy logs to Downloads',
  //           color: Theme.of(context).colorScheme.btn2Background,
  //           colorText: Theme.of(context).colorScheme.btn2TextColor,
  //           onPressed: () {
  //             _copyLogs();
  //           })
  //     ])
  //   ]);
  // }
}

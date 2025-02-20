import 'dart:convert';
import 'dart:typed_data';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:loggy/loggy.dart';
import 'package:vocabyte/components/app_bar2.dart';
import 'package:vocabyte/components/button2_animated.dart';
import 'package:vocabyte/components/disposable_stream.dart';
import 'package:vocabyte/components/hover_click.dart';
import 'package:vocabyte/components/item_in_menu_list.dart';
import 'package:vocabyte/pages/numerals/numerals_page.dart';
import 'package:vocabyte/components/dialogs/confirm_panel.dart';
import 'package:vocabyte/pages/settings/settings_about.dart';
import 'package:vocabyte/pages/settings/theme/theme_config.dart';
import 'package:vocabyte/repository/app_rep.dart';
import 'package:vocabyte/repository/settings_rep.dart';
import 'package:vocabyte/pages/settings/theme/app_theme.dart';
import 'package:vocabyte/app/file_utils.dart';
import 'package:vocabyte/app/ui_helper.dart';
import 'package:vocabyte/resource/constants.dart';
import 'package:vocabyte/services/protobuf/proto.pb.dart';
import 'package:vocabyte/services/service_api.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({required this.onChangeGoal, super.key});
  final Function() onChangeGoal;
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
  final _itemHeight = 70.0;
  ThemeType _theme = ThemeType.system;
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
    _theme = await SettingsRep().getTheme();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child: SafeArea(
            child: Scaffold(
                appBar: AppBar(
                    leadingWidth: double.infinity,
                    elevation: 0,
                    scrolledUnderElevation: 0,
                    backgroundColor: Colors.transparent,
                    leading: AppBar2(
                        type: Type.back,
                        child: Flexible(
                            child: Text('Settings',
                                style: Theme.of(context)
                                    .colorScheme
                                    .appBarText)))),
                body: CustomScrollView(
                    physics: const ClampingScrollPhysics(),
                    slivers: [
                      DecoratedSliver(
                          decoration: BoxDecoration(
                              // color: Theme.of(context).colorScheme.card
                              ),
                          sliver: SliverList.list(children: [
                            _profile(),
                            _numComplexity(),
                            _others()
                          ]))
                    ]))));
  }

  Widget _profile() {
    return Column(children: [
      Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Row(children: [
          Padding(
              padding: const EdgeInsets.only(top: 25, left: 25),
              child: Text('Theme', style: Theme.of(context).colorScheme.title1))
        ]),
        Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 25),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //
                  // light
                  ThemeSwitcher(
                      clipper: const ThemeSwitcherCircleClipper(),
                      builder: (context) {
                        return ItemInMenuList(
                            useBorderTop: false,
                            useBorderBot: false,
                            height: 45,
                            padding: const EdgeInsets.only(left: 25, right: 25),
                            margin: const EdgeInsets.only(top: 10),
                            onClicked: (_) async {
                              ThemeSwitcher.of(context)
                                  .changeTheme(theme: lightTheme);
                              await SettingsRep()
                                  .changeTheme(ThemeType.values[0]);
                              _update();
                            },
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Light',
                                      textAlign: TextAlign.center,
                                      style:
                                          Theme.of(context).colorScheme.title2),
                                  IgnorePointer(
                                      child: Radio(
                                          value: 0,
                                          groupValue: _theme.index,
                                          onChanged: (value) {}))
                                ]));
                      }),
                  //
                  // dark
                  ThemeSwitcher(
                      clipper: const ThemeSwitcherCircleClipper(),
                      builder: (context) {
                        return ItemInMenuList(
                            useBorderTop: false,
                            useBorderBot: false,
                            height: 45,
                            padding: const EdgeInsets.only(left: 25, right: 25),
                            margin: const EdgeInsets.only(top: 10),
                            onClicked: (_) async {
                              ThemeSwitcher.of(context)
                                  .changeTheme(theme: darkTheme);
                              await SettingsRep()
                                  .changeTheme(ThemeType.values[1]);
                              _update();
                            },
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Dark',
                                      textAlign: TextAlign.center,
                                      style:
                                          Theme.of(context).colorScheme.title2),
                                  IgnorePointer(
                                      child: Radio(
                                          value: 1,
                                          groupValue: _theme.index,
                                          onChanged: (value) {}))
                                ]));
                      }),
                  //
                  // system
                  ThemeSwitcher(
                      clipper: const ThemeSwitcherCircleClipper(),
                      builder: (context) {
                        return ItemInMenuList(
                            useBorderTop: false,
                            useBorderBot: false,
                            height: 45,
                            padding: const EdgeInsets.only(left: 25, right: 25),
                            margin: const EdgeInsets.only(top: 10),
                            onClicked: (pos) async {
                              ThemeSwitcher.of(context).changeTheme(
                                  theme: ThemeModelInheritedNotifier.of(context)
                                              .theme
                                              .brightness ==
                                          Brightness.light
                                      ? darkTheme
                                      : lightTheme);
                              await SettingsRep()
                                  .changeTheme(ThemeType.values[2]);
                              _update();
                            },
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('System',
                                      textAlign: TextAlign.center,
                                      style:
                                          Theme.of(context).colorScheme.title2),
                                  IgnorePointer(
                                      child: Radio(
                                          value: 2,
                                          groupValue: _theme.index,
                                          onChanged: (value) {}))
                                ]));
                      })
                ]))
      ]),
      ItemInMenuList(
          useBorderTop: true,
          useBorderBot: false,
          padding: const EdgeInsets.only(left: 25, right: 25),
          onClicked: (_) {
            AppRep().shareApp();
          },
          height: _itemHeight,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //
                // dayly goal
                Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(children: [
                      Text('Daily goal',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).colorScheme.title2),
                      const Spacer(),
                      HoverClick(
                          onPressedL: (_) {
                            widget.onChangeGoal();
                          },
                          child: Row(children: [
                            Text('${_dailyGoal ?? 0} words day',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).colorScheme.title2),
                            Icon(Icons.keyboard_arrow_right,
                                color: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.color)
                          ]))
                    ]))
              ])),
      //
      // export words
      ItemInMenuList(
          useBorderTop: true,
          useBorderBot: false,
          padding: const EdgeInsets.only(left: 25, right: 25),
          onClicked: (_) {
            AppRep().shareApp();
          },
          height: _itemHeight,
          child: Row(children: [
            Text('Export words',
                textAlign: TextAlign.center,
                style: Theme.of(context).colorScheme.title2),
            const Spacer(),
            if (_exportBusy)
              SizedBox(
                  width: 15,
                  height: 15,
                  child: CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.titlel4)),
            Button2Animated(
                iconData: Icons.drive_folder_upload_sharp,
                size: 20,
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                color: Theme.of(context).colorScheme.title2.color,
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
          ])),
      //
      // import words
      ItemInMenuList(
          useBorderTop: true,
          useBorderBot: false,
          padding: const EdgeInsets.only(left: 25, right: 25),
          onClicked: (_) {
            AppRep().shareApp();
          },
          height: _itemHeight,
          child: Row(children: [
            Text('Import words',
                textAlign: TextAlign.center,
                style: Theme.of(context).colorScheme.title2),
            const Spacer(),
            if (_importBusy)
              SizedBox(
                  width: 15,
                  height: 15,
                  child: CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.titlel4)),
            Button2Animated(
                iconData: Icons.folder_zip_sharp,
                size: 20,
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                color: Theme.of(context).colorScheme.title2.color,
                onClicked: () async {
                  busy(bool v) {
                    setState(() {
                      _importBusy = v;
                    });
                  }

                  try {
                    var res = await FilePicker.platform
                        .pickFiles(allowMultiple: true);
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
          ])),
      ItemInMenuList(
          useBorderTop: true,
          useBorderBot: false,
          padding: const EdgeInsets.only(left: 25, right: 25),
          onClicked: (_) {
            AppRep().shareApp();
          },
          height: _itemHeight,
          child: Row(children: [
            Text('Export profile',
                textAlign: TextAlign.center,
                style: Theme.of(context).colorScheme.title2),
            const Spacer(),
            if (_exportProfileBusy)
              SizedBox(
                  width: 15,
                  height: 15,
                  child: CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.titlel4)),
            Button2Animated(
                iconData: Icons.upload_sharp,
                size: 20,
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                color: Theme.of(context).colorScheme.title2.color,
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
          ])),
      ItemInMenuList(
          useBorderTop: true,
          useBorderBot: false,
          padding: const EdgeInsets.only(left: 25, right: 25),
          onClicked: (_) {
            AppRep().shareApp();
          },
          height: _itemHeight,
          child: Row(children: [
            Text('Import profile',
                textAlign: TextAlign.center,
                style: Theme.of(context).colorScheme.title2),
            const Spacer(),
            if (_importProfileBusy)
              SizedBox(
                  width: 15,
                  height: 15,
                  child: CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.titlel4)),
            Button2Animated(
                iconData: Icons.download_sharp,
                size: 20,
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                color: Theme.of(context).colorScheme.title2.color,
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
                                  nextReviewTmMs:
                                      Int64(it['next_review_tm_ms']),
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
          ])),
      ItemInMenuList(
          useBorderTop: true,
          useBorderBot: true,
          padding: const EdgeInsets.only(left: 25, right: 25),
          onClicked: (_) {
            AppRep().shareApp();
          },
          height: _itemHeight,
          child: Row(children: [
            Text('Delete data',
                textAlign: TextAlign.center,
                style: Theme.of(context).colorScheme.title2),
            const Spacer(),
            Button2Animated(
                iconData: Icons.delete_sharp,
                size: 20,
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                color: Theme.of(context).colorScheme.titleErr,
                onClicked: () async {
                  showModalBottomSheet(
                      context: context,
                      barrierColor: Colors.black26,
                      builder: (BuildContext context) {
                        return ConfirmPanel(
                          title: 'Are you sure?\nYou will lose all progress',
                          iconNo: Icons.delete,
                          iconOk: Icons.close,
                          onOk: () async {
                            Navigator.of(context).pop();
                            await ServiceApi().deleteProfile();
                            if (context.mounted) {
                              UiHelper.showToast(context, 'Done');
                            }
                          },
                        );
                      });
                })
          ]))
    ]);
  }

  Widget _numComplexity() {
    return Builder(builder: (context) {
      return Column(children: [
        Container(
            height: 70,
            margin: const EdgeInsets.only(left: 25, right: 25),
            child: Row(children: [
              Text('Numerals', style: Theme.of(context).colorScheme.title2)
            ])),
        ItemInMenuList(
            useBorderTop: false,
            useBorderBot: true,
            padding: const EdgeInsets.only(left: 25, right: 25),
            onClicked: (_) {
              AppRep().shareApp();
            },
            height: _itemHeight,
            child: Row(children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Complexity level',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).colorScheme.title2),
                  ]),
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
                          style: Theme.of(context).colorScheme.title2),
                    );
                  }).toList())
            ]))
      ]);
    });
  }

  Widget _others() {
    return Builder(builder: (context) {
      return Column(children: [
        Container(
            height: 90,
            margin: EdgeInsets.only(left: 25, right: 25),
            child: Row(children: [
              Text('Others', style: Theme.of(context).colorScheme.title2)
            ])),
        //
        // share
        ItemInMenuList(
            useBorderTop: true,
            useBorderBot: false,
            padding: const EdgeInsets.only(left: 25, right: 25),
            onClicked: (_) {
              AppRep().shareApp();
            },
            height: _itemHeight,
            child: Row(children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Share', style: Theme.of(context).colorScheme.title2)
                  ]),
              const Spacer(),
              Icon(Icons.link,
                  color: Theme.of(context).colorScheme.title2.color)
            ])),
        //
        // about the app
        ItemInMenuList(
            useBorderTop: true,
            useBorderBot: false,
            padding: const EdgeInsets.only(left: 25, right: 25),
            onClicked: (_) {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      settings: const RouteSettings(),
                      builder: (context) {
                        return const SettingsAbout();
                      }));
            },
            height: _itemHeight,
            child: Row(children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('About', style: Theme.of(context).colorScheme.title2),
                  ]),
              const Spacer(),
              Icon(Icons.info_rounded,
                  color: Theme.of(context).colorScheme.title2.color)
            ])),
        //
        // licenses page
        ItemInMenuList(
            useBorderTop: true,
            useBorderBot: true,
            padding: const EdgeInsets.only(left: 25, right: 25),
            onClicked: (_) {
              showLicensePage(context: context);
            },
            height: _itemHeight,
            child: Row(children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Licenses',
                        style: Theme.of(context).colorScheme.title2)
                  ]),
              const Spacer(),
              Icon(Icons.description,
                  color: Theme.of(context).colorScheme.title2.color)
            ])),
        //
        // version
        ItemInMenuList(
            useBorderTop: false,
            useBorderBot: false,
            padding: const EdgeInsets.only(left: 25, right: 25),
            height: 170,
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Column(children: [
                  const SizedBox(height: 30),
                  Text('${Constants.appName} ${Constants.appVersion}',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).colorScheme.title2)
                ])
              ]),
              const SizedBox(height: 30),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Image.asset('assets/logo.png',
                    width: 60, height: 60, cacheWidth: 150)
              ])
            ]))
      ]);
    });
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
}

class TapDownButton extends StatelessWidget {
  const TapDownButton({
    Key? key,
    required this.onTap,
    required this.child,
  }) : super(key: key);

  final void Function(TapDownDetails details) onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(24.0),
          ),
          border: Border.all(width: 1.0),
        ),
        child: child,
      ),
    );
  }
}

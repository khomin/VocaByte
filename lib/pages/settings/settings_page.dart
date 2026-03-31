import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vocabyte/components/app_bar2.dart';
import 'package:vocabyte/components/disposable_stream.dart';
import 'package:vocabyte/components/item_in_menu_list.dart';
import 'package:vocabyte/components/page_transition2.dart';
import 'package:vocabyte/components/round_button.dart';
import 'package:vocabyte/main.dart';
import 'package:vocabyte/pages/models/app_model.dart';
import 'package:vocabyte/pages/numerals/numerals_page.dart';
import 'package:vocabyte/components/dialogs/confirm_panel.dart';
import 'package:vocabyte/pages/settings/settings_about.dart';
import 'package:vocabyte/repository/app_rep.dart';
import 'package:vocabyte/repository/settings_rep.dart';
import 'package:vocabyte/repository/app_theme.dart';
import 'package:vocabyte/app/ui_helper.dart';
import 'package:vocabyte/resource/constants.dart';
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
  var _useSound = false;
  final _itemHeight = 70.0;
  ThemeMode _theme = ThemeMode.system;
  final _dispStream = DisposableStream();
  final _iconSize = 25.0;

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
    _useSound = await SettingsRep().getUseSound();
    setState(() {});
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
                          Text('Settings',
                              style: Theme.of(context).colorScheme.appBarText)
                        ])))),
            body: CustomScrollView(
                physics: const ClampingScrollPhysics(),
                slivers: [
                  DecoratedSliver(
                      decoration: const BoxDecoration(
                          // color: Theme.of(context).colorScheme.card
                          ),
                      sliver: SliverList.list(children: [
                        _profile(),
                        _numComplexity(),
                        _others(),
                      ]))
                ])));
  }

  Widget _profile() {
    var appModel = context.read<AppModel>();
    return Column(children: [
      Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Row(children: [
          Padding(
              padding: const EdgeInsets.only(top: 25, left: 25),
              child: Text('Theme', style: Theme.of(context).colorScheme.title1))
        ]),
        Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 25),
            child: RadioGroup<int>(
                groupValue: _theme.index,
                onChanged: (int? value) {},
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
                                padding:
                                    const EdgeInsets.only(left: 25, right: 25),
                                margin: const EdgeInsets.only(top: 10),
                                onClicked: (_) async {
                                  appModel.theme = ThemeMode.light;
                                  _update();
                                },
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Light',
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .colorScheme
                                              .title2),
                                      const IgnorePointer(
                                          child: Radio<int>(value: 0))
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
                                padding:
                                    const EdgeInsets.only(left: 25, right: 25),
                                margin: const EdgeInsets.only(top: 10),
                                onClicked: (_) async {
                                  appModel.theme = ThemeMode.dark;
                                  _update();
                                },
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Dark',
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .colorScheme
                                              .title2),
                                      const IgnorePointer(
                                          child: Radio(value: 1))
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
                                padding:
                                    const EdgeInsets.only(left: 25, right: 25),
                                margin: const EdgeInsets.only(top: 10),
                                onClicked: (pos) async {
                                  appModel.theme = ThemeMode.system;
                                  _update();
                                },
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('System',
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .colorScheme
                                              .title2),
                                      const IgnorePointer(
                                          child: Radio(value: 2))
                                    ]));
                          })
                    ])))
      ]),
      //
      // daily goal
      ItemInMenuList(
          useBorderTop: true,
          useBorderBot: false,
          padding: const EdgeInsets.only(left: 25, right: 25),
          onClicked: (_) {
            widget.onChangeGoal();
          },
          height: _itemHeight,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //
                // daily goal
                Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(children: [
                      Text('Daily goal',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).colorScheme.title2),
                      const Spacer(),
                      Row(children: [
                        Text('${_dailyGoal ?? 0} words day',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).colorScheme.title2),
                        Icon(Icons.keyboard_arrow_right,
                            color:
                                Theme.of(context).textTheme.titleSmall?.color)
                      ])
                    ]))
              ])),
      //
      // use sound
      ItemInMenuList(
          useBorderTop: true,
          useBorderBot: false,
          padding: const EdgeInsets.only(left: 25, right: 25),
          onClicked: (_) {
            widget.onChangeGoal();
          },
          height: _itemHeight,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(children: [
                      Text('Use sound',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).colorScheme.title2),
                      const Spacer(),
                      Switch(
                          value: _useSound,
                          onChanged: (value) async {
                            SettingsRep().setUseSound(value);
                            setState(() {
                              _useSound = value;
                            });
                          })
                    ]))
              ])),
      //
      // export words
      ItemInMenuList(
          useBorderTop: true,
          useBorderBot: false,
          padding: const EdgeInsets.only(left: 25, right: 25),
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
                      color: Theme.of(context).colorScheme.title5)),
            RoundButton(
                iconData: Icons.drive_folder_upload_sharp,
                height: Constants.baseButton,
                width: Constants.baseButton,
                iconSize: _iconSize,
                iconColor: Theme.of(context).colorScheme.title2.color,
                useScaleAnimation: true,
                color: Colors.transparent,
                onPressed: (_) async {
                  setState(() => _exportBusy = true);
                  var res = await ServiceApi().exportWords();
                  setState(() => _exportBusy = false);
                  if (mounted) {
                    if (res) {
                      UiHelper.showToast(context, 'Exported');
                    }
                  }
                })
          ])),
      //
      // import words
      ItemInMenuList(
          useBorderTop: true,
          useBorderBot: false,
          padding: const EdgeInsets.only(left: 25, right: 25),
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
                      color: Theme.of(context).colorScheme.title5)),
            RoundButton(
                iconData: Icons.folder_zip_sharp,
                height: Constants.baseButton,
                width: Constants.baseButton,
                iconSize: _iconSize,
                iconColor: Theme.of(context).colorScheme.title2.color,
                useScaleAnimation: true,
                color: Colors.transparent,
                onPressed: (_) async {
                  setState(() => _importBusy = true);
                  var count = await ServiceApi().importWords();
                  setState(() => _importBusy = false);
                  if (mounted) {
                    UiHelper.showToast(context,
                        'Imported $count ${count == 1 ? 'word' : 'word'}');
                  }
                })
          ])),
      ItemInMenuList(
          useBorderTop: true,
          useBorderBot: false,
          padding: const EdgeInsets.only(left: 25, right: 25),
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
                      color: Theme.of(context).colorScheme.title5)),
            RoundButton(
                iconData: Icons.upload_sharp,
                height: Constants.baseButton,
                width: Constants.baseButton,
                iconSize: _iconSize,
                iconColor: Theme.of(context).colorScheme.title2.color,
                useScaleAnimation: true,
                color: Colors.transparent,
                onPressed: (_) async {
                  setState(() => _exportProfileBusy = true);
                  var success = await ServiceApi().exportProfile();
                  setState(() => _exportProfileBusy = false);
                  if (mounted) {
                    if (success) {
                      UiHelper.showToast(context, 'Exported');
                    } else {
                      UiHelper.showToast(context, 'No words to export');
                    }
                  }
                })
          ])),
      ItemInMenuList(
          useBorderTop: true,
          useBorderBot: false,
          padding: const EdgeInsets.only(left: 25, right: 25),
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
                      color: Theme.of(context).colorScheme.title5)),
            RoundButton(
                iconData: Icons.download_sharp,
                height: Constants.baseButton,
                width: Constants.baseButton,
                iconSize: _iconSize,
                iconColor: Theme.of(context).colorScheme.title2.color,
                useScaleAnimation: true,
                color: Colors.transparent,
                onPressed: (_) async {
                  setState(() => _importProfileBusy = true);
                  var res = await ServiceApi().importProfile();
                  setState(() => _importProfileBusy = false);
                  if (mounted) {
                    if (res) {
                      UiHelper.showToast(context, 'Imported');
                    } else {
                      UiHelper.showToast(context, 'Error');
                    }
                  }
                })
          ])),
      ItemInMenuList(
          useBorderTop: true,
          useBorderBot: true,
          padding: const EdgeInsets.only(left: 25, right: 25),
          height: _itemHeight,
          child: Row(children: [
            Text('Delete data',
                textAlign: TextAlign.center,
                style: Theme.of(context).colorScheme.title2),
            const Spacer(),
            RoundButton(
                iconData: Icons.delete_sharp,
                height: Constants.baseButton,
                width: Constants.baseButton,
                iconSize: _iconSize,
                iconColor: Theme.of(context).colorScheme.titleErr,
                useScaleAnimation: true,
                color: Colors.transparent,
                onPressed: (_) async {
                  showModalBottomSheet(
                      context: context,
                      barrierColor: Colors.black26,
                      builder: (BuildContext context) {
                        return ConfirmPanel(
                          title: 'Are you sure?',
                          text: 'You will lose all progress',
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
                  focusColor: Theme.of(context).colorScheme.card,
                  dropdownColor: Theme.of(context).colorScheme.card,
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
            margin: const EdgeInsets.only(left: 25, right: 25),
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
              getIt<AppRep>().shareApp();
            },
            height: _itemHeight,
            child: Row(children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Share this app',
                        style: Theme.of(context).colorScheme.title2)
                  ]),
              const Spacer(),
              Icon(Icons.link,
                  size: 25, color: Theme.of(context).colorScheme.title2.color)
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
                  PageTransition2.build(
                    settings: const RouteSettings(),
                    type: TransitionType.slide,
                    child: const SettingsAbout(),
                  ));
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
                  size: 25, color: Theme.of(context).colorScheme.title2.color)
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
                  size: 25, color: Theme.of(context).colorScheme.title2.color)
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
}

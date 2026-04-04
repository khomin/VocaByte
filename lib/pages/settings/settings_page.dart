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
import 'package:vocabyte/pages/models/settings_model.dart';
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
  const SettingsPage({
    required this.onChangeGoal,
    super.key,
  });
  final Function() onChangeGoal;

  @override
  State<SettingsPage> createState() => _State();
}

class _State extends State<SettingsPage> {
  final _model = SettingsModel();
  final _cardPadding =
      const EdgeInsets.only(left: 25, right: 25, top: 5, bottom: 5);
  final _headerPadding =
      const EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10);

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      _model.update();
    });
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var padding = MediaQuery.of(context).padding;
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.baseColor1,
        body: ChangeNotifierProvider.value(
            value: _model,
            builder: (context, child) {
              return CustomScrollView(
                  physics: const ClampingScrollPhysics(),
                  slivers: [
                    SliverAppBar(
                        floating: true,
                        // snap: true,
                        // pinned: true,
                        primary: false,
                        expandedHeight:
                            Constants.homeAppBarHeight + padding.top,
                        collapsedHeight:
                            Constants.homeAppBarHeight + padding.top,
                        toolbarHeight: Constants.homeAppBarHeight + padding.top,
                        automaticallyImplyLeading: false,
                        // backgroundColor:
                        //     Theme.of(context).colorScheme.appBar,
                        scrolledUnderElevation: 0,
                        elevation: 0,
                        surfaceTintColor: Colors.transparent,
                        titleSpacing: 0,
                        title: Container(
                          alignment: Alignment.center,
                          child: Material(
                            color: Colors.transparent,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero),
                            child: Container(
                              padding: EdgeInsets.only(top: padding.top),
                              height: Constants.homeAppBarHeight + padding.top,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  // color: Colors.white,
                                  color: Theme.of(context).colorScheme.appBar,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          Colors.black.withValues(alpha: 0.05),
                                      blurRadius: 10,
                                      spreadRadius: 2,
                                      offset: const Offset(0, -2),
                                    ),
                                  ]),
                              child: _buildTopBar(),
                            ),
                          ),
                        )),
                    SliverList.list(children: [
                      _profile(),
                      _theme(),
                      _numerals(),
                      _others(),
                    ]),
                    SliverToBoxAdapter(
                      child: SizedBox(
                          height: MediaQuery.of(context).padding.bottom),
                    ),
                  ]);
            }));
  }

  Widget _buildTopBar() {
    return Stack(alignment: AlignmentGeometry.center, children: [
      Center(
          child: Text(
        'Settings',
        style: TextStyle(
          color: Theme.of(context).colorScheme.iconColor,
          fontSize: 16,
          fontFamily: Constants.fontInter,
        ),
      )),
    ]);
  }

  Widget _theme() {
    return Builder(builder: (context) {
      var appModel = context.read<AppModel>();
      var model = context.watch<SettingsModel>();
      return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.cardHome,
            borderRadius: BorderRadius.circular(25),
          ),
          margin: const EdgeInsets.only(
            top: 8,
            left: Constants.homeCardPadding,
            right: Constants.homeCardPadding,
            bottom: 8,
          ),
          child: Column(children: [
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Container(
                  height: 60,
                  alignment: Alignment.centerLeft,
                  margin: _cardPadding,
                  child: Text(
                    'Theme',
                    style: Theme.of(context).colorScheme.title1,
                  )),
              Padding(
                  padding: const EdgeInsets.only(),
                  child: RadioGroup<int>(
                      groupValue: model.theme.index,
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
                                      padding: const EdgeInsets.only(
                                          left: 25, right: 25),
                                      margin: const EdgeInsets.only(top: 10),
                                      onClicked: (_) async {
                                        appModel.theme = ThemeMode.light;
                                        model.update();
                                      },
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Light',
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context)
                                                  .colorScheme
                                                  .title2,
                                            ),
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
                                      padding: const EdgeInsets.only(
                                          left: 25, right: 25),
                                      margin: const EdgeInsets.only(top: 10),
                                      onClicked: (_) async {
                                        appModel.theme = ThemeMode.dark;
                                        model.update();
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
                                      padding: const EdgeInsets.only(
                                          left: 25, right: 25),
                                      margin: const EdgeInsets.only(top: 10),
                                      onClicked: (pos) async {
                                        appModel.theme = ThemeMode.system;
                                        _model.update();
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
            // use sound
            ItemInMenuList(
                useBorderTop: true,
                useBorderBot: false,
                margin: _cardPadding,
                onClicked: (_) {
                  widget.onChangeGoal();
                },
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
                                value: model.useSound,
                                onChanged: (value) async {
                                  SettingsRep().setUseSound(value);
                                  model.useSound = value;
                                  model.notify();
                                })
                          ]))
                    ])),
          ]));
    });
  }

  Widget _profile() {
    return Builder(builder: (context) {
      var model = context.watch<SettingsModel>();
      return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.cardHome,
            borderRadius: BorderRadius.circular(25),
          ),
          margin: const EdgeInsets.only(
            top: 8,
            left: Constants.homeCardPadding,
            right: Constants.homeCardPadding,
            bottom: 8,
          ),
          child: Column(children: [
            Container(
                height: 40,
                margin: _headerPadding,
                child: Row(children: [
                  Text('Profile', style: Theme.of(context).colorScheme.title1)
                ])),
            //
            // daily goal
            ItemInMenuList(
                useBorderTop: false,
                useBorderBot: false,
                margin: _cardPadding,
                onClicked: (_) {
                  widget.onChangeGoal();
                },
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //
                      // daily goal
                      Row(children: [
                        Text('Daily goal',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).colorScheme.title2),
                        const Spacer(),
                        Row(children: [
                          Text('${model.dailyGoal ?? 0} words day',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).colorScheme.title2),
                          Icon(Icons.keyboard_arrow_right,
                              color:
                                  Theme.of(context).textTheme.titleSmall?.color)
                        ])
                      ])
                    ])),
            //
            // export words
            ItemInMenuList(
                useBorderTop: true,
                useBorderBot: false,
                margin: _cardPadding,
                child: Row(children: [
                  Text('Export words',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).colorScheme.title2),
                  const Spacer(),
                  if (model.exportBusy)
                    SizedBox(
                        width: 15,
                        height: 15,
                        child: CircularProgressIndicator(
                            color: Theme.of(context).colorScheme.title5)),
                  RoundButton(
                      iconData: Icons.drive_folder_upload_sharp,
                      height: Constants.baseButton,
                      width: Constants.baseButton,
                      iconSize: _model.iconSize,
                      iconColor: Theme.of(context).colorScheme.title2.color,
                      useScaleAnimation: true,
                      color: Colors.transparent,
                      onPressed: (_) async {
                        model.exportBusy = true;
                        model.notify();
                        var res = await ServiceApi().exportWords();
                        model.exportBusy = false;
                        model.notify();
                        if (context.mounted && res) {
                          UiHelper.showToast(context, 'Exported');
                        }
                      })
                ])),
            //
            // import words
            ItemInMenuList(
                useBorderTop: true,
                useBorderBot: false,
                margin: _cardPadding,
                child: Row(children: [
                  Text('Import words',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).colorScheme.title2),
                  const Spacer(),
                  if (model.importBusy)
                    SizedBox(
                        width: 15,
                        height: 15,
                        child: CircularProgressIndicator(
                            color: Theme.of(context).colorScheme.title5)),
                  RoundButton(
                      iconData: Icons.folder_zip_sharp,
                      height: Constants.baseButton,
                      width: Constants.baseButton,
                      iconSize: _model.iconSize,
                      iconColor: Theme.of(context).colorScheme.title2.color,
                      useScaleAnimation: true,
                      color: Colors.transparent,
                      onPressed: (_) async {
                        model.importBusy = true;
                        model.notify();
                        var count = await ServiceApi().importWords();
                        model.importBusy = false;
                        model.notify();
                        if (context.mounted) {
                          UiHelper.showToast(context,
                              'Imported $count ${count == 1 ? 'word' : 'word'}');
                        }
                      })
                ])),
            ItemInMenuList(
                useBorderTop: true,
                useBorderBot: false,
                margin: _cardPadding,
                child: Row(children: [
                  Text('Export profile',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).colorScheme.title2),
                  const Spacer(),
                  if (model.exportProfileBusy)
                    SizedBox(
                        width: 15,
                        height: 15,
                        child: CircularProgressIndicator(
                            color: Theme.of(context).colorScheme.title5)),
                  RoundButton(
                      iconData: Icons.upload_sharp,
                      height: Constants.baseButton,
                      width: Constants.baseButton,
                      iconSize: model.iconSize,
                      iconColor: Theme.of(context).colorScheme.title2.color,
                      useScaleAnimation: true,
                      color: Colors.transparent,
                      onPressed: (_) async {
                        model.exportProfileBusy = true;
                        model.notify();
                        var success = await ServiceApi().exportProfile();
                        model.exportProfileBusy = false;
                        model.notify();
                        if (context.mounted) {
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
                margin: _cardPadding,
                child: Row(children: [
                  Text('Import profile',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).colorScheme.title2),
                  const Spacer(),
                  if (model.importProfileBusy)
                    SizedBox(
                        width: 15,
                        height: 15,
                        child: CircularProgressIndicator(
                            color: Theme.of(context).colorScheme.title5)),
                  RoundButton(
                      iconData: Icons.download_sharp,
                      height: Constants.baseButton,
                      width: Constants.baseButton,
                      iconSize: _model.iconSize,
                      iconColor: Theme.of(context).colorScheme.title2.color,
                      useScaleAnimation: true,
                      color: Colors.transparent,
                      onPressed: (_) async {
                        model.importProfileBusy = true;
                        model.notify();
                        var res = await ServiceApi().importProfile();
                        model.importProfileBusy = false;
                        model.notify();
                        if (context.mounted) {
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
                margin: _cardPadding,
                child: Row(children: [
                  Text('Delete data',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).colorScheme.title2),
                  const Spacer(),
                  RoundButton(
                      iconData: Icons.delete_sharp,
                      height: Constants.baseButton,
                      width: Constants.baseButton,
                      iconSize: _model.iconSize,
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
          ]));
    });
  }

  Widget _numerals() {
    return Builder(builder: (context) {
      var model = context.watch<SettingsModel>();
      return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.cardHome,
            borderRadius: BorderRadius.circular(25),
          ),
          margin: const EdgeInsets.only(
            top: 8,
            left: Constants.homeCardPadding,
            right: Constants.homeCardPadding,
            bottom: 8,
          ),
          child: Column(children: [
            Container(
                height: 40,
                margin: _headerPadding,
                child: Row(children: [
                  Text('Numerals', style: Theme.of(context).colorScheme.title1)
                ])),
            ItemInMenuList(
                useBorderTop: false,
                useBorderBot: true,
                margin: _cardPadding,
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
                          model.numLevel?.name ?? NumeralsLevel.easy.name),
                      focusColor: Theme.of(context).colorScheme.card,
                      dropdownColor: Theme.of(context).colorScheme.card,
                      onChanged: (String? value) async {
                        if (value == null) return;
                        var newVal = NumeralsLevel.values.firstWhere((it) =>
                            it.name.toLowerCase() == value.toLowerCase());
                        SettingsRep().setNumeralsLevel(newVal);
                        model.numLevel = newVal;
                        model.notify();
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
          ]));
    });
  }

  Widget _others() {
    return Builder(builder: (context) {
      return Builder(builder: (context) {
        var model = context.watch<SettingsModel>();
        return Column(children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.cardHome,
              borderRadius: BorderRadius.circular(25),
            ),
            margin: const EdgeInsets.only(
              top: 8,
              left: Constants.homeCardPadding,
              right: Constants.homeCardPadding,
              bottom: 16,
            ),
            child: Column(children: [
              Container(
                  height: 40,
                  margin: _headerPadding,
                  child: Row(children: [
                    Text('Other', style: Theme.of(context).colorScheme.title1)
                  ])),
              //
              // share
              ItemInMenuList(
                  useBorderTop: true,
                  useBorderBot: false,
                  margin: _cardPadding,
                  onClicked: (_) {
                    getIt<AppRep>().shareApp();
                  },
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
                        size: 25,
                        color: Theme.of(context).colorScheme.title2.color)
                  ])),
              //
              // about the app
              ItemInMenuList(
                  useBorderTop: true,
                  useBorderBot: false,
                  margin: _cardPadding,
                  onClicked: (_) {
                    Navigator.push(
                        context,
                        PageTransition2.build(
                          settings: const RouteSettings(),
                          type: TransitionType.slide,
                          child: const SettingsAbout(),
                        ));
                  },
                  child: Row(children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('About',
                              style: Theme.of(context).colorScheme.title2),
                        ]),
                    const Spacer(),
                    Icon(Icons.info_rounded,
                        size: 25,
                        color: Theme.of(context).colorScheme.title2.color)
                  ])),
              //
              // licenses page
              ItemInMenuList(
                  useBorderTop: true,
                  useBorderBot: true,
                  margin: _cardPadding,
                  onClicked: (_) {
                    showLicensePage(context: context);
                  },
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
                        size: 25,
                        color: Theme.of(context).colorScheme.title2.color)
                  ])),
            ]),
          ),
          //
          // version
          ItemInMenuList(
              useBorderTop: false,
              useBorderBot: false,
              margin: _cardPadding,
              child: Column(children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Column(children: [
                    const SizedBox(height: 10),
                    Text('${Constants.appName} ${Constants.appVersion}',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).colorScheme.title2)
                  ])
                ]),
                const SizedBox(height: 10),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Image.asset('assets/logo.png',
                      width: 60, height: 60, cacheWidth: 150)
                ]),
                const SizedBox(height: 30),
              ]))
        ]);
      });
    });
  }
}

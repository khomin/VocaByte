import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:vocabyte/components/app_bar2.dart';
import 'package:vocabyte/components/disposable_stream.dart';
import 'package:vocabyte/components/item_in_menu_list.dart';
import 'package:vocabyte/components/page_transition2.dart';
import 'package:vocabyte/components/round_button.dart';
import 'package:vocabyte/app_runner.dart';
import 'package:vocabyte/models/app_model.dart';
import 'package:vocabyte/models/settings_model.dart';
import 'package:vocabyte/pages/ads/upgrade_full.dart';
import 'package:vocabyte/pages/ads/upgrade_premium.dart';
import 'package:vocabyte/pages/numerals/numerals_page.dart';
import 'package:vocabyte/components/dialogs/confirm_panel.dart';
import 'package:vocabyte/pages/settings/settings_about.dart';
import 'package:vocabyte/pages/settings/settings_profile.dart';
import 'package:vocabyte/repository/app_rep.dart';
import 'package:vocabyte/repository/payment_service.dart';
import 'package:vocabyte/repository/settings_rep.dart';
import 'package:vocabyte/repository/app_theme.dart';
import 'package:vocabyte/app/ui_helper.dart';
import 'package:vocabyte/resource/constants.dart';
import 'package:vocabyte/services/service_api.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _State();
}

class _State extends State<SettingsPage> {
  final _model = SettingsModel();

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
                        primary: false,
                        expandedHeight:
                            Constants.homeAppBarHeight + padding.top,
                        collapsedHeight:
                            Constants.homeAppBarHeight + padding.top,
                        toolbarHeight: Constants.homeAppBarHeight + padding.top,
                        automaticallyImplyLeading: false,
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
                    //
                    SliverToBoxAdapter(child: _profile()),
                    //
                    if (AppConfig.shared.canHavePremium)
                      SliverToBoxAdapter(child: _payStatus()),
                    //
                    SliverToBoxAdapter(child: _theme()),
                    //
                    SliverToBoxAdapter(child: _numerals()),
                    //
                    SliverToBoxAdapter(child: _others()),
                    //
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

  Widget _profile() {
    return Builder(builder: (context) {
      var model = context.watch<SettingsModel>();
      return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.cardHome,
            borderRadius: BorderRadius.circular(15),
          ),
          margin: const EdgeInsets.only(
            top: 15,
            left: Constants.homeCardPadding,
            right: Constants.homeCardPadding,
          ),
          child: Column(children: [
            ItemInMenuList(
              useBorderTop: false,
              useBorderBot: false,
              padding: Constants.settingsCardPadding,
              onClicked: (_) {
                Navigator.push(
                    context,
                    PageTransition2.build(
                      settings: const RouteSettings(),
                      type: TransitionType.slide,
                      child: SettingsProfile(model: _model),
                    ));
              },
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'User ${model.name}',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.title2.color,
                        fontSize: 20,
                      ),
                    ),
                    if (AppConfig.shared.canHavePremium)
                      StreamBuilder(
                          stream: getIt<PaymentService>().premiumStatusStream,
                          initialData: false,
                          builder: (context, snapshot) {
                            var premium = snapshot.data ?? false;
                            return Container(
                              margin: const EdgeInsets.only(right: 12),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: premium
                                    ? Theme.of(context).colorScheme.premium
                                    : Theme.of(context).colorScheme.noPremium,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: premium
                                      ? Theme.of(context)
                                          .colorScheme
                                          .premiumBorder
                                      : Theme.of(context)
                                          .colorScheme
                                          .noPremiumBorder,
                                  width: 1,
                                ),
                              ),
                              child: Text(
                                premium ? 'PRO' : 'FREE',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 0.5,
                                  color: premium
                                      ? Theme.of(context)
                                          .colorScheme
                                          .premiumText
                                      : Theme.of(context)
                                          .colorScheme
                                          .noPremiumText,
                                ),
                              ),
                            );
                          }),
                    SizedBox(
                        width: 60,
                        height: 60,
                        child: model.name.isNotEmpty
                            ? RandomAvatar(
                                model.name,
                                height: 60,
                                width: 60,
                              )
                            : const SizedBox())
                  ]),
            ),
            //
            ItemInMenuList(
                useBorderTop: false,
                useBorderBot: false,
                padding: Constants.settingsCardPadding,
                onClicked: (_) {
                  Navigator.push(
                      context,
                      PageTransition2.build(
                        settings: const RouteSettings(),
                        type: TransitionType.slide,
                        child: SettingsProfile(model: _model),
                      ));
                },
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Profile',
                          style: Theme.of(context).colorScheme.title2,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Icon(
                      Icons.person_sharp,
                      size: 25,
                      color: Theme.of(context).colorScheme.title2.color,
                    )
                  ],
                )),
          ]));
    });
  }

  Widget _payStatus() {
    return StreamBuilder(
        stream: getIt<PaymentService>().premiumStatusStream,
        initialData: false,
        builder: (context, snapshot) {
          var premium = snapshot.data ?? false;
          if (premium) {
            return const SizedBox();
          }
          return UpgradePremium(
              price: getIt<PaymentService>().priceStream,
              onPressed: () async {
                Navigator.push(
                    context,
                    PageTransition2.build(
                        settings: const RouteSettings(),
                        type: TransitionType.slide,
                        child: const UpgradeFull(
                          limitReached: false,
                          withHeader: true,
                        )));
              });
        });
  }

  Widget _theme() {
    return Builder(builder: (context) {
      var appModel = context.read<AppModel>();
      var theme = context.watch<AppModel>().theme;
      var brightness = MediaQuery.platformBrightnessOf(context);
      var isDark = false;
      if (theme == ThemeMode.dark) {
        isDark = true;
      }
      if (theme == ThemeMode.system) {
        isDark = brightness == Brightness.dark;
      }
      return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.cardHome,
            borderRadius: BorderRadius.circular(15),
          ),
          margin: const EdgeInsets.only(
            top: 15,
            left: Constants.homeCardPadding,
            right: Constants.homeCardPadding,
          ),
          child: Column(children: [
            Container(
                height: 30,
                margin: Constants.settingsHeaderPadding,
                child: Row(children: [
                  Text(
                    'Dark mode',
                    style: Theme.of(context).colorScheme.title1,
                  )
                ])),
            ItemInMenuList(
                useBorderTop: false,
                useBorderBot: false,
                padding: Constants.settingsCardPadding,
                onClicked: (_) {
                  appModel.setTheme(isDark ? ThemeMode.light : ThemeMode.dark);
                },
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(children: [
                        Builder(builder: (context) {
                          if (isDark) {
                            return Text('Enabled',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).colorScheme.title2);
                          } else {
                            return Text('Disabled',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).colorScheme.title2);
                          }
                        }),
                        const Spacer(),
                        Switch(
                            value: isDark,
                            padding: EdgeInsets.zero,
                            onChanged: (value) async {
                              appModel.setTheme(
                                  isDark ? ThemeMode.light : ThemeMode.dark);
                            })
                      ])
                    ])),
          ]));
    });
  }

  Widget _numerals() {
    return Builder(builder: (context) {
      var model = context.watch<SettingsModel>();
      return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.cardHome,
            borderRadius: BorderRadius.circular(15),
          ),
          margin: const EdgeInsets.only(
            top: 15,
            left: Constants.homeCardPadding,
            right: Constants.homeCardPadding,
          ),
          child: Column(children: [
            Container(
                height: 30,
                margin: Constants.settingsHeaderPadding,
                child: Row(children: [
                  Text(
                    'Numerals',
                    style: Theme.of(context).colorScheme.title1,
                  )
                ])),
            ItemInMenuList(
                useBorderTop: false,
                useBorderBot: false,
                padding: Constants.settingsCardPadding,
                onClicked: (_) {},
                child: Row(children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Complexity level',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).colorScheme.title2,
                        ),
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
      var model = context.watch<SettingsModel>();
      return Column(children: [
        Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.cardHome,
              borderRadius: BorderRadius.circular(15)),
          margin: const EdgeInsets.only(
            top: 15,
            left: Constants.homeCardPadding,
            right: Constants.homeCardPadding,
          ),
          child: Column(children: [
            Container(
                height: 30,
                margin: Constants.settingsHeaderPadding,
                child: Row(children: [
                  Text('Other', style: Theme.of(context).colorScheme.title1)
                ])),
            //
            // use sound
            ItemInMenuList(
                useBorderTop: false,
                useBorderBot: false,
                padding: Constants.settingsCardPadding,
                onClicked: (_) {
                  model.setUseSound(!model.useSound);
                },
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(children: [
                        Text('Play sound',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).colorScheme.title2),
                        const Spacer(),
                        Switch(
                            value: model.useSound,
                            padding: EdgeInsets.zero,
                            onChanged: (value) async {
                              model.setUseSound(value);
                            })
                      ])
                    ])),
            //
            // share
            ItemInMenuList(
                useBorderTop: true,
                useBorderBot: false,
                padding: Constants.settingsCardPadding,
                onClicked: (_) {
                  getIt<AppRep>().shareApp();
                },
                child: Row(children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Share this app',
                          style: Theme.of(context).colorScheme.title2,
                        )
                      ]),
                  const Spacer(),
                  Icon(
                    Icons.link,
                    size: 25,
                    color: Theme.of(context).colorScheme.title2.color,
                  )
                ])),
            //
            // about the app
            ItemInMenuList(
                useBorderTop: true,
                useBorderBot: false,
                padding: Constants.settingsCardPadding,
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
                useBorderBot: false,
                padding: Constants.settingsCardPadding,
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
            padding: Constants.settingsCardPadding,
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
  }
}

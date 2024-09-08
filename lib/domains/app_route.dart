import 'dart:io';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:vocabyte/app/utils.dart';
import 'package:vocabyte/components/circle_button.dart';
import 'package:vocabyte/components/dev_panel.dart';
import 'package:vocabyte/domains/card_review/card_review_nav.dart';
import 'package:vocabyte/domains/drawer/drawer_menu.dart';
import 'package:vocabyte/domains/manage_word/manage_word_page.dart';
import 'package:vocabyte/domains/models/app_model.dart';
import 'package:vocabyte/domains/numerals/numerals_nav.dart';
import 'package:vocabyte/domains/page_about/page_about.dart';
import 'package:vocabyte/domains/page_home/page_home.dart';
import 'package:vocabyte/domains/page_search_word/page_search.dart';
import 'package:flutter/material.dart';
import 'package:vocabyte/domains/settings/settings_daily_goal.dart';
import 'package:vocabyte/domains/settings/settings_page.dart';
import 'package:vocabyte/domains/word_details/page_word_details.dart';
import 'package:vocabyte/repository/app_rep.dart';
import 'package:vocabyte/repository/settings_rep.dart';
import 'package:vocabyte/app/app_theme.dart';
import 'package:vocabyte/app/const_values.dart';
import 'package:vocabyte/app/ui_helper.dart';
import 'package:vocabyte/services/service_api.dart';

class AppRoute extends StatefulWidget {
  const AppRoute({super.key});

  @override
  State<AppRoute> createState() => _AppRouteState();
}

class _AppRouteState extends State<AppRoute> {
  final tag = 'appRoute';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) async {
          if (didPop) return;
          var nav = context.read<AppModel>().appNavKey;
          if (nav.currentState?.canPop() == true) {
            nav.currentState?.pop();
            return;
          }
          SystemNavigator.pop();
        },
        child: Builder(builder: (context) {
          var page = context.watch<AppModel>().page;
          return Scaffold(
              //
              // drawer mobile
              drawer:
                  (UiHelper.isMobile() && context.watch<AppModel>().drawerOn)
                      ? const Drawer(child: DrawerMenu())
                      : null,
              appBar: AppBar(
                  surfaceTintColor: Theme.of(context).colorScheme.baseColor1,
                  backgroundColor: Theme.of(context).colorScheme.baseColor1,
                  centerTitle: true,
                  shadowColor: Theme.of(context).colorScheme.titel3,
                  foregroundColor: Theme.of(context).colorScheme.iconColor,
                  automaticallyImplyLeading: context.watch<AppModel>().drawerOn,
                  titleSpacing:
                      (Platform.isIOS || Platform.isAndroid) ? 0 : null,
                  title: Stack(alignment: Alignment.center, children: [
                    if (!context.watch<AppModel>().drawerOn)
                      Row(children: [
                        CircleButton(
                            iconData: Icons.arrow_back,
                            color: Colors.transparent,
                            onPressed: (_) {
                              var nav = context.read<AppModel>().appNavKey;
                              if (nav.currentState?.canPop() == true) {
                                nav.currentState?.pop();
                              }
                            })
                      ]),
                    Text(Utils().pageToHeader(page),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.titel1)),
                    if (page == MenuPageType.reviewCard ||
                        page == MenuPageType.numerals)
                      StreamBuilder(
                          stream: AppRep().onProgressChanged,
                          builder: (context, snapshot) {
                            var v = snapshot.data ?? 0.0;
                            return Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: SizedBox(
                                        child: CircularProgressIndicator(
                                            value: v,
                                            backgroundColor: Theme.of(context)
                                                .colorScheme
                                                .page,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .titel1))));
                          })
                  ])),
              body: Column(children: [
                Expanded(
                    child: Navigator(
                        key: context.read<AppModel>().appNavKey,
                        initialRoute: MenuPageType.home.name,
                        observers: [context.read<AppModel>().appNavObserver],
                        onGenerateRoute: (RouteSettings settings) {
                          var type = UiHelper().routeNameToType(settings.name);
                          switch (type) {
                            //
                            // cards (default)
                            case MenuPageType.home:
                              return PageRouteBuilder(
                                  transitionDuration: Duration.zero,
                                  reverseTransitionDuration: Duration.zero,
                                  settings: RouteSettings(name: type.name),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    return child;
                                  },
                                  pageBuilder: (_, __, ___) =>
                                      PageHome(onGoToReview: () {
                                        context.read<AppModel>().goToPage(
                                            page: MenuPageType.reviewCard,
                                            replace: true);
                                      }, onGoToSearch: () {
                                        context.read<AppModel>().goToPage(
                                            page: MenuPageType.searchWord,
                                            replace: true);
                                      }, onGoToManageWords: () {
                                        context.read<AppModel>().goToPage(
                                            page: MenuPageType.manageWords,
                                            replace: true);
                                      }, onGoToNumerals: () {
                                        context.read<AppModel>().goToPage(
                                            page: MenuPageType.numerals,
                                            replace: true);
                                      }));
                            //
                            // account
                            case MenuPageType.account:
                              return PageRouteBuilder(
                                  transitionDuration: Duration.zero,
                                  reverseTransitionDuration: Duration.zero,
                                  settings: RouteSettings(name: type.name),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    return child;
                                  },
                                  pageBuilder: (_, __, ___) => Container(
                                        color: Colors.blue,
                                      ));
                            //
                            // search word
                            case MenuPageType.searchWord:
                              return PageRouteBuilder(
                                  transitionDuration: Duration.zero,
                                  reverseTransitionDuration: Duration.zero,
                                  settings: RouteSettings(name: type.name),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    return child;
                                  },
                                  pageBuilder: (_, __, ___) =>
                                      PageSearchWord(onShowWord: (data) async {
                                        context.read<AppModel>().goToPage(
                                            page: MenuPageType.wordDetails,
                                            replace: false);
                                        await ServiceApi()
                                            .putRecentWord(data.word);
                                        AppRep().updateRecent();
                                      }));
                            //
                            // word details
                            case MenuPageType.wordDetails:
                              return PageRouteBuilder(
                                  transitionDuration: Duration.zero,
                                  reverseTransitionDuration: Duration.zero,
                                  settings: RouteSettings(name: type.name),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    return child;
                                  },
                                  pageBuilder: (_, __, ___) => PageWordDetails(
                                      playWordAtStart: false,
                                      onBack: () {
                                        context.read<AppModel>().pageBack();
                                      }));
                            //
                            // card review
                            case MenuPageType.reviewCard:
                              return PageRouteBuilder(
                                  transitionDuration: Duration.zero,
                                  reverseTransitionDuration: Duration.zero,
                                  settings: RouteSettings(name: type.name),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    return child;
                                  },
                                  pageBuilder: (_, __, ___) =>
                                      CardReviewNav(onBack: () {
                                        context.read<AppModel>().pageBack();
                                      }));
                            //
                            // manage
                            case MenuPageType.manageWords:
                              return PageRouteBuilder(
                                  transitionDuration: Duration.zero,
                                  reverseTransitionDuration: Duration.zero,
                                  settings: RouteSettings(name: type.name),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    return child;
                                  },
                                  pageBuilder: (_, __, ___) =>
                                      ManageWordPage(onShowWord: (data) {
                                        context.read<AppModel>().goToPage(
                                            page: MenuPageType.wordDetails,
                                            replace: false);
                                      }));
                            //
                            // settings
                            case MenuPageType.settings:
                              return PageRouteBuilder(
                                  transitionDuration: Duration.zero,
                                  reverseTransitionDuration: Duration.zero,
                                  settings: RouteSettings(name: type.name),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    return child;
                                  },
                                  pageBuilder: (_, __, ___) =>
                                      SettingsPage(onChangeGoal: () {
                                        context.read<AppModel>().goToPage(
                                            page: MenuPageType.changeDailyGoal,
                                            replace: false);
                                      }));
                            //
                            // about
                            case MenuPageType.about:
                              return PageRouteBuilder(
                                  transitionDuration: Duration.zero,
                                  reverseTransitionDuration: Duration.zero,
                                  settings: RouteSettings(name: type.name),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    return child;
                                  },
                                  pageBuilder: (_, __, ___) =>
                                      const PageAbout());

                            //
                            // word details
                            case MenuPageType.numerals:
                              return PageRouteBuilder(
                                  transitionDuration: Duration.zero,
                                  reverseTransitionDuration: Duration.zero,
                                  settings: RouteSettings(name: type.name),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    return child;
                                  },
                                  pageBuilder: (_, __, ___) =>
                                      NumeralsNav(onBack: () {
                                        context.read<AppModel>().pageBack();
                                      }));
                            //
                            // manage
                            case MenuPageType.changeDailyGoal:
                              return PageRouteBuilder(
                                  transitionDuration: Duration.zero,
                                  reverseTransitionDuration: Duration.zero,
                                  settings: RouteSettings(name: type.name),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    return child;
                                  },
                                  pageBuilder: (_, __, ___) =>
                                      SettingsDailiyGoal(onBack: () {
                                        context.read<AppModel>().pageBack();
                                      }, onChanged: () {
                                        SettingsRep().onChanged.add(null);
                                        context.read<AppModel>().pageBack();
                                      }));
                            default:
                              throw Exception(
                                  'Invalid route: ${settings.name}');
                          }
                        })),
                //
                // dev panel
                if (ConstValues.isDev)
                  DevPanel(onGoTo: (page) {
                    context
                        .read<AppModel>()
                        .goToPage(page: page, replace: true);
                  })
              ]));
        }));
  }
}

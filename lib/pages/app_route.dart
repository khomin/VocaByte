import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:vocabyte/components/disposable_stream.dart';
import 'package:vocabyte/components/navigation_observer.dart';
import 'package:vocabyte/pages/card_review/card_review_nav.dart';
import 'package:vocabyte/pages/manage_word/manage_word_page.dart';
import 'package:vocabyte/pages/numerals/numerals_nav.dart';
import 'package:vocabyte/pages/page_home/page_home.dart';
import 'package:vocabyte/pages/page_search_word/page_search.dart';
import 'package:collection/collection.dart';
import 'package:vocabyte/pages/settings/settings_daily_goal.dart';
import 'package:vocabyte/pages/settings/settings_page.dart';
import 'package:vocabyte/pages/word_details/page_word_details.dart';
import 'package:vocabyte/repository/app_rep.dart';
import 'package:vocabyte/repository/nav_rep.dart';
import 'package:vocabyte/repository/settings_rep.dart';
import 'package:vocabyte/services/service_api.dart';

class AppRoute extends StatefulWidget {
  const AppRoute({super.key});

  @override
  State<AppRoute> createState() => _AppRouteState();
}

class _AppRouteState extends State<AppRoute> {
  late NavigatorObserverCustom _observer;
  final _dispStream = DisposableStream();
  final tag = 'appRoute';

  @override
  void initState() {
    super.initState();

    _observer = NavigatorObserverCustom(
        onDidPop: () {},
        onChanged: (name, arg) {
          var page = PageType.values.firstWhereOrNull((v) => v.name == name);
          switch (page) {
            case null:
              if (name == 'numerals') {
                NavigatorRep().routeBloc.onHideBottom.add(true);
              }
              break;
            case PageType.home:
              NavigatorRep().routeBloc.onHideBottom.add(false);
              break;
            case PageType.reviewCard:
              NavigatorRep().routeBloc.onHideBottom.add(true);
              break;
            case PageType.searchWord:
            case PageType.manageWords:
            case PageType.settings:
              break;
          }
          if (page != null) {
            NavigatorRep().routeBloc.onCurrent.add(Panel(type: page));
          }
        });
    _dispStream.add(NavigatorRep().routeBloc.onGoto.listen((page) {
      if (page == null) return;
      var settings = RouteSettings(name: page.type.name);
      var nav = NavigatorRep().routeBloc.navKey.currentState;
      while (nav?.canPop() == true) {
        nav?.pop();
      }
      switch (page.type) {
        case PageType.searchWord:
          nav?.push(CupertinoPageRoute(
              settings: settings,
              builder: (context) {
                return SearchWordPage(onShow: (data) async {
                  AppRep().cachedWord = data;
                  await ServiceApi().putRecentWord(data.word);
                  await AppRep().updateRecent();
                  nav.push(CupertinoPageRoute(
                      settings: settings,
                      builder: (context) {
                        return PageWordDetails(
                            playWordAtStart: true,
                            primary: true,
                            onBack: () {
                              Navigator.of(context).pop();
                            });
                      }));
                });
              }));
          break;
        case PageType.reviewCard:
          nav?.push(CupertinoPageRoute(
              settings: settings,
              builder: (context) {
                return const CardReviewNav();
              }));
          break;
        case PageType.manageWords:
          nav?.push(CupertinoPageRoute(
              settings: settings,
              builder: (context) {
                return ManageWordPage(onShowWord: (data) {
                  nav.push(CupertinoPageRoute(
                      settings: settings,
                      builder: (context) {
                        return PageWordDetails(
                            primary: true,
                            onBack: () {
                              Navigator.of(context).pop();
                            },
                            playWordAtStart: true);
                      }));
                });
              }));
          break;
        case PageType.settings:
          nav?.push(CupertinoPageRoute(
              settings: settings,
              builder: (context) {
                return SettingsPage(onChangeGoal: () {
                  nav.push(CupertinoPageRoute(
                      settings: settings,
                      builder: (context) {
                        return SettingsDailiyGoal(onChanged: (v) {
                          SettingsRep().setDailyGoal(v);
                          SettingsRep().onChanged.add(null);
                        });
                      }));
                });
              }));
          break;
        default:
          break;
      }
    }));
  }

  @override
  void dispose() {
    super.dispose();
    _dispStream.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      var nav = NavigatorRep().routeBloc.navKey;
      return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) async {
            if (didPop) return;
            var nav = NavigatorRep().routeBloc.navKey;
            if (nav.currentState?.canPop() == true) {
              nav.currentState?.pop();
              return;
            } else {
              SystemNavigator.pop();
            }
          },
          child: Navigator(
              key: nav,
              initialRoute: PageType.home.name,
              observers: [_observer],
              onGenerateRoute: (RouteSettings settings) {
                var type =
                    NavigatorRep().routeBloc.routeNameToType(settings.name);
                switch (type) {
                  //
                  // (default)
                  case PageType.home:
                    return PageRouteBuilder(
                        transitionDuration: Duration.zero,
                        reverseTransitionDuration: Duration.zero,
                        settings: RouteSettings(name: type.name),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return child;
                        },
                        pageBuilder: (_, __, ___) => PageHome(onReview: () {
                              // review
                              NavigatorRep()
                                  .routeBloc
                                  .goto(Panel(type: PageType.reviewCard));
                            }, onSearch: () {
                              // search
                              NavigatorRep()
                                  .routeBloc
                                  .goto(Panel(type: PageType.searchWord));
                            }, onManageWords: () {
                              // manage
                              NavigatorRep()
                                  .routeBloc
                                  .goto(Panel(type: PageType.manageWords));
                            }, onNumerals: () {
                              // numerals
                              nav.currentState?.push(CupertinoPageRoute(
                                  settings:
                                      const RouteSettings(name: 'numerals'),
                                  builder: (context) {
                                    return const NumeralsNav();
                                  }));
                            }));
                  default:
                    throw Exception('Invalid route: ${settings.name}');
                }
              }));
    });
  }
}


//
                        // search word
                        // case PageType.searchWord:
                        //   return PageRouteBuilder(
                        //       transitionDuration: Duration.zero,
                        //       reverseTransitionDuration: Duration.zero,
                        //       settings: RouteSettings(name: type.name),
                        //       transitionsBuilder: (context, animation,
                        //           secondaryAnimation, child) {
                        //         return child;
                        //       },
                        //       pageBuilder: (_, __, ___) =>
                        //           PageSearchWord(onShowWord: (data) async {
                        //             // context.read<AppModel>().goToPage(
                        //             //     page: PageType.wordDetails,
                        //             //     replace: false);
                        //             // await ServiceApi()
                        //             //     .putRecentWord(data.word);
                        //             // AppRep().updateRecent();
                        //           }));
                        // //
                        // // card review
                        // case PageType.reviewCard:
                        //   return PageRouteBuilder(
                        //       transitionDuration: Duration.zero,
                        //       reverseTransitionDuration: Duration.zero,
                        //       settings: RouteSettings(name: type.name),
                        //       transitionsBuilder: (context, animation,
                        //           secondaryAnimation, child) {
                        //         return child;
                        //       },
                        //       pageBuilder: (_, __, ___) =>
                        //           CardReviewNav(onBack: () {
                        //             // context.read<AppModel>().pageBack();
                        //           }));
                        // //
                        // // manage
                        // case PageType.manageWords:
                        //   return PageRouteBuilder(
                        //       transitionDuration: Duration.zero,
                        //       reverseTransitionDuration: Duration.zero,
                        //       settings: RouteSettings(name: type.name),
                        //       transitionsBuilder: (context, animation,
                        //           secondaryAnimation, child) {
                        //         return child;
                        //       },
                        //       pageBuilder: (_, __, ___) =>
                        //           ManageWordPage(onShowWord: (data) {
                        //             // context.read<AppModel>().goToPage(
                        //             //     page: PageType.wordDetails,
                        //             //     replace: false);
                        //           }));
                        // //
                        // // settings
                        // case PageType.settings:
                        //   return PageRouteBuilder(
                        //       transitionDuration: Duration.zero,
                        //       reverseTransitionDuration: Duration.zero,
                        //       settings: RouteSettings(name: type.name),
                        //       transitionsBuilder: (context, animation,
                        //           secondaryAnimation, child) {
                        //         return child;
                        //       },
                        //       pageBuilder: (_, __, ___) =>
                        //           SettingsPage(onChangeGoal: () {
                        //             // context.read<AppModel>().goToPage(
                        //             //     page: PageType.changeDailyGoal,
                        //             //     replace: false);
                        //           }));
                        //                                       //
                        // // word details
                        // case PageType.wordDetails:
                        //   return PageRouteBuilder(
                        //       transitionDuration: Duration.zero,
                        //       reverseTransitionDuration: Duration.zero,
                        //       settings: RouteSettings(name: type.name),
                        //       transitionsBuilder: (context, animation,
                        //           secondaryAnimation, child) {
                        //         return child;
                        //       },
                        //       pageBuilder: (_, __, ___) => PageWordDetails(
                        //           playWordAtStart: false,
                        //           onBack: () {
                        //             context.read<AppModel>().pageBack();
                        //           }));
                        //           //
                        // // account
                        // case PageType.account:
                        //   return PageRouteBuilder(
                        //       transitionDuration: Duration.zero,
                        //       reverseTransitionDuration: Duration.zero,
                        //       settings: RouteSettings(name: type.name),
                        //       transitionsBuilder: (context, animation,
                        //           secondaryAnimation, child) {
                        //         return child;
                        //       },
                        //       pageBuilder: (_, __, ___) => Container(
                        //             color: Colors.blue,
                        //           ));
                        // //
                        // // about
                        // case PageType.about:
                        //   return PageRouteBuilder(
                        //       transitionDuration: Duration.zero,
                        //       reverseTransitionDuration: Duration.zero,
                        //       settings: RouteSettings(name: type.name),
                        //       transitionsBuilder: (context, animation,
                        //           secondaryAnimation, child) {
                        //         return child;
                        //       },
                        //       pageBuilder: (_, __, ___) =>
                        //           const PageAbout());

                        // //
                        // // word details
                        // case PageType.numerals:
                        //   return PageRouteBuilder(
                        //       transitionDuration: Duration.zero,
                        //       reverseTransitionDuration: Duration.zero,
                        //       settings: RouteSettings(name: type.name),
                        //       transitionsBuilder: (context, animation,
                        //           secondaryAnimation, child) {
                        //         return child;
                        //       },
                        //       pageBuilder: (_, __, ___) =>
                        //           NumeralsNav(onBack: () {
                        //             context.read<AppModel>().pageBack();
                        //           }));
                        // //
                        // // manage
                        // case PageType.changeDailyGoal:
                        //   return PageRouteBuilder(
                        //       transitionDuration: Duration.zero,
                        //       reverseTransitionDuration: Duration.zero,
                        //       settings: RouteSettings(name: type.name),
                        //       transitionsBuilder: (context, animation,
                        //           secondaryAnimation, child) {
                        //         return child;
                        //       },
                        //       pageBuilder: (_, __, ___) =>
                        //           SettingsDailiyGoal(onBack: () {
                        //             context.read<AppModel>().pageBack();
                        //           }, onChanged: () {
                        //             SettingsRep().onChanged.add(null);
                        //             context.read<AppModel>().pageBack();
                        //           }));
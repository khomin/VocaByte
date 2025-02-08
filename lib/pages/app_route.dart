import 'dart:io';
import 'package:vocabyte/components/circle_button.dart';
import 'package:vocabyte/components/dev_panel.dart';
import 'package:vocabyte/pages/card_review/card_review_nav.dart';
import 'package:vocabyte/pages/manage_word/manage_word_page.dart';
import 'package:vocabyte/pages/page_home/page_home.dart';
import 'package:vocabyte/pages/page_search_word/page_search.dart';
import 'package:flutter/material.dart';
import 'package:vocabyte/pages/settings/settings_page.dart';
import 'package:vocabyte/repository/nav_rep.dart';
import 'package:vocabyte/app/app_theme.dart';
import 'package:vocabyte/app/constants.dart';

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
    return Builder(builder: (context) {
      // var page = context.watch<AppModel>().page;
      return Scaffold(
          appBar: AppBar(
              surfaceTintColor: Theme.of(context).colorScheme.baseColor1,
              backgroundColor: Theme.of(context).colorScheme.baseColor1,
              centerTitle: true,
              shadowColor: Theme.of(context).colorScheme.titel3,
              foregroundColor: Theme.of(context).colorScheme.iconColor,
              // automaticallyImplyLeading: context.watch<AppModel>().drawerOn,
              titleSpacing: (Platform.isIOS || Platform.isAndroid) ? 0 : null,
              title: Stack(alignment: Alignment.center, children: [
                // if (!context.watch<AppModel>().drawerOn)
                Row(children: [
                  CircleButton(
                      iconData: Icons.arrow_back,
                      color: Colors.transparent,
                      onPressed: (_) {
                        // var nav = context.read<AppModel>().appNavKey;
                        // if (nav.currentState?.canPop() == true) {
                        //   nav.currentState?.pop();
                        // }
                      })
                ]),
                Text(
                    'TODO ROUTE NAME', //NavigatorRep().routeBloc.routeName(page),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.titel1)),
                //
                // TODO: move progress
                // if (page == PageType.reviewCard ||
                //     page == PageType.numerals)
                //   StreamBuilder(
                //       stream: AppRep().onProgressChanged,
                //       builder: (context, snapshot) {
                //         var v = snapshot.data ?? 0.0;
                //         return Align(
                //             alignment: Alignment.centerRight,
                //             child: Padding(
                //                 padding: const EdgeInsets.all(10),
                //                 child: SizedBox(
                //                     child: CircularProgressIndicator(
                //                         value: v,
                //                         backgroundColor: Theme.of(context)
                //                             .colorScheme
                //                             .page,
                //                         color: Theme.of(context)
                //                             .colorScheme
                //                             .titel1))));
                // })
              ])),
          body: Column(children: [
            Expanded(
                child: Navigator(
                    key: NavigatorRep().routeBloc.navKey,
                    initialRoute: PageType.home.name,
                    // observers: [NavigatorRep().routeBloc.observer],
                    onGenerateRoute: (RouteSettings settings) {
                      var type = NavigatorRep()
                          .routeBloc
                          .routeNameToType(settings.name);
                      switch (type) {
                        //
                        // (default)
                        case PageType.home:
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
                                    // context.read<AppModel>().goToPage(
                                    //     page: PageType.reviewCard,
                                    //     replace: true);
                                  }, onGoToSearch: () {
                                    // context.read<AppModel>().goToPage(
                                    //     page: PageType.searchWord,
                                    //     replace: true);
                                  }, onGoToManageWords: () {
                                    // context.read<AppModel>().goToPage(
                                    //     page: PageType.manageWords,
                                    //     replace: true);
                                  }, onGoToNumerals: () {
                                    // context.read<AppModel>().goToPage(
                                    //     page: PageType.numerals,
                                    //     replace: true);
                                  }));

                        //
                        // search word
                        case PageType.searchWord:
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
                                    // context.read<AppModel>().goToPage(
                                    //     page: PageType.wordDetails,
                                    //     replace: false);
                                    // await ServiceApi()
                                    //     .putRecentWord(data.word);
                                    // AppRep().updateRecent();
                                  }));
                        //
                        // card review
                        case PageType.reviewCard:
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
                                    // context.read<AppModel>().pageBack();
                                  }));
                        //
                        // manage
                        case PageType.manageWords:
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
                                    // context.read<AppModel>().goToPage(
                                    //     page: PageType.wordDetails,
                                    //     replace: false);
                                  }));
                        //
                        // settings
                        case PageType.settings:
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
                                    // context.read<AppModel>().goToPage(
                                    //     page: PageType.changeDailyGoal,
                                    //     replace: false);
                                  }));
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
                        default:
                          throw Exception('Invalid route: ${settings.name}');
                      }
                    })),
            //
            // dev panel
            if (Constants.isDev)
              DevPanel(onGoTo: (page) {
                // context
                //     .read<AppModel>()
                //     .goToPage(page: page, replace: true);
              })
          ]));
    });
  }
}

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vocabyte/app/constants.dart';
import 'package:vocabyte/pages/app_route.dart';
import 'package:vocabyte/pages/card_review/card_review_nav.dart';
import 'package:vocabyte/pages/manage_word/manage_word_page.dart';
import 'package:vocabyte/pages/page_home/page_home.dart';
import 'package:vocabyte/pages/page_search_word/page_search.dart';
import 'package:vocabyte/pages/settings/settings_page.dart';
import 'package:vocabyte/pages/settings/theme/theme_config.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:loggy/loggy.dart';
import 'package:provider/provider.dart';
import 'package:vocabyte/components/disposable_stream.dart';
import 'package:vocabyte/pages/entry/page_entry.dart';
import 'package:vocabyte/pages/models/app_model.dart';
import 'package:vocabyte/pages/splash/splash.dart';
import 'package:vocabyte/pages/splash/splash_install.dart';
import 'package:vocabyte/repository/app_rep.dart';
import 'package:vocabyte/repository/nav_rep.dart';
import 'package:vocabyte/repository/settings_rep.dart';
import 'package:vocabyte/app/file_utils.dart';
import 'package:vocabyte/app/log_printer.dart';
import 'package:vocabyte/services/service_api.dart';
import 'package:vocabyte/services/tts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black,
      // Colors.white, // Set navigation bar color to white
      systemNavigationBarIconBrightness:
          Brightness.dark, // Set icons to dark for contrast
      statusBarColor: Colors
          .transparent, //Constants.colorPrimary, // Optional: Change the status bar color
      statusBarIconBrightness:
          Brightness.dark // Optional: Dark icons on status bar));
      ));

  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late AppModel _appModel;
  late AppRep _appRep;
  final _dispStream = DisposableStream();
  final tag = 'app';

  @override
  void initState() {
    super.initState();

    _appModel = AppModel();
    // onUpdateTasks: () {
    // AppRep().reviewTask.refresh();
    // });
    _appRep = AppRep();

    Future.microtask(() async {
      //
      // local app dir
      await FileUtils.init();
      //
      var initial = await SettingsRep().init();
      //
      _appModel.appVersion = initial.version;
      _appModel.onboarding = initial.onboarding;
      // _appModel.theme = initial.theme;
      // if (mounted) Utils.setTheme(context, initial.theme);
      // ThemeSwitcher.of(context).changeTheme(theme: theme)
      // ThemeSwitcher.of(context).changeTheme(
      //   theme: ThemeModelInheritedNotifier.of(context).theme.brightness ==
      //           Brightness.light
      //       ? darkTheme
      //       : lightTheme,
      //   offset: details.localPosition,
      // );
      //
      // if should copy resources
      if (!await FileUtils.isResourcesReady()) {
        _appModel.waitCopyResource = true;
        await FileUtils.copyResourcesToDir();
        _appModel.waitCopyResource = false;
      }
      //
      // ffi-cpp
      Loggy.initLoggy(logPrinter: LogPrinter());
      await ServiceApi().initLib(libraryPath: LibPath.path);
      _appModel.serviceInited = true;
      //
      // how many words to lern
      _appRep.updateWordToLearn();
      //
      // init delayed
      Future.delayed(const Duration(milliseconds: 500), () async {
        await _appRep.updateRecent();
        await TextToSpeach().initTts();
      });
    });

    // _dispStream.add(NavigatorRep().routeBloc.onGoto.listen((value) {
    //   switch (value?.type) {
    //     case null:
    //     case PageType.home:
    //     case PageType.settings:
    //     case PageType.searchWord:
    //     case PageType.manageWords:
    //       // Timer(const Duration(milliseconds: 200), () {
    //       setState(() {
    //         _bottomHide = false;
    //       });
    //     // });
    //     case PageType.reviewCard:
    //     default:
    //       setState(() {
    //         _bottomHide = true;
    //       });
    //       break;
    //   }
    // }));
  }

  @override
  void dispose() {
    super.dispose();
    _appModel.dispose();
    _dispStream.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<AppModel>.value(value: _appModel),
          Provider<AppRep>.value(value: _appRep)
        ],
        child: Builder(builder: (context) {
          late ThemeData initTheme;
          var theme = context.select<AppModel, Brightness?>((m) => m.theme);
          if (theme != null) {
            initTheme = theme == Brightness.dark ? darkTheme : lightTheme;
          } else {
            var br = View.of(context).platformDispatcher.platformBrightness;
            initTheme = br == Brightness.dark ? darkTheme : lightTheme;
          }
          return ThemeProvider(
              initTheme: initTheme,
              builder: (_, myTheme) {
                return MaterialApp(
                    title: Constants.appName, theme: myTheme, home: _app());
              });
        }));
  }

  PageType? _curPage;

  Widget _app() {
    // return PopScope(
    //     canPop: false,
    //     onPopInvokedWithResult: (didPop, result) async {
    //       if (didPop) return;
    //       // TODO: back
    //       // var page = NavigatorRep().routeBloc.onCurrent.valueOrNull;
    //       if (_curPage == PageType.reviewCard) {
    //         NavigatorRep().routeBloc.fullPop();
    //       } else {
    //         var nav = NavigatorRep().routeBloc.navKey;
    //         // var nav = context.read<AppModel>().appNavKey;
    //         if (nav.currentState?.canPop() == true) {
    //           nav.currentState?.pop();
    //           return;
    //         }
    //         // SystemNavigator.pop();
    //       }
    //     },
    //     child:
    return Scaffold(
        // backgroundColor: Colors.amber,
        body: Builder(builder: (context) {
          var model = context.watch<AppModel>();
          //
          // initial copy of assets
          if (model.waitCopyResource) {
            return const SplashInstall();
          }
          // first time show onboarding
          if (model.onboarding) {
            return PageOnboard(onStart: () {
              context.read<AppModel>().onboarding = false;
            });
          }
          // cpp not ready
          if (!model.serviceInited) {
            return const Splash();
          }
          return const AppRoute();
          return StreamBuilder(
              stream: NavigatorRep().routeBloc.onGoto,
              builder: (context, snapshot) {
                var page = snapshot.data?.type;
                _curPage = page;
                switch (page) {
                  case null:
                  case PageType.home:
                    return PageHome(onGoToReview: () {
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
                    });
                  case PageType.searchWord:
                    return PageSearchWord(onShowWord: (data) async {
                      // context.read<AppModel>().goToPage(
                      //     page: PageType.wordDetails,
                      //     replace: false);
                      // await ServiceApi()
                      //     .putRecentWord(data.word);
                      // AppRep().updateRecent();
                    });
                  case PageType.reviewCard:
                    return CardReviewNav(onBack: () {
                      // context.read<AppModel>().pageBack();
                    });
                  case PageType.manageWords:
                    return ManageWordPage(onShowWord: (data) {
                      // context.read<AppModel>().goToPage(
                      //     page: PageType.wordDetails,
                      //     replace: false);
                    });
                  case PageType.settings:
                    return SettingsPage(onChangeGoal: () {
                      // context.read<AppModel>().goToPage(
                      //     page: PageType.changeDailyGoal,
                      //     replace: false);
                    });
                }
              });
        }),
        bottomNavigationBar: StreamBuilder(
            // stream: NavigatorRep().routeBloc.onGoto,
            stream: NavigatorRep().routeBloc.onHideBottom,
            initialData: NavigatorRep().routeBloc.onHideBottom.valueOrNull,
            builder: (context, snapshot) {
              // var page = snapshot.data?.type;
              // switch (page) {
              //   case null:
              //   case PageType.home:
              var hide = snapshot.data ?? false;
              return AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  height: hide ? 0 : 75,
                  // height: page == PageType.reviewCard ? 0 : 75,
                  // curve: Curves.fastOutSlowIn,
                  // curve: Curves.linear,
                  // height: 35,
                  decoration: const BoxDecoration(
                      // color: Colors.black
                      ),
                  child: StreamBuilder(
                      stream: NavigatorRep().routeBloc.onGoto,
                      builder: (context, snapshot) {
                        var page = snapshot.data?.type;
                        return Stack(alignment: Alignment.center, children: [
                          _bottomHightlightActive(page),
                          Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              bottom: page == PageType.reviewCard ? null : null,
                              child: SizedBox(
                                  // color: Colors.teal,
                                  height: 75,
                                  child: BottomNavigationBar(
                                      // elevation: 2,
                                      // elevation: 0,
                                      // selectedFontSize: 12,
                                      // unselectedFontSize: 12,

                                      // type: BottomNavigationBarType.fixed,
                                      backgroundColor: Colors.transparent,
                                      // backgroundColor: Colors.amber,
                                      // fixedColor: Colors.transparent,
                                      // selectedItemColor: Colors.transparent,
                                      // backgroundColor: Theme.of(context).colorScheme.primary,
                                      // TODO: color
                                      // unselectedItemColor:
                                      //     Theme.of(context).colorScheme.cardSuccess,
                                      items: const [
                                        BottomNavigationBarItem(
                                            backgroundColor: Colors.white10,
                                            icon: Icon(Icons.home),
                                            label: 'Home'),
                                        BottomNavigationBarItem(
                                            icon: Icon(Icons.text_fields),
                                            label: 'Search'),
                                        BottomNavigationBarItem(
                                            icon: Icon(Icons.view_agenda),
                                            label: 'Review'),
                                        BottomNavigationBarItem(
                                            icon: Icon(Icons.edit_document),
                                            label: 'Manage'),
                                        BottomNavigationBarItem(
                                            icon: Icon(Icons.settings),
                                            label: 'Settings'),
                                      ],
                                      currentIndex: page?.index ?? 0,
                                      // iconSize: 1,
                                      // iconSize: 30,
                                      // TODO: color
                                      // selectedItemColor:
                                      //     Theme.of(context).colorScheme.iconColor,
                                      onTap: (value) async {
                                        // if (collapse) {
                                        //   context.read<AppModel>().setCollapse(false);
                                        // }
                                        // NavigatorRep().routeBloc.goto(Panel(
                                        //     type: PageType.values[value]));
                                        // NavigatorRep().routeBloc.navKey.currentState?.push(route)
                                        // Navigator.push(
                                        //     context,
                                        NavigatorRep()
                                            .routeBloc
                                            .navKey
                                            .currentState
                                            ?.push(CupertinoPageRoute(
                                                settings: const RouteSettings(),
                                                builder: (context) {
                                                  return CardReviewNav(
                                                      onBack: () {
                                                    // context.read<AppModel>().pageBack();
                                                  });
                                                }));
                                        NavigatorRep()
                                            .routeBloc
                                            .onHideBottom
                                            .add(true);
                                      })))
                        ]);
                      }));
            }));
  }

  Widget _bottomHightlightActive(PageType? page) {
    var decoration = const BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.all(Radius.circular(12)));
    return Padding(
        padding: const EdgeInsets.only(top: 4, bottom: 4),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Container(
            width: 70,
            height: 55,
            decoration:
                page == null || page == PageType.home ? decoration : null,
          ),
          Container(
              width: 70,
              height: 55,
              decoration: page == PageType.searchWord ? decoration : null),
          Container(
              width: 70,
              height: 55,
              decoration: page == PageType.reviewCard ? decoration : null),
          Container(
              width: 70,
              height: 55,
              decoration: page == PageType.manageWords ? decoration : null),
          Container(
              width: 70,
              height: 55,
              decoration: page == PageType.settings ? decoration : null)
        ]));
  }
}

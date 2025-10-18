import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:vocabyte/pages/settings/theme/app_theme.dart';
import 'package:vocabyte/resource/constants.dart';
import 'package:vocabyte/pages/app_route.dart';
import 'package:vocabyte/pages/settings/theme/theme_config.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:loggy/loggy.dart';
import 'package:provider/provider.dart';
import 'package:vocabyte/components/disposable_stream.dart';
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
  final _bottomNavHeight = kBottomNavigationBarHeight + 10;
  final _dispStream = DisposableStream();
  final tag = 'app';

  @override
  void initState() {
    super.initState();

    // AppLifecycleListener(onStateChange: (value) {
    //   switch (value) {
    //     case AppLifecycleState.resumed:
    //       var br = View.of(context).platformDispatcher.platformBrightness;
    //       var initTheme = br == Brightness.dark ? darkTheme : lightTheme;
    //       print('BTEST_THEME-SYSTEM: ${initTheme.brightness}, br=$br');
    //       break;
    //     case AppLifecycleState.detached:
    //     case AppLifecycleState.inactive:
    //     case AppLifecycleState.hidden:
    //     case AppLifecycleState.paused:
    //       break;
    //   }
    // });

    _appModel = AppModel();
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
      _appModel.theme = initial.theme;
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

      //
      // check if migrate database
      if (await ServiceApi().migrateDatabase()) {
        // (1) show status "migrating, please don't close the app"
        _appModel.waitMigratingDb = true;
        // (2) export all -> profile.json
        var temp = '${FileUtils.homeDir}/backup.json';
        await ServiceApi().exportProfile(explicitDir: temp);
        // (3) replace database.db
        await FileUtils.copyResourcesToDir();
        // (4) import profile.json
        await ServiceApi().importProfile(explicitDir: temp);
        // (6) remove temp profile
        FileUtils.deleteFile(temp);
        // (7) close status
        _appModel.waitMigratingDb = false;
      }

      _appModel.serviceInited = true;
      //
      // how many words to lern
      _appRep.refreshWordToLearn();
      //
      // init delayed
      Future.delayed(const Duration(milliseconds: 100), () async {
        TextToSpeach().initTts();
        // recent
        await _appRep.updateRecent();
        // manage list
        await _appRep.refreshManageList();
      });
    });
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
        builder: (context, child) {
          late ThemeData initTheme;
          var theme = context.select<AppModel, ThemeType?>((m) => m.theme);
          switch (theme) {
            case ThemeType.light:
              initTheme = lightTheme;
              // print('BTEST_THEME-LIGHT: ${initTheme.brightness}');
              break;
            case ThemeType.dark:
              initTheme = darkTheme;
              // print('BTEST_THEME-DARK: ${initTheme.brightness}');
              break;
            case ThemeType.system:
              // var br = View.of(context).platformDispatcher.platformBrightness;
              var br = MediaQuery.of(context).platformBrightness;
              initTheme = br == Brightness.dark ? darkTheme : lightTheme;
              // print('BTEST_THEME-SYSTEM: ${initTheme.brightness}, br=$br');
              break;
            default:
              // print('BTEST_THEME-BOX');
              return const SizedBox();
          }
          return ThemeProvider(
              initTheme: initTheme,
              key: ValueKey(initTheme),
              builder: (_, myTheme) {
                return MaterialApp(
                    title: Constants.appName, theme: myTheme, home: _app());
              });
        });
  }

  Widget _app() {
    return SafeArea(
        child: ThemeSwitchingArea(
            child: Scaffold(
                body: Builder(builder: (context) {
                  var model = context.watch<AppModel>();
                  //
                  // initial copy of assets
                  if (model.waitCopyResource) {
                    return const SplashWithText(text: 'Copying database...');
                  }
                  if (model.waitMigratingDb) {
                    return const SplashWithText(
                        text: "Installing update\nPlease don't close the app");
                  }
                  // cpp not ready
                  if (!model.serviceInited) {
                    return const Splash();
                  }
                  return const AppRoute();
                }),
                bottomNavigationBar: StreamBuilder(
                    stream: NavigatorRep().routeBloc.onHideBottom,
                    initialData:
                        NavigatorRep().routeBloc.onHideBottom.valueOrNull,
                    builder: (context, snapshot) {
                      var hide = snapshot.data ?? false;
                      var model = context.watch<AppModel>();
                      if (model.waitCopyResource || model.waitMigratingDb) {
                        hide = true;
                      }
                      return AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          height: hide ? 0 : _bottomNavHeight,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.bottomNavBg,
                              boxShadow: [
                                BoxShadow(
                                    color:
                                        Theme.of(context).colorScheme.shadowBox,
                                    blurRadius: 10,
                                    offset: const Offset(0, 0))
                              ]),
                          child: StreamBuilder(
                              stream: NavigatorRep().routeBloc.onCurrent,
                              initialData: NavigatorRep()
                                  .routeBloc
                                  .onCurrent
                                  .valueOrNull,
                              builder: (context, snapshot) {
                                var page = snapshot.data?.type;
                                return Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Positioned(
                                        // top: _bottomNavHeight,
                                        top: 0,
                                        left: 0,
                                        right: 0,
                                        bottom: 0,
                                        child:
                                            //Column(children: [
                                            _bottomHightlightActive(page),
                                      ),
                                      Positioned(
                                          top: 0,
                                          left: 0,
                                          right: 0,
                                          bottom: page == PageType.reviewCard
                                              ? null
                                              : null,
                                          child: SizedBox(
                                              height: _bottomNavHeight,
                                              child: BottomNavigationBar(
                                                  elevation: 0,
                                                  selectedFontSize: 12,
                                                  unselectedFontSize: 12,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  selectedItemColor: Theme.of(
                                                          context)
                                                      .colorScheme
                                                      .bottomNavIconSelected,
                                                  unselectedItemColor: Theme.of(
                                                          context)
                                                      .colorScheme
                                                      .bottomNavBgIconUnselected,
                                                  items: const [
                                                    BottomNavigationBarItem(
                                                        icon: Icon(Icons.home),
                                                        label: 'Home'),
                                                    BottomNavigationBarItem(
                                                        icon: Icon(
                                                            Icons.text_fields),
                                                        label: 'Search'),
                                                    BottomNavigationBarItem(
                                                        icon: Icon(
                                                            Icons.view_agenda),
                                                        label: 'Review'),
                                                    BottomNavigationBarItem(
                                                        icon: Icon(Icons
                                                            .edit_document),
                                                        label: 'Manage'),
                                                    BottomNavigationBarItem(
                                                        icon: Icon(
                                                            Icons.settings),
                                                        label: 'Settings'),
                                                  ],
                                                  currentIndex:
                                                      page?.index ?? 0,
                                                  onTap: (value) async {
                                                    var cur = NavigatorRep()
                                                        .routeBloc
                                                        .onCurrent
                                                        .valueOrNull;
                                                    var type =
                                                        PageType.values[value];
                                                    if (cur?.type == type) {
                                                      return;
                                                    }
                                                    NavigatorRep()
                                                        .routeBloc
                                                        .goto(
                                                            Panel(type: type));
                                                  })))
                                    ]);
                              }));
                    }))));
  }

  Widget _bottomHightlightActive(PageType? page) {
    var size = MediaQuery.sizeOf(context);
    return Builder(builder: (context) {
      var decoration = BoxDecoration(
          color: Theme.of(context).colorScheme.bottomNavSelectedBg,
          borderRadius: const BorderRadius.all(Radius.circular(12)));
      var width = size.width / 5;
      // var insets = View.of(context).viewInsets;
      // logDebug('INSETS = $insets');
      return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: width,
              height: double.infinity,
              decoration:
                  page == null || page == PageType.home ? decoration : null,
            ),
            Container(
                width: width,
                height: double.infinity,
                decoration: page == PageType.searchWord ? decoration : null),
            Container(
                width: width,
                height: double.infinity,
                decoration: page == PageType.reviewCard ? decoration : null),
            Container(
                width: width,
                height: double.infinity,
                decoration: page == PageType.manageWords ? decoration : null),
            Container(
                width: width,
                height: double.infinity,
                decoration: page == PageType.settings ? decoration : null)
          ]);
    });
  }
}

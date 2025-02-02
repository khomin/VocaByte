import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loggy/loggy.dart';
import 'package:provider/provider.dart';
import 'package:vocabyte/app/utils.dart';
import 'package:vocabyte/components/disposable_stream.dart';
import 'package:vocabyte/pages/drawer/drawer_menu.dart';
import 'package:vocabyte/pages/entry/page_entry.dart';
import 'package:vocabyte/pages/app_route.dart';
import 'package:vocabyte/pages/models/app_model.dart';
import 'package:vocabyte/repository/app_rep.dart';
import 'package:vocabyte/repository/nav_rep.dart';
import 'package:vocabyte/repository/settings_rep.dart';
import 'package:vocabyte/app/app_theme.dart';
import 'package:vocabyte/app/file_utils.dart';
import 'package:vocabyte/app/log_printer.dart';
import 'package:vocabyte/services/service_api.dart';
import 'package:vocabyte/services/tts.dart';
import 'package:window_manager/window_manager.dart';

class App extends StatefulWidget {
  const App({super.key});
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WindowListener, WidgetsBindingObserver {
  late AppModel _appModel;
  late AppRep _appRep;
  final _dispStream = DisposableStream();
  final tag = 'app';

  @override
  void initState() {
    super.initState();

    _appModel = AppModel(
        appNavKey: GlobalKey<NavigatorState>(),
        onUpdateTasks: () {
          AppRep().reviewTask.refresh();
        },
        onThemeChanged: (theme) {
          Utils.setTheme(context, theme);
        });
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
      if (mounted) Utils.setTheme(context, initial.theme);
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
        if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
          windowManager.addListener(this);
        } else {
          WidgetsBinding.instance.addObserver(this);
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _appModel.dispose();
    _dispStream.dispose();
    if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
      windowManager.removeListener(this);
    } else {
      WidgetsBinding.instance.removeObserver(this);
    }
  }

  @override
  void onWindowClose() async {
    if (Platform.isMacOS) {
      windowManager.hide();
    } else {
      if (Platform.isWindows || Platform.isLinux) {
        await windowManager.close();
      }
      if (Platform.isLinux) {
        SystemNavigator.pop();
      } else {
        exit(0);
      }
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // check theme when window change state (mobile)
  }

  @override
  void onWindowFocus() {
    // check theme when window change state (desktop)
  }

  @override
  void onWindowBlur() {}

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<AppModel>.value(value: _appModel),
          Provider<AppRep>.value(value: _appRep)
        ],
        child: Scaffold(
            body: Builder(builder: (context) {
              var model = context.watch<AppModel>();
              if (model.waitCopyResource) {
                return Container(
                    color: Theme.of(context).colorScheme.baseColor1,
                    child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                          Text('Copying database...\nIt may take 3-5 seconds',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Theme.of(context).colorScheme.titel4)),
                          Container(
                              width: 100,
                              height: 100,
                              margin: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(12)),
                                  color: Theme.of(context)
                                      .colorScheme
                                      .button2Hover),
                              child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: CircularProgressIndicator(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .titel4)))
                        ])));
              }
              if (!model.serviceInited) {
                return Container(
                    color: Theme.of(context).colorScheme.baseColor1);
              }
              if (model.onboarding) {
                return PageOnboard(onStart: () {
                  context.read<AppModel>().onboarding = false;
                });
              }
              return Row(children: [
                //
                // left menu for desktop
                if (!Platform.isIOS && !Platform.isAndroid) const DrawerMenu(),
                //
                // main
                const Expanded(child: AppRoute())
              ]);
            }),
            bottomNavigationBar: Container(
                height: 70,
                decoration: BoxDecoration(
                    // color: Constants.colorCard,
                    // color: Colors.amber,
                    // borderRadius: BorderRadius.only(
                    //     topLeft: Radius.circular(20),
                    //     topRight: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 0),
                      )
                    ]),
                child: StreamBuilder(
                    stream: NavigatorRep().routeBloc.onGoto,
                    builder: (context, snapshot) {
                      var page = snapshot.data?.type;
                      return BottomNavigationBar(
                          elevation: 0,
                          selectedFontSize: 12,
                          unselectedFontSize: 12,
                          type: BottomNavigationBarType.fixed,
                          backgroundColor: Colors.transparent,
                          // backgroundColor: Constants.colorCard,
                          // TODO: color
                          unselectedItemColor:
                              Theme.of(context).colorScheme.cardSuccess,
                          items: const <BottomNavigationBarItem>[
                            BottomNavigationBarItem(
                                icon: Icon(Icons.home), label: 'Home'),
                            BottomNavigationBarItem(
                                icon: Icon(Icons.create_new_folder_rounded),
                                label: 'Capture'),
                            BottomNavigationBarItem(
                                icon: Icon(Icons.notifications),
                                label: 'Alert'),
                            BottomNavigationBarItem(
                                icon: Icon(Icons.settings), label: 'Settings'),
                          ],
                          currentIndex: page?.index ?? 0,
                          // TODO: color
                          selectedItemColor:
                              Theme.of(context).colorScheme.iconColor,
                          onTap: (value) async {
                            // if (collapse) {
                            //   context.read<AppModel>().setCollapse(false);
                            // }
                            // NavigatorRep()
                            //     .routeBloc
                            //     .goto(Panel(type: PageType.values[value]));
                          });
                    }))));
  }
}

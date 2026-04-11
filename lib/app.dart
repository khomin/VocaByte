import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loggy/loggy.dart';
import 'package:provider/provider.dart';
import 'package:vocabyte/app/file_utils.dart';
import 'package:vocabyte/app/log_printer.dart';
import 'package:vocabyte/components/disposable_stream.dart';
import 'package:vocabyte/components/page_transition2.dart';
import 'package:vocabyte/main.dart';
import 'package:vocabyte/pages/card_review/card_review_main.dart';
import 'package:vocabyte/models/app_model.dart';
import 'package:vocabyte/pages/numerals/numerals_main.dart';
import 'package:vocabyte/pages/home/page_home.dart';
import 'package:vocabyte/pages/search_word/page_search.dart';
import 'package:vocabyte/pages/settings/settings_page.dart';
import 'package:vocabyte/pages/wizard/wizard.dart';
import 'package:vocabyte/pages/word_details/page_word_details.dart';
import 'package:vocabyte/repository/app_theme.dart';
import 'package:vocabyte/pages/splash/splash.dart';
import 'package:vocabyte/pages/splash/splash_install.dart';
import 'package:vocabyte/repository/app_rep.dart';
import 'package:vocabyte/resource/constants.dart';
import 'package:vocabyte/services/service_api.dart';
import 'package:vocabyte/services/tts.dart';

class App extends StatefulWidget {
  const App({super.key});
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late AppModel _appModel;
  // late NavigatorObserverCustom _observer;
  final _dispStream = DisposableStream();
  final tag = 'app';

  @override
  void initState() {
    super.initState();

    Future.microtask(() async {
      await FileUtils.init();

      // if should copy resources
      if (!await FileUtils.isResourcesReady()) {
        _appModel.waitCopyResource = true;
        await FileUtils.copyResourcesToDir();
        _appModel.waitCopyResource = false;
      }

      Loggy.initLoggy(logPrinter: LogPrinter());

      await ServiceApi().initLib(libraryPath: LibPath.path);

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
      _appModel.notify();

      getIt<AppRep>().refreshWordToLearn();

      Future.delayed(const Duration(milliseconds: 500), () async {
        TextToSpeach().initTts();
        await getIt<AppRep>().updateRecent();
        await getIt<AppRep>().refreshManageList();
      });
    });
  }

  @override
  void dispose() {
    _dispStream.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    _appModel = context.read<AppModel>();
    super.didChangeDependencies();
  }

  // TODO: flavor build - google/rustore sdk
  // TODO: feature scan text

  @override
  Widget build(BuildContext context) {
    var model = context.watch<AppModel>();

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
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.baseColor1,
        extendBody: true,
        bottomNavigationBar: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: BottomAppBar(
                padding: const EdgeInsets.symmetric(vertical: 8),
                color: Theme.of(context).colorScheme.bottomNavBg,
                shape: null,
                height: Constants.bottomNavHeight,
                notchMargin: 10.0,
                elevation: 10,
                shadowColor: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        padding: const EdgeInsets.all(15),
                        icon: Icon(
                          Icons.home_filled,
                          color: model.currentPage == PageType.home
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                        onPressed: () {
                          _appModel.setCurrentPage(PageType.home);
                        }),
                    const SizedBox(width: 48),
                    IconButton(
                        padding: const EdgeInsets.all(15),
                        icon: Icon(
                          Icons.settings,
                          color: model.currentPage == PageType.settings
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                        onPressed: () {
                          _appModel.setCurrentPage(PageType.settings);
                        }),
                  ],
                ))),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.fabButton,
          elevation: 4,
          shape: const CircleBorder(),
          onPressed: () {
            _openSearch(SearchMode.search);
          },
          child: const Icon(
            Icons.search,
            color: Colors.white,
            size: 30,
          ),
        ),
        body: PopScope(
            canPop: _appModel.currentPage == PageType.home,
            onPopInvokedWithResult: (didPop, result) async {
              if (didPop) return;
              _appModel.setCurrentPage(PageType.home);
            },
            child: Builder(builder: (context) {
              var model = context.watch<AppModel>();
              return IndexedStack(index: model.currentPage.index, children: [
                PageHome(
                  onReview: () {
                    Navigator.push(
                        context,
                        PageTransition2.build(
                          settings: const RouteSettings(),
                          type: TransitionType.opacity,
                          child: const CardReviewMain(),
                        ));
                  },
                  onSearch: () {
                    _openSearch(SearchMode.search);
                  },
                  onManageWords: () {
                    _openSearch(SearchMode.manage);
                  },
                  onNumerals: () {
                    Navigator.push(
                        context,
                        PageTransition2.build(
                          settings: const RouteSettings(),
                          type: TransitionType.opacity,
                          child: const NumeralsMain(),
                        ));
                  },
                  onWizard: () {
                    getIt<AppRep>().requestWizardData();
                    Navigator.push(
                        context,
                        PageTransition2.build(
                          settings: const RouteSettings(),
                          type: TransitionType.opacity,
                          child: const WizardMain(),
                        ));
                  },
                ),
                const SettingsPage(),
              ]);
            })));
  }

  void _openSearch(SearchMode mode) {
    if (_appModel.currentPage != PageType.home) {
      Timer(Constants.animDurationLong, () {
        _appModel.setCurrentPage(PageType.home);
      });
    }
    Navigator.of(context).push(
      PageTransition2.build(
          settings: const RouteSettings(),
          type: TransitionType.animation1,
          child: SearchWordPage(
              mode: mode,
              onShow: (data) async {
                getIt<AppRep>().cachedWord = data;
                await ServiceApi().putRecent(data.word);
                await getIt<AppRep>().updateRecent();
                if (!mounted) return;
                Navigator.push(
                    context,
                    PageTransition2.build(
                        settings: const RouteSettings(),
                        type: TransitionType.slide,
                        child: PageWordDetails(
                            playWordAtStart: true,
                            primary: true,
                            onBack: () {
                              Navigator.of(context).pop();
                            })));
              })),
    );
  }
}

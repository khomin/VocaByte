import 'package:flutter/material.dart';
import 'package:loggy/loggy.dart';
import 'package:provider/provider.dart';
import 'package:vocabyte/app/file_utils.dart';
import 'package:vocabyte/app/log_printer.dart';
import 'package:vocabyte/components/disposable_stream.dart';
import 'package:vocabyte/main.dart';
import 'package:vocabyte/pages/app_route.dart';
import 'package:vocabyte/pages/models/app_model.dart';
import 'package:vocabyte/repository/app_theme.dart';
import 'package:vocabyte/pages/splash/splash.dart';
import 'package:vocabyte/pages/splash/splash_install.dart';
import 'package:vocabyte/repository/app_rep.dart';
import 'package:vocabyte/repository/nav_rep.dart';
import 'package:vocabyte/repository/settings_rep.dart';
import 'package:vocabyte/services/service_api.dart';
import 'package:vocabyte/services/tts.dart';

class App extends StatefulWidget {
  const App({super.key});
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late AppModel _appModel;
  final _dispStream = DisposableStream();
  final tag = 'app';

  @override
  void initState() {
    super.initState();

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

      getIt<AppRep>().refreshWordToLearn();

      Future.delayed(const Duration(milliseconds: 100), () async {
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

  @override
  Widget build(BuildContext context) {
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
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.baseColor1,
      // backgroundColor: Colors.transparent,
      body: const AppRoute(),
    );
    // return SafeArea(
    //     child: Scaffold(
    //         body: Builder(builder: (context) {
    //           var model = context.watch<AppModel>();
    //           //
    //           // initial copy of assets
    //           if (model.waitCopyResource) {
    //             return const SplashWithText(text: 'Copying database...');
    //           }
    //           if (model.waitMigratingDb) {
    //             return const SplashWithText(
    //                 text: "Installing update\nPlease don't close the app");
    //           }
    //           // cpp not ready
    //           if (!model.serviceInited) {
    //             return const Splash();
    //           }
    //           return const AppRoute();
    //         }),
    //         bottomNavigationBar: StreamBuilder(
    //             stream: NavigatorRep().routeBloc.onHideBottom,
    //             initialData: NavigatorRep().routeBloc.onHideBottom.valueOrNull,
    //             // TODO: bar itself - fbfbfb
    //             // page color - fdfdfd
    //             // icons - 8ca1b5
    //             // active icons - 34c7f3
    //             builder: (context, snapshot) {
    //               var hide = snapshot.data ?? false;
    //               var model = context.watch<AppModel>();
    //               if (model.waitCopyResource || model.waitMigratingDb) {
    //                 hide = true;
    //               }
    //               return AnimatedContainer(
    //                 duration: const Duration(milliseconds: 250),
    //                 height: hide ? 0 : _bottomNavHeight,
    //                 // decoration: const BoxDecoration(
    //                 //   color: Colors
    //                 //       .pink, //Theme.of(context).colorScheme.bottomNavBg,
    //                 // boxShadow: [
    //                 //   BoxShadow(
    //                 //       color: Theme.of(context).colorScheme.shadowBox,
    //                 //       blurRadius: 10,
    //                 //       offset: const Offset(0, 0))
    //                 // ]
    //                 // ),
    //                 // child: StreamBuilder(
    //                 //     stream: NavigatorRep().routeBloc.onCurrent,
    //                 //     initialData:
    //                 //         NavigatorRep().routeBloc.onCurrent.valueOrNull,
    //                 //     builder: (context, snapshot) {
    //                 //       var page = snapshot.data?.type;
    //                 //       return Stack(alignment: Alignment.center, children: [
    //                 //         Positioned(
    //                 //           top: 0,
    //                 //           left: 0,
    //                 //           right: 0,
    //                 //           bottom: page == PageType.reviewCard ? null : null,
    //                 //           // child: SizedBox(
    //                 //           //   height: _bottomNavHeight,
    //                 //           child: Container(
    //                 //             padding: const EdgeInsets.symmetric(
    //                 //                 horizontal: 10, vertical: 30),
    //                 //             decoration: const BoxDecoration(),
    //                 //             child: ConvexAppBar(
    //                 //               style: TabStyle
    //                 //                   .fixedCircle, // This makes the center button stand out
    //                 //               backgroundColor: Colors.white,
    //                 //               color: Colors.black,
    //                 //               activeColor: Colors
    //                 //                   .deepPurple, // Or your primary theme color
    //                 //               items: [
    //                 //                 TabItem(icon: Icons.home, title: 'Home'),
    //                 //                 TabItem(
    //                 //                     icon: Icons.search, title: 'Search'),
    //                 //                 TabItem(
    //                 //                     icon: Icons
    //                 //                         .add), // The "Fixed Circle" index
    //                 //                 TabItem(
    //                 //                     icon: Icons.library_books,
    //                 //                     title: 'Manage'),
    //                 //                 TabItem(
    //                 //                     icon: Icons.settings,
    //                 //                     title: 'Settings'),
    //                 //               ],
    //                 //               initialActiveIndex: 2,
    //                 //               onTap: (int i) {
    //                 //                 if (i == 2) {
    //                 //                   // Trigger your Review/Add logic here
    //                 //                 }
    //                 //               },
    //                 //             ),
    //                 //             // child: ConvexAppBar(
    //                 //             //   backgroundColor: Colors.white,
    //                 //             //   cornerRadius: 5,
    //                 //             //   color: Colors.black,
    //                 //             //   activeColor: Theme.of(context)
    //                 //             //       .colorScheme
    //                 //             //       .bottomNavIconSelected,
    //                 //             //   // style: TabStyle.fixedCircle,
    //                 //             //   style: TabStyle.react,
    //                 //             //   shadowColor: Colors.grey.shade400,
    //                 //             //   height: _bottomNavHeight - 10,
    //                 //             //   items: [
    //                 //             //     const TabItem(
    //                 //             //         title: 'Home', icon: Icons.list),
    //                 //             //     const TabItem(
    //                 //             //         title: 'Home', icon: Icons.list),
    //                 //             //     TabItem(icon: Icon(Icons.add)
    //                 //             //         //   icon: Container(
    //                 //             //         //     padding: const EdgeInsets.all(5),
    //                 //             //         //     decoration: BoxDecoration(
    //                 //             //         //       color: Colors.amber,
    //                 //             //         //       shape: BoxShape.circle,
    //                 //             //         //     ),
    //                 //             //         //     child:
    //                 //             //         //         const Icon(Icons.abc_sharp),
    //                 //             //         //   ),
    //                 //             //         ),
    //                 //             //     const TabItem(
    //                 //             //         title: 'Home', icon: Icons.list),
    //                 //             //     const TabItem(
    //                 //             //         title: 'Home', icon: Icons.list),
    //                 //             //   ],
    //                 //             //   initialActiveIndex: 1,
    //                 //             //   onTap: (int i) =>
    //                 //             //       print('click index=$i'),
    //                 //             // ),
    //                 //           ),
    //                 //           // child: BottomNavigationBar(
    //                 //           //     elevation: 0,
    //                 //           //     selectedFontSize: 12,
    //                 //           //     unselectedFontSize: 12,
    //                 //           //     backgroundColor: Colors.transparent,
    //                 //           //     selectedItemColor: Theme.of(context)
    //                 //           //         .colorScheme
    //                 //           //         .bottomNavIconSelected,
    //                 //           //     unselectedItemColor:
    //                 //           //         Theme.of(context)
    //                 //           //             .colorScheme
    //                 //           //             .bottomNavBgIconUnselected,
    //                 //           //     items: const [
    //                 //           //       BottomNavigationBarItem(
    //                 //           //           icon: Icon(Icons.home),
    //                 //           //           label: 'Home'),
    //                 //           //       BottomNavigationBarItem(
    //                 //           //           icon: Icon(Icons.text_fields),
    //                 //           //           label: 'Search'),
    //                 //           //       BottomNavigationBarItem(
    //                 //           //           icon: Icon(Icons.view_agenda),
    //                 //           //           label: 'Review'),
    //                 //           //       BottomNavigationBarItem(
    //                 //           //           icon:
    //                 //           //               Icon(Icons.edit_document),
    //                 //           //           label: 'Manage'),
    //                 //           //       BottomNavigationBarItem(
    //                 //           //           icon: Icon(Icons.settings),
    //                 //           //           label: 'Settings'),
    //                 //           //     ],
    //                 //           //     currentIndex: page?.index ?? 0,
    //                 //           //     onTap: (value) async {
    //                 //           //       var cur = NavigatorRep()
    //                 //           //           .routeBloc
    //                 //           //           .onCurrent
    //                 //           //           .valueOrNull;
    //                 //           //       var type = PageType.values[value];
    //                 //           //       if (cur?.type == type) {
    //                 //           //         return;
    //                 //           //       }
    //                 //           //       NavigatorRep()
    //                 //           //           .routeBloc
    //                 //           //           .goto(Panel(type: type));
    //                 //           //     }),
    //                 //         )
    //                 //       ]);
    //                 //     }),
    //               );
    //             })));
  }
}

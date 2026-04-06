import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:vocabyte/app.dart';
import 'package:vocabyte/repository/app_rep.dart';
import 'package:vocabyte/repository/app_theme.dart';
import 'package:vocabyte/repository/settings_rep.dart';
import 'package:vocabyte/resource/constants.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:vocabyte/models/app_model.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  getIt.registerLazySingleton<AppRep>(() => AppRep());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDependencies();

  var initial = await SettingsRep().init();
  var model = AppModel(
    theme: initial.theme,
    appVersion: initial.version,
    onboarding: initial.onboarding,
  );

  runApp(MainApp(model: model));
}

class MainApp extends StatelessWidget {
  const MainApp({required this.model, super.key});
  final AppModel model;

  SystemUiOverlayStyle _getSystemStyle(BuildContext context, ThemeMode mode) {
    if (mode == ThemeMode.system) {
      var overlay = MediaQuery.of(context).platformBrightness;
      overlay == Brightness.light
          ? mode = ThemeMode.light
          : mode = ThemeMode.dark;
    }
    switch (mode) {
      case ThemeMode.light:
        return const SystemUiOverlayStyle(
          systemNavigationBarColor: MenuColorScheme.bottomBarLight,
          statusBarColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.dark,
        );
      case ThemeMode.dark:
        return const SystemUiOverlayStyle(
          systemNavigationBarColor: MenuColorScheme.bottomBarDark,
          statusBarColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.light,
        );
      case ThemeMode.system:
        return const SystemUiOverlayStyle();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppModel>.value(
        value: model,
        builder: (context, child) {
          var theme = context.select<AppModel, ThemeMode>((v) => v.theme);
          return MaterialApp(
              title: Constants.appName,
              themeMode: theme,
              theme: ThemeData(
                brightness: Brightness.light,
              ),
              darkTheme: ThemeData(
                brightness: Brightness.dark,
              ),
              home: AnnotatedRegion<SystemUiOverlayStyle>(
                value: _getSystemStyle(context, theme),
                child: const App(),
              ));
        });
  }
}

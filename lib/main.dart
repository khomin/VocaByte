import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:loggy/loggy.dart';
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

  // Load everything up front
  final results = await Future.wait([
    SettingsRep().getTheme(),
    initDependencies(),
  ]);

  runApp(
    ChangeNotifierProvider(
      create: (_) => AppModel(theme: results[0] as ThemeMode),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = context.select<AppModel, ThemeMode>((v) => v.theme);
    return MaterialApp(
        title: Constants.appName,
        themeMode: theme,
        theme: _buildTheme(Brightness.light),
        darkTheme: _buildTheme(Brightness.dark),
        home: const App());
  }

  ThemeData _buildTheme(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    return ThemeData(
      brightness: brightness,
      splashFactory: InkRipple.splashFactory,
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: isDark
              ? MenuColorScheme.bottomBarDark
              : MenuColorScheme.bottomBarLight,
          systemNavigationBarIconBrightness:
              isDark ? Brightness.light : Brightness.dark,
        ),
      ),
    );
  }
}

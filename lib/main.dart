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

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarContrastEnforced: false,
    statusBarColor: Colors.transparent,
  ));

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
    final bool isDark = theme == ThemeMode.system
        ? MediaQuery.platformBrightnessOf(context) == Brightness.dark
        : theme == ThemeMode.dark;
    Future.microtask(() {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarContrastEnforced: false,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
        systemNavigationBarIconBrightness:
            isDark ? Brightness.light : Brightness.dark,
      ));
    });
    return MaterialApp(
      title: Constants.appName,
      themeMode: theme,
      theme: _buildTheme(Brightness.light),
      darkTheme: _buildTheme(Brightness.dark),
      home: const App(),
    );
  }

  ThemeData _buildTheme(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    return ThemeData(
      brightness: brightness,
      splashFactory: InkRipple.splashFactory,
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarIconBrightness:
              isDark ? Brightness.light : Brightness.dark,
        ),
      ),
      useMaterial3: true,
      // This tells the Scaffold to not automatically add padding for the bottom bar
      // allowing your background color to bleed through
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: isDark
            ? MenuColorScheme.bottomBarDark
            : MenuColorScheme.bottomBarLight,
      ),
    );
  }
}

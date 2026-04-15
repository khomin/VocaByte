import 'package:flutter/material.dart';
import 'package:vocabyte/app.dart';
import 'package:vocabyte/app_runner.dart';
import 'package:vocabyte/repository/app_theme.dart';
import 'package:vocabyte/resource/constants.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:vocabyte/models/app_model.dart';

void main() => runMyFlavoredApp(FlavorType.rustore);

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
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: isDark
            ? MenuColorScheme.bottomBarDark
            : MenuColorScheme.bottomBarLight,
      ),
    );
  }
}

import 'dart:io';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:vocabyte/app/app.dart';
import 'package:vocabyte/repository/settings_rep.dart';
import 'package:vocabyte/app/const_values.dart';
import 'package:vocabyte/app/ui_helper.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (UiHelper.isDesktop()) {
    await windowManager.ensureInitialized();

    WindowOptions windowOptions = const WindowOptions(
      minimumSize: ConstValues.minWindowSize,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.normal,
    );
    if (Platform.isLinux || Platform.isWindows) {
      windowManager.setIcon('assets/logo.png');
    }
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      var size = await SettingsRep().getScreenSize();
      windowManager.setSize(size ?? const Size(850, 650));
      await windowManager.show();
      await windowManager.focus();
    });
  }
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
        light: ThemeData(
          brightness: Brightness.light,
        ),
        dark: ThemeData(
          brightness: Brightness.dark,
        ),
        initial: AdaptiveThemeMode.dark,
        builder: (theme, darkTheme) {
          return MaterialApp(
              title: ConstValues.appName,
              theme: theme,
              darkTheme: darkTheme,
              home: const App());
        });
  }
}

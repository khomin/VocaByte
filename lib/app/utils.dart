import 'dart:io';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:vocabyte/domains/drawer/drawer_menu.dart';
import 'package:vocabyte/app/app_theme.dart';

enum ScreenLayoutType { minimum, medium, large, full }

class Utils {
  static void showSnackBar(BuildContext context, String text,
      {bool error = false}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text,
          textAlign: TextAlign.center,
          maxLines: 5,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: error
                ? Theme.of(context).colorScheme.error
                : Theme.of(context).colorScheme.text1,
          )),
      duration: const Duration(seconds: 2),
      backgroundColor: Theme.of(context).colorScheme.dialogBackground,
    ));
  }

  static String replaceHtmlPlaceholders(String html, ColorScheme colors) {
    html = html.replaceAll('%main-color', colorToStr(colors.mainColor));
    html = html.replaceAll(
        '%active-main-color', colorToStr(colors.activeMainColor));
    html = html.replaceAll(
        '%main-disabled-color-50', colorToStr(colors.mainDisabledColor50));
    return html;
  }

  static String colorToStr(Color color) {
    return 'rgb(${color.red},${color.green},${color.blue})';
  }

  static String systemName() {
    if (Platform.isAndroid) {
      return 'android';
    } else if (Platform.isIOS) {
      return 'ios';
    } else if (Platform.isMacOS) {
      return 'macos';
    } else if (Platform.isLinux) {
      return 'linux';
    } else if (Platform.isWindows) {
      return 'windows';
    }
    return 'undefined';
  }

  String pageToHeader(MenuPageType? v) {
    if (v == null) return '';
    switch (v) {
      case MenuPageType.account:
        return 'Account';
      case MenuPageType.home:
        return 'Home';
      case MenuPageType.wordDetails:
        return 'Details';
      case MenuPageType.settings:
        return 'Settings';
      case MenuPageType.about:
        return 'About';
      case MenuPageType.searchWord:
        return 'Search';
      case MenuPageType.reviewCard:
        return 'Review';
      case MenuPageType.manageWords:
        return 'Manage words';
      case MenuPageType.numerals:
        return 'Numerals';
      case MenuPageType.changeDailyGoal:
        return 'Change goal';
    }
  }

  static void setTheme(BuildContext context, ThemeType theme) {
    switch (theme) {
      case ThemeType.light:
        if (context.mounted) AdaptiveTheme.of(context).setLight();
      case ThemeType.dark:
        if (context.mounted) AdaptiveTheme.of(context).setDark();
      case ThemeType.system:
        if (context.mounted) AdaptiveTheme.of(context).setSystem();
    }
  }
}

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:vocabyte/repository/app_theme.dart';

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
}

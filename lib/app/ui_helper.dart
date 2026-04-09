import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:loggy/loggy.dart';
import 'package:vocabyte/models/review_model.dart';
import 'package:vocabyte/pages/card_review/card_review_main.dart';
import 'package:vocabyte/pages/numerals/numerals_main.dart';
import 'package:vocabyte/repository/app_theme.dart';
import 'package:vocabyte/resource/constants.dart';

enum ToastType { normal, error }

class UiHelper {
  static bool isMobile() {
    return Platform.isAndroid || Platform.isIOS;
  }

  static bool isDesktop() {
    return Platform.isWindows || Platform.isMacOS || Platform.isLinux;
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

  static bool get isTablet {
    final firstView = WidgetsBinding.instance.platformDispatcher.views.first;
    final logicalShortestSide =
        firstView.physicalSize.shortestSide / firstView.devicePixelRatio;
    return logicalShortestSide > 600;
  }

  static void showToast(BuildContext context, String text,
      {ToastType type = ToastType.normal}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Theme.of(context).colorScheme.snackColor,
        content: Text(text,
            textAlign: TextAlign.center,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Theme.of(context).colorScheme.snackColorText,
              fontFamily: Constants.fontFredoka,
            )),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  static Future<bool> hadleTextCtrV(
      KeyEvent event, TextEditingController? ctr) async {
    if (ctr == null) return false;
    if (event is KeyDownEvent) {
      if (event.physicalKey == PhysicalKeyboardKey.keyV) {
        if ((Platform.isMacOS && HardwareKeyboard.instance.isMetaPressed) ||
            (Platform.isWindows &&
                HardwareKeyboard.instance.isControlPressed) ||
            (Platform.isLinux && HardwareKeyboard.instance.isControlPressed)) {
          var data = await Clipboard.getData(Clipboard.kTextPlain);
          var text = data?.text;
          if (text == null) return false;
          var cursorPos = ctr.selection.base.offset;
          String textBeforeCursor = ctr.text.substring(0, cursorPos);
          ctr.text = textBeforeCursor + text;
          ctr.selection = TextSelection.collapsed(offset: ctr.text.length);
          return true;
        }
      }
    }
    return false;
  }

  boxShadow(BuildContext context, Offset offset, {Color? color}) {
    return BoxDecoration(
        color: color ?? Theme.of(context).colorScheme.baseColor2,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 2,
              offset: offset)
        ]);
  }

  static dynamic getRouteArg(Object? arguments, String s) {
    if (arguments == null) {
      return null;
    }
    return (arguments as dynamic)[s];
  }

  static Future<bool> waitCondition(
      {int timeout = 15, required Future<bool> Function() condition}) async {
    var complete = Completer<bool>();
    var start = DateTime.now();
    () async {
      while (true) {
        var tDiff = start.difference(DateTime.now()).inSeconds;
        // timeout, failed
        if (tDiff.isNegative && tDiff.abs() >= timeout) {
          complete.complete(false);
          break;
        }
        // if condition true - success
        if (await condition() == true) {
          complete.complete(true);
          break;
        }
        await Future.delayed(const Duration(seconds: 1));
      }
    }();
    return complete.future;
  }

  CardPageType routeCardNameToType(String? name) {
    for (var it in CardPageType.values) {
      if (it.name == name) {
        return it;
      }
    }
    return CardPageType.idle;
  }

  NumPageType routeNumeralsNameToType(String? name) {
    for (var it in NumPageType.values) {
      if (it.name == name) {
        return it;
      }
    }
    return NumPageType.idle;
  }

  String durationFormat(Duration duration) {
    return duration.toString().split('.').first.padLeft(8, "0");
  }

  static String toFormatText(String? v) {
    if (v == null) return '';
    if (v.isEmpty) return v;
    // some descriptions begin with '(something)'
    try {
      if (v[0] == '(') {
        var endIndex = v.indexOf(')');
        if (endIndex != -1) {
          v = v.substring(endIndex + 1);
        }
      }
      // remove space if in the beginning
      if (v.isNotEmpty && v[0] == ' ') {
        v = v.substring(1);
      }
      // make first char upper if it is a letter and in lower
      for (var i = 0; i < v!.length; i++) {
        var c = v[i];
        if (c != c.toUpperCase() && c == c.toLowerCase()) {
          v = v.substring(0, 1).toUpperCase() + v.substring(1);
        }
      }
      return v;
    } catch (ex) {
      logDebug(ex);
    }
    return '';
  }

  static List<TextSpan> makeTextSpan(
      {required String query,
      required String text,
      required Color colorHighlight,
      required Color colorBase}) {
    List<TextSpan> spans = [];
    var queryLen = query.length;

    TextSpan createSpan(String text, bool hightLight) {
      if (hightLight) {
        // make visible only matching text, rest is transparent
        return TextSpan(
          text: text,
          style: TextStyle(
              color: colorHighlight,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              decorationColor: colorHighlight),
        );
      }
      return TextSpan(text: text, style: TextStyle(color: colorBase));
    }

    var againsLoop = 0;
    while (true) {
      againsLoop++;
      var index = text.toLowerCase().indexOf(query);
      if (index < 0) {
        if (text.isNotEmpty) {
          var span = createSpan(text, false);
          spans.add(span);
        }
        break;
      }
      if (index != 0) {
        var sub = text.substring(0, index);
        text = text.replaceRange(0, index, '');
        var span = createSpan(sub, false);
        spans.add(span);
        continue;
      }
      var sub = text.substring(0, queryLen);
      text = text.replaceRange(0, queryLen, '');
      var span = createSpan(sub, true);
      spans.add(span);
      if (text.isEmpty) {
        break;
      }
      if (againsLoop > 100) {
        break;
      }
    }
    return spans;
  }

  static double calculateHomeGridRation(double width) {
    if (width > 1000) {
      return 2.05; // For large screens
    } else if (width > 800) {
      return 1.2; // For medium screens
    } else {
      return 1.05;
    }
  }

  // static isDrawerOn(MenuPageType page) {
  //   var drawerOn = false;
  //   switch (page) {
  //     case MenuPageType.account:
  //     case MenuPageType.wordDetails:
  //     case MenuPageType.reviewCard:
  //     case MenuPageType.manageWords:
  //     case MenuPageType.changeDailyGoal:
  //       drawerOn = false;
  //       break;
  //     case MenuPageType.searchWord:
  //     case MenuPageType.home:
  //     case MenuPageType.settings:
  //     case MenuPageType.about:
  //     case MenuPageType.numerals:
  //       drawerOn = true;
  //       break;
  //   }
  //   return drawerOn;
  // }
}

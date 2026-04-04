import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Constants {
  static final Constants _instance = Constants._internal();

  static const appName = "VocaByte";
  static const localFolderName = 'vocabyte';
  static var appVersion = '1.0.3';
  static const appLink =
      'https://play.google.com/store/apps/details?id=com.vocabyte.app';
  static const appGroupLink = 'https://groups.google.com/g/vocabyte';

  static double iconHomeSize = 60.0;
  static double bottomNavHeight = 70.0;

  static String get fontInter => 'Inter';
  static String get fontFredoka => 'Fredoka';

  static const duration = Duration(milliseconds: 200);
  static const durationPanel = Duration(milliseconds: 100);
  static const lastFrameDuration = Duration(milliseconds: 150);
  static const searchHeroDuration = Duration(milliseconds: 250);

  static const appBarButton = 52.0;
  static double homeAppBarHeight = 70.0;
  static double searchItemHeight = 50;

  static const baseButton = 55.0;
  static const homeCardHeight = 80.0;
  static const homeCardPadding = 10.0;

  static const menuFontSize1 = 15.0;
  static const menuFontSize2 = 14.0;
  static const menuFontSize3 = 13.0;

  static const double learnCountForBreak = 20;
  static const int reapedToLeanDefault = 10;
  static const int goalDefault = 20;

  static const isDev = kDebugMode;
  static const isMock = false;
  static const minWindowSize = Size(200, 300);

  static const shadowDown = Offset(0, 5);
  static const shadowUp = Offset(0, -5);
  static const shadowUpLight = Offset(0, -1);

  static const double dialogHeaderHeight = 30;
  static const double dialogHeaderMiddle = 40;
  static const double dialogHeaderLargeHeight = 56;

  // dialogs
  static const dialogHeadertFontSize = 15.0;
  static const dialogHeaderFontWeight = FontWeight.w400;
  static const dialogFontSize = 14.0;
  static const dialogFontWeight = FontWeight.w200;

  static const buttonHeight = 45.0;

  static const animDurationFast = Duration(milliseconds: 50);
  static const animDurationMid = Duration(milliseconds: 200);
  static const animDurationLong = Duration(milliseconds: 1000);

  factory Constants() {
    return _instance;
  }

  Constants._internal();
}

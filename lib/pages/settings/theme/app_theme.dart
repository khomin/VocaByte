import 'package:flutter/material.dart';
import 'package:vocabyte/app/ui_helper.dart';

enum ThemeType { light, dark, system }

extension MenuColorScheme on ColorScheme {
  Color get baseColor1 => const Color.fromARGB(255, 31, 33, 35);
  Color get baseColor2 => const Color(0xFFFFFFFF);
  Color get baseLight => const Color(0xFFF5F5F5);

  Color get lightBlueText => const Color(0xFFB5C2D4);
  //
  // drawer menu
  Color get menuActive => const Color(0xFF191b1c);
  Color get menuIdle => const Color(0xFF111313);

  Color get inputText => brightness == Brightness.dark
      ? const Color.fromARGB(255, 231, 231, 231)
      : const Color.fromARGB(255, 028, 028, 028);
  Color get inputBackground => brightness == Brightness.dark
      ? const Color.fromARGB(255, 34, 34, 34)
      : const Color.fromARGB(255, 34, 34, 34);
  Color get inputHint => brightness == Brightness.dark
      ? const Color.fromARGB(255, 128, 128, 128)
      : const Color.fromARGB(255, 128, 128, 128);
  Color get inputFieldBorder => brightness == Brightness.dark
      ? const Color(0xff6b87ab)
      : const Color(0xff6b87ab);
  Color get inputHintError => brightness == Brightness.dark
      ? const Color.fromARGB(255, 218, 87, 87)
      : const Color.fromARGB(255, 218, 87, 87);

  Color get listSplit => brightness == Brightness.dark
      ? const Color.fromARGB(255, 54, 54, 54)
      : const Color.fromARGB(255, 200, 200, 200);

  Color get text1 => const Color(0xFF233F67);
  Color get text2 => brightness == Brightness.dark
      ? const Color.fromARGB(255, 255, 0, 0)
      : const Color.fromARGB(255, 0, 255, 128);
  Color get text3 => brightness == Brightness.dark
      ? const Color(0xFFFAFAFA)
      : const Color(0xFF233F67);
  Color get text4 => brightness == Brightness.dark
      ? const Color(0xFF475E7D)
      : const Color(0xFFB6BECD);
  Color get text5 => brightness == Brightness.dark
      ? const Color(0xFFB5C2D4)
      : const Color(0xFFB6BECD);
  //
  // dialogs/inputs
  Color get dialogBackground => brightness == Brightness.dark
      ? const Color(0xFF232628)
      : const Color(0xFF232628);

  Color get dialogHeaderColor => const Color.fromARGB(255, 57, 99, 90);
  Color get dialogHeaderBg => brightness == Brightness.dark
      ? const Color(0xFF1F3149)
      : const Color(0xFFFFFFFF);
  Color get dialogText => brightness == Brightness.dark
      ? const Color(0xFFB5C2D4)
      : const Color(0xFF233F67);

  Color get bottomNavBg =>
      brightness == Brightness.dark ? Colors.black26 : const Color(0xFFF0F0F0);

  Color get bottomNavSelectedBg =>
      brightness == Brightness.dark ? Colors.white12 : Colors.black12;

  Color get bottomNavIconSelected =>
      brightness == Brightness.dark ? buttonOption1 : buttonOption1;

  Color get bottomNavBgIconUnselected =>
      brightness == Brightness.dark ? Colors.white38 : Colors.black54;

  Color get checkBoxActive => brightness == Brightness.dark
      ? (UiHelper.isMobile()
          ? const Color(0xFFFFFFFF)
          : const Color(0xFFFFFFFF))
      : const Color(0xFFFFFFFF);

  Color get menuActiveText => brightness == Brightness.dark
      ? const Color(0xFFB5C2D4)
      : const Color(0xFF323232);
  Color get menuIdleText => const Color(0xFFb9b3a9);

  //
  // text
  TextStyle get appBarText => TextStyle(
      color: brightness == Brightness.dark
          ? const Color(0xFFCACACA)
          : const Color(0xFF202020),
      fontSize: 14,
      fontWeight: FontWeight.w500);

  TextStyle get title1 => TextStyle(
      color: brightness == Brightness.dark
          ? const Color(0xFF8A8A9A)
          : const Color(0xFF202020),
      fontSize: 14,
      fontWeight: FontWeight.w500);

  TextStyle get title2 => TextStyle(
      color: brightness == Brightness.dark
          ? const Color(0xFFCACACA)
          : const Color(0xF06A6A6A),
      fontSize: 14,
      fontWeight: FontWeight.w400);

  TextStyle get title3 => TextStyle(
      color: brightness == Brightness.dark
          ? const Color(0xFFAAAAAA)
          : const Color(0xF04A4A4A),
      fontSize: 14,
      fontWeight: FontWeight.w400);

  Color get title4 => brightness == Brightness.dark
      ? const Color.fromARGB(255, 26, 151, 97)
      : const Color.fromARGB(255, 26, 151, 97);
  Color get title5 => brightness == Brightness.dark
      ? const Color(0xFFB5C2D4)
      : const Color(0xFF172339);
  Color get titleErr => brightness == Brightness.dark
      ? const Color.fromARGB(255, 182, 9, 0)
      : const Color.fromARGB(255, 195, 42, 34);

  TextStyle get titleInverse => TextStyle(
      color: brightness == Brightness.dark
          ? const Color(0xFFF0F0F0)
          : const Color(0xFFFFFFFF),
      fontSize: 14,
      fontWeight: FontWeight.w500);

  Color get dialogHeaderText => brightness == Brightness.dark
      ? const Color(0xFFB5C2D4)
      : const Color(0xFF202020);

  Color get cardHome => brightness == Brightness.dark
      ? const Color.fromARGB(255, 40, 40, 40)
      : Colors.white;
  Color get pageHome => brightness == Brightness.dark
      ? const Color.fromARGB(255, 0, 0, 0)
      : const Color(0xFFFAFAFA);

  Color get card => brightness == Brightness.dark
      ? const Color.fromARGB(255, 26, 26, 26)
      : const Color.fromARGB(255, 255, 255, 255);
  Color get cardSuccess => brightness == Brightness.dark
      ? const Color.fromARGB(255, 36, 80, 68)
      : const Color.fromARGB(255, 141, 186, 174);
  Color get cardError => brightness == Brightness.dark
      ? const Color.fromARGB(255, 114, 65, 65)
      : const Color.fromARGB(255, 207, 173, 173);

  Color get cardDefinition => brightness == Brightness.dark
      ? const Color(0xFFF0F0F0)
      : const Color(0xFF202020);

  Color get cardExample => brightness == Brightness.dark
      ? const Color(0xFFCFCFCF)
      : const Color(0xF06A6A6A);

  Color get page => brightness == Brightness.dark
      ? const Color.fromARGB(255, 0, 0, 0)
      : const Color.fromARGB(255, 241, 241, 241);
  Color get shadowBox => brightness == Brightness.dark
      ? const Color(0x05FFFFFF)
      : const Color(0x3F000000);

  Color get shadow2 => brightness == Brightness.dark
      ? const Color(0xFFFFFFFF)
      : const Color(0x50000000);

  // Color get  => const Color.fromARGB(159, 109, 109, 109);

  Color get menuBorderColor => brightness == Brightness.dark
      ? const Color(0xFF303030)
      : const Color(0x15000000);

  Color get buttonOption1 => const Color.fromARGB(255, 70, 124, 113);
  Color get buttonOption2 => const Color.fromARGB(255, 162, 74, 167);
  Color get buttonOption3 => const Color.fromARGB(255, 49, 86, 77);
  Color get buttonOption4 => const Color.fromARGB(255, 101, 103, 137);
  Color get buttonOptionText => brightness == Brightness.dark
      ? const Color(0xFF202020)
      : const Color(0xFFDFDFDF);

  Color get cardText => brightness == Brightness.dark
      ? const Color(0xFFCACACA)
      : const Color(0xFF202020);

  Color get cardIcon => brightness == Brightness.dark
      ? const Color(0xFF30CC89)
      : const Color(0xFF172339);

  Color get placeholder1 => brightness == Brightness.dark
      ? const Color(0xFF30CC89)
      : const Color(0x7F172339);

  Color get iconColor => brightness == Brightness.dark
      ? const Color(0xFFB5C2D4)
      : const Color(0xFF323232);

  Color get roundButton => brightness == Brightness.dark
      ? const Color(0x10FFFFFF)
      : const Color(0x0a000000);

  Color get textResultGrad1 => brightness == Brightness.dark
      ? const Color.fromARGB(255, 255, 102, 6)
      : const Color.fromARGB(255, 255, 102, 6);

  Color get textResultGrad2 => brightness == Brightness.dark
      ? Colors.yellow
      : const Color.fromARGB(255, 166, 153, 38);

  //
  // buttons
  Color get button2 => const Color(0xFF767676);
  Color get button2Text => brightness == Brightness.dark
      ? const Color(0xFFB5C2D4)
      : const Color(0xFF172339);
  Color get button2Hover => const Color.fromARGB(255, 82, 85, 86);

  Color get button3 => brightness == Brightness.dark
      ? const Color(0xFF2A3D58)
      : const Color(0xFF172339);
  Color get button3Text => brightness == Brightness.dark
      ? const Color(0xFFB5C2D4)
      : const Color(0xFFFFFFFF);
  Color get button3Hover => brightness == Brightness.dark
      ? const Color.fromARGB(255, 58, 85, 122)
      : const Color.fromARGB(255, 58, 85, 122);

  Color get button3Inversed => brightness == Brightness.dark
      ? const Color(0xFF1EB172)
      : const Color(0xFF1EB172);
  Color get button3HoverInverted => brightness == Brightness.dark
      ? const Color.fromARGB(255, 53, 225, 150)
      : const Color(0xFF1EB172);
  Color get button3TextInversed => brightness == Brightness.dark
      ? const Color(0xFF111F32)
      : const Color(0xFFF0F5F9);

  Color get button4 => brightness == Brightness.dark
      ? const Color(0xFF1EB172)
      : const Color(0xFF1EB172);
  Color get button4Hover => brightness == Brightness.dark
      ? const Color.fromARGB(255, 33, 194, 124)
      : const Color.fromARGB(255, 33, 194, 124);
  Color get button4Text => brightness == Brightness.dark
      ? const Color(0xFF111F32)
      : const Color(0xFF111F32);

  Color get searchList =>
      brightness == Brightness.dark ? Colors.transparent : Colors.transparent;
  Color get search => brightness == Brightness.dark
      ? const Color(0xFFD1FFEB)
      : const Color(0xFFFFFFFF);
  Color get searchListText => brightness == Brightness.dark
      ? const Color(0xFF1EB172)
      : const Color(0xFF1EB172);
  Color get searchListTextActive => brightness == Brightness.dark
      ? const Color(0xFF111F32)
      : const Color(0xFF111F32);
  Color get searchListActive => brightness == Brightness.dark
      ? const Color(0xFF1EB172)
      : const Color(0xFF1EB172);
  Color get searchListBorderActive => brightness == Brightness.dark
      ? const Color(0xFF1EB172)
      : const Color(0xFF1EB172);
  Color get searchListBorderOff => brightness == Brightness.dark
      ? const Color(0xFFB5C2D4)
      : const Color(0xFFB5C2D4);

  //
  // html block colors
  Color get mainColor => brightness == Brightness.dark
      ? const Color.fromRGBO(181, 194, 212, 1)
      : const Color(0xFF172339);

  Color get activeMainColor => brightness == Brightness.dark
      ? const Color.fromRGBO(48, 204, 137, 1)
      : const Color(0xFF1EB172);

  Color get mainDisabledColor50 => brightness == Brightness.dark
      ? const Color.fromRGBO(91, 112, 142, 1)
      : const Color(0xFF98A2B5);

  Color get toastNormal => const Color(0xFFDBDBDB);
  Color get toastWarning => const Color(0xFFDBDBDB);
  Color get toastBad => const Color(0xFFDBDBDB);
  Color get white => const Color(0xFFFFFFFF);

  Color get transparent => Colors.transparent;
}

import 'package:flutter/material.dart';
import 'package:vocabyte/app/ui_helper.dart';

enum ThemeType { light, dark, system }

extension MenuColorScheme on ColorScheme {
  static const dark = true;
  Color get baseColor1 => const Color.fromARGB(255, 31, 33, 35);
  Color get baseColor2 => const Color(0xFFFFFFFF);
  Color get baseLight => const Color(0xFFF5F5F5);

  Color get lightBlueText => const Color(0xFFB5C2D4);
  //
  // drawer menu
  Color get menuActive => const Color(0xFF191b1c);
  Color get menuIdle => const Color(0xFF111313);

  Color get inputText => const Color.fromARGB(255, 231, 231, 231);
  Color get inputBackground => const Color.fromARGB(255, 34, 34, 34);
  Color get inputHint => const Color.fromARGB(255, 128, 128, 128);
  Color get inputFieldBorder => const Color(0xff6b87ab);
  Color get inputHintError => const Color.fromARGB(255, 218, 87, 87);

  Color get listSplit => const Color.fromARGB(255, 54, 54, 54);

  Color get text1 => const Color(0xFF233F67);
  Color get text2 => dark ? const Color(0xFF7087a8) : const Color(0xFF233F67);
  Color get text3 => dark ? const Color(0xFFFAFAFA) : const Color(0xFF233F67);
  Color get text4 => dark ? const Color(0xFF475E7D) : const Color(0xFFB6BECD);
  Color get text5 => dark ? const Color(0xFFB5C2D4) : const Color(0xFFB6BECD);
  //
  // dialogs/inputs
  Color get dialogBackground =>
      dark ? const Color(0xFF232628) : const Color(0xFF232628);

  Color get dialogHeaderColor => const Color.fromARGB(255, 57, 99, 90);

  Color get dialogHeaderText => dark
      ? (UiHelper.isMobile()
          ? const Color(0xFFFFFFFF)
          : const Color(0xFFB5C2D4))
      : const Color(0xFF233F67);

  Color get dialogHeaderText2 => const Color(0xFFB5C2D4);

  Color get checkBoxActive => dark
      ? (UiHelper.isMobile()
          ? const Color(0xFFFFFFFF)
          : const Color(0xFFFFFFFF))
      : const Color(0xFFFFFFFF);

  Color get menuActiveText =>
      dark ? const Color(0xFFB5C2D4) : const Color(0xFF323232);
  Color get menuIdleText => const Color(0xFFb9b3a9);

  //
  // text
  Color get titel1 => dark ? const Color(0xFF1EB172) : const Color(0xFF172339);
  Color get titel2 => dark ? const Color(0xFFB5C2D4) : const Color(0xFF1EB172);
  Color get titel3 => dark ? const Color(0xFF1EB172) : const Color(0xFF1EB172);
  Color get titel4 => dark ? const Color(0xFFB5C2D4) : const Color(0xFF172339);
  Color get titelErr =>
      dark ? const Color.fromARGB(255, 182, 9, 0) : const Color(0xFFFF4B40);

  Color get textInCard => const Color.fromARGB(255, 255, 255, 255);
  Color get textInCard2 => const Color.fromARGB(255, 255, 255, 255);

  Color get card => const Color(0xFF111313);
  Color get cardSuccess => const Color.fromARGB(255, 36, 80, 68);
  Color get cardError => const Color.fromARGB(255, 114, 65, 65);
  Color get page => const Color.fromARGB(255, 45, 48, 49);

  Color get buttonOption1 => const Color.fromARGB(255, 57, 99, 90);
  Color get buttonOption2 => const Color.fromARGB(255, 156, 96, 159);

  Color get buttonOption3 => const Color.fromARGB(255, 49, 86, 77);

  Color get cardText => const Color(0xFFDCE7F5);
  Color get cardIcon =>
      dark ? const Color(0xFF30CC89) : const Color(0xFF172339);

  Color get placeholder1 =>
      dark ? const Color(0xFF30CC89) : const Color(0x7F172339);

  Color get iconColor =>
      dark ? const Color(0xFFB5C2D4) : const Color(0xFF323232);

  //
  // buttons
  Color get button2 => const Color(0xFF767676);
  Color get button2Text =>
      dark ? const Color(0xFFB5C2D4) : const Color(0xFF172339);
  Color get button2Hover => const Color.fromARGB(255, 82, 85, 86);

  Color get button3 => dark ? const Color(0xFF2A3D58) : const Color(0xFF172339);
  Color get button3Text =>
      dark ? const Color(0xFFB5C2D4) : const Color(0xFFFFFFFF);
  Color get button3Hover => dark
      ? const Color.fromARGB(255, 58, 85, 122)
      : const Color.fromARGB(255, 58, 85, 122);

  Color get button3Inversed =>
      dark ? const Color(0xFF1EB172) : const Color(0xFF1EB172);
  Color get button3HoverInverted =>
      dark ? const Color.fromARGB(255, 53, 225, 150) : const Color(0xFF1EB172);
  Color get button3TextInversed =>
      dark ? const Color(0xFF111F32) : const Color(0xFFF0F5F9);

  Color get button4 => dark ? const Color(0xFF1EB172) : const Color(0xFF1EB172);
  Color get button4Hover => dark
      ? const Color.fromARGB(255, 33, 194, 124)
      : const Color.fromARGB(255, 33, 194, 124);
  Color get button4Text =>
      dark ? const Color(0xFF111F32) : const Color(0xFF111F32);

  Color get searchList => dark ? Colors.transparent : Colors.transparent;
  Color get search => dark ? const Color(0xFFD1FFEB) : const Color(0xFFFFFFFF);
  Color get searchListText =>
      dark ? const Color(0xFF1EB172) : const Color(0xFF1EB172);
  Color get searchListTextActive =>
      dark ? const Color(0xFF111F32) : const Color(0xFF111F32);
  Color get searchListActive =>
      dark ? const Color(0xFF1EB172) : const Color(0xFF1EB172);
  Color get searchListBorderActive =>
      dark ? const Color(0xFF1EB172) : const Color(0xFF1EB172);
  Color get searchListBorderOff =>
      dark ? const Color(0xFFB5C2D4) : const Color(0xFFB5C2D4);

  Color get dialogHeaderBg =>
      dark ? const Color(0xFF1F3149) : const Color(0xFFFFFFFF);
  Color get dialogText =>
      dark ? const Color(0xFFB5C2D4) : const Color(0xFF233F67);

  //
  // html block colors
  Color get mainColor =>
      dark ? const Color.fromRGBO(181, 194, 212, 1) : const Color(0xFF172339);

  Color get activeMainColor =>
      dark ? const Color.fromRGBO(48, 204, 137, 1) : const Color(0xFF1EB172);

  Color get mainDisabledColor50 =>
      dark ? const Color.fromRGBO(91, 112, 142, 1) : const Color(0xFF98A2B5);

  Color get toastNormal => const Color(0xFFDBDBDB);
  Color get toastWarning => const Color(0xFFDBDBDB);
  Color get toastBad => const Color(0xFFDBDBDB);
  Color get white => const Color(0xFFFFFFFF);

  Color get transparent => Colors.transparent;
}

import 'package:flutter/material.dart';
import 'package:vocabyte/app/ui_helper.dart';
import 'package:vocabyte/resource/constants.dart';
import 'dart:ui' as ui;

extension MenuColorScheme on ColorScheme {
  bool dark() => brightness == Brightness.dark;

  Color get appBar =>
      dark() ? const Color(0xFF1c1e23) : const Color(0xFFecebf2);
  Color get baseColor1 =>
      dark() ? const Color(0xFF000000) : const Color(0xFFecebf2);

  static const bottomBarLight = Color(0xFFecebf2);
  static const bottomBarDark = Color(0xFF252525);

  Color get bottomNavBg => dark() ? bottomBarDark : bottomBarLight;
  Color get bottomNavIcon => dark() ? Colors.white38 : const Color(0xFF8ca1b5);
  Color get bottomNavIconSelected =>
      dark() ? buttonOption1 : const Color(0xFF8ca1b5);

  Color get homeCardH1 =>
      dark() ? const Color(0xFFCACACA) : const Color(0xFF43444c);

  Color get chipsBox => dark()
      ? const Color(0xFF1c1e23)
      : const Color.fromARGB(255, 236, 235, 242);
  Color get chip => dark() ? const Color(0xFF1c1e23) : const Color(0xFFecebf2);
  Color get chipActive =>
      dark() ? const Color.fromARGB(255, 75, 85, 134) : const Color(0xFFC0CCFF);

  Color get snackColor => dark()
      ? const Color.fromARGB(255, 82, 70, 152)
      : const Color.fromARGB(255, 204, 189, 255);
  Color get snackColorText =>
      dark() ? const Color(0xFFecebf2) : const Color.fromARGB(255, 28, 28, 28);

  Color get bottomSheet => dark()
      ? const Color(0xFF1c1e23)
      : const Color.fromARGB(255, 238, 238, 238);

  Color get textInputBox => dark() ? const Color(0xFF3F3F3F) : Colors.white;
  Color get textInput => dark() ? Colors.white : Colors.white;

  Color get itemSearch =>
      dark() ? const Color(0xFF111317) : Colors.white.withValues(alpha: 0.5);

  Color get reviewCardPastel => dark() ? const Color(0x6E4CAF4F) : Colors.green;
  Color get reviewCardPastelRequired => dark() ? Colors.orange : Colors.orange;
  Color get manageCardPastel => dark() ? const Color(0x6E2195F3) : Colors.blue;
  Color get numeralsCardPastel =>
      dark() ? const Color(0x6E9B27B0) : Colors.purple;
  Color get libraryCardPastel => dark()
      ? const Color.fromARGB(109, 39, 162, 176)
      : const Color.fromARGB(255, 39, 135, 176);

  Color get fabButton => const Color(0xFF7B61D1);

  Color get baseColor2 => const Color(0xFFFFFFFF);
  Color get baseLight => const Color(0xFFF5F5F5);

  Color get lightBlueText => const Color(0xFFB5C2D4);
  //
  // drawer menu
  Color get menuActive => const Color(0xFF191b1c);
  Color get menuIdle => const Color(0xFF111313);

  Color get inputText => dark()
      ? const Color(0xFFE7E7E7)
      : const Color.fromARGB(255, 028, 028, 028);
  Color get inputBackground => dark()
      ? const Color.fromARGB(255, 34, 34, 34)
      : const Color.fromARGB(255, 34, 34, 34);
  Color get inputHint => dark()
      ? const Color.fromARGB(255, 128, 128, 128)
      : const Color.fromARGB(255, 128, 128, 128);
  Color get inputFieldBorder =>
      dark() ? const Color(0xff6b87ab) : const Color(0xff6b87ab);
  Color get inputHintError => dark()
      ? const Color.fromARGB(255, 218, 87, 87)
      : const Color.fromARGB(255, 218, 87, 87);

  Color get listSplit => dark()
      ? const Color.fromARGB(255, 54, 54, 54)
      : const Color.fromARGB(255, 200, 200, 200);

  Color get text1 => const Color(0xFF233F67);
  Color get text2 => dark()
      ? const Color.fromARGB(255, 255, 0, 0)
      : const Color.fromARGB(255, 0, 255, 128);
  Color get text3 => dark() ? const Color(0xFFFAFAFA) : const Color(0xFF233F67);
  Color get text4 => dark() ? const Color(0xFF475E7D) : const Color(0xFFB6BECD);
  Color get text5 => dark()
      ? const Color(0xFFB5C2D4)
      : const Color.fromARGB(255, 139, 145, 157);
  //
  // dialogs/inputs
  Color get dialogBackground =>
      dark() ? const Color(0xFF232628) : const Color(0xFF232628);

  Color get dialogHeaderColor => const Color.fromARGB(255, 57, 99, 90);
  Color get dialogHeaderBg =>
      dark() ? const Color(0xFF1F3149) : const Color(0xFFFFFFFF);
  Color get dialogText =>
      dark() ? const Color(0xFFB5C2D4) : const Color(0xFF233F67);

  Color get checkBoxActive => dark()
      ? (UiHelper.isMobile()
          ? const Color(0xFFFFFFFF)
          : const Color(0xFFFFFFFF))
      : const Color(0xFFFFFFFF);

  Color get menuActiveText =>
      dark() ? const Color(0xFFB5C2D4) : const Color(0xFF323232);
  Color get menuIdleText => const Color(0xFFb9b3a9);

  //
  // text
  TextStyle get appBarText => TextStyle(
        color: dark() ? const Color(0xFFCACACA) : const Color(0xFF202020),
        fontSize: 14,
        fontWeight: FontWeight.w500,
      );
  TextStyle get title1 => TextStyle(
        color: dark() ? const Color(0xFF8A8A9A) : const Color(0xFF202020),
        fontSize: 15,
        fontWeight: FontWeight.w500,
        fontFamily: Constants.fontFredoka,
      );
  TextStyle get title2 => TextStyle(
        color: dark() ? const Color(0xFFCACACA) : const Color(0xEE383838),
        fontSize: 15,
        fontWeight: FontWeight.w400,
        fontFamily: Constants.fontFredoka,
      );
  TextStyle get title3 => TextStyle(
        color: dark() ? const Color(0xFFAAAAAA) : const Color(0xF04A4A4A),
        fontSize: 14,
        fontWeight: FontWeight.w400,
      );
  TextStyle getBeautifulLine1(BuildContext context) => TextStyle(
        fontSize: 20,
        fontFamily: Constants.fontFredoka,
        fontWeight: FontWeight.w500,
        foreground: Paint()
          ..shader = ui.Gradient.linear(
            const Offset(0, 0),
            const Offset(300, 0),
            [
              Theme.of(context).colorScheme.textResultGrad1,
              Theme.of(context).colorScheme.textResultGrad2,
            ],
          ),
      );
  TextStyle getBeautifulLine2(BuildContext context) => TextStyle(
      fontSize: 20,
      fontFamily: Constants.fontFredoka,
      fontWeight: FontWeight.w600,
      foreground: Paint()
        ..shader = ui.Gradient.linear(
            const Offset(0, 0), const Offset(300, 0), <Color>[
          Theme.of(context).colorScheme.textResultGrad1,
          Theme.of(context).colorScheme.textResultGrad2
        ]));

  Color get title4 => dark()
      ? const Color.fromARGB(255, 26, 151, 97)
      : const Color.fromARGB(255, 26, 151, 97);
  Color get title5 =>
      dark() ? const Color(0xFFB5C2D4) : const Color(0xFF172339);
  Color get titleErr =>
      dark() ? const Color(0xFFDF524B) : const Color.fromARGB(255, 195, 42, 34);

  TextStyle get titleInverse => TextStyle(
        color: dark() ? const Color(0xFFF0F0F0) : const Color(0xFFFFFFFF),
        fontSize: 15,
        fontWeight: FontWeight.w500,
        fontFamily: Constants.fontFredoka,
      );

  Color get dialogHeaderText =>
      dark() ? const Color(0xFFB5C2D4) : const Color(0xFF202020);

  Color get cardHome =>
      dark() ? const Color.fromARGB(255, 40, 40, 40) : Colors.white;
  Color get pageHome =>
      dark() ? const Color.fromARGB(255, 0, 0, 0) : const Color(0xFFFAFAFA);

  Color get card => dark()
      ? const Color.fromARGB(255, 26, 26, 26)
      : const Color.fromARGB(255, 255, 255, 255);
  Color get cardSuccess => dark()
      ? const Color.fromARGB(255, 36, 80, 68)
      : const Color.fromARGB(255, 141, 186, 174);
  Color get cardError => dark()
      ? const Color.fromARGB(255, 114, 65, 65)
      : const Color.fromARGB(255, 207, 173, 173);

  Color get cardDefinition =>
      dark() ? const Color(0xFFF0F0F0) : const Color(0xFF202020);

  Color get cardExample =>
      dark() ? const Color(0xFFCFCFCF) : const Color(0xF06A6A6A);

  Color get page => dark()
      ? const Color.fromARGB(255, 0, 0, 0)
      : const Color.fromARGB(255, 241, 241, 241);
  Color get shadowBox =>
      dark() ? const Color(0x05FFFFFF) : const Color(0x3F000000);

  Color get shadow2 =>
      dark() ? const Color(0xFFFFFFFF) : const Color(0x50000000);

  Color get menuBorderColor =>
      dark() ? const Color(0xFF303030) : const Color(0x15000000);

  Color get buttonOption1 => const Color(0xFF467C71);
  Color get buttonOption2 => dark()
      ? const Color.fromARGB(255, 108, 49, 111)
      : const Color(0xFFA24AA7);
  Color get buttonOption3 => const Color(0xFF31564D);
  Color get buttonOption4 => const Color(0xFF656789);
  Color get buttonOptionText =>
      dark() ? const Color(0xFFDFDFDF) : const Color(0xFFDFDFDF);

  Color get progressStepsSelected => dark()
      ? const Color.fromARGB(255, 175, 175, 175)
      : const Color(0xFFDFDFDF);
  Color get progressStepsUnselected =>
      dark() ? const Color.fromARGB(255, 65, 65, 65) : const Color(0xFFDFDFDF);

  Color get cardText =>
      dark() ? const Color(0xFFCACACA) : const Color(0xFF202020);

  Color get cardIcon =>
      dark() ? const Color(0xFF30CC89) : const Color(0xFF172339);

  Color get placeholder1 =>
      dark() ? const Color(0xFF30CC89) : const Color(0x7F172339);

  Color get iconColor => dark()
      ? const Color.fromARGB(255, 226, 226, 226)
      : const Color(0xFF323232);

  Color get roundButton =>
      dark() ? const Color(0x10FFFFFF) : const Color(0x0a000000);

  Color get textResultGrad1 => dark()
      ? const Color.fromARGB(255, 255, 102, 6)
      : const Color.fromARGB(255, 255, 102, 6);

  Color get textResultGrad2 =>
      dark() ? Colors.yellow : const Color.fromARGB(255, 166, 153, 38);

  //
  // buttons
  Color get button2 => const Color(0xFF767676);
  Color get button2Text =>
      dark() ? const Color(0xFFB5C2D4) : const Color(0xFF172339);
  Color get button2Hover => const Color.fromARGB(255, 82, 85, 86);

  Color get button3 =>
      dark() ? const Color(0xFF2A3D58) : const Color(0xFF172339);
  Color get button3Text =>
      dark() ? const Color(0xFFB5C2D4) : const Color(0xFFFFFFFF);
  Color get button3Hover => dark()
      ? const Color.fromARGB(255, 58, 85, 122)
      : const Color.fromARGB(255, 58, 85, 122);

  Color get button3Inversed =>
      dark() ? const Color(0xFF1EB172) : const Color(0xFF1EB172);
  Color get button3HoverInverted => dark()
      ? const Color.fromARGB(255, 53, 225, 150)
      : const Color(0xFF1EB172);
  Color get button3TextInversed =>
      dark() ? const Color(0xFF111F32) : const Color(0xFFF0F5F9);

  Color get button4 =>
      dark() ? const Color(0xFF1EB172) : const Color(0xFF1EB172);
  Color get button4Hover => dark()
      ? const Color.fromARGB(255, 33, 194, 124)
      : const Color.fromARGB(255, 33, 194, 124);
  Color get button4Text =>
      dark() ? const Color(0xFF111F32) : const Color(0xFF111F32);

  Color get searchList => dark() ? Colors.transparent : Colors.transparent;
  Color get search =>
      dark() ? const Color(0xFFD1FFEB) : const Color(0xFFFFFFFF);
  Color get searchListText =>
      dark() ? const Color(0xFF1EB172) : const Color(0xFF1EB172);
  Color get searchListTextActive =>
      dark() ? const Color(0xFF111F32) : const Color(0xFF111F32);
  Color get searchListActive =>
      dark() ? const Color(0xFF1EB172) : const Color(0xFF1EB172);
  Color get searchListBorderActive =>
      dark() ? const Color(0xFF1EB172) : const Color(0xFF1EB172);
  Color get searchListBorderOff =>
      dark() ? const Color(0xFFB5C2D4) : const Color(0xFFB5C2D4);

  //
  // html block colors
  Color get mainColor =>
      dark() ? const Color.fromRGBO(181, 194, 212, 1) : const Color(0xFF172339);

  Color get activeMainColor =>
      dark() ? const Color.fromRGBO(48, 204, 137, 1) : const Color(0xFF1EB172);

  Color get mainDisabledColor50 =>
      dark() ? const Color.fromRGBO(91, 112, 142, 1) : const Color(0xFF98A2B5);

  Color get toastNormal => const Color(0xFFDBDBDB);
  Color get toastWarning => const Color(0xFFDBDBDB);
  Color get toastBad => const Color(0xFFDBDBDB);
  Color get white => const Color(0xFFFFFFFF);

  Color get transparent => Colors.transparent;
}

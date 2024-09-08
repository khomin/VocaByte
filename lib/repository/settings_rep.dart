import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:vocabyte/app/app_theme.dart';
import 'package:vocabyte/domains/numerals/numerals_page.dart';
import 'package:vocabyte/app/const_values.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsData {}

class Initial {
  Initial(
      {required this.theme, required this.version, required this.onboarding});
  ThemeType theme;
  String version;
  bool onboarding;
}

class SettingsRep {
  static final SettingsRep _instance = SettingsRep._internal();

  static const _themeKey = 'theme_type';
  static const _screenSizeWidthKey = 'screen_w_key';
  static const _screenSizeHeightKey = 'screen_h_k';
  static const _numLevelKey = 'num_lev_k';
  static const _dayGoalKey = 'goal_k';
  static const _onboardingKey = 'onboard';

  final onChanged = BehaviorSubject();

  Future<Initial> init() async {
    var res = await Future.wait([
      // theme
      SettingsRep().getTheme(),
      // version
      ConstValues().getVersion(),
      // first start
      SettingsRep().getOnboarding()
    ]);
    return Initial(
        theme: res[0] as ThemeType,
        version: res[1] as String,
        onboarding: res[2] as bool);
  }

  //
  // theme change
  void changeTheme(ThemeType themeType) {
    () async {
      final prefs = await SharedPreferences.getInstance();
      prefs.setInt(_themeKey, themeType.index);
    }();
  }

  //
  // theme get
  Future<ThemeType> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    var theme = prefs.getInt(_themeKey);
    if (theme == null) {
      return ThemeType.system;
    }
    return ThemeType.values[theme];
  }

  void setScreenSize(Size size) async {
    final prefs = await SharedPreferences.getInstance();
    var oldW = prefs.getInt(_screenSizeWidthKey);
    var oldH = prefs.getInt(_screenSizeHeightKey);
    if ((oldH == null || oldW == null)) {
      // if no stored value (first time)
      await prefs.setInt(_screenSizeWidthKey, size.width.toInt());
      await prefs.setInt(_screenSizeHeightKey, size.height.toInt());
      //logDebug('$tag: screen size: $size (no stored)');
    } else if ((size.width.toInt() != oldW.toInt() ||
            size.height.toInt() != oldH.toInt()) &&
        size.width.toInt() >= ConstValues.minWindowSize.width.toInt() &&
        size.height.toInt() > ConstValues.minWindowSize.height.toInt()) {
      // if size changed and > minWindowSize
      await prefs.setInt(_screenSizeWidthKey, size.width.toInt());
      await prefs.setInt(_screenSizeHeightKey, size.height.toInt());
    }
  }

  Future<Size?> getScreenSize() async {
    final prefs = await SharedPreferences.getInstance();
    var w = prefs.getInt(_screenSizeWidthKey);
    var h = prefs.getInt(_screenSizeHeightKey);
    if (w == null || h == null) return null;
    var size = Size(w.toDouble(), h.toDouble());

    return size;
  }

  void setNumeralsLevel(NumeralsLevel v) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(_numLevelKey, v.index);
  }

  Future<NumeralsLevel> getNumeralsLevel() async {
    final prefs = await SharedPreferences.getInstance();
    return NumeralsLevel.values[prefs.getInt(_numLevelKey) ?? 0];
  }

  void setDailyGoal(int v) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(_dayGoalKey, v);
  }

  Future<int> getDailyGoal() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_dayGoalKey) ?? ConstValues.goalDefault;
  }

  void setOnboarding(bool v) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(_onboardingKey, v);
  }

  Future<bool> getOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    var v = prefs.getBool(_onboardingKey) ?? true;
    return v;
  }

  //
  // remove all stored values
  Future removeAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_themeKey);
  }

  factory SettingsRep() {
    return _instance;
  }
  SettingsRep._internal();
}

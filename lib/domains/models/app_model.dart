import 'package:flutter/material.dart';
import 'package:vocabyte/app/app_theme.dart';
import 'package:vocabyte/app/ui_helper.dart';
import 'package:vocabyte/components/navigation_observer.dart';
import 'package:vocabyte/domains/drawer/drawer_menu.dart';
import 'package:vocabyte/repository/settings_rep.dart';

class AppModel with ChangeNotifier {
  final GlobalKey<NavigatorState> appNavKey;
  late final NavigatorObserverCustom appNavObserver;
  final Function(ThemeType theme) onThemeChanged;
  final Function() onUpdateTasks;

  bool _drawerOn = false;
  String _appVersion = '';
  bool _onboarding = false;
  bool _serviceInited = false;
  bool _waitCopyResource = false;
  ThemeType _theme = ThemeType.system;
  MenuPageType _page = MenuPageType.home;
  bool get drawerOn => _drawerOn;

  AppModel(
      {required this.appNavKey,
      required this.onUpdateTasks,
      required this.onThemeChanged}) {
    appNavObserver = NavigatorObserverCustom(onChanged: (name) async {
      var page = UiHelper().routeNameToType(name);
      var drawer = UiHelper.isDrawerOn(page);

      if (page == MenuPageType.home) {
        onUpdateTasks();
      }

      _drawerOn = drawer;
      _page = page;

      Future.microtask(() {
        notifyListeners();
      });
    });
  }

  String get appVersion => _appVersion;
  set appVersion(String v) {
    if (_appVersion != v) {
      _appVersion = v;
      notifyListeners();
    }
  }

  bool get onboarding => _onboarding;
  set onboarding(bool v) {
    if (_onboarding != v) {
      _onboarding = v;
      SettingsRep().setOnboarding(false);
      notifyListeners();
    }
  }

  bool get serviceInited => _serviceInited;
  set serviceInited(bool v) {
    if (_serviceInited != v) {
      _serviceInited = v;
      notifyListeners();
    }
  }

  bool get waitCopyResource => _waitCopyResource;
  set waitCopyResource(bool v) {
    if (_waitCopyResource != v) {
      _waitCopyResource = v;
      notifyListeners();
    }
  }

  ThemeType get theme => _theme;
  set theme(ThemeType v) {
    if (_theme != v) {
      _theme = v;
      notifyListeners();
    }
  }

  MenuPageType get page => _page;

  void goToPage({required MenuPageType page, required bool replace}) {
    if (replace) {
      appNavKey.currentState?.popUntil((route) => route.isFirst);
      appNavKey.currentState?.pushNamed(page.name);
    } else {
      appNavKey.currentState?.pushNamed(page.name);
    }
    _page = page;
    _drawerOn = UiHelper.isDrawerOn(page);
    notifyListeners();
  }

  void pageBack() {
    if (appNavKey.currentState?.canPop() == true) {
      appNavKey.currentState?.pop();
    }
  }

  void update() {
    notifyListeners();
  }
}

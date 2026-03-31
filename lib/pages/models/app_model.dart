import 'package:flutter/material.dart';
import 'package:vocabyte/repository/settings_rep.dart';

enum PageType { home, searchWord, manageWords, settings }

class AppModel with ChangeNotifier {
  String _appVersion = '';
  ThemeMode _theme = ThemeMode.system;
  bool _onboarding = false;
  bool _serviceInited = false;
  bool _waitCopyResource = false;
  bool _waitMigratingDb = false;
  PageType currentPage = PageType.home;

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

  bool get waitMigratingDb => _waitMigratingDb;
  set waitMigratingDb(bool v) {
    if (_waitMigratingDb != v) {
      _waitMigratingDb = v;
      notifyListeners();
    }
  }

  set theme(ThemeMode v) {
    if (_theme != v) {
      _theme = v;
      SettingsRep().setTheme(v);
      notifyListeners();
    }
  }

  ThemeMode get theme => _theme;

  void setCurrentPage(PageType v) {
    currentPage = v;
    notify();
  }

  void notify() {
    notifyListeners();
  }
}

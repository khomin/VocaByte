import 'package:flutter/material.dart';
import 'package:vocabyte/pages/settings/theme/app_theme.dart';
import 'package:vocabyte/repository/settings_rep.dart';

class AppModel with ChangeNotifier {
  String _appVersion = '';
  ThemeType _theme = ThemeType.system;
  bool _onboarding = false;
  bool _serviceInited = false;
  bool _waitCopyResource = false;
  bool _waitMigratingDb = false;

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

  set theme(ThemeType v) {
    if (_theme != v) {
      _theme = v;
      notifyListeners();
    }
  }

  ThemeType get theme => _theme;

  void update() {
    notifyListeners();
  }
}

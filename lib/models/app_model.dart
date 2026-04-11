import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:vocabyte/repository/settings_rep.dart';

enum PageType { home, settings }

class AppModel with ChangeNotifier {
  String appVersion = '';
  ThemeMode theme = ThemeMode.system;
  bool onboarding = false;
  bool serviceInited = false;
  bool waitCopyResource = false;
  bool waitMigratingDb = false;
  PageType currentPage = PageType.home;
  bool _disposed = false;

  AppModel({required this.theme}) {
    Future.microtask(() async {
      var packageInfo = await PackageInfo.fromPlatform();
      appVersion = packageInfo.version;
      notify();
    });
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  void notify() {
    if (_disposed) return;
    notifyListeners();
  }

  void setOnboarding(bool v) {
    if (onboarding != v) {
      onboarding = v;
      SettingsRep().setOnboarding(false);
      notifyListeners();
    }
  }

  void setTheme(ThemeMode v) {
    if (theme != v) {
      theme = v;
      SettingsRep().setTheme(v);
      notifyListeners();
    }
  }

  void setCurrentPage(PageType v) {
    currentPage = v;
    notify();
  }
}

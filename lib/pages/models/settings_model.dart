import 'package:flutter/material.dart';
import 'package:vocabyte/components/disposable_stream.dart';
import 'package:vocabyte/pages/numerals/numerals_page.dart';
import 'package:vocabyte/repository/settings_rep.dart';

class SettingsModel with ChangeNotifier {
  NumeralsLevel? numLevel;
  int? dailyGoal;
  var importProfileBusy = false;
  var exportBusy = false;
  var importBusy = false;
  var exportProfileBusy = false;
  var useSound = false;
  ThemeMode theme = ThemeMode.system;
  final iconSize = 25.0;
  final _dispStream = DisposableStream();
  var _disposed = false;

  SettingsModel() {
    _dispStream.add(SettingsRep().onChanged.stream.listen((_) {
      update();
    }));
  }

  @override
  void dispose() {
    _dispStream.dispose();
    _disposed = true;
    super.dispose();
  }

  void notify() {
    if (_disposed) return;
    notifyListeners();
  }

  void update() async {
    numLevel = await SettingsRep().getNumeralsLevel();
    dailyGoal = await SettingsRep().getDailyGoal();
    theme = await SettingsRep().getTheme();
    useSound = await SettingsRep().getUseSound();
    notify();
  }
}

import 'package:flutter/material.dart';

class WizardItemData {
  WizardItemData({required this.title, required this.body});
  String title;
  String body;
}

class WizardModel with ChangeNotifier {
  var list = <WizardItemData>[];
  var _disposed = false;

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  void notify() {
    if (_disposed) return;
    notifyListeners();
  }
}

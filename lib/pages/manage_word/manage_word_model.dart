import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:vocabyte/services/protobuf/proto.pb.dart';

class ManageWordModel with ChangeNotifier {
  final TextEditingController controller = TextEditingController();
  final FocusNode focus = FocusNode();
  String? query;
  var found = <WordInReview>[];
  var filtered = <WordInReview>[];
  var _inited = false;

  bool get inited => _inited;

  set inited(bool v) {
    _inited = v;
    notifyListeners();
  }

  void search(String v) async {
    if (v.isEmpty) {
      reset();
      return;
    }
    query = v;
    notifyListeners();

    if (v.isNotEmpty) {
      filtered.clear();
      filtered.addAll(found.where((it) {
        return it.word.toLowerCase().startsWith(v.toLowerCase());
      }));
    } else {
      filtered = [];
    }
    notifyListeners();
  }

  void reset() {
    query = null;
    controller.text = '';
    filtered.clear();
    notifyListeners();
  }

  void loseFocus() {
    focus.unfocus();
  }

  void setModels({required List<WordInReview> data}) {
    found.clear();
    for (var it in data) {
      var it2 = found.firstWhereOrNull((p) => it == p);
      if (it2 == null) {
        found.add(it);
      }
    }
    notifyListeners();
  }

  void notify() => notifyListeners();
}

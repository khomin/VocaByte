import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:vocabyte/services/protobuf/proto.pb.dart';

class ManageWordModel with ChangeNotifier {
  final TextEditingController controller = TextEditingController();
  final FocusNode focus = FocusNode();
  String? search;
  var listModel = <WordInReview>[];
  var listModelFilter = <WordInReview>[];
  var _inited = false;

  bool get inited => _inited;

  set inited(bool v) {
    _inited = v;
    notifyListeners();
  }

  void updateSearch(String v) async {
    if (v.isEmpty) {
      clearSearch();
      return;
    }
    search = v;
    notifyListeners();

    if (v.isNotEmpty) {
      listModelFilter.clear();
      listModelFilter.addAll(listModel.where((it) {
        return it.word.toLowerCase().startsWith(v.toLowerCase());
      }));
    } else {
      listModelFilter = [];
    }
    notifyListeners();
  }

  void clearSearch() {
    search = null;
    controller.text = '';
    listModelFilter.clear();
    notifyListeners();
  }

  void loseFocus() {
    focus.unfocus();
  }

  void setModels({required List<WordInReview> data}) {
    listModel.clear();
    for (var it in data) {
      var it2 = listModel.firstWhereOrNull((p) => it == p);
      if (it2 == null) {
        listModel.add(it);
      }
    }
    notifyListeners();
  }

  void notify() => notifyListeners();
}

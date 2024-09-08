import 'package:flutter/material.dart';
import 'package:vocabyte/domains/models/word_data.dart';
import 'package:vocabyte/repository/app_rep.dart';
import 'package:vocabyte/services/service_api.dart';

class SearchWordModel with ChangeNotifier {
  final TextEditingController controller = TextEditingController();
  final FocusNode focus = FocusNode();
  String query = '';
  var found = <FullInfo>[];
  var recent = <FullInfo>[];

  @override
  void dispose() {
    super.dispose();
    focus.dispose();
  }

  void search(String v) async {
    query = v;
    if (v.isNotEmpty) {
      var list = <FullInfo>[];
      var search = await ServiceApi().searchWords(word: v, useLike: true);
      for (var it in search.item) {
        var info = await AppRep().wordToInfo(it);
        if (info != null) {
          list.add(info);
        }
      }
      list.sort((a, b) {
        if (a.freq == -1) {
          return 1;
        }
        if (b.freq == -1) {
          return -1;
        }
        return a.freq.compareTo(b.freq);
      });
      updateList(list);
    } else {
      updateList(<FullInfo>[]);
    }
  }

  void updateList(dynamic v) {
    found = v;
    notifyListeners();
  }

  void reset() {
    controller.text = '';
    search('');
    loseFocus();
  }

  void loseFocus() {
    focus.unfocus();
  }
}

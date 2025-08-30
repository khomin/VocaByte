import 'package:flutter/material.dart';
import 'package:vocabyte/pages/models/word_data.dart';
import 'package:vocabyte/repository/app_rep.dart';
import 'package:vocabyte/services/service_api.dart';
import 'package:collection/collection.dart';

class SearchInfo extends FullInfo {
  SearchInfo(
      {required super.word,
      required super.transcript,
      required super.meaning,
      required super.freq,
      required this.isInStudy});
  bool isInStudy;
}

class SearchWordModel with ChangeNotifier {
  final TextEditingController controller = TextEditingController();
  final FocusNode focus = FocusNode();
  String query = '';
  var found = <SearchInfo>[];
  var recent = <SearchInfo>[];

  @override
  void dispose() {
    super.dispose();
    focus.dispose();
  }

  void search(String v) async {
    query = v;
    if (v.isNotEmpty) {
      var list = <SearchInfo>[];
      var manageList = AppRep().onManageWordChanged.valueOrNull ?? [];

      var search = await ServiceApi().searchWords(word: v, useLike: true);
      for (var it in search.item) {
        var info = await AppRep().wordToInfo(it);
        if (info != null) {
          list.add(SearchInfo(
              word: info.word,
              transcript: info.transcript,
              meaning: info.meaning,
              freq: info.freq,
              isInStudy: manageList.firstWhereOrNull((manage) {
                    return manage.word.toLowerCase() == info.word.toLowerCase();
                  }) !=
                  null));
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
      updateList([]);
    }
  }

  void updateList(List<SearchInfo> v) {
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

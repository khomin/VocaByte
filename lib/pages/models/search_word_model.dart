import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:vocabyte/components/disposable_stream.dart';
import 'package:vocabyte/pages/models/word_data.dart';
import 'package:vocabyte/pages/page_search_word/page_search.dart';
import 'package:vocabyte/repository/app_rep.dart';
import 'package:vocabyte/services/protobuf/proto.pb.dart';
import 'package:vocabyte/services/service_api.dart';
import 'package:vocabyte/main.dart';

class SearchInfo extends FullInfo {
  SearchInfo({
    required super.word,
    required super.transcript,
    required super.meaning,
    required super.freq,
    required super.examples,
    required this.isInStudy,
  });
  bool isInStudy;
}

class SearchWordModel with ChangeNotifier {
  SearchMode mode = SearchMode.search;
  final TextEditingController controller = TextEditingController();
  final FocusNode focus = FocusNode();
  String query = '';
  var searchResult = <SearchInfo>[];
  var recent = <SearchInfo>[];
  var manageList = <WordInReview>[];
  var manageFiltered = <WordInReview>[];
  final _dispStream = DisposableStream();
  var _disposed = false;

  SearchWordModel() {
    _dispStream.add(getIt<AppRep>().onManageWordChanged.listen((v) async {
      manageList = v ?? [];
      if (_disposed) return;
      notify();
    }));
  }

  @override
  void dispose() {
    focus.dispose();
    _dispStream.dispose();
    _disposed = true;
    super.dispose();
  }

  void notify() {
    if (_disposed) return;
    notifyListeners();
  }

  void search(String query) async {
    this.query = query;
    switch (mode) {
      case SearchMode.search:
        if (query.isNotEmpty) {
          var list = <SearchInfo>[];
          var manageList =
              getIt<AppRep>().onManageWordChanged.valueOrNull ?? [];
          var search = await ServiceApi().getDictionary(
            word: query,
            useLike: true,
          );
          for (var it in search.item) {
            var info = await getIt<AppRep>().wordToInfo(it);
            if (info != null) {
              list.add(SearchInfo(
                  word: info.word,
                  transcript: info.transcript,
                  meaning: info.meaning,
                  freq: info.freq,
                  examples: info.examples,
                  isInStudy: manageList.firstWhereOrNull((manage) {
                        return manage.word.toLowerCase() ==
                            info.word.toLowerCase();
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
          searchResult = list;
        } else {
          controller.text = '';
          searchResult = [];
        }
        notify();
        break;
      case SearchMode.manage:
        if (query.isEmpty) {
          controller.text = '';
          manageFiltered = [];
          notify();
          return;
        }
        if (query.isNotEmpty) {
          manageFiltered.clear();
          manageFiltered.addAll(manageList.where((it) {
            return it.word.toLowerCase().startsWith(query.toLowerCase());
          }));
        } else {
          manageFiltered = [];
        }
        notify();
        break;
    }
  }

  void reset() {
    controller.text = '';
    search('');
    loseFocus();
  }

  void loseFocus() {
    focus.unfocus();
  }

  void setMode(SearchMode mode) {
    if (this.mode == mode) return;
    this.mode = mode;
    notify();
    search(query);
  }

  bool nothingFound() {
    switch (mode) {
      case SearchMode.search:
        return query.isNotEmpty && searchResult.isEmpty;
      case SearchMode.manage:
        return query.isNotEmpty && manageFiltered.isEmpty;
    }
  }

  bool noWordsToManage() {
    return query.isEmpty && manageList.isEmpty;
  }

  bool showRecent() {
    return query.isEmpty;
  }
}

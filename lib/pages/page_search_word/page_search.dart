import 'package:collection/collection.dart';
import 'package:vocabyte/components/circle_button.dart';
import 'package:vocabyte/components/disposable_stream.dart';
import 'package:vocabyte/components/hover_button.dart';
import 'package:vocabyte/components/hover_click.dart';
import 'package:vocabyte/components/round_button.dart';
import 'package:vocabyte/pages/models/search_word_model.dart';
import 'package:vocabyte/pages/models/word_data.dart';
import 'package:vocabyte/pages/page_search_word/word_item.dart';
import 'package:flutter/material.dart';
import 'package:vocabyte/repository/app_rep.dart';
import 'package:vocabyte/app/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:vocabyte/services/service_api.dart';

class SearchWordPage extends StatefulWidget {
  const SearchWordPage({required this.onShow, super.key});
  final Function(FullInfo data) onShow;

  @override
  SearchWordPageState createState() => SearchWordPageState();
}

class SearchWordPageState extends State<SearchWordPage> {
  final _dispStream = DisposableStream();
  late SearchWordModel _model;
  final tag = 'searchWord';

  @override
  void initState() {
    super.initState();
    _model = SearchWordModel();
  }

  @override
  void dispose() {
    super.dispose();
    _model.dispose();
    _dispStream.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: ChangeNotifierProvider.value(
                value: _model,
                builder: (context, child) {
                  return CustomScrollView(
                      physics: const ClampingScrollPhysics(),
                      slivers: [
                        SliverAppBar(
                            automaticallyImplyLeading: false,
                            flexibleSpace: _appBar()),
                        //
                        _searchResult(),
                        //
                        if (context.watch<SearchWordModel>().query.isNotEmpty &&
                            context.watch<SearchWordModel>().found.isEmpty)
                          _searchNotFound(),
                        //
                        // recent viewed
                        if (context.watch<SearchWordModel>().query.isEmpty)
                          _searchRecent()
                      ]);
                })));
  }

  Widget _appBar() {
    return Container(
        color: Theme.of(context).colorScheme.card,
        child: Row(children: [
          RoundButton(
              padding: const EdgeInsets.only(left: 10),
              color: Colors.transparent,
              iconColor: Theme.of(context).colorScheme.white,
              size: const Size(50, 50),
              iconSize: 22,
              iconData: Icons.arrow_back_ios,
              onPressed: (p0) {
                Navigator.of(context).pop();
              }),
          Flexible(child: _input())
        ]));
  }

  Widget _input() {
    return HoverClick(
        onPressedL: (_) {
          _model.focus.requestFocus();
        },
        child: SizedBox(
            height: kToolbarHeight,
            child: Row(children: [
              Flexible(
                  child: TextField(
                      controller: _model.controller,
                      focusNode: _model.focus,
                      onChanged: (value) {
                        _model.search(value);
                      },
                      onEditingComplete: () {},
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inputText,
                          fontSize: 15),
                      decoration: InputDecoration(
                        fillColor:
                            Theme.of(context).colorScheme.inputBackground,
                        contentPadding:
                            const EdgeInsets.only(left: 10, right: 10),
                        hintText: 'Enter word',
                        hintStyle: TextStyle(
                            color: Theme.of(context).colorScheme.inputHint,
                            fontSize: 15),
                        enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.zero),
                            borderSide: BorderSide(color: Colors.transparent)),
                        focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            borderSide: BorderSide(color: Colors.transparent)),
                      ))),
              Builder(builder: (context) {
                var search = context.watch<SearchWordModel>().query;
                var empty = search.isEmpty;
                if (empty) {
                  return const SizedBox();
                }
                return RoundButton(
                    iconData: Icons.clear_sharp,
                    color: Colors.transparent,
                    iconSize: 22,
                    margin: const EdgeInsets.only(right: 15),
                    size: const Size(40, 40),
                    iconColor:
                        Theme.of(context).colorScheme.white.withOpacity(0.5),
                    onPressed: (_) {
                      _model.reset();
                    });
              })
            ])));
  }

  Widget _searchResult() {
    return Builder(builder: (context) {
      return SliverList.builder(
          itemCount: context.watch<SearchWordModel>().found.length,
          itemBuilder: (BuildContext context, int index) {
            var obj = context.read<SearchWordModel>().found[index];
            return WordItem(
                data: obj,
                onClicked: () async {
                  _model.loseFocus();
                  widget.onShow.call(obj);
                });
          });
    });
  }

  Widget _searchNotFound() {
    return SliverFillRemaining(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text('Nothing found',
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Theme.of(context).colorScheme.titel4))
    ]));
  }

  _searchRecent() {
    return StreamBuilder(
        stream: AppRep().onRecentWords,
        builder: (context, snapshot) {
          return SliverList.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                var model = snapshot.data![index];
                return WordItem(
                    data: model,
                    onClicked: () async {
                      // recent words have only part of data
                      // have to use request to get full
                      // before navigation
                      var r = await ServiceApi()
                          .searchWords(word: model.word, useLike: false);

                      var word = r.item.firstWhereOrNull((it) =>
                          it.value.toLowerCase() == model.word.toLowerCase());
                      if (word == null) {
                        return;
                      }
                      var info = await AppRep().wordToInfo(word);
                      _model.loseFocus();
                      if (info == null) return;
                      AppRep().cachedWord = info;
                      widget.onShow.call(info);
                    });
              });
        });
  }
}

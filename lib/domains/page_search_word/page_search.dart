import 'package:collection/collection.dart';
import 'package:vocabyte/components/disposable_stream.dart';
import 'package:vocabyte/components/hover_button.dart';
import 'package:vocabyte/domains/models/search_word_model.dart';
import 'package:vocabyte/domains/models/word_data.dart';
import 'package:vocabyte/domains/page_search_word/word_item.dart';
import 'package:flutter/material.dart';
import 'package:vocabyte/repository/app_rep.dart';
import 'package:vocabyte/app/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:vocabyte/services/service_api.dart';

class PageSearchWord extends StatefulWidget {
  const PageSearchWord({required this.onShowWord, super.key});
  final Function(FullInfo data) onShowWord;

  @override
  PageSearchWordState createState() => PageSearchWordState();
}

class PageSearchWordState extends State<PageSearchWord> {
  final _dispStream = DisposableStream();
  late SearchWordModel _model;
  final tag = 'searchWord';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _dispStream.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => SearchWordModel(),
        builder: (context, child) {
          _model = context.read<SearchWordModel>();
          return CustomScrollView(slivers: [
            SliverAppBar(
              pinned: true,
              leadingWidth: 0,
              leading: Container(),
              backgroundColor: Theme.of(context).colorScheme.baseColor1,
              surfaceTintColor: Theme.of(context).colorScheme.baseColor1,
              toolbarHeight: 60,
              title: _searchInput(),
            ),
            //
            // search result
            SliverList.builder(
                itemCount: context.watch<SearchWordModel>().found.length,
                itemBuilder: (BuildContext context, int index) {
                  var obj = context.read<SearchWordModel>().found[index];
                  return WordItem(
                      data: obj,
                      onClicked: () async {
                        _model.reset();
                        _model.loseFocus();
                        AppRep().cachedWord = obj;
                        widget.onShowWord.call(obj);
                      });
                }),
            //
            // nothing found
            if (context.watch<SearchWordModel>().query.isNotEmpty &&
                context.watch<SearchWordModel>().found.isEmpty)
              SliverFillRemaining(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Text('Nothing found',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.titel4))
                  ])),
            //
            // recent viewed
            if (context.watch<SearchWordModel>().query.isEmpty)
              StreamBuilder(
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
                                var r = await ServiceApi().searchWords(
                                    word: model.word, useLike: false);

                                var word = r.item.firstWhereOrNull((it) =>
                                    it.value.toLowerCase() ==
                                    model.word.toLowerCase());
                                if (word == null) {
                                  return;
                                }
                                var info = await AppRep().wordToInfo(word);
                                _model.loseFocus();
                                if (info == null) return;
                                AppRep().cachedWord = info;
                                widget.onShowWord.call(info);
                              });
                        });
                  })
          ]);
        });
  }

  Widget _searchInput() {
    return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(children: [
                Row(children: [
                  Expanded(
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
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(6)),
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .listSplit)),
                              hintText: 'Enter word',
                              hintStyle: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.inputHint,
                                  fontSize: 15),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      const BorderRadius.all(Radius.zero),
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .listSplit)))))
                ]),
                if (_model.query.isNotEmpty)
                  Positioned(
                      top: 0,
                      bottom: 0,
                      right: 10,
                      child: HoverButton(
                        icon: Icons.cancel,
                        color: Theme.of(context).colorScheme.inputHint,
                        hoverColor: Theme.of(context).colorScheme.inputHint,
                        onClicked: (_) {
                          _model.reset();
                        },
                      ))
              ])
            ]));
  }
}

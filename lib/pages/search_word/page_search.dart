import 'dart:async';

import 'package:collection/collection.dart';
import 'package:vocabyte/components/chip_item.dart';
import 'package:vocabyte/components/disposable_stream.dart';
import 'package:vocabyte/components/hover_click.dart';
import 'package:vocabyte/components/round_button.dart';
import 'package:vocabyte/main.dart';
import 'package:vocabyte/pages/search_word/manage_item.dart';
import 'package:vocabyte/models/search_word_model.dart';
import 'package:vocabyte/models/word_data.dart';
import 'package:vocabyte/pages/search_word/search_item.dart';
import 'package:flutter/material.dart';
import 'package:vocabyte/repository/app_rep.dart';
import 'package:vocabyte/repository/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:vocabyte/resource/constants.dart';
import 'package:vocabyte/services/service_api.dart';

enum SearchMode { search, manage }

class SearchWordPage extends StatefulWidget {
  const SearchWordPage({
    required this.mode,
    required this.onShow,
    super.key,
  });
  final SearchMode mode;
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
    _model.mode = widget.mode;

    Future.delayed(
        Constants.searchHeroDuration + const Duration(milliseconds: 20), () {
      _model.focus.requestFocus();
    });
  }

  @override
  void dispose() {
    _model.dispose();
    _dispStream.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: ChangeNotifierProvider<SearchWordModel>.value(
                value: _model,
                builder: (context, child) {
                  var padding = MediaQuery.of(context).padding;
                  return CustomScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      slivers: [
                        SliverAppBar(
                            pinned: true,
                            primary: false,
                            toolbarHeight:
                                Constants.homeAppBarHeight + padding.top,
                            automaticallyImplyLeading: false,
                            backgroundColor:
                                Theme.of(context).colorScheme.appBar,
                            surfaceTintColor: Colors.transparent,
                            titleSpacing: 0,
                            title: HoverClick(
                              onPressedL: (_) {
                                _model.focus.requestFocus();
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  child: Hero(
                                    tag: 'search_bar',
                                    flightShuttleBuilder: (flightContext,
                                        animation,
                                        flightDirection,
                                        fromHeroContext,
                                        toHeroContext) {
                                      var borderRadius = BorderRadiusTween(
                                        begin: const BorderRadius.only(
                                            topLeft: Radius.circular(50),
                                            topRight: Radius.circular(50)),
                                        end: BorderRadius.circular(8),
                                      );
                                      return AnimatedBuilder(
                                        animation: animation,
                                        builder: (context, child) {
                                          return Material(
                                            type: MaterialType.canvas,
                                            color: Colors.transparent,
                                            clipBehavior: Clip.antiAlias,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: borderRadius
                                                  .evaluate(animation)!,
                                            ),
                                            child: toHeroContext.widget,
                                          );
                                        },
                                      );
                                    },
                                    child: Material(
                                      color: Colors.transparent,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero),
                                      child: Container(
                                        padding:
                                            EdgeInsets.only(top: padding.top),
                                        height: Constants.homeAppBarHeight +
                                            padding.top,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .textInputBox,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: _buildSearchInput(),
                                      ),
                                    ),
                                  )),
                            )),
                        //
                        _searchResult(),
                      ]);
                })));
  }

  Widget _searchResult() {
    return Builder(builder: (context) {
      final animation =
          ModalRoute.of(context)?.animation ?? const AlwaysStoppedAnimation(1);
      var mode = context.select<SearchWordModel, SearchMode>(
        (value) => value.mode,
      );
      return SliverFillRemaining(
        child: AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              final isReversing = animation.status == AnimationStatus.reverse;
              if (isReversing) {
                return Opacity(
                  opacity: isReversing ? 0.0 : 1.0,
                  child: child,
                );
              }
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            child: Container(
              color: Theme.of(context).colorScheme.appBar,
              child: Column(children: [
                //
                Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Row(
                      children: [
                        ChipItem(
                          text: 'Search',
                          active: mode == SearchMode.search,
                          onPressed: () {
                            _model.setMode(SearchMode.search);
                          },
                        ),
                        const SizedBox(width: 8),
                        ChipItem(
                          text: 'Manage words',
                          active: mode == SearchMode.manage,
                          onPressed: () {
                            _model.setMode(SearchMode.manage);
                          },
                        )
                      ],
                    )),
                //
                Flexible(
                  child: Builder(builder: (context) {
                    var model = context.watch<SearchWordModel>();
                    switch (mode) {
                      case SearchMode.search:
                        return model.nothingFound()
                            ? Padding(
                                padding: const EdgeInsets.only(top: 50),
                                child: Text('Nothing found',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        fontFamily: Constants.fontFredoka,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .title5)))
                            : model.showRecent()
                                ? _recent()
                                : Container(
                                    margin: const EdgeInsets.only(top: 20),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .itemSearch,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        itemCount: model.searchResult.length,
                                        itemBuilder: (context, index) {
                                          var obj = model.searchResult[index];
                                          return SearchWordItem(
                                              data: obj,
                                              key: ValueKey('s-search-$obj'),
                                              onClicked: () async {
                                                _model.loseFocus();
                                                widget.onShow.call(obj);
                                              });
                                        }));
                      case SearchMode.manage:
                        if (model.noWordsToManage()) {
                          return Padding(
                              padding: const EdgeInsets.only(top: 50),
                              child: Text('No words',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      fontFamily: Constants.fontFredoka,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .title5)));
                        }
                        if (model.nothingFound()) {
                          return Padding(
                              padding: const EdgeInsets.only(top: 50),
                              child: Text('Nothing found',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      fontFamily: Constants.fontFredoka,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .title5)));
                        }
                        return Container(
                            margin: const EdgeInsets.only(
                              top: 20,
                              left: 8,
                              right: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.itemSearch,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ListView.builder(
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                primary: false,
                                itemCount: model.showRecent()
                                    ? model.manageList.length
                                    : model.manageFiltered.length,
                                itemBuilder: (context, index) {
                                  var obj = model.showRecent()
                                      ? model.manageList[index]
                                      : model.manageFiltered[index];
                                  return ManageWordItem(
                                      data: obj,
                                      key: ValueKey('s-manage-$obj'),
                                      onClicked: () async {
                                        _model.loseFocus();
                                        var r =
                                            await ServiceApi().getDictionary(
                                          word: obj.word,
                                          useLike: false,
                                        );
                                        var word = r.item.firstOrNull;
                                        if (word == null) return;
                                        var info = await getIt<AppRep>()
                                            .wordToInfo(word);
                                        if (info == null) return;
                                        widget.onShow.call(info);
                                      });
                                }));
                    }
                  }),
                ),
              ]),
            )),
      );
    });
  }

  Widget _buildSearchInput() {
    return Row(children: [
      Container(
        height: Constants.appBarButton,
        width: Constants.appBarButton,
        margin: const EdgeInsets.only(left: 5, right: 5),
        child: RoundButton(
            color: Colors.transparent,
            iconColor: Theme.of(context).colorScheme.appBarText.color,
            width: Constants.appBarButton,
            iconSize: 22,
            radius: 30,
            padding: const EdgeInsets.only(left: 5),
            iconData: Icons.arrow_back_ios,
            onPressed: (_) {
              Navigator.of(context).pop();
            }),
      ),
      Flexible(
          child: TextFormField(
        controller: _model.controller,
        focusNode: _model.focus,
        onChanged: (value) {
          _model.search(value);
        },
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: 'Search your words...',
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.iconColor,
            fontSize: 16,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
          alignLabelWithHint: true,
          floatingLabelAlignment: FloatingLabelAlignment.center,
        ),
      )),
      ChangeNotifierProvider<SearchWordModel>.value(
          value: _model,
          builder: (context, child) {
            var search = context.watch<SearchWordModel>().query;
            var empty = search.isEmpty;
            if (empty) {
              return const SizedBox();
            }
            return RoundButton(
                iconData: Icons.clear_sharp,
                color: Theme.of(context).colorScheme.roundButton,
                iconSize: 15,
                height: 30,
                width: 30,
                margin: const EdgeInsets.only(right: 5),
                iconColor: Theme.of(context).colorScheme.appBarText.color,
                onPressed: (_) {
                  _model.reset();
                });
          }),
      // TODO: audio search
    ]);
  }

  Widget _recent() {
    return StreamBuilder(
        stream: getIt<AppRep>().onRecentWords,
        initialData: getIt<AppRep>().onRecentWords.valueOrNull,
        builder: (context, snapshot) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 15, top: 15),
                    child: Text('Recent search',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            fontFamily: Constants.fontInter,
                            color: Theme.of(context).colorScheme.title5))),
                Flexible(
                    child: Container(
                        margin: const EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.itemSearch,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListView.builder(
                            itemCount: snapshot.data?.length ?? 0,
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            primary: true,
                            itemBuilder: (BuildContext context, int index) {
                              var model = snapshot.data![index];
                              return SearchWordItem(
                                  data: model,
                                  onClicked: () async {
                                    var r = await ServiceApi().getDictionary(
                                      word: model.word,
                                      useLike: false,
                                    );
                                    var word = r.item.firstWhereOrNull((it) =>
                                        it.value.toLowerCase() ==
                                        model.word.toLowerCase());
                                    if (word == null) {
                                      return;
                                    }
                                    var info = await getIt<AppRep>().wordToInfo(
                                      word,
                                    );
                                    _model.loseFocus();
                                    if (info == null) return;
                                    getIt<AppRep>().cachedWord = info;
                                    widget.onShow.call(info);
                                  });
                            })))
              ]);
        });
  }
}

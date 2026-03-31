import 'package:collection/collection.dart';
import 'package:vocabyte/components/app_bar2.dart';
import 'package:vocabyte/components/disposable_stream.dart';
import 'package:vocabyte/components/hover_click.dart';
import 'package:vocabyte/components/round_button.dart';
import 'package:vocabyte/main.dart';
import 'package:vocabyte/pages/models/search_word_model.dart';
import 'package:vocabyte/pages/models/word_data.dart';
import 'package:vocabyte/pages/page_search_word/search_item.dart';
import 'package:flutter/material.dart';
import 'package:vocabyte/repository/app_rep.dart';
import 'package:vocabyte/repository/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:vocabyte/resource/constants.dart';
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
    _model.dispose();
    _dispStream.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Theme.of(context).colorScheme.baseColor1,
        extendBody: true,
        backgroundColor: Colors.pink,
        extendBodyBehindAppBar: true,
        body: ChangeNotifierProvider<SearchWordModel>.value(
            value: _model,
            builder: (context, child) {
              return CustomScrollView(
                  physics: const ClampingScrollPhysics(),
                  slivers: [
                    SliverAppBar(
                        pinned: true,
                        primary: false,
                        toolbarHeight: Constants.homeAppBarHeight,
                        automaticallyImplyLeading: false,
                        // backgroundColor: Theme.of(context).colorScheme.appBar,
                        backgroundColor: Colors.yellow,
                        scrolledUnderElevation: 0,
                        surfaceTintColor: Colors.transparent,
                        // actionsPadding: EdgeInsets.only(),
                        expandedHeight: 100,
                        collapsedHeight: 100,
                        elevation: 4,
                        titleSpacing: 0,
                        // t
                        title: Hero(
                          tag: 'search_bar',
                          flightShuttleBuilder: (flightContext, animation,
                              flightDirection, fromHeroContext, toHeroContext) {
                            // This creates a smooth interpolation of the corners during flight

                            var borderRadius = BorderRadiusTween(
                              begin: const BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight:
                                      Radius.circular(30)), // Home Page shape
                              end:
                                  BorderRadius.circular(0), // Search Page shape
                            );
                            return AnimatedBuilder(
                              animation: animation,
                              builder: (context, child) {
                                return Material(
                                  type: MaterialType.canvas,
                                  // elevation: 4,
                                  // color: Colors.white,
                                  color: Colors.transparent,
                                  clipBehavior: Clip
                                      .antiAlias, // Critical for rounded corners
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        borderRadius.evaluate(animation)!,
                                  ),
                                  child: toHeroContext
                                      .widget, // Fly the Search Page's content
                                );
                              },
                            );
                          },
                          child: Material(
                            // color: Colors.transparent,
                            // elevation: 2,
                            color: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                            // shape: RoundedRectangleBorder(
                            //   borderRadius: BorderRadius.circular(30),
                            // ),
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 8),
                              // height: 100,
                              height: MediaQuery.of(context).padding.top + 80,
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).padding.top),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                  child: TextFormField(
                                enabled: false,
                                decoration: const InputDecoration(
                                  // TODO: audio search
                                  hintText: "Search your words...",
                                  prefixIcon:
                                      Icon(Icons.search, color: Colors.grey),
                                  border: InputBorder.none,
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 15),
                                ),
                              )),
                            ),
                          ),
                        )),

                    // SliverAppBar(
                    //   automaticallyImplyLeading: false,
                    //   flexibleSpace: AppBar2(
                    //       type: Type.back,
                    //       child: Flexible(
                    //         child: _input(),
                    //       )),
                    // ),
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
            }));
  }

  Widget _input() {
    return HoverClick(
        onPressedL: (_) {
          _model.focus.requestFocus();
        },
        child: Hero(
            tag: 'search_bar',
            child: ChangeNotifierProvider<SearchWordModel>.value(
                value: _model,
                builder: (context, child) {
                  return Material(
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
                                    keyboardType: TextInputType.text,
                                    onEditingComplete: () {},
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .inputText,
                                        fontSize: 15),
                                    decoration: InputDecoration(
                                      fillColor: Theme.of(context)
                                          .colorScheme
                                          .inputBackground,
                                      contentPadding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      hintText: 'Enter word',
                                      hintStyle: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .inputHint,
                                          fontSize: 15),
                                      enabledBorder: const OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.all(Radius.zero),
                                          borderSide: BorderSide(
                                              color: Colors.transparent)),
                                      focusedBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(6)),
                                          borderSide: BorderSide(
                                              color: Colors.transparent)),
                                    ))),
                            Builder(builder: (context) {
                              var search =
                                  context.watch<SearchWordModel>().query;
                              var empty = search.isEmpty;
                              if (empty) {
                                return const SizedBox();
                              }
                              return RoundButton(
                                  iconData: Icons.clear_sharp,
                                  iconSize: 22,
                                  margin: const EdgeInsets.only(right: 15),
                                  height: Constants.baseButton,
                                  width: Constants.baseButton,
                                  color:
                                      Theme.of(context).colorScheme.roundButton,
                                  iconColor: Theme.of(context)
                                      .colorScheme
                                      .appBarText
                                      .color,
                                  onPressed: (_) {
                                    _model.reset();
                                  });
                            })
                          ])));
                })));
  }

  Widget _searchResult() {
    return Builder(builder: (context) {
      return SliverList.builder(
          itemCount: context.watch<SearchWordModel>().found.length,
          itemBuilder: (BuildContext context, int index) {
            var obj = context.read<SearchWordModel>().found[index];
            return SearchWordItem(
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
              color: Theme.of(context).colorScheme.title5))
    ]));
  }

  _searchRecent() {
    return StreamBuilder(
        stream: getIt<AppRep>().onRecentWords,
        builder: (context, snapshot) {
          return SliverList.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                var model = snapshot.data![index];
                return SearchWordItem(
                    data: model,
                    onClicked: () async {
                      // recent words have only part of data
                      // have to use request to get full
                      // before navigation
                      var r = await ServiceApi()
                          .getDictionary(word: model.word, useLike: false);

                      var word = r.item.firstWhereOrNull((it) =>
                          it.value.toLowerCase() == model.word.toLowerCase());
                      if (word == null) {
                        return;
                      }
                      var info = await getIt<AppRep>().wordToInfo(word);
                      _model.loseFocus();
                      if (info == null) return;
                      getIt<AppRep>().cachedWord = info;
                      widget.onShow.call(info);
                    });
              });
        });
  }
}

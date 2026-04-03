import 'package:collection/collection.dart';
import 'package:vocabyte/components/chip_item.dart';
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
  }

  @override
  void dispose() {
    _model.dispose();
    _dispStream.dispose();
    super.dispose();
  }

  // backgroundColor: Theme.of(context).colorScheme.baseColor1,
  // backgroundColor: Theme.of(context).colorScheme.appBar,
  // backgroundColor: Colors.pink,

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        // extendBodyBehindAppBar: true,
        // extendBody: true,
        // primary: false,
        body: ChangeNotifierProvider<SearchWordModel>.value(
            value: _model,
            builder: (context, child) {
              var padding = MediaQuery.of(context).padding;
              // var padding = EdgeInsets.only(top: 32.355555555555554);
              return Column(children: [
                // const SizedBox(
                //   height: 20,
                // ),
                Container(
                    // color: Colors.pink,
                    height: Constants.homeAppBarHeight + padding.top,
                    alignment: Alignment.center,
                    child: Hero(
                      tag: 'search_bar',
                      flightShuttleBuilder: (flightContext, animation,
                          flightDirection, fromHeroContext, toHeroContext) {
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
                              // color: Colors.white,
                              color: Colors.transparent,
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                borderRadius: borderRadius.evaluate(animation)!,
                              ),
                              child: toHeroContext.widget,
                            );
                          },
                        );
                      },
                      child: Material(
                        // color: Colors.white,
                        color: Colors.transparent,
                        // shape: const RoundedRectangleBorder(
                        //   borderRadius: BorderRadius.zero,
                        // ),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero),
                        child: Container(
                            // height:
                            //     padding.top + 80 - 8,
                            // margin: const EdgeInsets.only(bottom: 8),
                            padding: EdgeInsets.only(top: padding.top),
                            // margin: EdgeInsets.only(top: padding.top),
                            height: Constants.homeAppBarHeight + padding.top,
                            alignment: Alignment.center,
                            // height: Constants.homeAppBarHeight,

                            // height: padding.top + Constants.homeAppBarHeight,
                            // margin: const EdgeInsets.only(bottom: 8),
                            // padding: EdgeInsets.only(top: 30),
                            // padding: EdgeInsets.only(top: padding.top),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              // color: Colors.pink.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: _buildSearchInput()),
                      ),
                    )),
                Flexible(
                  child: CustomScrollView(
                      physics: const ClampingScrollPhysics(),
                      slivers: [
                        // SliverAppBar(
                        //     pinned: true,
                        //     primary: false,
                        //     // expandedHeight:
                        //     //     Constants.homeAppBarHeight + padding.top + 10,
                        //     // collapsedHeight:
                        //     //     Constants.homeAppBarHeight + padding.top + 10,
                        //     // toolbarHeight: Constants.homeAppBarHeight + padding.top,
                        //     toolbarHeight: Constants.homeAppBarHeight + padding.top,
                        //     automaticallyImplyLeading: false,
                        //     backgroundColor: Theme.of(context).colorScheme.appBar,
                        //     // scrolledUnderElevation: 0,
                        //     surfaceTintColor: Colors.transparent,
                        //     titleSpacing: 0,
                        //     title: Hero(
                        //       tag: 'search_bar',
                        //       flightShuttleBuilder: (flightContext, animation,
                        //           flightDirection, fromHeroContext, toHeroContext) {
                        //         var borderRadius = BorderRadiusTween(
                        //           begin: const BorderRadius.only(
                        //               topLeft: Radius.circular(50),
                        //               topRight: Radius.circular(50)),
                        //           end: BorderRadius.circular(8),
                        //         );
                        //         return AnimatedBuilder(
                        //           animation: animation,
                        //           builder: (context, child) {
                        //             return Material(
                        //               type: MaterialType.canvas,
                        //               // color: Colors.white,
                        //               color: Colors.transparent,
                        //               clipBehavior: Clip.antiAlias,
                        //               shape: RoundedRectangleBorder(
                        //                 borderRadius:
                        //                     borderRadius.evaluate(animation)!,
                        //               ),
                        //               child: toHeroContext.widget,
                        //             );
                        //           },
                        //         );
                        //       },
                        //       child: Material(
                        //         // color: Colors.white,
                        //         color: Colors.transparent,
                        //         // shape: const RoundedRectangleBorder(
                        //         //   borderRadius: BorderRadius.zero,
                        //         // ),
                        //         child: Container(
                        //           // height:
                        //           //     padding.top + 80 - 8,
                        //           // margin: const EdgeInsets.only(bottom: 8),
                        //           // padding: EdgeInsets.only(top: padding.top),
                        //           // margin: EdgeInsets.only(top: padding.top),
                        //           height: Constants.homeAppBarHeight + padding.top,
                        //           // height: Constants.homeAppBarHeight,

                        //           // height: padding.top + Constants.homeAppBarHeight,
                        //           // margin: const EdgeInsets.only(bottom: 8),
                        //           // padding: EdgeInsets.only(top: 30),
                        //           // padding: EdgeInsets.only(top: padding.top),
                        //           decoration: BoxDecoration(
                        //             color: Colors.white,
                        //             // color: Colors.pink.withValues(alpha: 0.2),
                        //             borderRadius: BorderRadius.circular(5),
                        //           ),
                        //           child: Center(
                        //             child: Padding(
                        //                 padding: EdgeInsets.only(),
                        //                 // padding: EdgeInsets.only(top: padding.top),
                        //                 child: TextFormField(
                        //                     enabled: true,
                        //                     decoration: InputDecoration(
                        //                       // TODO: audio search
                        //                       hintText: 'Search your words...',
                        //                       hintStyle: TextStyle(
                        //                           color: Theme.of(context)
                        //                               .colorScheme
                        //                               .iconColor),
                        //                       prefixIcon: Icon(
                        //                         Icons.arrow_back,
                        //                         color: Theme.of(context)
                        //                             .colorScheme
                        //                             .iconColor,
                        //                       ),
                        //                       border: InputBorder.none,
                        //                       contentPadding: EdgeInsets.symmetric(
                        //                         vertical: 15,
                        //                       ),
                        //                     ))),
                        //           ),
                        //         ),
                        //       ),
                        //     )),

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
                      ]),
                )
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
                            _model.mode = SearchMode.search;
                            _model.notify();
                          },
                        ),
                        const SizedBox(width: 8),
                        ChipItem(
                          text: 'Manage words',
                          active: mode == SearchMode.manage,
                          onPressed: () {
                            _model.mode = SearchMode.manage;
                            _model.notify();
                          },
                        )
                      ],
                    )),
                //

                // if (context.watch<SearchWordModel>().query.isNotEmpty && context.watch<SearchWordModel>().found.isEmpty)
                //   _searchNotFound(),
                // //
                // // recent viewed
                // if (context.watch<SearchWordModel>().query.isEmpty)
                //   _searchRecent()
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
                            : ListView.builder(
                                shrinkWrap: true,
                                itemCount: model.found.length,
                                itemBuilder: (context, index) {
                                  var obj = model.found[index];
                                  return SearchWordItem(
                                      data: obj,
                                      onClicked: () async {
                                        _model.loseFocus();
                                        widget.onShow.call(obj);
                                      });
                                });
                      case SearchMode.manage:
                        if (model.found.isEmpty) {
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
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: model.found.length,
                            itemBuilder: (context, index) {
                              var obj = model.found[index];
                              return SearchWordItem(
                                  data: obj,
                                  onClicked: () async {
                                    _model.loseFocus();
                                    widget.onShow.call(obj);
                                  });
                            });
                    }
                  }),
                ),
              ]),
            )),
      );
      // return SliverList.builder(
      //     itemCount: context.watch<SearchWordModel>().found.length,
      //     itemBuilder: (BuildContext context, int index) {
      //       var obj = context.read<SearchWordModel>().found[index];
      //       return SearchWordItem(
      //           data: obj,
      //           onClicked: () async {
      //             _model.loseFocus();
      //             widget.onShow.call(obj);
      //           });
      //     });
    });
  }

  Widget _buildSearchInput() {
    return TextFormField(
      enabled: true,
      decoration: InputDecoration(
        // TODO: audio search
        hintText: 'Search your words...',
        hintStyle: TextStyle(color: Theme.of(context).colorScheme.iconColor),
        prefixIcon: Icon(
          Icons.arrow_back,
          color: Theme.of(context).colorScheme.iconColor,
        ),
        border: InputBorder.none,
        // contentPadding: EdgeInsets.symmetric(
        //   vertical: Constants.homeAppBarHeight / 2,
        // ),
        contentPadding: EdgeInsets.symmetric(vertical: 15),
        alignLabelWithHint: true,
        floatingLabelAlignment: FloatingLabelAlignment.center,
        // icon: Icon(
        //   Icons.arrow_back,
        //   color: Theme.of(context).colorScheme.iconColor,
        // ),
        // maintainHintHeight: true,
        // maintainHintSize: true,
        // maintainLabelSize: true,
      ),
    );
  }

  // Widget _searchNotFound() {
  //   return SliverFillRemaining(
  //       child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
  //     Text('Nothing found',
  //         style: TextStyle(
  //             fontWeight: FontWeight.w400,
  //             fontSize: 16,
  //             color: Theme.of(context).colorScheme.title5))
  //   ]));
  // }

  // _searchRecent() {
  //   return StreamBuilder(
  //       stream: getIt<AppRep>().onRecentWords,
  //       builder: (context, snapshot) {
  //         return ListView.builder(
  //             itemCount: snapshot.data?.length ?? 0,
  //             itemBuilder: (BuildContext context, int index) {
  //               var model = snapshot.data![index];
  //               return SearchWordItem(
  //                   data: model,
  //                   onClicked: () async {
  //                     // recent words have only part of data
  //                     // have to use request to get full
  //                     // before navigation
  //                     var r = await ServiceApi()
  //                         .getDictionary(word: model.word, useLike: false);

  //                     var word = r.item.firstWhereOrNull((it) =>
  //                         it.value.toLowerCase() == model.word.toLowerCase());
  //                     if (word == null) {
  //                       return;
  //                     }
  //                     var info = await getIt<AppRep>().wordToInfo(word);
  //                     _model.loseFocus();
  //                     if (info == null) return;
  //                     getIt<AppRep>().cachedWord = info;
  //                     widget.onShow.call(info);
  //                   });
  //             });
  //       });
  // }
}

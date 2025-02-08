import 'package:vocabyte/components/app_bar2.dart';
import 'package:vocabyte/components/disposable_stream.dart';
import 'package:vocabyte/components/hover_button.dart';
import 'package:vocabyte/components/hover_click.dart';
import 'package:vocabyte/components/round_button.dart';
import 'package:vocabyte/pages/manage_word/manage_word_item.dart';
import 'package:vocabyte/pages/manage_word/manage_word_model.dart';
import 'package:vocabyte/pages/models/word_data.dart';
import 'package:flutter/material.dart';
import 'package:vocabyte/repository/app_rep.dart';
import 'package:provider/provider.dart';
import 'package:vocabyte/app/app_theme.dart';
import 'package:vocabyte/services/service_api.dart';

class ManageWordPage extends StatefulWidget {
  const ManageWordPage({required this.onShowWord, super.key});
  final Function(FullInfo data) onShowWord;

  @override
  ManageWordPageState createState() => ManageWordPageState();
}

class ManageWordPageState extends State<ManageWordPage> {
  final _dispStream = DisposableStream();
  late ManageWordModel _model;
  final tag = 'manageWord';

  @override
  void initState() {
    super.initState();
    _model = ManageWordModel();

    Future.microtask(() async {
      AppRep().refreshManageList();

      _dispStream.add(AppRep().onManageWordChanged.listen((v) async {
        _model.setModels(data: v ?? []);
        _model.inited = true;
      }));
    });
  }

  @override
  void dispose() {
    super.dispose();
    _model.dispose();
    _dispStream.dispose();
  }

  void _clicked(String text) async {
    _model.loseFocus();
    var r = await ServiceApi().searchWords(word: text, useLike: false);
    var word = r.item.firstOrNull;
    if (word == null) return;
    var info = await AppRep().wordToInfo(word);
    if (info == null) return;
    AppRep().cachedWord = info;
    widget.onShowWord.call(info);
  }

  //
  // busy
  // if (!context.watch<ManageWordModel>().inited) {
  //   return Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         Container(
  //             width: 100,
  //             height: 100,
  //             decoration: BoxDecoration(
  //                 borderRadius: const BorderRadius.all(
  //                     Radius.circular(12)),
  //                 color: Theme.of(context)
  //                     .colorScheme
  //                     .button2Hover),
  //             child: Padding(
  //                 padding: const EdgeInsets.all(20),
  //                 child: CircularProgressIndicator(
  //                     color: Theme.of(context)
  //                         .colorScheme
  //                         .titel4)))
  //       ]);
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: ChangeNotifierProvider.value(
                value: _model,
                builder: (context, child) {
                  var model = context.watch<ManageWordModel>();
                  return CustomScrollView(
                      physics: const ClampingScrollPhysics(),
                      slivers: [
                        SliverAppBar(
                          flexibleSpace: AppBar2(
                              type: Type.back,
                              child: Flexible(child: _input())),
                        ),
                        //
                        // filtered
                        _searchResult(),
                        //
                        // all words
                        if (model.query == null && model.found.isNotEmpty)
                          _allData(),
                        //
                        // nothing found
                        if (model.query?.isNotEmpty == true &&
                            model.filtered.isEmpty)
                          _searchNotFound(),
                        //
                        // TODO: busy
                      ]);
                })));
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
                var empty =
                    _model.query == null || _model.query?.isEmpty == true;
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

  Widget _searchResult() {
    return Builder(builder: (context) {
      return SliverList.builder(
          itemCount: context.watch<ManageWordModel>().filtered.length,
          itemBuilder: (BuildContext context, int index) {
            var obj = context.read<ManageWordModel>().filtered[index];
            return ManageWordItem(
                data: obj,
                onClicked: () async {
                  _clicked(obj.word);
                });
          });
    });
  }

  Widget _allData() {
    return Builder(builder: (context) {
      return SliverList.builder(
          itemCount: context.watch<ManageWordModel>().found.length,
          itemBuilder: (BuildContext context, int index) {
            var obj = context.read<ManageWordModel>().found[index];
            return ManageWordItem(
                data: obj,
                onClicked: () async {
                  _clicked(obj.word);
                });
          });
    });
  }

  // Widget _input() {
  //   return Padding(
  //       padding: const EdgeInsets.only(bottom: 10),
  //       child: Column(
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           crossAxisAlignment: CrossAxisAlignment.stretch,
  //           children: [
  //             Stack(children: [
  //               Row(children: [
  //                 Expanded(
  //                     child: TextField(
  //                         controller: _model?.controller,
  //                         focusNode: _model?.focus,
  //                         onChanged: (value) {
  //                           _model?.updateSearch(value);
  //                         },
  //                         onEditingComplete: () {},
  //                         style: TextStyle(
  //                             color: Theme.of(context).colorScheme.inputText,
  //                             fontSize: 15),
  //                         decoration: InputDecoration(
  //                             fillColor:
  //                                 Theme.of(context).colorScheme.inputBackground,
  //                             contentPadding:
  //                                 const EdgeInsets.only(left: 10, right: 10),
  //                             focusedBorder: OutlineInputBorder(
  //                                 borderRadius: const BorderRadius.all(
  //                                     Radius.circular(6)),
  //                                 borderSide: BorderSide(
  //                                     color: Theme.of(context)
  //                                         .colorScheme
  //                                         .listSplit)),
  //                             hintText: 'Enter word',
  //                             hintStyle: TextStyle(
  //                                 color:
  //                                     Theme.of(context).colorScheme.inputHint,
  //                                 fontSize: 15),
  //                             enabledBorder: OutlineInputBorder(
  //                                 borderRadius:
  //                                     const BorderRadius.all(Radius.zero),
  //                                 borderSide: BorderSide(
  //                                     color: Theme.of(context)
  //                                         .colorScheme
  //                                         .listSplit)))))
  //               ]),
  //               if (_model?.search?.isNotEmpty == true)
  //                 Positioned(
  //                     top: 0,
  //                     bottom: 0,
  //                     right: 10,
  //                     child: HoverButton(
  //                       icon: Icons.cancel,
  //                       color: Theme.of(context).colorScheme.inputHint,
  //                       hoverColor: Theme.of(context).colorScheme.inputHint,
  //                       onClicked: (_) {
  //                         _model?.clearSearch();
  //                       },
  //                     ))
  //             ])
  //           ]));
  // }
}

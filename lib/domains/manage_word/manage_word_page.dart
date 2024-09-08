import 'package:vocabyte/components/disposable_stream.dart';
import 'package:vocabyte/components/hover_button.dart';
import 'package:vocabyte/domains/manage_word/manage_word_item.dart';
import 'package:vocabyte/domains/manage_word/manage_word_model.dart';
import 'package:vocabyte/domains/models/word_data.dart';
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
  ManageWordModel? _model;
  final tag = 'manageWord';

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      AppRep().refreshManageList();

      _dispStream.add(AppRep().onManageWordChanged.listen((v) async {
        _model?.setModels(data: v ?? []);
        _model?.inited = true;
      }));
    });
  }

  @override
  void dispose() {
    super.dispose();
    _dispStream.dispose();
  }

  void _clicked(String text) async {
    _model?.clearSearch();
    _model?.loseFocus();
    var r = await ServiceApi().searchWords(word: text, useLike: false);
    var word = r.item.firstOrNull;
    if (word == null) return;
    var info = await AppRep().wordToInfo(word);
    if (info == null) return;
    AppRep().cachedWord = info;
    widget.onShowWord.call(info);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ManageWordModel(),
        builder: (context, child) {
          _model = context.read<ManageWordModel>();
          //
          // busy
          if (!context.watch<ManageWordModel>().inited) {
            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          color: Theme.of(context).colorScheme.button2Hover),
                      child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: CircularProgressIndicator(
                              color: Theme.of(context).colorScheme.titel4)))
                ]);
          }
          return CustomScrollView(
              scrollBehavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              slivers: [
                SliverAppBar(
                  pinned: true,
                  leadingWidth: 0,
                  leading: Container(),
                  backgroundColor: Theme.of(context).colorScheme.baseColor1,
                  surfaceTintColor: Theme.of(context).colorScheme.baseColor1,
                  toolbarHeight: 60,
                  title: _searchInput(),
                ),
                SliverFillRemaining(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      //
                      // search but nothing found
                      if (context.watch<ManageWordModel>().search?.isNotEmpty ==
                              true &&
                          context
                              .watch<ManageWordModel>()
                              .listModelFilter
                              .isEmpty)
                        Text('Nothing found',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Theme.of(context).colorScheme.titel4)),

                      //
                      // search list
                      if (context.watch<ManageWordModel>().search?.isNotEmpty ==
                              true &&
                          context
                              .watch<ManageWordModel>()
                              .listModelFilter
                              .isNotEmpty)
                        Expanded(
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: context
                                    .watch<ManageWordModel>()
                                    .listModelFilter
                                    .length,
                                itemBuilder: (BuildContext context, int index) {
                                  var obj = context
                                      .read<ManageWordModel>()
                                      .listModelFilter[index];
                                  return ManageWordItem(
                                      data: obj,
                                      onClicked: () async {
                                        _clicked(obj.word);
                                      });
                                })),

                      //
                      // all words
                      if (context.watch<ManageWordModel>().search == null &&
                          context.watch<ManageWordModel>().listModel.isNotEmpty)
                        Expanded(
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: context
                                    .watch<ManageWordModel>()
                                    .listModel
                                    .length,
                                itemBuilder: (BuildContext context, int index) {
                                  var obj = context
                                      .read<ManageWordModel>()
                                      .listModel[index];
                                  return ManageWordItem(
                                      data: obj,
                                      onClicked: () async {
                                        _clicked(obj.word);
                                      });
                                })),

                      //
                      // no words
                      if (context.watch<ManageWordModel>().inited &&
                          context.watch<ManageWordModel>().search == null &&
                          context.watch<ManageWordModel>().listModel.isEmpty)
                        Text('No words to manage',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Theme.of(context).colorScheme.titel4))
                    ]))
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
                          controller: _model?.controller,
                          focusNode: _model?.focus,
                          onChanged: (value) {
                            _model?.updateSearch(value);
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
                if (_model?.search?.isNotEmpty == true)
                  Positioned(
                      top: 0,
                      bottom: 0,
                      right: 10,
                      child: HoverButton(
                        icon: Icons.cancel,
                        color: Theme.of(context).colorScheme.inputHint,
                        hoverColor: Theme.of(context).colorScheme.inputHint,
                        onClicked: (_) {
                          _model?.clearSearch();
                        },
                      ))
              ])
            ]));
  }
}

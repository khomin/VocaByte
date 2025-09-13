import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:vocabyte/components/app_bar2.dart';
import 'package:vocabyte/components/button_fixed_down.dart';
import 'package:vocabyte/components/button_round_corner.dart';
import 'package:vocabyte/components/button_with_menu.dart';
import 'package:vocabyte/components/disposable_stream.dart';
import 'package:vocabyte/components/hover_click.dart';
import 'package:vocabyte/pages/models/search_word_model.dart';
import 'package:flutter/material.dart';
import 'package:vocabyte/pages/word_details/next_review_panel.dart';
import 'package:vocabyte/repository/app_rep.dart';
import 'package:vocabyte/pages/settings/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:vocabyte/resource/constants.dart';
import 'package:vocabyte/app/ui_helper.dart';
import 'package:vocabyte/services/protobuf/proto.pb.dart';
import 'package:vocabyte/services/protobuf/proto.pbserver.dart';
import 'package:vocabyte/services/service_api.dart';
import 'package:vocabyte/services/tts.dart';

class PageWordDetails extends StatefulWidget {
  const PageWordDetails(
      {required this.playWordAtStart,
      this.primary = false,
      required this.onBack,
      super.key});
  final Function() onBack;
  final bool playWordAtStart;
  final bool primary;

  @override
  PageWordDetailsState createState() => PageWordDetailsState();
}

class PageWordDetailsState extends State<PageWordDetails>
    with TickerProviderStateMixin {
  final _dispStream = DisposableStream();
  var _curMeaningIndex = 0;
  WordInReview? _status;
  String? _reviewIn;
  RespSentences? _sentences;
  late AnimationController _playWordCtr;
  late AnimationController _playExampleCtr;
  final _word = AppRep().cachedWord?.word ?? 'undefined';
  final tag = 'wordDetails';

  @override
  void initState() {
    super.initState();

    _playWordCtr =
        AnimationController(vsync: this, duration: Constants.animDurationFast);
    _playExampleCtr =
        AnimationController(vsync: this, duration: Constants.animDurationFast);

    Future.microtask(() async {
      await Future.wait([_refreshStatus(), _initialSentence()]);
      if (widget.playWordAtStart) {
        _playWord();
      }
      await _loadExamples(3, 0);
      await _loadExamples(100, 0);
    });
  }

  @override
  void dispose() {
    _dispStream.dispose();
    _playWordCtr.dispose();
    _playExampleCtr.dispose();
    super.dispose();
  }

  Future _refreshStatus() async {
    var status = await AppRep().reviewTask.getWordReviewStatus(word: _word);
    if (status != null) {
      var reviewIn = AppRep().reviewTimeInDuration(status);
      if (mounted) {
        setState(() {
          _status = status;
          _reviewIn = AppRep().reviewInToString(reviewIn);
        });
      }
    } else {
      if (mounted) {
        setState(() {
          _status = status;
        });
      }
    }
    return null;
  }

  Future _initialSentence() async {
    var v = _sentences =
        await ServiceApi().getSentences(word: _word, limit: 1, offset: 0);
    if (mounted) {
      setState(() {
        _sentences = v;
      });
    }
    return null;
  }

  Future _loadExamples(int count, int offset) async {
    var word = AppRep().cachedWord?.word;
    if (word == null) return;
    var v = _sentences = await ServiceApi()
        .getSentences(word: word, limit: count, offset: offset);
    if (mounted) {
      setState(() {
        _sentences = v;
      });
    }
    return null;
  }

  Future _playWord() async {
    TextToSpeach().onChange(_word);
    _playWordCtr.forward();
    await TextToSpeach().speak();
    _playWordCtr.reverse();
  }

  void _playExample() async {
    var word = AppRep().cachedWord?.word;
    var meaning = AppRep().cachedWord?.meaning;
    if (word == null || meaning == null) return;
    var definition = meaning[_curMeaningIndex].definition;
    var example = meaning[_curMeaningIndex].example;
    TextToSpeach().onChange(definition);
    _playExampleCtr.forward();
    await TextToSpeach().speak();
    if (example?.isNotEmpty == true) {
      TextToSpeach().onChange('For example: $example');
      await TextToSpeach().speak();
    }
    _playExampleCtr.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.page,
            appBar: widget.primary
                ? AppBar(
                    backgroundColor: Theme.of(context).colorScheme.page,
                    leadingWidth: double.infinity,
                    leading: AppBar2(
                        type: Type.back,
                        child: Flexible(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                              Text('Manage',
                                  style:
                                      Theme.of(context).colorScheme.appBarText)
                            ]))))
                : null,
            body: ChangeNotifierProvider(
                create: (_) => SearchWordModel(),
                builder: (context, child) {
                  var size = MediaQuery.of(context).size;
                  var data = AppRep().cachedWord;
                  var sentences = _sentences?.data;
                  if (data == null) return const SizedBox();
                  return Stack(alignment: Alignment.center, children: [
                    Column(children: [
                      Expanded(
                          child: CustomScrollView(slivers: [
                        SliverToBoxAdapter(
                          child: Padding(
                              padding: EdgeInsets.only(
                                  top: size.height / 5, bottom: 50),
                              child: Column(
                                children: [
                                  _cardView(),
                                ],
                              )),
                        ),
                        SliverList(
                            delegate: SliverChildListDelegate([
                          SingleChildScrollView(
                              child: Column(children: [
                            ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: sentences?.length ?? 0,
                                itemBuilder: (BuildContext context, int index) {
                                  var i = sentences?[index];
                                  var textSpan = UiHelper.makeTextSpan(
                                      query: _word.toLowerCase(),
                                      text: i ?? '',
                                      colorBase: Theme.of(context)
                                          .colorScheme
                                          .appBarText
                                          .color!,
                                      colorHighlight: Theme.of(context)
                                          .colorScheme
                                          .buttonOption2);
                                  return Container(
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(8)),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black
                                                    .withValues(alpha: 0.1),
                                                blurRadius: 15,
                                                offset: const Offset(0, 1))
                                          ],
                                          color: Theme.of(context)
                                              .colorScheme
                                              .cardHome),
                                      margin: const EdgeInsets.only(
                                          top: 5,
                                          bottom: 5,
                                          left: 20,
                                          right: 20),
                                      padding: const EdgeInsets.only(
                                          top: 5,
                                          bottom: 5,
                                          left: 20,
                                          right: 20),
                                      child: Text.rich(
                                          TextSpan(children: textSpan),
                                          maxLines: 15,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .appBarText
                                                  .color)));
                                })
                          ]))
                        ]))
                      ])),
                      _footerButton()
                    ])
                  ]);
                })));
  }

  Widget _cardView() {
    return Builder(builder: (context) {
      var data = AppRep().cachedWord;
      if (data == null) return const SizedBox();
      var meaning = data.meaning[_curMeaningIndex];
      var size = MediaQuery.of(context).size;
      return Container(
          margin: const EdgeInsets.only(left: 30, right: 30),
          padding: const EdgeInsets.only(bottom: 10, top: 10),
          constraints: BoxConstraints(minHeight: size.height / 3),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              color: Theme.of(context).colorScheme.cardHome,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 15,
                    offset: const Offset(0, 1))
              ]),
          child: Column(children: [
            HoverClick(
                onPressedL: (_) {
                  _playWord();
                },
                child: Column(children: [
                  //
                  // word
                  Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Row(children: [
                        Expanded(
                            child: Text(data.word,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .appBarText
                                        .color))),
                        //
                        // n of n meaning
                        if (data.meaning.length > 1)
                          Container(
                              width: 100,
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Center(
                                  child: Text(
                                      '${_curMeaningIndex + 1}/${data.meaning.length}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .title1
                                              .color)))),
                        //
                        // speech part
                        Container(
                            width: 80,
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text(meaning.speechPart,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color:
                                        Theme.of(context).colorScheme.title4)))
                      ])),
                  Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(children: [
                        //
                        // transcript
                        if (data.transcript.isNotEmpty)
                          Text(data.transcript,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .cardDefinition)),
                        const SizedBox(width: 10),
                        //
                        // frequency
                        if (data.freq > 0)
                          Text('#${data.freq}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .cardDefinition)),
                        const Spacer(),
                        //
                        // play
                        Padding(
                            padding: const EdgeInsets.only(left: 10, right: 20),
                            child: AnimatedIcon(
                                icon: AnimatedIcons.play_pause,
                                progress: _playWordCtr))
                      ]))
                ])),
            //
            // swipe meanings
            Row(children: [
              Expanded(
                  child: ExpandablePageView.builder(
                      onPageChanged: (int page) {
                        setState(() {
                          _curMeaningIndex = page;
                        });
                      },
                      itemCount: data.meaning.length,
                      itemBuilder: (context, index) {
                        var meaning = data.meaning[index];
                        return Container(
                            padding: const EdgeInsets.only(
                                top: 20, left: 10, right: 10),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  //
                                  // definition
                                  Row(children: [
                                    Expanded(
                                        child: Text(meaning.definition,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 10,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .cardDefinition)))
                                  ]),
                                  //
                                  // example
                                  if (meaning.example != null)
                                    Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: HoverClick(
                                            onPressedL: (_) {
                                              _playExample();
                                            },
                                            child: Row(children: [
                                              Expanded(
                                                  child: Text(
                                                      meaning.example ?? '',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 10,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 16,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                          color: Theme.of(
                                                                  context)
                                                              .colorScheme
                                                              .cardExample)))
                                            ]))),
                                  //
                                  // synonyms
                                  if (meaning.synonyms.isNotEmpty)
                                    Row(children: [
                                      Expanded(
                                          child: Text(
                                              meaning.synonyms.join(', '),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .title3
                                                      .color)))
                                    ]),
                                  const SizedBox(height: 10),
                                  //
                                  // play
                                  HoverClick(
                                      onPressedL: (_) {
                                        _playExample();
                                      },
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 10,
                                                  bottom: 10,
                                                  right: 10,
                                                ),
                                                child: AnimatedIcon(
                                                    icon: AnimatedIcons
                                                        .play_pause,
                                                    progress: _playExampleCtr))
                                          ]))
                                ]));
                      }))
            ])
          ]));
    });
  }

  Widget _footerButton() {
    var countKnow = _status?.successCount ?? 0;
    var completed = countKnow >= 10;
    var leftText = '';
    if (countKnow == 0) {
      leftText = 'New';
    } else if (countKnow == 1) {
      leftText = '$countKnow time know';
    } else {
      leftText = '$countKnow times know';
    }
    return Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.page,
            boxShadow: [
              BoxShadow(
                  color: Theme.of(context).colorScheme.shadowBox,
                  blurRadius: 10,
                  offset: const Offset(0, 0))
            ]),
        child: FixedFooterBottom(
            child1: _status != null
                ? Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Flexible(
                        child: Column(children: [
                      Text(leftText,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color:
                                  Theme.of(context).colorScheme.title2.color)),
                      const SizedBox(height: 10),
                      StepProgressIndicator(
                        totalSteps: Constants.reapedToLeanDefault,
                        currentStep: countKnow,
                        size: 10,
                        selectedColor:
                            Theme.of(context).colorScheme.buttonOption1,
                        unselectedColor:
                            Theme.of(context).colorScheme.buttonOptionText,
                      )
                    ]))
                  ])
                : ButtonRoundCorner(
                    text: 'Should learn',
                    color: Theme.of(context).colorScheme.buttonOption1,
                    colorText: Theme.of(context).colorScheme.buttonOptionText,
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    direction: TextDirection.ltr,
                    radious: const BorderRadius.all(Radius.circular(10)),
                    onPressed: () async {
                      var data = AppRep().cachedWord;
                      var w = data?.word;
                      if (w == null) return;
                      await ServiceApi().addWordInReview(
                          req: ReqAddWordInReview(
                              word: w, useExtraFields: false));
                      _refreshStatus();
                      AppRep().refreshManageList();
                    }),
            childFlex2: 13,
            child2: _status == null
                ? null
                : ButtonWithMenu(
                    text: completed ? 'Completed' : 'Review $_reviewIn',
                    icon: completed ? Icons.thumb_up : null,
                    onPressed: () {
                      widget.onBack.call();
                    },
                    onMenu: () {
                      showModalBottomSheet(
                          context: context,
                          useRootNavigator: true,
                          backgroundColor:
                              Theme.of(context).colorScheme.pageHome,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(12.0)),
                          ),
                          builder: (context) {
                            return NextReviewPanel(
                                review: AppRep.reviewTimeToEnum(_status),
                                onChanged: (review) async {
                                  var time = AppRep.reviewTimeToInt(review);
                                  var data = AppRep().cachedWord;
                                  await AppRep()
                                      .updateReviewTime(data?.word, time);
                                  _refreshStatus();
                                },
                                onAlreadyKnow: () async {
                                  var data = AppRep().cachedWord;
                                  var w = data?.word;
                                  if (w == null) return;
                                  await ServiceApi()
                                      .removeWordFromCurrent(word: w);
                                  await _refreshStatus();
                                  AppRep().refreshManageList();
                                });
                          });
                    })));
  }
}

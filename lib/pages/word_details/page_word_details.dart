import 'package:collection/collection.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:fixnum/fixnum.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:vocabyte/components/app_bar2.dart';
import 'package:vocabyte/components/button_fixed_down.dart';
import 'package:vocabyte/components/button_round_corner.dart';
import 'package:vocabyte/components/button_with_menu.dart';
import 'package:vocabyte/components/disposable_stream.dart';
import 'package:vocabyte/components/hover_click.dart';
import 'package:flutter/material.dart';
import 'package:vocabyte/main.dart';
import 'package:vocabyte/pages/word_details/next_review_panel.dart';
import 'package:vocabyte/repository/app_rep.dart';
import 'package:vocabyte/repository/app_theme.dart';
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
  late AnimationController _playWordCtr;
  late AnimationController _playExampleCtr;
  final _pageController = PageController();
  final _word = getIt<AppRep>().cachedWord?.word ?? 'undefined';
  final tag = 'wordDetails';

  @override
  void initState() {
    super.initState();

    _playWordCtr =
        AnimationController(vsync: this, duration: Constants.animDurationFast);
    _playExampleCtr =
        AnimationController(vsync: this, duration: Constants.animDurationFast);

    Future.microtask(() async {
      _refreshStatus(initial: true);
      if (widget.playWordAtStart) {
        _playWord();
      }
    });
  }

  @override
  void dispose() {
    _dispStream.dispose();
    _playWordCtr.dispose();
    _playExampleCtr.dispose();
    _pageController.dispose();
    super.dispose();
  }

  Future _refreshStatus({required bool initial}) async {
    var status =
        await getIt<AppRep>().reviewTask.getWordReviewStatus(word: _word);
    if (status != null) {
      var reviewIn = getIt<AppRep>().reviewTimeInDuration(status);
      if (mounted) {
        var initialIndex = 0;
        if (initial) {
          if (status.meaningId.isNotEmpty) {
            var meanings = getIt<AppRep>().cachedWord?.meaning;
            if (meanings != null) {
              var found = meanings.firstWhereOrNull(
                  (element) => element.id == status.meaningId);
              if (found != null) {
                initialIndex = meanings.indexOf(found);
              }
            }
          }
        }
        setState(() {
          _status = status;
          _reviewIn = getIt<AppRep>().reviewInToString(reviewIn);
        });
        if (initial && initialIndex != 0) {
          _pageController.animateToPage(initialIndex,
              duration: const Duration(milliseconds: 10),
              curve: Curves.bounceIn);
        }
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

  Future _playWord() async {
    TextToSpeach().onChange(_word);
    _playWordCtr.forward();
    await TextToSpeach().speak();
    _playWordCtr.reverse();
  }

  void _playExample() async {
    var word = getIt<AppRep>().cachedWord?.word;
    var meaning = getIt<AppRep>().cachedWord?.meaning;
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
            body: Builder(builder: (context) {
              var size = MediaQuery.sizeOf(context);
              var data = getIt<AppRep>().cachedWord;
              var sentences = data?.examples;
              if (data == null) {
                return const SizedBox();
              }
              return Stack(alignment: Alignment.center, children: [
                Column(children: [
                  Expanded(
                      child: CustomScrollView(slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                          padding: EdgeInsets.only(top: size.height / 5),
                          child: Column(
                            children: [
                              // 1
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
                                      top: 5, bottom: 5, left: 20, right: 20),
                                  padding: const EdgeInsets.only(
                                      top: 5, bottom: 5, left: 20, right: 20),
                                  child: Text.rich(TextSpan(children: textSpan),
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
      var data = getIt<AppRep>().cachedWord;
      if (data == null) return const SizedBox();
      var meaning = data.meaning[_curMeaningIndex];
      var size = MediaQuery.sizeOf(context);
      var isCurrent = false;
      if (_status != null) {
        isCurrent = true;
      }
      var isCurrentMeaning = false;
      var meaningId = _status?.meaningId;
      if (isCurrent) {
        if (meaningId == meaning.id) {
          isCurrentMeaning = true;
        } else if (meaningId == null ||
            meaningId.isEmpty == true && _curMeaningIndex == 0) {
          isCurrentMeaning = true;
        }
      }
      return Column(children: [
        Container(
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
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .appBarText
                                          .color))),

                          //
                          // current meaning
                          if (isCurrent &&
                              isCurrentMeaning &&
                              data.meaning.length > 1)
                            Icon(Icons.check_circle_outlined,
                                color: Theme.of(context).colorScheme.title4),
                          //
                          // n of n meaning
                          if (data.meaning.length > 1)
                            Container(
                                width: 55,
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                child: Center(
                                    child: Text(
                                        '${_curMeaningIndex + 1}/${data.meaning.length}',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
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
                              padding:
                                  const EdgeInsets.only(left: 5, right: 10),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(meaning.speechPart,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .title4))
                                  ]))
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
                          Container(
                              width: 80,
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Center(
                                  child: AnimatedIcon(
                                      icon: AnimatedIcons.play_pause,
                                      progress: _playWordCtr)))
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
                        controller: _pageController,
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
                                          padding:
                                              const EdgeInsets.only(top: 20),
                                          child: HoverClick(
                                              onPressedL: (_) {
                                                _playExample();
                                              },
                                              child: Row(children: [
                                                Expanded(
                                                    child: Text(
                                                        meaning.example ?? '',
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 10,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 16,
                                                            fontStyle: FontStyle
                                                                .italic,
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
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 10,
                                                    bottom: 10,
                                                    right: 10,
                                                  ),
                                                  child: AnimatedIcon(
                                                      icon: AnimatedIcons
                                                          .play_pause,
                                                      progress:
                                                          _playExampleCtr))
                                            ]))
                                  ]));
                        }))
              ])
            ])),
        //
        // 2
        Container(
            height: 50,
            margin: const EdgeInsets.only(bottom: 10),
            width: double.infinity,
            child: Stack(children: [
              AnimatedPositioned(
                  top: isCurrent && !isCurrentMeaning ? 0 : -100,
                  left: 0,
                  right: 0,
                  duration: Constants.duration,
                  child: ButtonRoundCorner(
                      text: 'Use this meaning',
                      iconData: Icons.school,
                      color: Theme.of(context).colorScheme.cardSuccess,
                      colorText: Theme.of(context).colorScheme.button2Text,
                      padding: EdgeInsets.only(
                          left: size.width / 5, right: size.width / 5),
                      direction: TextDirection.ltr,
                      radious: const BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16)),
                      onPressed: () async {
                        var data = getIt<AppRep>().cachedWord;
                        var w = data?.word;
                        if (w == null) return;
                        var id = meaning.id;
                        if (id == null) return;
                        await getIt<AppRep>()
                            .updateMeaningId(word: w, meaningId: id);
                        _refreshStatus(initial: false);
                      }))
            ]))
      ]);
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
                      var data = getIt<AppRep>().cachedWord;
                      if (data == null) return;
                      String? meaingId;
                      try {
                        meaingId = data.meaning[_curMeaningIndex].id;
                      } catch (_) {}
                      await ServiceApi().addCurrent(
                          req: ReqAddWordInReview(
                        word: data.word,
                        useExtraFields: true,
                        failCount: 0,
                        lastTmFail: Int64.ZERO,
                        lastTmSuccess: Int64.ZERO,
                        nextReviewTmMs: Int64.ZERO,
                        successCount: 0,
                        meaningId: meaingId,
                      ));
                      _refreshStatus(initial: false);
                      getIt<AppRep>().refreshManageList();
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
                                review:
                                    getIt<AppRep>().reviewTimeToEnum(_status),
                                onChanged: (review) async {
                                  var time = AppRep.reviewTimeToInt(review);
                                  var data = getIt<AppRep>().cachedWord;
                                  await getIt<AppRep>()
                                      .updateReviewTime(data?.word, time);
                                  _refreshStatus(initial: false);
                                },
                                onAlreadyKnow: () async {
                                  var data = getIt<AppRep>().cachedWord;
                                  var w = data?.word;
                                  if (w == null) return;
                                  await ServiceApi()
                                      .deleteCurrentExact(word: w);
                                  await _refreshStatus(initial: false);
                                  getIt<AppRep>().refreshManageList();
                                });
                          });
                    })));
  }
}

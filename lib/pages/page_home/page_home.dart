import 'package:vocabyte/components/disposable_stream.dart';
import 'package:flutter/material.dart';
import 'package:vocabyte/components/round_button.dart';
import 'package:vocabyte/main.dart';
import 'package:vocabyte/repository/app_rep.dart';
import 'package:vocabyte/repository/app_theme.dart';
import 'package:vocabyte/repository/nav_rep.dart';
import 'package:vocabyte/resource/constants.dart';

class PageHome extends StatefulWidget {
  const PageHome({
    required this.onReview,
    required this.onSearch,
    required this.onManageWords,
    required this.onNumerals,
    super.key,
  });

  final Function() onReview;
  final Function() onSearch;
  final Function() onManageWords;
  final Function() onNumerals;

  @override
  PageHomeState createState() => PageHomeState();
}

class PageHomeState extends State<PageHome> {
  final _dispStream = DisposableStream();
  final tag = 'home';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _dispStream.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var appRep = getIt<AppRep>();
    return CustomScrollView(physics: const ClampingScrollPhysics(), slivers: [
      SliverAppBar(
          floating: true,
          snap: true,
          pinned: false,
          // expandedHeight: Constants.homeAppBarHeight,
          // collapsedHeight: Constants.homeAppBarHeight,
          // toolbarHeight: Constants.homeAppBarHeight,
          expandedHeight: MediaQuery.of(context).padding.top + 80,
          collapsedHeight: MediaQuery.of(context).padding.top + 80,
          toolbarHeight: MediaQuery.of(context).padding.top + 80,
          automaticallyImplyLeading: false,
          // titleSpacing: 0,
          backgroundColor: Theme.of(context).colorScheme.appBar,
          // backgroundColor: Colors.amber,
          scrolledUnderElevation: 0,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          title: Hero(
            tag: 'search_bar',
            child: Material(
              color: Colors.transparent,
              // elevation: 2,
              // color: Colors.white,
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(30),
              // ),
              child: Container(
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: TextFormField(
                  enabled: false,
                  decoration: const InputDecoration(
                    // TODO: audio search
                    hintText: "Search your words...",
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
              ),
            ),
          )),
      SliverList.list(children: [
        const SizedBox(height: 15),
        //
        StreamBuilder(
            stream: appRep.reviewTask.wordToReviewCnt,
            builder: (context, snapshot) {
              var v = snapshot.data;
              return _item(
                  header: v == null
                      ? 'Updating...'
                      : v == 0
                          ? '0 words'
                          : v > 1
                              ? '$v words'
                              : '$v word',
                  description: v == null
                      ? 'Words to review'
                      : v > 0
                          ? v > 1
                              ? 'Review them today'
                              : 'Review it today'
                          : 'No words to review today',
                  iconBackground: v == null
                      ? Colors.transparent
                      : Theme.of(context)
                          .colorScheme
                          .reviewCardPastel
                          .withValues(alpha: 0.15),
                  width: size.width - Constants.homeCardPadding,
                  asset: 'assets/study.png',
                  canTap: () => true,
                  onTap: () {
                    widget.onReview();
                  });
            }),
        _item(
            header: 'Manage words',
            description: 'Manage your study list',
            iconBackground: Theme.of(context)
                .colorScheme
                .manageCardPastel
                .withValues(alpha: 0.15),
            width: size.width - Constants.homeCardPadding,
            asset: 'assets/search2.png',
            canTap: () => true,
            onTap: () {
              widget.onManageWords();
            }),
        _item(
            header: 'Numerals',
            description: 'Listen to the numbers',
            iconBackground: Theme.of(context)
                .colorScheme
                .numeralsCardPastel
                .withValues(alpha: 0.15),
            width: size.width - Constants.homeCardPadding,
            asset: 'assets/numeral.png',
            canTap: () => true,
            onTap: () {
              widget.onNumerals();
            }),
      ])
      // ])
    ]);
  }

  Widget _item({
    required String header,
    required String description,
    required double width,
    required String asset,
    required bool Function() canTap,
    required Function() onTap,
    required Color iconBackground,
  }) {
    return RoundButton(
        color: Theme.of(context).colorScheme.cardHome,
        radius: 25,
        useShadow: true,
        useScaleAnimation: false,
        height: Constants.homeCardHeight,
        margin: const EdgeInsets.only(
          left: Constants.homeCardPadding,
          right: Constants.homeCardPadding,
          bottom: 16,
        ),
        width: width,
        onPressed: (_) {
          if (canTap()) {
            onTap();
          }
        },
        child: IgnorePointer(
          child: Stack(children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 14,
              ),
              child: Row(children: [
                Stack(children: [
                  Center(
                    child: Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        color: iconBackground,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              Text(
                                header,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: Constants.fontInter,
                                  fontWeight: FontWeight.bold,
                                  height: 1.1,
                                  color:
                                      Theme.of(context).colorScheme.homeCardH1,
                                ),
                              ),
                            ]),
                            const SizedBox(height: 8),
                            Text(
                              description,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: Constants.fontFredoka,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ]))
                ])
              ]),
            ),
            Positioned(
              top: -0,
              bottom: 0,
              right: 0,
              child: SizedBox(
                  width: 85,
                  child: Stack(children: [
                    Center(
                        child: SizedBox(
                      width: 65,
                      height: 65,
                      child: Image.asset(
                        asset,
                      ),
                    ))
                  ])),
            ),
          ]),
        ));
  }
}

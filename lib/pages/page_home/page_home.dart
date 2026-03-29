import 'package:vocabyte/components/disposable_stream.dart';
import 'package:flutter/material.dart';
import 'package:vocabyte/components/round_button.dart';
import 'package:vocabyte/main.dart';
import 'package:vocabyte/repository/app_rep.dart';
import 'package:vocabyte/repository/app_theme.dart';
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
    super.dispose();
    _dispStream.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var appRep = getIt<AppRep>();
    return Scaffold(
        // backgroundColor: Theme.of(context).colorScheme.pageHome,
        // backgroundColor: Theme.of(context).colorScheme.appBar,
        // backgroundColor: Colors.amber,
        backgroundColor: Theme.of(context).colorScheme.baseColor1,
        extendBody: true,
        bottomNavigationBar: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: BottomAppBar(
                padding: const EdgeInsets.symmetric(vertical: 8),
                color: Theme.of(context).colorScheme.bottomNavBg,
                shape: const CircularNotchedRectangle(),
                height: Constants.bottomNavHeight,
                notchMargin: 8.0,
                elevation: 10,
                shadowColor: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        icon: const Icon(Icons.home_filled), onPressed: () {}),
                    IconButton(
                        icon: const Icon(Icons.search), onPressed: () {}),
                    const SizedBox(width: 48),
                    IconButton(
                        icon: const Icon(Icons.menu_book), onPressed: () {}),
                    IconButton(
                        icon: const Icon(Icons.settings), onPressed: () {}),
                  ],
                ))),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.fabButton,
          elevation: 4,
          shape: const CircleBorder(),
          onPressed: () {
            // Trigger your smooth "Review" animation here
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          ),
        ),
        body: CustomScrollView(
            // physics: const BouncingScrollPhysics(),
            physics: const ClampingScrollPhysics(),
            slivers: [
              SliverAppBar(
                floating: true,
                snap: true,
                pinned: false,
                expandedHeight: Constants.homeAppBarHeight,
                collapsedHeight: Constants.homeAppBarHeight,
                toolbarHeight: Constants.homeAppBarHeight,
                automaticallyImplyLeading: false,
                backgroundColor: Theme.of(context).colorScheme.appBar,
                scrolledUnderElevation: 0,
                surfaceTintColor: Colors.transparent,
                elevation: 0,
                // Use 'title' instead of 'flexibleSpace' to stop the fading shit
                title: Container(
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
                      hintText: "Search your words...",
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 15),
                    ),
                  ),
                ),
              ),
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
                                  ? 'Review them today'
                                  : 'No words to review today',
                          smallIconBackground: v == null
                              ? Colors.transparent
                              : Theme.of(context)
                                  .colorScheme
                                  .reviewCardPastel
                                  .withValues(alpha: 0.15),
                          smallIcon: v == null
                              ? Stack(children: [
                                  Center(
                                      child: SizedBox(
                                          width: 25,
                                          height: 25,
                                          child: RepaintBoundary(
                                              child: CircularProgressIndicator(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .reviewCardPastelRequired,
                                          ))))
                                ])
                              : Icon(
                                  Icons.menu_book,
                                  color: Colors.transparent,
                                  // color: Theme.of(context)
                                  //     .colorScheme
                                  //     .reviewCardPastel,
                                  size: 25,
                                ),
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
                    smallIconBackground: Theme.of(context)
                        .colorScheme
                        .manageCardPastel
                        .withValues(alpha: 0.15),
                    smallIcon: Icon(
                      Icons.storage_rounded,
                      // color: Theme.of(context)
                      //     .colorScheme
                      //     .manageCardPastel
                      //     .withValues(alpha: 0.3)
                      color: Colors.transparent,
                      size: 14,
                    ),
                    width: size.width - Constants.homeCardPadding,
                    asset: 'assets/search2.png',
                    canTap: () => true,
                    onTap: () {
                      widget.onManageWords();
                    }),
                _item(
                    header: 'Numerals',
                    description: 'Listen to the numbers',
                    smallIcon: Icon(
                      Icons.confirmation_number,
                      color: Colors.transparent,
                      // color: Theme.of(context)
                      //     .colorScheme
                      //     .numeralsCardPastel
                      //     .withValues(alpha: 0.15),
                      size: 14,
                    ),
                    smallIconBackground: Theme.of(context)
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
            ]));
  }

  Widget _item({
    required String header,
    required String description,
    required double width,
    required String asset,
    required bool Function() canTap,
    required Function() onTap,
    required Widget smallIcon,
    required Color smallIconBackground,
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
                      color: smallIconBackground,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: smallIcon,
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
                                // fontWeight: FontWeight.normal,
                                // fontWeight: FontWeight.w700,
                                // fontFamily: Constants.font1,
                                fontWeight: FontWeight.bold,
                                height: 1.1,
                                color: Theme.of(context).colorScheme.homeCardH1,
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
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ]))
              ])
            ]),
          ),
          // ClipRRect(
          //     borderRadius: BorderRadius.circular(24),
          //     child: Stack(children: [
          //       Positioned(
          //           top: -0,
          //           bottom: 0,
          //           right: 5,
          //           child: Opacity(
          //             opacity: 0.50,
          //             child: SizedBox(
          //               width: 80,
          //               height: 80,
          //               child: Image.asset(asset),
          //             ),
          //           )),
          //     ]))
          // Positioned(
          //   right: 0,
          //   top: 0,
          //   bottom: 0,
          //   child: Container(
          //     width: 40,
          //     height: 40,
          //     decoration: BoxDecoration(
          //       color: smallIconColor,
          //       borderRadius: const BorderRadius.all(Radius.circular(10)),
          //     ),
          //     child: smallIcon,
          //   ),
          // ),
          ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Stack(children: [
                Positioned(
                  top: -0,
                  bottom: 0,
                  // left: 0,
                  right: 0,
                  child: Container(
                      width: 85,
                      // height: 40,
                      decoration: BoxDecoration(
                          // color: smallIconColor,
                          // color: Colors.green.shade50,
                          // borderRadius:
                          //     const BorderRadius.all(Radius.circular(10)),
                          ),
                      child: Stack(children: [
                        Center(
                            child: Opacity(
                          opacity: 1,
                          // opacity: 0.65,
                          // opacity: 0.50,
                          child: SizedBox(
                            width: 65,
                            height: 65,
                            child: Image.asset(
                              asset,
                              // width: 75,
                              // height: 75,
                            ),
                          ),
                        ))
                      ])),
                )
              ]))
        ])));
  }
}

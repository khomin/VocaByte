import 'package:vocabyte/components/disposable_stream.dart';
import 'package:flutter/material.dart';
import 'package:vocabyte/components/round_button.dart';
import 'package:vocabyte/main.dart';
import 'package:vocabyte/pages/home/home_card_item.dart';
import 'package:vocabyte/repository/app_rep.dart';
import 'package:vocabyte/repository/app_theme.dart';
import 'package:vocabyte/resource/constants.dart';

class PageHome extends StatefulWidget {
  const PageHome({
    required this.onReview,
    required this.onSearch,
    required this.onManageWords,
    required this.onNumerals,
    required this.onWizard,
    super.key,
  });
  final Function() onReview;
  final Function() onSearch;
  final Function() onManageWords;
  final Function() onNumerals;
  final Function() onWizard;

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
    var appRep = getIt<AppRep>();
    var size = MediaQuery.sizeOf(context);
    var padding = MediaQuery.paddingOf(context);
    return CustomScrollView(physics: const ClampingScrollPhysics(), slivers: [
      SliverAppBar(
          floating: true,
          snap: true,
          pinned: false,
          primary: false,
          expandedHeight: Constants.homeAppBarHeight + padding.top,
          collapsedHeight: Constants.homeAppBarHeight + padding.top,
          toolbarHeight: Constants.homeAppBarHeight + padding.top,
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).colorScheme.appBar,
          scrolledUnderElevation: 0,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          title: Hero(
            tag: 'search_bar',
            child: Material(
              color: Colors.transparent,
              child: Container(
                margin: EdgeInsets.only(top: padding.top),
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    widget.onSearch();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    shadowColor: Colors.transparent,
                    backgroundColor: Theme.of(context).colorScheme.textInputBox,
                  ),
                  child: TextFormField(
                      enabled: false,
                      decoration: InputDecoration(
                        // TODO: audio search
                        hintText: "Search your words...",
                        prefixIcon: Icon(
                          Icons.search,
                          color: Theme.of(context).colorScheme.iconColor,
                        ),
                        hintStyle: TextStyle(
                          color: Theme.of(context).colorScheme.iconColor,
                          fontSize: 16,
                          fontFamily: Constants.fontInter,
                        ),
                        border: InputBorder.none,
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 15),
                      )),
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
              return HomeCardItem(
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
                      : Theme.of(context).colorScheme.reviewCardPastel,
                  width: size.width - Constants.homeCardPadding,
                  asset: 'assets/study.png',
                  canTap: () => true,
                  onTap: () {
                    widget.onReview();
                  });
            }),
        HomeCardItem(
            header: 'Manage words',
            description: 'Manage your study list',
            iconBackground: Theme.of(context).colorScheme.manageCardPastel,
            width: size.width - Constants.homeCardPadding,
            asset: 'assets/search2.png',
            canTap: () => true,
            onTap: () {
              widget.onManageWords();
            }),
        HomeCardItem(
            header: 'Numerals',
            description: 'Listen to the numbers',
            iconBackground: Theme.of(context).colorScheme.numeralsCardPastel,
            width: size.width - Constants.homeCardPadding,
            asset: 'assets/numeral.png',
            canTap: () => true,
            onTap: () {
              widget.onNumerals();
            }),
        HomeCardItem(
            header: 'Library',
            description: 'Choose words to add',
            iconBackground: Theme.of(context).colorScheme.libraryCardPastel,
            width: size.width - Constants.homeCardPadding,
            asset: 'assets/library_pigeon.png',
            canTap: () => true,
            onTap: () {
              widget.onWizard();
            }),
      ]),
      SliverToBoxAdapter(
        child: SizedBox(height: MediaQuery.of(context).padding.bottom),
      ),
    ]);
  }
}

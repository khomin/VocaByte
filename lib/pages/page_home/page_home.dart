import 'package:provider/provider.dart';
import 'package:vocabyte/components/avatar.dart';
import 'package:vocabyte/components/disposable_stream.dart';
import 'package:flutter/material.dart';
import 'package:vocabyte/components/round_button.dart';
import 'package:vocabyte/repository/app_rep.dart';
import 'package:vocabyte/pages/settings/theme/app_theme.dart';
import 'package:vocabyte/app/ui_helper.dart';
import 'package:vocabyte/resource/constants.dart';

class PageHome extends StatefulWidget {
  const PageHome(
      {required this.onReview,
      required this.onSearch,
      required this.onManageWords,
      required this.onNumerals,
      super.key});

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
    return Builder(builder: (context) {
      var size = MediaQuery.of(context).size;
      return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.pageHome,
          appBar: AppBar(
              centerTitle: true,
              elevation: 1,
              shadowColor: Theme.of(context).colorScheme.title4,
              title: SizedBox(
                  height: kToolbarHeight,
                  width: double.infinity,
                  child: Stack(children: [
                    Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        top: 0,
                        child: Center(
                            child: Text('Home',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).colorScheme.title1))),
                    Positioned(
                        right: 0,
                        bottom: 10,
                        top: 10,
                        child: Avatar(onPressed: (p0) {}))
                  ]))),
          body: Column(children: [
            //
            // start padding
            const SizedBox(height: 20),
            Expanded(
                child: GridView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio:
                            UiHelper.calculateHomeGridRation(size.width),
                        crossAxisSpacing: 1),
                    children: [
                  StreamBuilder(
                      stream: context.read<AppRep>().reviewTask.wordToReviewCnt,
                      initialData: context
                          .read<AppRep>()
                          .reviewTask
                          .wordToReviewCnt
                          .valueOrNull,
                      builder: (context, snapshot) {
                        var v = snapshot.data;
                        return _item(
                            iconInt: v,
                            header: v == null
                                ? 'Refreshing..'
                                : v > 0
                                    ? 'Review'
                                    : 'No words to review',
                            description:
                                'Keep your words memorized\nAdd words using search',
                            canClick: () => v != 0,
                            onClick: () {
                              widget.onReview();
                            });
                      }),
                  _item(
                      // icon: Icons.search_outlined,
                      icon: Image.asset('assets/search2.png',
                          width: Constants.iconHomeSize),
                      header: 'Search',
                      description:
                          'Find a word\nand see its meaning\nwith examples',
                      canClick: () => true,
                      onClick: () {
                        widget.onSearch();
                      }),
                  _item(
                      // icon: Icons.confirmation_number,
                      icon: Image.asset('assets/numeral.png',
                          cacheWidth: 150,
                          cacheHeight: 150,
                          width: Constants.iconHomeSize),
                      header: 'Numerals',
                      description:
                          'Listen to the number\nEnter it without mistakes',
                      canClick: () => true,
                      onClick: () {
                        widget.onNumerals();
                      }),
                  _item(
                      // icon: Icons.storage_rounded,
                      icon: Image.asset('assets/manage.png',
                          width: Constants.iconHomeSize),
                      header: 'Manage words',
                      description: 'Manage your study list',
                      canClick: () => true,
                      onClick: () {
                        widget.onManageWords();
                      })
                ]))
          ]));
    });
  }

  Widget _item(
      {Widget? icon,
      required String header,
      required String description,
      int? iconInt,
      required bool Function() canClick,
      required Function() onClick}) {
    return Padding(
        padding: const EdgeInsets.all(4),
        child: RoundButton(
            color: Theme.of(context).colorScheme.cardHome,
            radius: 12,
            useShadow: true,
            useScaleAnimation: true,
            onPressed: (_) {
              if (canClick()) {
                onClick();
              }
            },
            child: IgnorePointer(
                child: Padding(
                    padding: const EdgeInsets.only(
                      left: 14, right: 14, //top: 10,
                      // bottom: 10
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Image.asset('assets/numeral.png', width: 80),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                icon ??
                                    SizedBox(
                                        height: 40,
                                        child: icon ??
                                            (iconInt != null
                                                ? Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            const BorderRadius.all(
                                                                Radius.circular(
                                                                    8)),
                                                        color: iconInt > 0
                                                            ? Theme.of(context)
                                                                .colorScheme
                                                                .buttonOption2
                                                            : Theme.of(context)
                                                                .colorScheme
                                                                .buttonOption1),
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10,
                                                            right: 10),
                                                    child: Center(
                                                        child: Text('$iconInt',
                                                            style: Theme.of(context)
                                                                .colorScheme
                                                                .titleInverse)))
                                                : const Padding(
                                                    padding: EdgeInsets.only(left: 10),
                                                    child: Stack(children: [
                                                      SizedBox(
                                                          width: 20,
                                                          height: 20,
                                                          child: Center(
                                                              child: RepaintBoundary(
                                                                  child:
                                                                      CircularProgressIndicator())))
                                                    ])))),
                              ]),
                          Column(children: [
                            Row(children: [
                              Expanded(
                                  child: Text(header,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                      maxLines: 5,
                                      overflow: TextOverflow.ellipsis))
                            ]),
                            // const SizedBox(height: 10),
                            const SizedBox(height: 10),
                            Row(children: [
                              Expanded(
                                  child: Text(description,
                                      style: const TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400),
                                      maxLines: 5,
                                      overflow: TextOverflow.ellipsis))
                            ])
                          ])
                        ])))));
  }
}

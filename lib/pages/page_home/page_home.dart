import 'package:provider/provider.dart';
import 'package:vocabyte/components/circle_button.dart';
import 'package:vocabyte/components/container_click.dart';
import 'package:vocabyte/components/disposable_stream.dart';
import 'package:flutter/material.dart';
import 'package:vocabyte/repository/app_rep.dart';
import 'package:vocabyte/app/app_theme.dart';
import 'package:vocabyte/app/ui_helper.dart';

class PageHome extends StatefulWidget {
  const PageHome(
      {required this.onGoToReview,
      required this.onGoToSearch,
      required this.onGoToManageWords,
      required this.onGoToNumerals,
      super.key});

  final Function onGoToReview;
  final Function onGoToSearch;
  final Function onGoToManageWords;
  final Function onGoToNumerals;

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
          // backgroundColor: Colors.deepOrange,
          backgroundColor: Theme.of(context).colorScheme.page,
          appBar: AppBar(
              // surfaceTintColor: Theme.of(context).colorScheme.baseColor1,
              // backgroundColor: Theme.of(context).colorScheme.baseColor1,
              backgroundColor: Colors.black,
              centerTitle: true,
              shadowColor: Theme.of(context).colorScheme.titel3,
              foregroundColor: Theme.of(context).colorScheme.iconColor,
              // automaticallyImplyLeading: context.watch<AppModel>().drawerOn,
              // titleSpacing:
              //     (Platform.isIOS || Platform.isAndroid) ? 0 : null,
              title: SizedBox(
                  height: kToolbarHeight,
                  width: double.infinity,
                  // color: Colors.amber,
                  child: Stack(
                      // alignment: Alignment.center,
                      children: [
                        // if (!context.watch<AppModel>().drawerOn)
                        // Row(
                        //     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       //   CircleButton(
                        //       //       iconData: Icons.arrow_back,
                        //       //       color: Colors.transparent,
                        //       //       onPressed: (_) {
                        //       //         // var nav = context.read<AppModel>().appNavKey;
                        //       //         // if (nav.currentState?.canPop() == true) {
                        //       //         //   nav.currentState?.pop();
                        //       //         // }
                        //       //       })
                        //       const Spacer(),
                        Positioned(
                            left: 0,
                            right: 0,
                            bottom: 0,
                            top: 0,
                            child: Center(
                                child: Text(
                                    'Home', //NavigatorRep().routeBloc.routeName(page),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .titel1)))),
                        //       const Spacer(),
                        Positioned(
                            right: 0,
                            bottom: 10,
                            top: 10,
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: const BoxDecoration(
                                  color: Colors.greenAccent,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                            ))
                        // ])
                      ]))),
          body: Column(children: [
            //
            // start padding
            const SizedBox(height: 20),

            Expanded(
                child: GridView(
                    shrinkWrap: true,
                    // padding: EdgeInsets.zero,
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
                        var v = snapshot.data ?? 0;
                        return _item(
                            iconInt: v,
                            header: v > 0 ? 'Review' : 'No words to review',
                            description:
                                'Keep your words memorized\nAdd words using search',
                            canClick: () => v != 0,
                            onClick: () {
                              widget.onGoToReview();
                            });
                      }),
                  _item(
                      icon: Icons.search_outlined,
                      header: 'Search',
                      description:
                          'Find a word\nand see its meaning\nwith examples',
                      canClick: () => true,
                      onClick: () {
                        widget.onGoToSearch();
                      }),
                  _item(
                      icon: Icons.confirmation_number,
                      header: 'Numerals',
                      description:
                          'Listen to the number\nEnter it without mistakes',
                      canClick: () => true,
                      onClick: () {
                        widget.onGoToNumerals();
                      }),
                  _item(
                      icon: Icons.storage_rounded,
                      header: 'Manage words',
                      description: 'Manage your study list',
                      canClick: () => true,
                      onClick: () {
                        widget.onGoToManageWords();
                      })
                ]))
          ]));
    });
  }

  Widget _item(
      {IconData? icon,
      required String header,
      required String description,
      int? iconInt,
      required bool Function() canClick,
      required Function() onClick}) {
    return ContainerClick(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        // boxColor: Theme.of(context).colorScheme.card,
        boxColor: const Color.fromARGB(255, 29, 29, 29),
        clickedColor: Theme.of(context).colorScheme.menuActive,
        onClicked: () {
          if (canClick()) {
            onClick();
          }
        },
        child: Padding(
            padding:
                const EdgeInsets.only(left: 14, right: 14, top: 20, bottom: 10),
            child: Column(children: [
              Row(children: [
                SizedBox(
                    height: 35,
                    child: icon != null
                        ? Icon(icon, size: 35)
                        : (iconInt != null
                            ? Container(
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8)),
                                    color: iconInt > 0
                                        ? Theme.of(context)
                                            .colorScheme
                                            .buttonOption2
                                        : Theme.of(context)
                                            .colorScheme
                                            .buttonOption1),
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Center(
                                    child: Text('$iconInt',
                                        style: const TextStyle(fontSize: 20))))
                            : const SizedBox()))
              ]),
              const SizedBox(height: 10),
              Row(children: [
                Expanded(
                    child: Text(header,
                        style: const TextStyle(fontSize: 14),
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis))
              ]),
              const SizedBox(height: 10),
              Row(children: [
                Expanded(
                    child: Text(description,
                        style: const TextStyle(fontSize: 10),
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis))
              ])
            ])));
  }
}

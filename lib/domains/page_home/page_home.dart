import 'package:provider/provider.dart';
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
      return Container(
          color: Theme.of(context).colorScheme.page,
          child: Column(children: [
            //
            // start padding
            const SizedBox(height: 20),

            Expanded(
                child: GridView(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio:
                            UiHelper.calculateHomeGridRation(size.width),
                        crossAxisSpacing: 1),
                    children: [
                  StreamBuilder(
                      stream: context.read<AppRep>().reviewTask.wordToReviewCnt,
                      builder: (context, snapshot) {
                        var v = snapshot.data ?? 0;
                        return _item(
                            iconInt: v,
                            header: v > 0 ? 'Review' : 'No words to review',
                            description:
                                'Keep your words memorized\nYou can add more words using search',
                            canClick: () => v != 0,
                            onClick: () {
                              widget.onGoToReview();
                            });
                      }),
                  _item(
                      icon: Icons.search_outlined,
                      header: 'Search',
                      description:
                          'Find a word and see its meaning with examples',
                      canClick: () => true,
                      onClick: () {
                        widget.onGoToSearch();
                      }),
                  _item(
                      icon: Icons.confirmation_number,
                      header: 'Numerals',
                      description:
                          'Listen to the number and enter it without mistakes',
                      canClick: () => true,
                      onClick: () {
                        widget.onGoToNumerals();
                      }),
                  _item(
                      icon: Icons.storage_rounded,
                      header: 'Manage words',
                      description:
                          'Look at the words in your study list\nChange the next review date or delete them',
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
        boxColor: Theme.of(context).colorScheme.card,
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
                                padding: const EdgeInsets.all(4),
                                margin: const EdgeInsets.only(right: 8),
                                child: Text(
                                  '$iconInt',
                                  style: const TextStyle(fontSize: 20),
                                ))
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

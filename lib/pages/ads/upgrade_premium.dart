import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:vocabyte/components/item_in_menu_list.dart';
import 'package:vocabyte/repository/app_theme.dart';
import 'package:vocabyte/resource/constants.dart';

class UpgradePremium extends StatelessWidget {
  final Stream<String?> price;
  final Function() onPressed;

  const UpgradePremium({
    required this.price,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.cardUpgrade,
            borderRadius: BorderRadius.circular(15),
          ),
          margin: const EdgeInsets.only(
            left: Constants.homeCardPadding,
            right: Constants.homeCardPadding,
            top: 30,
            bottom: 15,
          ),
          child: Stack(children: [
            Column(children: [
              ItemInMenuList(
                  useBorderTop: false,
                  useBorderBot: false,
                  padding: EdgeInsets.only(
                      left: Constants.settingsCardPadding.left,
                      right: Constants.settingsCardPadding.right),
                  onClicked: (_) async {
                    onPressed();
                  },
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Row(children: [
                              Text(
                                'Upgrade to Pro',
                                style:
                                    Theme.of(context).colorScheme.titleUpgrade,
                              )
                            ])),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'To remove all limits',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .titleUpgrade
                                        .color,
                                    fontSize: Theme.of(context)
                                        .colorScheme
                                        .title2
                                        .fontSize,
                                    fontFamily: Theme.of(context)
                                        .colorScheme
                                        .title2
                                        .fontFamily,
                                    fontWeight: Theme.of(context)
                                        .colorScheme
                                        .title2
                                        .fontWeight,
                                  ),
                                ),
                              ]),
                        ),
                      ])),
            ]),
            Positioned(
              right: 20,
              top: 0,
              bottom: 0,
              child: Row(children: [
                Padding(
                    padding:
                        const EdgeInsets.only(top: 20, bottom: 20, right: 20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          StreamBuilder(
                              stream: price,
                              builder: (context, snapshot) {
                                var v = snapshot.data;
                                if (v == null) {
                                  return const SizedBox();
                                }
                                return Text(
                                  v,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .titleUpgrade
                                        .color,
                                    fontSize: 16,
                                    fontFamily: Theme.of(context)
                                        .colorScheme
                                        .title2
                                        .fontFamily,
                                    fontWeight: FontWeight.w500,
                                  ),
                                );
                              }),
                        ])),
                IgnorePointer(
                    child: Icon(
                  Symbols.crown,
                  size: 50,
                  color: Theme.of(context).colorScheme.titleUpgrade.color,
                )),
              ]),
            )
          ]));
    });
  }
}

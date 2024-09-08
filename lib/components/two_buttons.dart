import 'package:flutter/material.dart';
import 'package:vocabyte/components/button3.dart';
import 'package:vocabyte/app/app_theme.dart';
import 'package:vocabyte/app/ui_helper.dart';

class TwoButtons extends StatelessWidget {
  const TwoButtons(
      {required this.textLeft,
      required this.textRight,
      this.iconLeft,
      this.iconRight,
      required this.onCancel,
      required this.onOk,
      super.key});
  final String textLeft;
  final String textRight;
  final String? iconLeft;
  final String? iconRight;
  final Function onCancel;
  final Function onOk;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 10, top: UiHelper.isDesktop() ? 10 : 20),
        height: UiHelper.isDesktop() ? 80 : 40,
        alignment: Alignment.centerLeft,
        child: UiHelper.isDesktop()
            // desktop
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                    const Spacer(),
                    Button3(
                        text: textLeft,
                        iconPath: iconLeft,
                        color: Theme.of(context).colorScheme.buttonOption1,
                        colorText: Theme.of(context).colorScheme.cardText,
                        onPressed: () {
                          onCancel.call();
                        }),
                    const SizedBox(width: 10),
                    if (textRight != '')
                      Button3(
                          text: textRight,
                          iconPath: iconRight,
                          color: Theme.of(context).colorScheme.buttonOption2,
                          colorText: Theme.of(context).colorScheme.cardText,
                          onPressed: () {
                            onOk();
                          }),
                    const Spacer()
                  ])
            // mobile
            : Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                    const Spacer(),
                    TextButton(
                        onPressed: () {
                          onCancel.call();
                        },
                        child: Text(
                          textLeft,
                          style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .dialogHeaderText2),
                        )),
                    const SizedBox(width: 10),
                    TextButton(
                        onPressed: () {
                          onOk();
                        },
                        child: Text(
                          textRight,
                          style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .dialogHeaderText2),
                        )),
                  ]));
  }
}

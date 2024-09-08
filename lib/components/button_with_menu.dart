import 'package:flutter/material.dart';
import 'package:vocabyte/components/button_round_corner.dart';
import 'package:vocabyte/app/app_theme.dart';
import 'package:vocabyte/app/const_values.dart';

class ButtonWithMenu extends StatelessWidget {
  const ButtonWithMenu(
      {required this.text,
      required this.onPressed,
      required this.onMenu,
      super.key});
  final String text;
  final Function() onPressed;
  final Function() onMenu;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
          child: ButtonRoundCorner(
              text: text,
              color: Theme.of(context).colorScheme.buttonOption1,
              colorText: Theme.of(context).colorScheme.cardText,
              direction: TextDirection.ltr,
              radious: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10)),
              onPressed: () {
                onPressed();
              })),
      SizedBox(
          width: 40,
          height: ConstValues.buttonHeight,
          child: ElevatedButton(
              onPressed: () {
                onMenu();
              },
              autofocus: false,
              style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8),
                          bottomRight: Radius.circular(8))),
                  padding: EdgeInsets.zero,
                  backgroundColor: Theme.of(context).colorScheme.buttonOption3,
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                    color: Theme.of(context).colorScheme.baseColor1,
                  )),
              child: Icon(Icons.arrow_drop_down_outlined,
                  color: Theme.of(context).colorScheme.cardText)))
    ]);
  }
}

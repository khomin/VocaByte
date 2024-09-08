import 'package:flutter/material.dart';
import 'package:vocabyte/components/button3.dart';
import 'package:vocabyte/components/dialogs/dialog_header.dart';
import 'package:vocabyte/app/app_theme.dart';
import 'package:vocabyte/app/const_values.dart';

class ErrorDialog {
  void show(BuildContext context, String error, {Function? onClosed}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
            backgroundColor: Theme.of(context).colorScheme.dialogBackground,
            titlePadding: EdgeInsets.zero,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            title: DialogHeader(
                text: 'Error',
                height: ConstValues.dialogHeaderMiddle,
                close: () {
                  onClosed?.call();
                  Navigator.pop(context);
                }),
            children: <Widget>[
              Center(
                  child: SelectableText(error,
                      style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.lightBlueText))),
              SimpleDialogOption(
                  child: Column(children: [
                Container(
                    margin: const EdgeInsets.only(left: 10),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Button3(
                            text: 'Ok',
                            iconData: Icons.cancel,
                            color: Theme.of(context).colorScheme.baseColor2,
                            colorText: Theme.of(context).colorScheme.text1,
                            onPressed: () {
                              Navigator.pop(context);
                              onClosed?.call();
                            })
                      ],
                    ))
              ]))
            ]);
      },
    ).then((value) => onClosed?.call());
  }
}

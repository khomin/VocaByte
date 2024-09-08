import 'package:flutter/material.dart';
import 'package:vocabyte/components/dialogs/dialog_header.dart';
import 'package:vocabyte/components/two_buttons.dart';
import 'package:vocabyte/app/app_theme.dart';
import 'package:vocabyte/app/const_values.dart';
import 'package:vocabyte/app/ui_helper.dart';

class ConfirmDialog {
  void show(
      {required BuildContext context,
      required String header,
      required String label,
      required String button,
      Function? onDone,
      Function? onCancel}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          titlePadding: EdgeInsets.zero,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          title: UiHelper.isDesktop()
              ? DialogHeader(
                  text: '',
                  height: ConstValues.dialogHeaderMiddle,
                  close: () {
                    onCancel?.call();
                    Navigator.pop(context);
                  })
              : null,
          children: <Widget>[
            SimpleDialogOption(
              child: Text(header,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: ConstValues.dialogHeadertFontSize,
                      fontWeight: ConstValues.dialogHeaderFontWeight,
                      color: Theme.of(context).colorScheme.dialogHeaderText)),
            ),
            SimpleDialogOption(
              child: Column(children: [
                Container(
                  alignment: Alignment.center,
                  child: Text(label,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: ConstValues.dialogFontSize,
                          fontWeight: ConstValues.dialogHeaderFontWeight,
                          color:
                              Theme.of(context).colorScheme.dialogHeaderText)),
                ),
                const SizedBox(height: 25),
                TwoButtons(
                    textLeft: 'Cancel',
                    textRight: button,
                    onCancel: () {
                      Navigator.pop(context);
                      onCancel?.call();
                    },
                    onOk: () {
                      Navigator.pop(context);
                      onDone?.call();
                    })
              ]),
            ),
          ],
        );
      },
    );
  }
}

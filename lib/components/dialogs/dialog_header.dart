import 'package:flutter/material.dart';
import 'package:vocabyte/components/button2.dart';
import 'package:vocabyte/components/circle_button.dart';
import 'package:vocabyte/app/app_theme.dart';
import 'package:vocabyte/app/const_values.dart';
import 'package:vocabyte/app/ui_helper.dart';

class DialogHeader extends StatelessWidget {
  const DialogHeader(
      {this.text,
      this.close,
      this.isCollapsed = false,
      this.useShadow = true,
      this.height = 30,
      this.color,
      this.child,
      super.key});
  final String? text;
  final Function? close;
  final double height;
  final bool isCollapsed;
  final bool useShadow;
  final Color? color;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        decoration: useShadow
            ? UiHelper().boxShadow(context, ConstValues.shadowDown,
                color: color ?? Theme.of(context).colorScheme.dialogHeaderColor)
            : null,
        color:
            !useShadow ? Theme.of(context).colorScheme.dialogHeaderColor : null,
        padding: EdgeInsets.zero,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          if (isCollapsed)
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleButton(
                      iconData: Icons.arrow_back,
                      color: Colors.transparent,
                      onPressed: (_) {
                        close?.call();
                      })
                ]),
          if (text != null) const SizedBox(width: 10),
          if (text != null)
            Expanded(
                flex: 2,
                child: Text(text ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.text1))),
          if (text != null) const Spacer(flex: 1),
          //
          // additional
          if (child != null) child!,
          //
          // close x
          if (!isCollapsed)
            Button2(
                text: 'Close',
                iconData: Icons.close,
                onPressed: () {
                  close?.call();
                }),
          const SizedBox(width: 10)
        ]));
  }
}

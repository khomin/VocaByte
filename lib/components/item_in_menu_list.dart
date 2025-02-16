import 'package:flutter/material.dart';
import 'package:vocabyte/test_parts/convert_epub_txt.dart';
import 'package:vocabyte/app/app_theme.dart';

class ItemInMenuList extends StatelessWidget {
  const ItemInMenuList(
      {required this.useBorderTop,
      required this.useBorderBot,
      required this.height,
      required this.child,
      this.padding,
      this.margin,
      this.onClicked,
      super.key});
  final bool useBorderTop;
  final bool useBorderBot;
  final double height;
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Function()? onClicked;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: height,
        margin: margin,
        decoration: BoxDecoration(
            border: Border(
                top: useBorderTop
                    ? BorderSide(
                        color: Theme.of(context).colorScheme.menuBorderColor,
                        width: 1)
                    : BorderSide.none,
                bottom: useBorderBot
                    ? BorderSide(
                        color: Theme.of(context).colorScheme.menuBorderColor,
                        width: 1)
                    : BorderSide.none)),
        child: onClicked != null
            ? ElevatedButton(
                onPressed: () {
                  onClicked?.call();
                },
                autofocus: false,
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide.none),
                    padding: padding ?? EdgeInsets.zero,
                    alignment: Alignment.center,
                    animationDuration: Duration.zero,
                    shadowColor: Colors.transparent,
                    backgroundColor: Colors.transparent,
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w300, fontSize: 12)),
                child: child)
            : child);
  }
}

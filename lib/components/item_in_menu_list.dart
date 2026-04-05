import 'package:flutter/material.dart';
import 'package:vocabyte/components/hover_click.dart';
import 'package:vocabyte/repository/app_theme.dart';

class ItemInMenuList extends StatelessWidget {
  const ItemInMenuList({
    required this.useBorderTop,
    required this.useBorderBot,
    this.minHeight,
    required this.child,
    this.padding,
    this.margin,
    this.onClicked,
    this.duration,
    super.key,
  });
  final bool useBorderTop;
  final bool useBorderBot;
  final double? minHeight;
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Function(Offset pos)? onClicked;
  final Duration? duration;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: margin,
        constraints: BoxConstraints(
          minHeight: minHeight ?? 0.0,
        ),
        decoration: BoxDecoration(
            border: Border(
                top: useBorderTop
                    ? BorderSide(
                        color: Theme.of(context).colorScheme.menuBorderColor,
                        width: 1,
                      )
                    : BorderSide.none,
                bottom: useBorderBot
                    ? BorderSide(
                        color: Theme.of(context).colorScheme.menuBorderColor,
                        width: 1,
                      )
                    : BorderSide.none)),
        child: onClicked != null
            ? HoverClick(
                // right click for desktops
                onPressedR: (_) {
                  RenderBox box = context.findRenderObject() as RenderBox;
                  Offset pos = box.localToGlobal(Offset.zero);
                  onClicked?.call(pos);
                },
                child: ElevatedButton(
                  onPressed: () async {
                    RenderBox box = context.findRenderObject() as RenderBox;
                    Offset pos = box.localToGlobal(Offset.zero);
                    if (duration != null) {
                      await Future.delayed(duration!);
                    }
                    onClicked?.call(pos);
                  },
                  autofocus: false,
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: BorderSide.none,
                      ),
                      padding: padding ?? EdgeInsets.zero,
                      visualDensity: VisualDensity.defaultDensityForPlatform(
                        TargetPlatform.android,
                      ),
                      alignment: Alignment.center,
                      animationDuration: Duration.zero,
                      shadowColor: Colors.transparent,
                      backgroundColor: Colors.transparent,
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                      )),
                  child: child,
                ),
              )
            : child);
  }
}

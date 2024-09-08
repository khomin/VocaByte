import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HoverClickComponent extends StatelessWidget {
  const HoverClickComponent(
      {this.onClick,
      this.onHover,
      this.child,
      this.cursor = SystemMouseCursors.click,
      super.key});
  final Function? onHover;
  final Function? onClick;
  final Widget? child;
  final SystemMouseCursor cursor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTapUp: (details) {
          if (onClick is Function(TapUpDetails)) {
            onClick?.call(details);
          } else {
            onClick?.call();
          }
        },
        child: MouseRegion(
            cursor: cursor,
            onEnter: (event) {
              onHover?.call(true);
            },
            onExit: (event) {
              onHover?.call(false);
            },
            child: child));
  }
}

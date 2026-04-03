import 'package:flutter/material.dart';

class HoverClick extends StatelessWidget {
  const HoverClick({
    super.key,
    this.onPressedL,
    this.onPressedR,
    this.onHover,
    this.onHoverPos,
    this.onDragPos,
    this.onLongPress,
    this.onDoubleTap,
    this.activity,
    this.cursor = SystemMouseCursors.click,
    this.child,
  });
  final Function(bool on)? onHover;
  final Function(Offset pos)? onHoverPos;
  final Function(DragUpdateDetails details)? onDragPos;
  final Function(Offset pos)? onPressedL;
  final Function(Offset pos)? onPressedR;
  final Function(Offset pos)? onLongPress;
  final Function()? onDoubleTap;
  final Widget? child;
  final Function()? activity;
  final MouseCursor? cursor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTapUp: onPressedL != null
            ? (details) {
                onPressedL?.call(details.globalPosition);
              }
            : null,
        onLongPressStart: onLongPress != null
            ? (details) {
                onLongPress?.call(details.globalPosition);
              }
            : null,
        onSecondaryTapUp: onPressedR != null
            ? (details) {
                onPressedR?.call(details.globalPosition);
              }
            : null,
        onDoubleTap: onDoubleTap != null
            ? () {
                onDoubleTap?.call();
              }
            : null,
        onPanUpdate: onDragPos,
        child: MouseRegion(
          onHover: (pos) {
            activity?.call();
            onHoverPos?.call(pos.position);
          },
          cursor: cursor ?? SystemMouseCursors.basic,
          onEnter: onHover != null
              ? (event) {
                  onHover?.call(true);
                }
              : null,
          onExit: onHover != null
              ? (event) {
                  onHover?.call(false);
                }
              : null,
          child: child,
        ));
  }
}

import 'package:vocabyte/components/hover_click_component.dart';
import 'package:flutter/material.dart';

class HoverButton extends StatefulWidget {
  const HoverButton(
      {required this.icon,
      required this.onClicked,
      this.color,
      this.size,
      this.hoverColor,
      this.padding,
      super.key});

  final Function(Offset) onClicked;
  final IconData icon;
  final Color? color;
  final Color? hoverColor;
  final EdgeInsets? padding;
  final double? size;

  @override
  State<HoverButton> createState() => _State();
}

class _State extends State<HoverButton> {
  var isHover = false;

  @override
  Widget build(BuildContext context) {
    return HoverClickComponent(
        onClick: (details) {
          widget.onClicked.call(details.globalPosition);
        },
        onHover: (hover) {
          setState(() {
            isHover = hover;
          });
        },
        child: Container(
          padding: widget.padding ?? const EdgeInsets.all(8),
          child: Icon(widget.icon,
              size: widget.size,
              color: isHover ? widget.hoverColor! : widget.color!),
        ));
  }
}

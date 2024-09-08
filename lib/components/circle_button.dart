import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vocabyte/app/ui_helper.dart';

class CircleButton extends StatelessWidget {
  const CircleButton(
      {this.iconData,
      this.iconPath,
      this.color,
      this.iconColor,
      this.onPressed,
      this.padding,
      super.key});
  final IconData? iconData;
  final String? iconPath;
  final Function(Offset)? onPressed;
  final Color? color;
  final Color? iconColor;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    var key = GlobalKey();
    return ElevatedButton(
        onPressed: () {
          RenderBox box = key.currentContext?.findRenderObject() as RenderBox;
          Offset pos = box.localToGlobal(Offset.zero); //this is global position
          onPressed?.call(pos);
        },
        key: key,
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            shadowColor: Colors.transparent,
            elevation: 0.0,
            backgroundColor: color,
            surfaceTintColor: Colors.transparent,
            padding: padding ?? const EdgeInsets.all(15),
            minimumSize: UiHelper.isMobile() ? Size.zero : null),
        child: iconData != null
            ? Icon(iconData, color: iconColor ?? Colors.white)
            : (iconPath != null
                ? SvgPicture.asset(iconPath ?? '',
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn))
                : const SizedBox()));
  }
}

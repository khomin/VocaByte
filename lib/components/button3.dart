import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Button3 extends StatelessWidget {
  const Button3(
      {this.text,
      this.colorText,
      this.alignment,
      this.iconData,
      this.iconPath,
      this.direction = TextDirection.ltr,
      this.padding,
      this.color,
      this.onPressed,
      super.key});
  final String? text;
  final IconData? iconData;
  final String? iconPath;
  final Function? onPressed;
  final Color? color;
  final Color? colorText;
  final Alignment? alignment;
  final TextDirection direction;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => onPressed?.call(),
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: padding,
            elevation: 0,
            backgroundColor: color,
            textStyle: TextStyle(
                fontWeight: FontWeight.w300, fontSize: 12, color: colorText)),
        child: Directionality(
            textDirection: direction,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // to preserve same height
                const SizedBox(height: 20),
                if (iconData != null)
                  Icon(iconData, color: colorText, size: 20),
                if (iconPath != null)
                  SvgPicture.asset(
                    iconPath!,
                    height: 20,
                    width: 20,
                    colorFilter: ColorFilter.mode(colorText!, BlendMode.srcIn),
                  ),
                const SizedBox(width: 5),
                Text(text!,
                    style: TextStyle(
                        color: colorText,
                        fontWeight: FontWeight.w500,
                        fontSize: 14))
              ],
            )));
  }
}

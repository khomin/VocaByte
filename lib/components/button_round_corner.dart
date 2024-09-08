import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vocabyte/app/app_theme.dart';
import 'package:vocabyte/app/const_values.dart';
import 'package:vocabyte/app/ui_helper.dart';

class ButtonRoundCorner extends StatelessWidget {
  const ButtonRoundCorner(
      {this.text,
      this.colorText,
      this.alignment,
      this.iconData,
      this.iconPath,
      this.direction = TextDirection.ltr,
      this.padding,
      this.color,
      this.borderColor,
      this.onPressed,
      required this.radious,
      super.key});
  final String? text;
  final IconData? iconData;
  final String? iconPath;
  final Function? onPressed;
  final Color? color;
  final Color? colorText;
  final Color? borderColor;
  final Alignment? alignment;
  final TextDirection direction;
  final EdgeInsets? padding;
  final BorderRadiusGeometry radious;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: padding ?? EdgeInsets.zero,
        child: ElevatedButton(
            onPressed: () => onPressed?.call(),
            autofocus: false,
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: radious,
                    side: borderColor != null
                        ? BorderSide(width: 1.5, color: borderColor!)
                        : BorderSide.none),
                padding: EdgeInsets.zero,
                backgroundColor: color,
                textStyle: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                  color: Theme.of(context).colorScheme.baseColor1,
                )),
            child: Directionality(
                textDirection: direction,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  // to preserve same height
                  const SizedBox(height: ConstValues.buttonHeight),
                  if (iconData != null)
                    Icon(iconData, color: colorText, size: 14),
                  if (iconPath != null)
                    SvgPicture.asset(iconPath!,
                        height: 14,
                        width: 14,
                        colorFilter: colorText != null
                            ? ColorFilter.mode(colorText!, BlendMode.srcIn)
                            : null),
                  if (text != null) const SizedBox(width: 8),
                  if (text != null)
                    Text(text!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: colorText,
                            fontWeight: FontWeight.w500,
                            fontSize: UiHelper.isMobile() ? 14 : 12))
                ]))));
  }
}

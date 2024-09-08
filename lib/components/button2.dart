import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vocabyte/app/app_theme.dart';

class Button2 extends StatelessWidget {
  const Button2(
      {required this.text,
      this.alignment,
      this.iconData,
      this.iconPath,
      this.direction = TextDirection.ltr,
      this.onPressed,
      this.padding,
      super.key});
  final String text;
  final IconData? iconData;
  final String? iconPath;
  final Function()? onPressed;
  final Alignment? alignment;
  final TextDirection direction;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => onPressed?.call(),
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(90),
            ),
            padding: padding ?? const EdgeInsets.all(15),
            elevation: 0,
            backgroundColor: Theme.of(context).colorScheme.transparent,
            shadowColor: Theme.of(context).colorScheme.transparent,
            textStyle: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 12,
              color: Theme.of(context).colorScheme.baseColor1,
            )),
        child: Directionality(
            textDirection: direction,
            child: Row(children: [
              if (iconData != null)
                Icon(iconData,
                    color: Theme.of(context).colorScheme.button2Text, size: 20),
              if (iconPath != null)
                SvgPicture.asset(
                  iconPath!,
                  height: 20,
                  width: 20,
                ),
              const SizedBox(width: 5),
              Text(text,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.button2Text,
                      fontWeight: FontWeight.w500,
                      fontSize: 14))
            ])));
  }
}

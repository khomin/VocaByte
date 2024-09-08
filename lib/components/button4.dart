import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vocabyte/app/app_theme.dart';

class Button4 extends StatelessWidget {
  const Button4(
      {required this.text,
      this.alignment,
      this.iconData,
      this.iconPath,
      this.direction,
      this.onPressed,
      super.key});
  final String text;
  final IconData? iconData;
  final String? iconPath;
  final Function? onPressed;
  final Alignment? alignment;
  final TextDirection? direction;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => onPressed?.call(),
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(90),
            ),
            // padding: const EdgeInsets.all(4),
            elevation: 10,
            surfaceTintColor: Colors.transparent,
            foregroundColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            fixedSize: const Size(40, 40),
            shadowColor: Colors.transparent,
            textStyle: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 12,
              color: Theme.of(context).colorScheme.iconColor,
            )),
        child: Row(children: [
          if (iconData != null)
            Icon(iconData,
                color: Theme.of(context).colorScheme.iconColor, size: 20),
          if (iconPath != null)
            SvgPicture.asset(
              iconPath!,
              height: 20,
              width: 20,
            ),
          // if (text.isNotEmpty) const SizedBox(width: 5),
          // if (text.isNotEmpty)
          //   Text(text,
          //       style: TextStyle(
          //           color: Theme.of(context).colorScheme.inputText,
          //           fontWeight: FontWeight.w500,
          //           fontFamily: ConstValues.font,
          //           fontSize: 14))
        ]));
  }
}

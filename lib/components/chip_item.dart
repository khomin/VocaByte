import 'package:flutter/material.dart';
import 'package:vocabyte/repository/app_theme.dart';
import 'package:vocabyte/resource/constants.dart';

class ChipItem extends StatelessWidget {
  const ChipItem({
    required this.text,
    required this.active,
    required this.onPressed,
    super.key,
  });
  final String text;
  final bool active;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      labelPadding: const EdgeInsets.only(left: 15, right: 15),
      padding: EdgeInsets.zero,
      elevation: 0,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      side: active
          ? null
          : BorderSide(
              color: Theme.of(context).colorScheme.chipActive,
              width: 1,
            ),
      backgroundColor: active
          ? Theme.of(context).colorScheme.chipActive
          : Theme.of(context).colorScheme.chip,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      onPressed: () {
        onPressed();
      },
      label: Text(
        text,
        style: TextStyle(
          color: Theme.of(context).colorScheme.inputText,
          fontFamily: Constants.fontInter,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

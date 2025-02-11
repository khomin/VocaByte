import 'package:flutter/material.dart';

class Avatar extends StatefulWidget {
  const Avatar(
      {required this.onPressed,
      this.padding,
      this.margin,
      this.size,
      super.key});
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Size? size;
  final Function(Offset)? onPressed;

  @override
  AvatarState createState() => AvatarState();
}

class AvatarState extends State<Avatar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: const Icon(Icons.account_circle, size: 35),
    );
  }
}

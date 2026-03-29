import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vocabyte/repository/app_theme.dart';
import 'package:vocabyte/resource/constants.dart';
import 'package:vocabyte/app/ui_helper.dart';

class ButtonRoundCorner extends StatefulWidget {
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
  State2 createState() => State2();
}

class State2 extends State<ButtonRoundCorner>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    _animation = Tween<double>(begin: 1.0, end: 1.01).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
        scale: _animation,
        child: Padding(
            padding: widget.padding ?? EdgeInsets.zero,
            child: ElevatedButton(
                onPressed: () async {
                  _controller.forward();
                  await Future.delayed(const Duration(milliseconds: 50));
                  if (!mounted) return;
                  _controller.reverse();
                  widget.onPressed?.call();
                },
                autofocus: false,
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: widget.radious,
                        side: widget.borderColor != null
                            ? BorderSide(width: 1.5, color: widget.borderColor!)
                            : BorderSide.none),
                    padding: EdgeInsets.zero,
                    backgroundColor: widget.color,
                    shadowColor: Colors.black,
                    elevation: 8,
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.baseColor1,
                    )),
                child: Directionality(
                    textDirection: widget.direction,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // to preserve same height
                          const SizedBox(height: Constants.buttonHeight),
                          if (widget.iconData != null)
                            Icon(widget.iconData,
                                color: widget.colorText, size: 14),
                          if (widget.iconPath != null)
                            SvgPicture.asset(widget.iconPath!,
                                height: 14,
                                width: 14,
                                colorFilter: widget.colorText != null
                                    ? ColorFilter.mode(
                                        widget.colorText!, BlendMode.srcIn)
                                    : null),
                          if (widget.text != null) const SizedBox(width: 8),
                          if (widget.text != null)
                            Text(widget.text!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: widget.colorText,
                                    fontWeight: FontWeight.w500,
                                    fontSize: UiHelper.isMobile() ? 14 : 12))
                        ])))));
  }
}

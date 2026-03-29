import 'dart:async';
import 'package:flutter/material.dart';

class RoundButton extends StatefulWidget {
  const RoundButton({
    required this.color,
    required this.onPressed,
    this.iconData,
    this.iconColor,
    this.padding,
    this.margin,
    this.useScaleAnimation = false,
    this.iconSize,
    this.radius = 30,
    this.child,
    this.useShadow = false,
    this.width,
    this.height,
    super.key,
  });
  final IconData? iconData;
  final Color? iconColor;
  final Color color;
  final bool useScaleAnimation;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? height;
  final double? width;
  final double? iconSize;
  final Widget? child;
  final double radius;
  final bool useShadow;
  final Function(Offset)? onPressed;

  @override
  RoundButtonState createState() => RoundButtonState();
}

class RoundButtonState extends State<RoundButton>
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
    _animation = Tween<double>(begin: 1.0, end: 1.05).animate(
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
    return ScaleTransition(scale: _animation, child: _button());
  }

  Widget _button() {
    return Container(
        width: widget.width,
        height: widget.height,
        margin: widget.margin,
        decoration: BoxDecoration(boxShadow: [
          if (widget.useShadow)
            BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 15,
                offset: const Offset(0, 1))
        ]),
        child: Center(
            child: Stack(alignment: Alignment.center, children: [
          Positioned.fill(
              child: ElevatedButton(
                  onPressed: () {
                    if (widget.useScaleAnimation) {
                      _controller.forward();
                      Timer(
                        const Duration(milliseconds: 50),
                        () async {
                          widget.onPressed?.call(Offset.zero);
                          if (!mounted) return;
                          _controller.reverse();
                        },
                      );
                    } else {
                      widget.onPressed?.call(Offset.zero);
                    }
                  },
                  key: widget.key,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(widget.radius),
                    ),
                    shadowColor: widget.color,
                    // fixedSize: widget.size ?? const Size(50, 50),
                    padding: widget.padding ?? EdgeInsets.zero,
                    backgroundColor: widget.color,
                  ),
                  child: Center(
                    child: Icon(widget.iconData,
                        color: widget.iconColor, size: widget.iconSize ?? 30),
                  ))),
          //
          // text
          if (widget.child != null) Positioned.fill(child: widget.child!)
        ])));
  }
}

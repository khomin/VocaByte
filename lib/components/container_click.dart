import 'dart:async';
import 'package:flutter/material.dart';
import 'package:vocabyte/components/disposable_stream.dart';
import 'package:vocabyte/components/hover_click_component.dart';

class ContainerClick extends StatefulWidget {
  const ContainerClick(
      {required this.onClicked,
      required this.child,
      required this.boxColor,
      required this.clickedColor,
      this.borderRadius,
      this.margin,
      this.height,
      super.key});

  final Function() onClicked;
  final Color boxColor;
  final Color clickedColor;
  final BorderRadius? borderRadius;
  final EdgeInsets? margin;
  final double? height;
  final Widget child;

  @override
  State<ContainerClick> createState() => _State();
}

class _State extends State<ContainerClick> with TickerProviderStateMixin {
  var _clicked = false;
  Timer? _tm;
  final _dispStream = DisposableStream();
  late Animation<double> _animateScale;
  late AnimationController _animateController;

  @override
  void initState() {
    super.initState();
    _animateController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 20),
    );
    _animateScale =
        Tween<double>(begin: 1.0, end: 0.95).animate(_animateController);
  }

  @override
  void dispose() {
    _animateController.dispose();
    _dispStream.dispose();
    _tm?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
        scale: _animateScale,
        child: Container(
            margin: widget.margin ?? const EdgeInsets.all(4),
            decoration: BoxDecoration(
                color: widget.boxColor, borderRadius: widget.borderRadius),
            height: widget.height,
            child: HoverClickComponent(
                onClick: () {
                  _tm?.cancel();
                  _tm = Timer(const Duration(milliseconds: 200), () {
                    setState(() {
                      _clicked = false;
                    });
                    _animateController.reset();
                  });
                  _animateController.forward(from: 0.0);
                  setState(() {
                    _clicked = true;
                  });
                  widget.onClicked();
                },
                child: AnimatedContainer(
                    height: double.infinity,
                    duration: const Duration(milliseconds: 50),
                    decoration: BoxDecoration(
                        color: _clicked ? widget.clickedColor : widget.boxColor,
                        borderRadius: widget.borderRadius),
                    child: widget.child))));
  }
}

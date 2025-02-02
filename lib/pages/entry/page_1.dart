import 'package:vocabyte/components/button3.dart';
import 'package:vocabyte/components/button_round_corner.dart';
import 'package:vocabyte/app/app_theme.dart';
import 'package:flutter/material.dart';

enum EntyryType { first, book, seacrh, study }

class Page1 extends StatefulWidget {
  const Page1(
      {required this.type,
      required this.iconPath,
      required this.header,
      required this.description,
      this.onSkip,
      this.onStart,
      super.key});
  final EntyryType type;
  final String iconPath;
  final String header;
  final String description;
  final Function()? onSkip;
  final Function()? onStart;
  @override
  State<Page1> createState() => _State();
}

class _State extends State<Page1> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animationLogo;
  final _animationDuration = const Duration(milliseconds: 300);
  var _animate = false;
  var _animate2 = false;
  final tag = 'Page1';

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _animationLogo = Tween<double>(begin: 1.2, end: 0.8).animate(_controller);
    _controller.forward(from: 0.0);
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) {
        setState(() {
          _animate = true;
        });
      }
    });
    Future.delayed(const Duration(milliseconds: 150), () {
      if (mounted) {
        setState(() {
          _animate2 = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      var size = MediaQuery.of(context).size;
      return SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(alignment: Alignment.center, children: [
            Positioned(
                top: 80,
                left: 0,
                right: 0,
                child: AnimatedOpacity(
                    duration: _animationDuration,
                    opacity: _animate2 ? 1.0 : 0.0,
                    child: Container(
                        margin: const EdgeInsets.only(top: 20),
                        width: size.width / 2,
                        height: size.height / 5,
                        child: ScaleTransition(
                            scale: _animationLogo,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(widget.iconPath,
                                      height: size.height / 5)
                                ]))))),
            AnimatedPositioned(
                duration: _animationDuration,
                top: _animate ? size.height / 2.2 : size.height / 1.5,
                left: 20,
                right: 20,
                child: AnimatedOpacity(
                    duration: _animationDuration,
                    opacity: _animate ? 1.0 : 0.0,
                    child: Column(children: [
                      Row(children: [
                        Expanded(
                            child: Text(widget.header,
                                maxLines: 5,
                                style: TextStyle(
                                    color: Theme.of(context).colorScheme.text5,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 22)))
                      ]),
                      const SizedBox(height: 10),
                      Row(children: [
                        Expanded(
                            child: Text(widget.description,
                                maxLines: 5,
                                style: TextStyle(
                                    color: Theme.of(context).colorScheme.text2,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14)))
                      ]),
                      const SizedBox(height: 10),
                      if (widget.type == EntyryType.first ||
                          widget.type == EntyryType.book ||
                          widget.type == EntyryType.seacrh)
                        AnimatedOpacity(
                            duration: _animationDuration,
                            opacity: _animate2 ? 1.0 : 0.0,
                            child: ScaleTransition(
                                scale: _animationLogo,
                                child: Row(children: [
                                  const Spacer(),
                                  Button3(
                                      text: 'Next',
                                      iconData: Icons.arrow_back_outlined,
                                      direction: TextDirection.rtl,
                                      padding: const EdgeInsets.all(20),
                                      color: Theme.of(context)
                                          .colorScheme
                                          .transparent,
                                      colorText:
                                          Theme.of(context).colorScheme.text2,
                                      onPressed: () {
                                        widget.onSkip?.call();
                                      })
                                ])))
                    ]))),
            if (widget.type == EntyryType.first ||
                widget.type == EntyryType.study)
              AnimatedPositioned(
                  duration: _animationDuration,
                  bottom: _animate2 ? 40 : 0,
                  left: 100,
                  right: 100,
                  child: AnimatedOpacity(
                      duration: _animationDuration,
                      opacity: _animate2 ? 1.0 : 0.0,
                      child: Column(children: [
                        ButtonRoundCorner(
                            iconData: Icons.arrow_left,
                            text: 'Start',
                            color: Theme.of(context).colorScheme.buttonOption3,
                            colorText: Theme.of(context).colorScheme.cardText,
                            direction: TextDirection.rtl,
                            radious:
                                const BorderRadius.all(Radius.circular(10)),
                            onPressed: () {
                              widget.onStart?.call();
                              // Navigator.pop(context);
                            })
                      ])))
          ]));
    });
  }
}

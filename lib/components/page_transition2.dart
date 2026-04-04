import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vocabyte/resource/constants.dart';

enum TransitionType { slide, opacity, animation1 }

class PageTransition2 {
  static Route<dynamic> build({
    required RouteSettings settings,
    required TransitionType type,
    required Widget child,
  }) {
    switch (type) {
      case TransitionType.slide:
        return TransparentCupertinoPageRoute(
            settings: settings,
            builder: (context) {
              return child;
            });
      case TransitionType.opacity:
        return PageRouteBuilder(
            settings: settings,
            transitionDuration: const Duration(milliseconds: 250),
            reverseTransitionDuration: const Duration(milliseconds: 50),
            transitionsBuilder: transitionOpacity,
            pageBuilder: (context, animation, secondaryAnimation) {
              return child;
            });
      case TransitionType.animation1:
        return PageRouteBuilder(
            settings: const RouteSettings(),
            opaque: false,
            barrierDismissible: true,
            transitionDuration: Constants.searchHeroDuration,
            reverseTransitionDuration: Constants.searchHeroDuration,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return child;
            },
            pageBuilder: (context, animation, secondaryAnimation) {
              return child;
            });
    }
  }

  static SlideTransition transitionHorizontal(
      BuildContext context,
      Animation<double> animation,
      Animation<double> animationSecond,
      Widget? child) {
    const begin = Offset(1.0, 0.0);
    const end = Offset.zero;
    const curve = Curves.ease;

    final tween = Tween(begin: begin, end: end);
    final curvedAnimation = CurvedAnimation(
      parent: animation,
      curve: curve,
    );
    return SlideTransition(
      position: tween.animate(curvedAnimation),
      child: child,
    );
  }

  static SlideTransition transitionVertical(
      Animation<double> animation, Widget? child) {
    const begin = Offset(0.0, 1.0);
    const end = Offset.zero;
    const curve = Curves.ease;

    final tween = Tween(begin: begin, end: end);
    final curvedAnimation = CurvedAnimation(
      parent: animation,
      curve: curve,
    );
    return SlideTransition(
      position: tween.animate(curvedAnimation),
      child: child,
    );
  }

  static FadeTransition transitionOpacity(
      BuildContext context,
      Animation<double> animation,
      Animation<double> animationSecond,
      Widget? child) {
    final slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: animation,
      curve: Curves.easeOutCubic, // This curve makes it "snap" smoothly
    ));

    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: slideAnimation,
        child: child,
      ),
    );
  }
}

class TransparentCupertinoPageRoute<T> extends CupertinoPageRoute<T> {
  TransparentCupertinoPageRoute({
    required super.builder,
    super.settings,
    super.fullscreenDialog,
  });

  @override
  Color? get barrierColor => Colors.transparent;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 250);
}

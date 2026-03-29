import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum TransitionType { slide, opacity }

class PageTransition2 {
  static Route<dynamic> build({
    required RouteSettings settings,
    required TransitionType type,
    required Widget child,
  }) {
    switch (type) {
      case TransitionType.slide:
        // TODO: Handle this case.
        throw UnimplementedError();
      case TransitionType.opacity:
        return TransparentCupertinoPageRoute(
            settings: settings,
            builder: (context) {
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

  static Duration pageTransitionDuration() {
    return const Duration(milliseconds: kDebugMode ? 1000 : 180);
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

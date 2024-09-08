import 'dart:math';

import 'package:flutter/material.dart';

typedef ProgressWidgetBuilder = Function(BuildContext context, double progress);

/// 带进度的边框按钮
class ProgressBorderButton extends StatefulWidget {
  final int duration; // 单位秒
  // final Size size; // 矩形框宽高
  final double strokeWidth;
  final Color borderColor;

  final ProgressWidgetBuilder childBuild;

  const ProgressBorderButton(
      {required this.duration,
      this.strokeWidth = 0,
      required this.borderColor,
      required this.childBuild,
      Key? key})
      : super(key: key);

  @override
  ProgressBorderButtonState createState() => ProgressBorderButtonState();
}

class ProgressBorderButtonState extends State<ProgressBorderButton>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  void start() {
    _controller.reset();
    _controller.forward();
  }

  void setEnd() {
    _controller.fling();
  }

  void stopToDefault() {
    _controller.reset();
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: Duration(seconds: widget.duration), vsync: this);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // end
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
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: _BorderPainter(
              widget.borderColor, widget.strokeWidth, 1 - _controller.value),
          child: widget.childBuild(context, 1 - _controller.value),
        );
      },
    );
  }
}

class _BorderPainter extends CustomPainter {
  final double _percent;
  final double strokeWidth;
  final Paint _paint;

  _BorderPainter(Color borderColor, this.strokeWidth, this._percent)
      : _paint = Paint()
          ..strokeWidth = strokeWidth
          ..color = borderColor
          ..isAntiAlias = true
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Size size) {
    Path path;
    path = _initRoundPath(size.width, size.height, _percent);
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(covariant _BorderPainter oldDelegate) {
    return oldDelegate._percent != _percent ||
        oldDelegate.strokeWidth != strokeWidth;
  }

  /// 圆角矩形绘制，从上部中间位置开始
  /// [rw] 矩形宽度
  /// [h] 矩形高度
  /// [percent] 百分比
  _initRoundPath(double rw, double h, double percent) {
    Path path = Path();
    rw = rw - strokeWidth;
    h = h - strokeWidth;
    double halfBorder = strokeWidth / 2;
    double r = h / 2;
    double w = rw - r * 2;
    double pDistance = percent * (2 * w + 2 * r * pi);
    // print('w=$w h=$h, pDistance:$pDistance');
    if (pDistance <= w / 2) {
      path.moveTo(rw / 2 + pDistance, halfBorder);
      path.lineTo(rw - r + strokeWidth, halfBorder);
      path.addArc(
          Rect.fromLTWH(w + halfBorder, halfBorder, h, h), -0.5 * pi, pi);
      path.lineTo(h / 2, h + halfBorder);
      path.addArc(Rect.fromLTWH(halfBorder, halfBorder, h, h), 0.5 * pi, pi);
      path.lineTo(rw / 2, halfBorder);
      // print('state=1');
    } else if (pDistance <= w / 2 + r * pi) {
      /// 弧度占一半圆的比例
      double ratio = (pDistance - w / 2) / (r * pi);
      if (ratio < 0.5) {
        double angle = ratio / 180;
        double x = rw - (r - r * sin(angle));
        double y = r - cos(angle) * r;
        path.moveTo(x, y);
      } else {
        double angle = 180 - ratio / 180;
        double x = rw / 2 + w / 2 + r * sin(angle);
        double y = r + cos(angle) * r;
        path.moveTo(x, y);
      }
      path.addArc(Rect.fromLTWH(w + halfBorder, halfBorder, h, h),
          (ratio - 0.5) * pi, pi * (1 - ratio));
      path.lineTo(h / 2, h + halfBorder);
      path.addArc(Rect.fromLTWH(halfBorder, halfBorder, h, h), 0.5 * pi, pi);
      path.lineTo(rw / 2, halfBorder);
      // print('state=2');
    } else if (pDistance < 1.5 * w + r * pi) {
      path.moveTo(
          rw - (pDistance - (w / 2 + r * pi)) - r - halfBorder, h + halfBorder);
      path.lineTo(h / 2, h + halfBorder);
      path.addArc(Rect.fromLTWH(halfBorder, halfBorder, h, h), 0.5 * pi, pi);
      path.lineTo(rw / 2, halfBorder);
      // print('state=3');
    } else if (pDistance <= 1.5 * w + 2 * r * pi) {
      /// 弧度占一半圆的比例
      double ratio = (pDistance - r * pi - 1.5 * w) / (r * pi);
      if (ratio < 0.5) {
        double angle = ratio / 180;
        double x = r - r * sin(angle);
        double y = r + cos(angle) * r;
        path.moveTo(x, y);
      } else {
        double angle = 180 - ratio / 180;
        double x = r - r * sin(angle);
        double y = r - cos(angle) * r;
        path.moveTo(x, y);
      }
      path.addArc(Rect.fromLTWH(halfBorder, halfBorder, h, h),
          (ratio + 0.5) * pi, pi * (1 - ratio));
      path.lineTo(rw / 2, halfBorder);
      // print('state=4');
    } else if (pDistance < 2 * w + 2 * r * pi) {
      path.moveTo(h / 2 + (pDistance - 1.5 * w - 2 * r * pi), halfBorder);
      path.lineTo(rw / 2, halfBorder);
      // print('state=5');
    } else {
      // path.moveTo(rw / 2, 0);
      // path.lineTo(rw / 2, 0);
      // print('state=6');
    }
    return path;
  }
}

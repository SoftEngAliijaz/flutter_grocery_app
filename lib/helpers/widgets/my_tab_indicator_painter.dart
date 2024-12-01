import 'dart:math';

import 'package:flutter/material.dart';

class MyTabIndicationPainter extends CustomPainter {
  MyTabIndicationPainter(
      {required this.indicatorWidth,
      required this.xPadding,
      required this.indicatorRadius,
      required this.yPadding,
      this.pageController,
      this.selectedBackground})
      : super(repaint: pageController) {
    dxTarget = indicatorWidth;
    dxEntry = xPadding;
    radius = indicatorRadius;
    dy = yPadding;
    painter = Paint()
      ..color = selectedBackground!
      ..style = PaintingStyle.fill;
  }

  late double dxEntry;
  late double dxTarget;
  late double dy;
  final PageController? pageController;
  late Paint painter;
  late double radius;
  final Color? selectedBackground;
  final double indicatorWidth, xPadding, indicatorRadius, yPadding;

  @override
  void paint(Canvas canvas, Size size) {
    final pos = pageController!.position;
    double fullExtent = (pos.maxScrollExtent - pos.minScrollExtent + pos.viewportDimension);

    double pageOffset = pos.extentBefore / fullExtent;

    bool left2right = dxEntry < dxTarget;
    Offset entry = Offset(left2right ? dxEntry : dxTarget, dy);
    Offset target = Offset(left2right ? dxTarget : dxEntry, dy);

    Path path = Path();
    path.addArc(Rect.fromCircle(center: entry, radius: radius), 0.5 * pi, 1 * pi);
    path.addRect(Rect.fromLTRB(entry.dx, dy - radius, target.dx, dy + radius));
    path.addArc(Rect.fromCircle(center: target, radius: radius), 1.5 * pi, 1 * pi);

    canvas.translate(size.width * pageOffset, 0.0);
    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(MyTabIndicationPainter oldDelegate) => true;
}

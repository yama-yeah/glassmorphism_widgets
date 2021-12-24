import 'package:flutter/material.dart';

class GlassBorder extends StatelessWidget {
  final _GradientPainter _painter;
  final BorderRadius _borderRadius;
  final double? width;
  final double? height;
  GlassBorder({
    Key? key,
    required double strokeWidth,
    required BorderRadius borderRadius,
    required Gradient gradient,
    this.height,
    this.width,
  })  : _painter = _GradientPainter(
            strokeWidth: strokeWidth,
            borderRadius: borderRadius,
            gradient: gradient),
        _borderRadius = borderRadius,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _painter,
      size: MediaQuery.of(context).size,
      //Size(width, height),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: _borderRadius,
        ),
        width: width,
        height: height,
      ),
    );
  }
}

class _GradientPainter extends CustomPainter {
  final double strokeWidth;
  final Gradient gradient;
  final BorderRadius borderRadius;

  _GradientPainter(
      {required this.strokeWidth,
      required this.borderRadius,
      required this.gradient});
  final Paint paintObject = Paint();

  @override
  void paint(Canvas canvas, Size size) {
    /*RRect innerRect2 = RRect.fromRectAndRadius(
        Rect.fromLTRB(strokeWidth, strokeWidth, size.width - (strokeWidth),
            size.height - (strokeWidth)),
        Radius.circular(radius - strokeWidth));*/
    RRect innerRect2 = RRect.fromRectAndCorners(
      Rect.fromLTRB(strokeWidth, strokeWidth, size.width - (strokeWidth),
          size.height - (strokeWidth)),
      topLeft: Radius.elliptical(borderRadius.topLeft.x - strokeWidth,
          borderRadius.topLeft.y - strokeWidth),
      topRight: Radius.elliptical(borderRadius.topRight.x - strokeWidth,
          borderRadius.topRight.y - strokeWidth),
      bottomLeft: Radius.elliptical(borderRadius.bottomLeft.x - strokeWidth,
          borderRadius.bottomLeft.y - strokeWidth),
      bottomRight: Radius.elliptical(borderRadius.bottomRight.x - strokeWidth,
          borderRadius.bottomRight.y - strokeWidth),
    );

    RRect outerRect =
        borderRadius.toRRect(Rect.fromLTRB(0, 0, size.width, size.height));
    paintObject.shader = gradient.createShader(Offset.zero & size);

    Path outerRectPath = Path()..addRRect(outerRect);
    Path innerRectPath2 = Path()..addRRect(innerRect2);
    canvas.drawPath(
        Path.combine(PathOperation.difference, outerRectPath, innerRectPath2),
        paintObject);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

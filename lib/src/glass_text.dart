import 'package:flutter/material.dart';

class GlassText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final double opacity;
  final double? fontSize;
  final FontWeight fontWeight;
  final Color color;
  const GlassText(
    this.data, {
    this.style,
    this.color = Colors.white,
    this.opacity = 0.5,
    this.fontSize,
    this.fontWeight = FontWeight.bold,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style?.copyWith(color: style?.color?.withOpacity(opacity)) ??
          TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color.withOpacity(opacity),
          ),
    );
  }
}

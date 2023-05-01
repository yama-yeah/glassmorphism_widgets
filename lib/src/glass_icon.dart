import 'package:flutter/material.dart';

/// GlassIcon is a create Icon with a glass effect.
class GlassIcon extends StatelessWidget {
  const GlassIcon(this.icon,
      {Key? key, this.size, this.color, this.opacity = 0.5})
      : super(key: key);

  final IconData icon;
  final Color? color;
  final double opacity;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      key: key,
      color: color != null
          ? color!.withOpacity(opacity)
          : Colors.white.withOpacity(opacity),
      size: size,
    );
  }
}

import 'package:flutter/material.dart';

class GlassIcon extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final double opacity;

  const GlassIcon(this.icon, {Key? key, this.color, this.opacity = 0.5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      key: key,
      color: color != null
          ? color!.withOpacity(opacity)
          : Colors.white.withOpacity(opacity),
      size: 30,
    );
  }
}

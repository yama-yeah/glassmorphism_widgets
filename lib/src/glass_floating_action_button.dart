import 'package:flutter/material.dart';
import 'glass_container.dart';

class GlassFloatingActionButton extends StatelessWidget {
  final Function() onPressed;
  final Widget? child;
  final double? radius;
  final double? border;
  final double? blur;
  final LinearGradient? linearGradient;
  final LinearGradient? borderGradient;
  final BorderRadius? borderRadius;
  const GlassFloatingActionButton({
    Key? key,
    required this.onPressed,
    this.child,
    this.radius,
    this.border,
    this.blur,
    this.linearGradient,
    this.borderGradient,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 30),
      blur: blur,
      border: border,
      linearGradient: linearGradient,
      borderGradient: borderGradient,
      child: FloatingActionButton(
        elevation: 0,
        onPressed: onPressed,
        backgroundColor: Colors.transparent,
        child: child,
      ),
    );
  }
}

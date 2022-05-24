import 'package:flutter/material.dart';

import 'glass_container.dart';

/// A GlassButton is a button that draws a glass effect.
class GlassButton extends StatelessWidget {
  final double? radius;
  final double? border;
  final double? blur;
  final LinearGradient? linearGradient;
  final LinearGradient? borderGradient;
  final BorderRadius? borderRadius;
  const GlassButton({
    Key? key,
    this.radius,
    this.border,
    this.blur,
    this.linearGradient,
    this.borderGradient,
    this.borderRadius,
    this.child,
    required this.onPressed,
    this.onLongPressed,
  }) : super(key: key);
  final Widget? child;
  final void Function() onPressed;
  final void Function()? onLongPressed;

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      radius: radius,
      border: border,
      blur: blur,
      linearGradient: linearGradient,
      borderGradient: borderGradient,
      borderRadius: borderRadius,
      child: RawMaterialButton(
        onPressed: onPressed,
        onLongPress: onLongPressed,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: child,
        ),
      ),
    );
  }
}

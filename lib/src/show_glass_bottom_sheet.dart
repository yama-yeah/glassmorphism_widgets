import 'package:flutter/material.dart';
import 'package:glassmorphism_widgets/src/glass_container.dart';

/// Show a BottomSheet with a glass effect.
void showGlassBottomSheet({
  required BuildContext context,
  Widget? child,
  LinearGradient? linearGradient,
  LinearGradient? borderGradient,
  double radius = 20,
  double? blur,
  BorderRadius? borderRadius,
}) {
  showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black.withOpacity(0.2),
    builder: (BuildContext ctx) {
      return GlassContainer(
        radius: radius,
        blur: blur,
        linearGradient: linearGradient,
        borderGradient: borderGradient,
        child: child,
      );
    },
  );
}

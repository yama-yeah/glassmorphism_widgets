import 'package:flutter/material.dart';
import 'package:glassmorphism_widgets/src/glass_container.dart';

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
      final _borderRadius = borderRadius ??
          BorderRadius.only(
            topLeft: Radius.circular(radius),
            topRight: Radius.circular(radius),
          );
      return GlassContainer(
        borderRadius: _borderRadius,
        blur: blur,
        linearGradient: linearGradient,
        borderGradient: borderGradient,
        child: child,
      );
    },
  );
}

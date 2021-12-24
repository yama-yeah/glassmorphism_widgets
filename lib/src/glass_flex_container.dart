import 'dart:ui';

import 'package:flutter/material.dart';

import 'glass_border.dart';

class GlassFlexContainer extends StatelessWidget {
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;

  final int? flex;
  final EdgeInsetsGeometry? margin;

  final Matrix4? transform;

  final BorderRadius borderRadius;
  final Widget? child;

  final double radius;
  final BoxShape shape;
  final BoxConstraints? constraints;
  final double border;
  final double blur;
  final LinearGradient? linearGradient;
  final LinearGradient? borderGradient;

  GlassFlexContainer(
      {Key? key,
      this.child,
      this.alignment,
      this.padding,
      this.shape = BoxShape.rectangle,
      this.margin,
      this.transform,
      double? radius,
      this.linearGradient,
      double? border,
      double? blur,
      this.borderGradient,
      BorderRadius? borderRadius,
      this.constraints,
      this.flex = 1})
      : assert(margin == null || margin.isNonNegative),
        assert(padding == null || padding.isNonNegative),
        assert(
          flex! >= 1,
          'Flex value can be less than 1 : $flex. Please Provide a flex value > 1',
        ),
        assert(constraints == null || constraints.debugAssertIsValid()),
        borderRadius = borderRadius ?? BorderRadius.circular(radius ?? 20),
        radius = radius ?? 20,
        border = border ?? 2,
        blur = blur ?? 20,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex!,
      child: Container(
        key: key,
        alignment: alignment,
        padding: padding,
        constraints: const BoxConstraints.tightForFinite(),
        transform: transform,
        child: Stack(
          children: [
            ClipRRect(
              clipBehavior: Clip.hardEdge,
              borderRadius: borderRadius,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur * 2),
                child: Container(
                  alignment: alignment ?? Alignment.topLeft,
                  decoration: BoxDecoration(
                    borderRadius: borderRadius,
                    gradient: linearGradient ??
                        LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            const Color(0xFFffffff).withOpacity(0.1),
                            const Color(0xFFFFFFFF).withOpacity(0.05),
                          ],
                          stops: const [
                            0.1,
                            1,
                          ],
                        ),
                  ),
                ),
              ),
            ),
            GlassBorder(
              strokeWidth: border,
              borderRadius: borderRadius,
              gradient: borderGradient ??
                  LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color(0xFFffffff).withOpacity(0.5),
                      const Color((0xFFFFFFFF)).withOpacity(0.5),
                    ],
                  ),
            ),
            ClipRRect(
              clipBehavior: Clip.hardEdge,
              borderRadius: borderRadius,
              child: Container(
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

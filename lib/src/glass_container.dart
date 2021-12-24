import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'glass_border.dart';

class GlassContainer extends StatefulWidget {
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry alignment;

  final EdgeInsetsGeometry? margin;
  final Matrix4? transform;
  final BoxShape shape;

  final Widget? child;
  final double radius;
  final double border;
  final double blur;
  final LinearGradient? linearGradient;
  final LinearGradient? borderGradient;
  final BorderRadius borderRadius;
  GlassContainer({
    key,
    this.child,
    this.padding,
    this.shape = BoxShape.rectangle,
    this.margin,
    this.transform,
    double? radius,
    this.linearGradient,
    double? border,
    double? blur,
    this.borderGradient,
    this.alignment = Alignment.topLeft,
    BorderRadius? borderRadius,
  })  : assert(margin == null || margin.isNonNegative),
        assert(padding == null || padding.isNonNegative),
        radius = radius ?? 20,
        border = border ?? 2,
        blur = blur ?? 20,
        borderRadius = borderRadius ?? BorderRadius.circular(radius ?? 20),
        super(key: key);

  @override
  _GlassContainerState createState() => _GlassContainerState();
}

class _GlassContainerState extends State<GlassContainer> {
  final GlobalKey _contentKey = GlobalKey();

  BuildContext? contentBox;
  Size? size;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      if (size != _contentKey.currentContext?.size) {
        setState(() {
          size = _contentKey.currentContext?.size;
        });
      }
      //print(_contentKey.currentContext?.size);
    });
    return Stack(
      alignment: widget.alignment,
      children: [
        SizedBox(
          width: size?.width,
          height: size?.height,
          child: Stack(
            alignment: widget.alignment,
            children: [
              size != null
                  ? ClipRRect(
                      clipBehavior: Clip.hardEdge,
                      borderRadius: widget.borderRadius,
                      child: SizedBox(
                        height: size?.height,
                        width: size?.width,
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                              sigmaX: widget.blur, sigmaY: widget.blur * 2),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: widget.borderRadius,
                              gradient: widget.linearGradient ??
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
                            height: size!.height,
                            width: size!.width,
                          ),
                        ),
                      ),
                    )
                  : const Text(""),
              size == null
                  ? const Text("")
                  : SizedBox(
                      height: size!.height,
                      width: size!.width,
                      child: GlassBorder(
                        strokeWidth: widget.border,
                        borderRadius: widget.borderRadius,
                        width: size!.width,
                        height: size!.height,
                        gradient: widget.borderGradient ??
                            LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                const Color(0xFFffffff).withOpacity(0.5),
                                const Color((0xFFFFFFFF)).withOpacity(0.5),
                              ],
                            ),
                      ),
                    ),
            ],
          ),
        ),
        ClipRRect(
          clipBehavior: Clip.hardEdge,
          borderRadius: widget.borderRadius,
          child: Container(
            //alignment: widget.alignment,
            //color: Colors.red,
            child: widget.child,
            key: _contentKey,
            //alignment: Alignment.topCenter,
          ),
        ),
      ],
    );
  }
}

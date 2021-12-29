import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'glass_border.dart';

class GlassContainer extends StatefulWidget {
  /*Key? key,
    this.alignment,
    this.padding,
    this.color,
    this.decoration,
    this.foregroundDecoration,
    double? width,
    double? height,
    BoxConstraints? constraints,
    this.margin,
    this.transform,
    this.transformAlignment,
    this.child,
    this.clipBehavior = Clip.none,*/
  GlassContainer({
    Key? key,
    this.alignment = Alignment.topLeft,
    this.padding,
    this.linearGradient,
    this.borderGradient,
    double? blur,
    this.width,
    this.height,
    this.constraints,
    this.margin,
    this.transform,
    this.transformAlignment,
    double? radius,
    double? border,
    BorderRadius? borderRadius,
    this.child,
  })  : radius = radius ?? 20,
        border = border ?? 2,
        blur = blur ?? 20,
        borderRadius = borderRadius ?? BorderRadius.circular(radius ?? 20),
        super(key: key);

  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry alignment;
  final AlignmentGeometry? transformAlignment;

  final EdgeInsetsGeometry? margin;
  final Matrix4? transform;

  final Widget? child;
  final double radius;
  final double border;
  final double blur;
  final LinearGradient? linearGradient;
  final LinearGradient? borderGradient;
  final BorderRadius borderRadius;
  final double? width;
  final double? height;
  final BoxConstraints? constraints;

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
    return Container(
      key: widget.key,
      alignment: widget.alignment,
      padding: widget.padding,
      width: widget.width,
      height: widget.height,
      constraints: widget.constraints,
      margin: widget.margin,
      transform: widget.transform,
      transformAlignment: widget.transformAlignment,
      child: Stack(
        children: [
          SizedBox(
            width: widget.width ?? size?.width,
            height: widget.height ?? size?.height,
            child: Stack(
              alignment: widget.alignment,
              children: [
                size != null
                    ? ClipRRect(
                        clipBehavior: Clip.hardEdge,
                        borderRadius: widget.borderRadius,
                        child: SizedBox(
                          width: widget.width ?? size?.width,
                          height: widget.height ?? size?.height,
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
                                        const Color(0xFFffffff)
                                            .withOpacity(0.1),
                                        const Color(0xFFFFFFFF)
                                            .withOpacity(0.05),
                                      ],
                                      stops: const [
                                        0.1,
                                        1,
                                      ],
                                    ),
                              ),
                              width: widget.width ?? size?.width,
                              height: widget.height ?? size?.height,
                            ),
                          ),
                        ),
                      )
                    : const Text(''),
                size == null
                    ? const Text('')
                    : SizedBox(
                        height: widget.height ?? size?.height,
                        width: widget.width ?? size?.width,
                        child: GlassBorder(
                          strokeWidth: widget.border,
                          borderRadius: widget.borderRadius,
                          width: widget.width ?? size?.width,
                          height: widget.height ?? size?.height,
                          gradient: widget.borderGradient ??
                              LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  const Color(0xFFffffff).withOpacity(0.5),
                                  const Color(0xFFFFFFFF).withOpacity(0.5),
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
              height: widget.height,
              key: _contentKey,
              width: widget.width,
              //alignment: Alignment.topCenter,
              //alignment: widget.alignment,
              //alignment: widget.alignment,
              //color: Colors.red,
              //color: Colors.red,
              child: widget.child,
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism_widgets/src/glass_theme.dart';

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
    this.alignment,
    this.padding,
    this.linearGradient,
    this.borderGradient,
    this.blur,
    this.width,
    this.height,
    this.constraints,
    this.margin,
    this.transform,
    this.transformAlignment,
    this.radius,
    this.border,
    this.borderRadius,
    this.child,
  }) : super(key: key);

  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;
  final AlignmentGeometry? transformAlignment;

  final EdgeInsetsGeometry? margin;
  final Matrix4? transform;

  final Widget? child;
  final double? radius;
  final double? border;
  final double? blur;
  final LinearGradient? linearGradient;
  final LinearGradient? borderGradient;
  final BorderRadius? borderRadius;
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
    final linearGradient =
        widget.linearGradient ?? GlassTheme.of(context).linearGradient;
    final borderGradient =
        widget.borderGradient ?? GlassTheme.of(context).borderGradient;
    final blur = widget.blur ?? GlassTheme.of(context).blur;
    final border = widget.border ?? GlassTheme.of(context).border;
    final borderRadius =
        widget.borderRadius ?? GlassTheme.of(context).borderRadius;
    final alignment = widget.alignment;
    return Container(
      key: widget.key,
      //alignment: widget.alignment,
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
              alignment: Alignment.topLeft,
              children: [
                size != null
                    ? ClipRRect(
                        clipBehavior: Clip.hardEdge,
                        borderRadius: borderRadius,
                        child: SizedBox(
                          width: widget.width ?? size?.width,
                          height: widget.height ?? size?.height,
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                                sigmaX: blur, sigmaY: blur * 2),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: borderRadius,
                                  gradient: linearGradient),
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
                          strokeWidth: border,
                          borderRadius: borderRadius,
                          width: widget.width ?? size?.width,
                          height: widget.height ?? size?.height,
                          gradient: borderGradient,
                        ),
                      ),
              ],
            ),
          ),
          ClipRRect(
            clipBehavior: Clip.hardEdge,
            borderRadius: borderRadius,
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

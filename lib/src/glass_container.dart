import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism_widgets/src/glass_theme.dart';

import 'glass_border.dart';

/// A GlassContainer is a container that draws a glass effect.
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
  const GlassContainer({
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
  GlassContainerState createState() => GlassContainerState();
}

class GlassContainerState extends State<GlassContainer> {
  final GlobalKey _contentKey = GlobalKey();

  BuildContext? contentBox;
  Size? size;
  WidgetsBinding? get _widgetsBindingInstance => WidgetsBinding.instance;

  @override
  Widget build(BuildContext context) {
    _widgetsBindingInstance?.addPostFrameCallback((_) {
      if (size != _contentKey.currentContext?.size) {
        if (mounted) {
          setState(() {
            size = _contentKey.currentContext?.size;
          });
        }
      }
      //print(_contentKey.currentContext?.size);
    });
    final linearGradient =
        widget.linearGradient ?? GlassTheme.of(context).linearGradient;
    final borderGradient =
        widget.borderGradient ?? GlassTheme.of(context).borderGradient;
    final blur = widget.blur ?? GlassTheme.of(context).blur;
    final border = widget.border ?? GlassTheme.of(context).border;
    final borderRadius = widget.borderRadius == null
        ? widget.radius == null
            ? GlassTheme.of(context).borderRadius
            : BorderRadius.circular(widget.radius!)
        : widget.borderRadius!;
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
      child: ClipRRect(
        borderRadius: borderRadius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur * 2),
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
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: borderRadius,
                                    gradient: linearGradient),
                                width: widget.width ?? size?.width,
                                height: widget.height ?? size?.height,
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
                child: SizedBox(
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
        ),
      ),
    );
  }
}

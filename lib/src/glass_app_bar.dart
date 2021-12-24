import 'package:flutter/material.dart';

import 'glass_container.dart';

class GlassAppBar extends StatelessWidget with PreferredSizeWidget {
  final double? radius;
  final double? border;
  final double? blur;
  final LinearGradient? linearGradient;
  final LinearGradient? borderGradient;
  final BorderRadius? borderRadius;
  final List<Widget>? actions;
  GlassAppBar({
    Key? key,
    this.leading,
    this.title,
    this.centerTitle,
    this.radius,
    this.border,
    this.blur,
    this.linearGradient,
    this.borderGradient,
    this.borderRadius,
    this.actions,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  final Widget? leading;
  final Widget? title;
  final bool? centerTitle;

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      flexibleSpace: GlassContainer(
        radius: radius ?? 0,
        border: border,
        blur: blur,
        linearGradient: linearGradient,
        borderGradient: borderGradient,
        borderRadius: borderRadius,
      ),
      leading: leading,
      title: title,
      centerTitle: centerTitle,
      actions: actions,
    );
  }
}

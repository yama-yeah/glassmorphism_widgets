import 'package:flutter/material.dart';

import 'glass_container.dart';

/// A GlassAppBar is a Material Design app bar that is like a [AppBar] but
/// with glass effect.
class GlassAppBar extends StatelessWidget with PreferredSizeWidget {
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

  final double? radius;
  final double? border;
  final double? blur;
  final LinearGradient? linearGradient;
  final LinearGradient? borderGradient;
  final BorderRadius? borderRadius;
  final List<Widget>? actions;

  final Widget? leading;
  final Widget? title;
  final bool? centerTitle;

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      radius: radius ?? 0,
      border: border,
      blur: blur,
      linearGradient: linearGradient,
      borderGradient: borderGradient,
      borderRadius: borderRadius,
      child: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: leading,
        title: title,
        centerTitle: centerTitle,
        actions: actions,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'glass_container.dart';

class GlassListTile extends StatelessWidget {
  final double? radius;
  final double? border;
  final double? blur;
  final LinearGradient? linearGradient;
  final LinearGradient? borderGradient;
  final BorderRadius? borderRadius;
  const GlassListTile({
    Key? key,
    this.radius,
    this.border,
    this.blur,
    this.linearGradient,
    this.borderGradient,
    this.borderRadius,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
  }) : super(key: key);

  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      radius: radius,
      linearGradient: linearGradient,
      borderGradient: borderGradient,
      border: border,
      blur: blur,
      borderRadius: borderRadius,
      child: Center(
        child: Material(
          color: Colors.transparent,
          child: ListTile(
            leading: leading,
            title: title,
            subtitle: subtitle,
            trailing: trailing,
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}

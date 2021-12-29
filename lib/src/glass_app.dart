import 'package:flutter/material.dart';
import 'package:glassmorphism_widgets/src/glass_theme.dart';
import 'package:glassmorphism_widgets/src/glass_theme_data.dart';

class GlassApp extends StatelessWidget {
  GlassApp({Key? key, GlassThemeData? theme, this.home})
      : this.theme = theme ?? GlassThemeData(),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return GlassTheme(data: theme, child: home ?? Container());
  }

  final GlassThemeData theme;
  final Widget? home;
}

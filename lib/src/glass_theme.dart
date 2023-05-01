import 'package:flutter/material.dart';
import 'package:glassmorphism_widgets/src/glass_theme_data.dart';

/// A widget that provides a GlassThemeData for its descendants.
class GlassTheme extends StatelessWidget {
  const GlassTheme({
    Key? key,
    required this.data,
    required this.child,
  }) : super(key: key);
  final Widget child;
  final GlassThemeData data;
  static final GlassThemeData _kFallbackTheme = GlassThemeData.fallback();

  static GlassThemeData of(BuildContext context) {
    final _InheritedGlassTheme? inheritedTheme =
        context.dependOnInheritedWidgetOfExactType<_InheritedGlassTheme>();
    final GlassThemeData theme = inheritedTheme?.theme.data ?? _kFallbackTheme;
    return GlassThemeData.localize(theme);
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedGlassTheme(
      theme: this,
      child: child,
    );
  }
}

class _InheritedGlassTheme extends InheritedWidget {
  const _InheritedGlassTheme({
    Key? key,
    required this.theme,
    required Widget child,
  }) : super(key: key, child: child);
  final GlassTheme theme;

  @override
  bool updateShouldNotify(_InheritedGlassTheme old) =>
      theme.data != old.theme.data;
}

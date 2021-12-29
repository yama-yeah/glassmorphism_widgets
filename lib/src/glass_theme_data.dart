import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GlassThemeData with Diagnosticable {
  factory GlassThemeData({
    double? radius,
    double? border,
    double? blur,
    LinearGradient? linearGradient,
    LinearGradient? borderGradient,
    BorderRadius? borderRadius,
  }) {
    radius ??= 20;
    border ??= 2;
    blur ??= 20;
    linearGradient ??= LinearGradient(
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
    );
    borderGradient ??= LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        const Color(0xFFffffff).withOpacity(0.5),
        const Color(0xFFFFFFFF).withOpacity(0.5),
      ],
    );
    borderRadius ??= BorderRadius.circular(radius);
    return GlassThemeData.raw(
      radius: radius,
      border: border,
      blur: blur,
      linearGradient: linearGradient,
      borderGradient: borderGradient,
      borderRadius: borderRadius,
    );
  }

  const GlassThemeData.raw({
    required this.radius,
    required this.border,
    required this.blur,
    required this.linearGradient,
    required this.borderGradient,
    required this.borderRadius,
  });

  factory GlassThemeData.fallback() => GlassThemeData(
        radius: null,
        border: null,
        blur: null,
        linearGradient: LinearGradient(
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
        borderGradient: null,
        borderRadius: null,
      );

  GlassThemeData copyWith(
          {double? radius,
          double? border,
          double? blur,
          LinearGradient? linearGradient,
          LinearGradient? borderGradient,
          BorderRadius? borderRadius}) =>
      GlassThemeData.raw(
        radius: radius ?? this.radius,
        border: border ?? this.border,
        blur: blur ?? this.blur,
        linearGradient: linearGradient ?? this.linearGradient,
        borderGradient: borderGradient ?? this.borderGradient,
        borderRadius: borderRadius ?? this.borderRadius,
      );

  static GlassThemeData localize(GlassThemeData baseTheme) {
    return _localizedThemeDataCache.putIfAbsent(
      _IdentityGlassThemeDataCacheKey(baseTheme),
      () {
        return baseTheme.copyWith(
          blur: baseTheme.blur,
          border: baseTheme.border,
          borderRadius: baseTheme.borderRadius,
          linearGradient: baseTheme.linearGradient,
          borderGradient: baseTheme.borderGradient,
        );
      },
    );
  }

  static const int _localizedThemeDataCacheSize = 5;

  static final _FifoCache<_IdentityGlassThemeDataCacheKey, GlassThemeData>
      _localizedThemeDataCache =
      _FifoCache<_IdentityGlassThemeDataCacheKey, GlassThemeData>(
          _localizedThemeDataCacheSize);

  final double radius;
  final double border;
  final double blur;
  final LinearGradient linearGradient;
  final LinearGradient borderGradient;
  final BorderRadius borderRadius;
}

@immutable
class _IdentityGlassThemeDataCacheKey {
  const _IdentityGlassThemeDataCacheKey(this.baseTheme);
  //this.localTextGeometry);

  final GlassThemeData baseTheme;

  // Using XOR to make the hash function as fast as possible (e.g. Jenkins is
  // noticeably slower).
  @override
  int get hashCode => identityHashCode(baseTheme);
  // ^ identityHashCode(localTextGeometry);

  @override
  bool operator ==(Object other) {
    // We are explicitly ignoring the possibility that the types might not
    // match in the interests of speed.
    return other is _IdentityGlassThemeDataCacheKey &&
        identical(other.baseTheme, baseTheme);
    //&& identical(other.localTextGeometry, localTextGeometry);
  }
}

class _FifoCache<K, V> {
  _FifoCache(this._maximumSize)
      : assert(_maximumSize != null && _maximumSize > 0);

  /// In Dart the map literal uses a linked hash-map implementation, whose keys
  /// are stored such that [Map.keys] returns them in the order they were
  /// inserted.
  final Map<K, V> _cache = <K, V>{};

  /// Maximum number of entries to store in the cache.
  ///
  /// Once this many entries have been cached, the entry inserted least recently
  /// is evicted when adding a new entry.
  final int _maximumSize;

  /// Returns the previously cached value for the given key, if available;
  /// if not, calls the given callback to obtain it first.
  ///
  /// The arguments must not be null.
  V putIfAbsent(K key, V Function() loader) {
    assert(key != null);
    assert(loader != null);
    final V? result = _cache[key];
    if (result != null) return result;
    if (_cache.length == _maximumSize) _cache.remove(_cache.keys.first);
    return _cache[key] = loader();
  }
}

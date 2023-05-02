import 'package:flutter/material.dart';

import 'glass_container.dart';

/// A GlassAppBar is a Glassmorphic Design app bar that is like a [AppBar]

class GlassAppBar extends StatefulWidget implements PreferredSizeWidget {
  const GlassAppBar({
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
  State<GlassAppBar> createState() => _GlassAppBarState();
}

class _GlassAppBarState extends State<GlassAppBar> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //ignore: unnecessary_statements
      MediaQuery.of(context).size;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      radius: widget.radius ?? 0,
      border: widget.border,
      blur: widget.blur,
      linearGradient: widget.linearGradient,
      borderGradient: widget.borderGradient,
      borderRadius: widget.borderRadius,
      child: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: widget.leading,
        title: widget.title,
        centerTitle: widget.centerTitle,
        actions: widget.actions,
      ),
    );
  }
}

// class GlassAppBar extends StatelessWidget implements PreferredSizeWidget {
//   const GlassAppBar({
//     Key? key,
//     this.leading,
//     this.title,
//     this.centerTitle,
//     this.radius,
//     this.border,
//     this.blur,
//     this.linearGradient,
//     this.borderGradient,
//     this.borderRadius,
//     this.actions,
//   })  : preferredSize = const Size.fromHeight(kToolbarHeight),
//         super(key: key);

//   final double? radius;
//   final double? border;
//   final double? blur;
//   final LinearGradient? linearGradient;
//   final LinearGradient? borderGradient;
//   final BorderRadius? borderRadius;
//   final List<Widget>? actions;

//   final Widget? leading;
//   final Widget? title;
//   final bool? centerTitle;

//   @override
//   final Size preferredSize;

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return GlassContainer(
//       radius: radius ?? 0,
//       border: border,
//       blur: blur,
//       linearGradient: linearGradient,
//       borderGradient: borderGradient,
//       borderRadius: borderRadius,
//       child: AppBar(
//         backgroundColor: Colors.transparent,
//         shadowColor: Colors.transparent,
//         leading: leading,
//         title: title,
//         centerTitle: centerTitle,
//         actions: actions,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'glass_container.dart';

/// GlassListTile is a create ListTile with a glass effect.
class GlassListTile extends StatefulWidget {
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

  final double? radius;
  final double? border;
  final double? blur;
  final LinearGradient? linearGradient;
  final LinearGradient? borderGradient;
  final BorderRadius? borderRadius;

  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;

  final void Function()? onTap;

  @override
  GlassListTileState createState() => GlassListTileState();
}

class GlassListTileState extends State<GlassListTile> {
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
      radius: widget.radius,
      linearGradient: widget.linearGradient,
      borderGradient: widget.borderGradient,
      border: widget.border,
      blur: widget.blur,
      borderRadius: widget.borderRadius,
      child: Center(
        child: Material(
          color: Colors.transparent,
          child: ListTile(
            leading: widget.leading,
            title: widget.title,
            subtitle: widget.subtitle,
            trailing: widget.trailing,
            onTap: widget.onTap,
          ),
        ),
      ),
    );
  }
}

// class GlassListTile extends StatelessWidget {
//   const GlassListTile({
//     Key? key,
//     this.radius,
//     this.border,
//     this.blur,
//     this.linearGradient,
//     this.borderGradient,
//     this.borderRadius,
//     this.leading,
//     this.title,
//     this.subtitle,
//     this.trailing,
//     this.onTap,
//   }) : super(key: key);

//   final double? radius;
//   final double? border;
//   final double? blur;
//   final LinearGradient? linearGradient;
//   final LinearGradient? borderGradient;
//   final BorderRadius? borderRadius;

//   final Widget? leading;
//   final Widget? title;
//   final Widget? subtitle;
//   final Widget? trailing;

//   final void Function()? onTap;

//   @override
//   Widget build(BuildContext context) {
//     return GlassContainer(
//       radius: radius,
//       linearGradient: linearGradient,
//       borderGradient: borderGradient,
//       border: border,
//       blur: blur,
//       borderRadius: borderRadius,
//       child: Center(
//         child: Material(
//           color: Colors.transparent,
//           child: ListTile(
//             leading: leading,
//             title: title,
//             subtitle: subtitle,
//             trailing: trailing,
//             onTap: onTap,
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

/// GlassTextField is a create TextField with a glass effect.
class GlassTextField extends StatelessWidget {
  const GlassTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: Colors.white,
        hintText: 'Enter your email',
        prefixIcon: const Icon(Icons.email),
      ),
    );
  }
}

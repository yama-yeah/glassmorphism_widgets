import 'package:flutter/material.dart';

class GlassTextField extends StatelessWidget {
  const GlassTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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

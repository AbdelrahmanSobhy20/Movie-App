import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureTex = false,
    this.initialValue,
    required this.validator,
  });

  final TextEditingController controller;
  final String hintText;
  bool obscureTex;
  String? initialValue;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return
      TextFormField(
      validator: validator,
      initialValue: initialValue,
      controller: controller,
      keyboardType: TextInputType.name,
      obscureText: obscureTex,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.primary,
        contentPadding: const EdgeInsets.all(16),
      ),
    );
  }
}

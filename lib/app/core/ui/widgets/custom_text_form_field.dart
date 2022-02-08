import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final bool obscureText;
  final FormFieldValidator<String?>? validator;
  final ValueChanged<String?>? onChanged;
  final TextInputType? keyboardType;

  const CustomTextFormField({
    required this.label,
    this.keyboardType,
    this.onChanged,
    this.validator,
    this.obscureText = false,
    this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      onChanged: onChanged,
      cursorColor: context.theme.primaryColor,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        isDense: true,
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(23),
          borderSide: BorderSide(color: Colors.grey[400]!),
        ),
        labelStyle: const TextStyle(color: Colors.black),
        errorStyle: const TextStyle(color: Colors.redAccent),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(23),
          borderSide: BorderSide(color: Colors.grey[400]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(23),
          borderSide: BorderSide(color: Colors.grey[400]!),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}

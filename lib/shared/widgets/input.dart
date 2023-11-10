import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatelessWidget {
  const Input({
    super.key,
    this.label,
    this.icon,
    this.controller,
    this.validator,
    this.hint,
    this.obscureText = false,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.focusNode,
    this.maxLength,
    this.inputFormatters,
    this.suffixIcon,
  });
  final String? label;
  final String? hint;
  final Widget? icon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String? value)? validator;
  final bool obscureText;
  final Function()? onEditingComplete;
  final Function(String value)? onFieldSubmitted;
  final FocusNode? focusNode;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label ?? "",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ),
        TextFormField(
          focusNode: focusNode,
          obscureText: obscureText,
          controller: controller,
          decoration: InputDecoration(
            fillColor: Colors.grey.shade100,
            filled: true,
            prefixIcon: icon,
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.black),
            errorStyle: const TextStyle(
              color: Colors.white,
            ),
            counterStyle: const TextStyle(color: Colors.white70),
          ),
          validator: validator,
          onEditingComplete: onEditingComplete,
          onFieldSubmitted: onFieldSubmitted,
          inputFormatters: inputFormatters,
          maxLength: maxLength,
        ),
      ],
    );
  }
}

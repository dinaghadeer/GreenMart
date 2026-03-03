import 'package:flutter/material.dart';
import '../utils/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool enabled;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    this.validator,
    this.keyboardType,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      enabled: enabled,
      cursorColor: AppColors.primaryColor,

      decoration: InputDecoration(
        labelText: label,

        /// Label styles
        labelStyle: const TextStyle(color: Colors.grey),
        floatingLabelStyle:
        const TextStyle(color: AppColors.primaryColor),

        /// Error text style
        errorStyle: const TextStyle(
          color: Colors.red,
          fontSize: 12,
        ),

        /// Spacing inside field
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 18,
        ),

        /// Normal border
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
          const BorderSide(color: Colors.grey, width: 1),
        ),

        /// Focused border
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
          const BorderSide(
            color: AppColors.primaryColor,
            width: 2,
          ),
        ),

        /// Error border (not focused)
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
          const BorderSide(
            color: Colors.red,
            width: 1.5,
          ),
        ),

        /// Error + Focused border
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
          const BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),

        /// Disabled border
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
          const BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
      ),
    );
  }
}
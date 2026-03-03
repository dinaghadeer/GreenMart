import 'package:flutter/material.dart';
import '../utils/colors.dart';

class CustomPasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;
  final bool enabled;

  const CustomPasswordField({
    super.key,
    required this.controller,
    this.label = "Password",
    this.validator,
    this.enabled = true,
  });

  @override
  State<CustomPasswordField> createState() =>
      _CustomPasswordFieldState();
}

class _CustomPasswordFieldState
    extends State<CustomPasswordField> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: obscure,
      enabled: widget.enabled,
      cursorColor: AppColors.primaryColor,

      validator: widget.validator ??
              (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            }
            if (value.length < 8) {
              return 'Password must be at least 8 characters';
            }
            return null;
          },

      decoration: InputDecoration(
        labelText: widget.label,

        /// Label styles
        labelStyle: const TextStyle(color: Colors.grey),
        floatingLabelStyle:
        const TextStyle(color: AppColors.primaryColor),

        /// Error style
        errorStyle: const TextStyle(
          color: Colors.red,
          fontSize: 12,
        ),

        /// Padding inside field
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 18,
        ),

        /// Eye icon
        suffixIcon: IconButton(
          icon: Icon(
            obscure ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey,
          ),
          onPressed: () {
            setState(() {
              obscure = !obscure;
            });
          },
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

        /// Error border
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
          const BorderSide(
            color: Colors.red,
            width: 1.5,
          ),
        ),

        /// Focused + Error border
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
          const BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
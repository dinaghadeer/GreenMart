import 'package:flutter/material.dart';
import '../../../core/utils/colors.dart';
import 'VerificationScreen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    phoneController = TextEditingController();
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  String? _validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Phone number is required";
    }

    final phone = value.replaceAll(" ", "").trim();

    // Egyptian phone numbers: 010/011/012/015 + 8 digits
    final regex = RegExp(r'^01[0-2,5][0-9]{8}$');

    if (!regex.hasMatch(phone)) {
      return "Enter a valid mobile number";
    }

    return null;
  }

  void _onNext() {
    FocusScope.of(context).unfocus(); // close keyboard
    if (_formKey.currentState!.validate()) {
      final phone = phoneController.text.replaceAll(" ", "").trim();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => VerificationScreen(phone: phone),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,

      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Back
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: AppColors.darkColor,
                  ),
                ),

                const SizedBox(height: 32),

                const Text(
                  "Enter your mobile number",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkColor,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  "We need to verify you. We will send you a one time verification code.",
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.greyColor,
                    height: 1.3,
                  ),
                ),

                const SizedBox(height: 32),

                TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  cursorColor: AppColors.primaryColor,
                  validator: _validatePhone,
                  decoration: InputDecoration(
                    labelText: "Mobile Number",
                    labelStyle: const TextStyle(color: Colors.grey),
                    floatingLabelStyle:
                    const TextStyle(color: AppColors.primaryColor),

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: AppColors.primaryColor,
                        width: 2,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 2,
                      ),
                    ),
                  ),
                ),

                // extra space so content doesn’t collide with bottom button
                const SizedBox(height: 90),
              ],
            ),
          ),
        ),
      ),

      /// Button pinned to bottom and lifts with keyboard
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(
          24,
          12,
          24,
          12 + bottomInset, // lifts above keyboard
        ),
        child: SizedBox(
          height: 50,
          child: ElevatedButton(
            onPressed: _onNext,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              "Next",
              style: TextStyle(fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }
}
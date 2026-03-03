import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/colors.dart';
import '../../../core/widgets/custom_password_field.dart';
import '../../../core/widgets/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();

  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _onSignUp() {
    FocusScope.of(context).unfocus(); // close keyboard
    if (formKey.currentState!.validate()) {
      // TODO: implement sign up
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
          key: formKey,
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Logo
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: SvgPicture.asset("assets/images/carrot.svg"),
                  ),
                ),

                const SizedBox(height: 28),

                const Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkColor,
                  ),
                ),

                const SizedBox(height: 16),

                const Text(
                  "Enter your credentials to continue",
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.greyColor,
                  ),
                ),

                const SizedBox(height: 32),

                /// Username
                CustomTextField(
                  controller: nameController,
                  label: "Username",
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Username is required";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                /// Email
                CustomTextField(
                  controller: emailController,
                  label: "Email",
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Email is required";
                    }
                    if (!value.contains('@')) {
                      return "Enter a valid email";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                /// Password
                CustomPasswordField(
                  controller: passwordController,
                ),

                const SizedBox(height: 24),

                /// Back to login (keep inside scroll)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account? ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkColor,
                        fontSize: 12,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),

                // Extra space so content doesn’t hide under bottom button
                const SizedBox(height: 90),
              ],
            ),
          ),
        ),
      ),

      /// Button pinned at bottom & lifts above keyboard
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(
          24,
          12,
          24,
          12 + bottomInset,
        ),
        child: SizedBox(
          height: 50,
          child: ElevatedButton(
            onPressed: _onSignUp,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              foregroundColor: AppColors.whiteColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              "Sign Up",
              style: TextStyle(fontSize: 15),
            ),
          ),
        ),
      ),
    );
  }
}
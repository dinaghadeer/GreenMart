import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../../core/utils/colors.dart';

class VerificationScreen extends StatefulWidget {
  final String phone;

  const VerificationScreen({super.key, required this.phone});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final otpController = TextEditingController();
  final focusNode = FocusNode();

  Timer? _timer;
  int secondsLeft = 30;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    otpController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  void _startTimer() {
    _timer?.cancel();
    setState(() => secondsLeft = 30);

    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (secondsLeft == 0) {
        t.cancel();
      } else {
        setState(() => secondsLeft--);
      }
    });
  }

  String _maskPhone(String phone) {
    if (phone.length <= 3) return phone;
    final last = phone.substring(phone.length - 3);
    return "0XXXXXXXXX$last";
  }

  void _onConfirm() {
    FocusScope.of(context).unfocus();

    final otp = otpController.text.trim();
    if (otp.length < 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter the OTP code")),
      );
      return;
    }

    // TODO: verify OTP
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.darkColor,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: AppColors.primaryColor, width: 2),
      ),
    );

    final errorPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: Colors.red, width: 2),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,

      body: SafeArea(
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
                  size: 20,
                ),
              ),

              const SizedBox(height: 28),

              const Text(
                "Enter verification code",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkColor,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                "We have sent SMS to: ${_maskPhone(widget.phone)}",
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.greyColor,
                ),
              ),

              const SizedBox(height: 28),

              /// OTP input
              Center(
                child: Pinput(
                  controller: otpController,
                  focusNode: focusNode,
                  length: 4,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  errorPinTheme: errorPinTheme,
                  separatorBuilder: (_) => const SizedBox(width: 12),
                  hapticFeedbackType: HapticFeedbackType.lightImpact,
                  showCursor: true,
                  cursor: Container(
                    width: 2,
                    height: 22,
                    color: AppColors.primaryColor,
                  ),
                  onCompleted: (_) => _onConfirm(), // optional auto confirm
                ),
              ),

              const SizedBox(height: 24),

              /// Change phone number
              Center(
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Text(
                    "Change Phone Number",
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.greyColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              /// Resend
              Center(
                child: GestureDetector(
                  onTap: secondsLeft == 0
                      ? () {
                    // TODO: resend OTP
                    _startTimer();
                  }
                      : null,
                  child: Text(
                    secondsLeft == 0
                        ? "Resend OTP"
                        : "Resend OTP ($secondsLeft)",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: secondsLeft == 0
                          ? AppColors.primaryColor
                          : Colors.orange,
                    ),
                  ),
                ),
              ),

              // extra space so content doesn't hide under bottom button
              const SizedBox(height: 90),
            ],
          ),
        ),
      ),

      /// Confirm button pinned to bottom and lifts above keyboard
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
            onPressed: _onConfirm,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              "Confirm",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
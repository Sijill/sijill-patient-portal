import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';

import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/core/utils/customed_button.dart';
import 'package:sijil_patient_portal/features/auth/widget/customed_logo.dart';
import 'package:sijil_patient_portal/features/auth/widget/customed_otp_pin_code_textField.dart';

typedef Validator = String? Function(String?)?;

class CustomedOtpContent extends StatefulWidget {
  final VoidCallback navigateScreen;
  final VoidCallback resendCode;
  final Validator validator;
  final TextEditingController otpController;
  const CustomedOtpContent({
    super.key,
    required this.navigateScreen,
    required this.resendCode,
    this.validator,
    required this.otpController,
  });

  @override
  State<CustomedOtpContent> createState() => _CustomedOtpContentState();
}

class _CustomedOtpContentState extends State<CustomedOtpContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 57.h, horizontal: 21.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomedLogo(),
                SizedBox(height: 50.h),
                Text(
                  "Enter the code sent to your email",
                  style: AppStyle.semiBoldBlack24,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 45.h),
                CustomedOtpPinCodeTextfield(
                  otpController: widget.otpController,
                  validator: widget.validator,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Nothing Yet?", style: AppStyle.mediumBlack16),
                    TextButton(
                      onPressed: () {
                        widget.resendCode();
                      },
                      child: AutoSizeText(
                        "Resend Code",
                        style: AppStyle.mediumGray16.copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.gray,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                CustomedButton(
                  text: "Submit",
                  onPressed: () {
                    widget.navigateScreen();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

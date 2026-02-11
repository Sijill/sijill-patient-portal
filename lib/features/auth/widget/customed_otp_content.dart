import 'package:flutter/material.dart';

import 'dart:ui';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sijil_patient_portal/core/utils/Padding.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/core/utils/customed_button.dart';
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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.authBg),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: width * 0.04),
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.04,
                    vertical: height * 0.01,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.authContainerColor,
                    borderRadius: BorderRadius.circular(40.r),
                    border: Border.all(
                      color: AppColors.authBorderColor,
                      width: 1.5,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.01,
                      vertical: height * 0.04,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Enter the code sent to your email",
                          style: AppStyle.boldBlack24,
                          textAlign: TextAlign.center,
                        ).setVerticalPadding(context, 0.01),
                        SizedBox(height: height * 0.02),
                        CustomedOtpPinCodeTextfield(
                          otpController: widget.otpController,
                          validator: widget.validator,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Nothing Yet?", style: AppStyle.boldBlack20),
                            TextButton(
                              onPressed: () {
                                widget.resendCode();
                              },
                              child: Text(
                                "Resend Code",
                                style: AppStyle.boldPrimary16,
                              ),
                            ),
                          ],
                        ).setVerticalPadding(context, 0.001),
                        SizedBox(height: height * 0.02),
                        CustomedButton(
                          text: "Verify",
                          onPressed: () {
                            widget.navigateScreen();
                          },
                        ),
                      ],
                    ),
                  ),
                ).setVerticalPadding(context, 0.16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';

typedef Validator = String? Function(String?)?;

class CustomedOtpPinCodeTextfield extends StatelessWidget {
  final TextEditingController otpController;
  final Validator validator;
  CustomedOtpPinCodeTextfield({
    super.key,
    required this.otpController,
    this.validator,
  });
  final StreamController<ErrorAnimationType> errorController =
      StreamController();

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      validator: validator,
      errorTextSpace: 20.h,
      length: 6,
      obscureText: false,
      animationType: AnimationType.fade,
      keyboardType: TextInputType.number,

      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(32.r),
        fieldHeight: 50.h,
        fieldWidth: 45.w,
        activeFillColor: AppColors.white,
        activeBorderWidth: 1,
        borderWidth: 1,
        inactiveFillColor: AppColors.authContainerColor,
        inactiveColor: AppColors.blueLight,
      ),
      animationDuration: Duration(milliseconds: 300),
      enableActiveFill: true,
      errorAnimationController: errorController,
      controller: otpController,
      onCompleted: (value) {},

      beforeTextPaste: (text) {
        return true;
      },
      appContext: context,
    );
  }
}

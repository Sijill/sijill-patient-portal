import 'package:flutter/material.dart';
import 'package:sijil_patient_portal/core/utils/app_routes.dart';
import 'package:sijil_patient_portal/core/utils/validators.dart';
import 'package:sijil_patient_portal/features/auth/widget/customed_otp_content.dart';

class OtpSigninVerification extends StatefulWidget {
  const OtpSigninVerification({super.key});

  @override
  State<OtpSigninVerification> createState() => _OtpSigninVerificationState();
}

class _OtpSigninVerificationState extends State<OtpSigninVerification> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: CustomedOtpContent(
        otpController: otpController,
        validator: (val) {
          return AppValidators.validateOtp(val);
        },
        navigateScreen: () {
          if (_formKey.currentState!.validate()) {
            Navigator.of(
              context,
            ).pushNamedAndRemoveUntil(AppRoutes.homeScreen, (route) => false);
          }
        },
        resendCode: () {},
      ),
    );
  }
}

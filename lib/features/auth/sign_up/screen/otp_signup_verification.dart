import 'package:flutter/material.dart';
import 'package:sijil_patient_portal/core/utils/app_routes.dart';
import 'package:sijil_patient_portal/core/utils/validators.dart';
import 'package:sijil_patient_portal/features/auth/widget/customed_otp_content.dart';

class OtpSignupVerification extends StatelessWidget {
  OtpSignupVerification({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: CustomedOtpContent(
        validator: (val) {
          return AppValidators.validateOtp(val);
        },
        navigateScreen: () {
          if (_formKey.currentState!.validate()) {
            Navigator.of(context).pushNamedAndRemoveUntil(
              AppRoutes.applicationReviewPage,
              (route) => false,
            );
          }
        },
        resendCode: () {},
      ),
    );
  }
}

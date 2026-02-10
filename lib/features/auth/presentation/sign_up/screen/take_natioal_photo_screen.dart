import 'package:flutter/material.dart';
import 'package:sijil_patient_portal/core/utils/app_routes.dart';
import 'package:sijil_patient_portal/features/auth/widget/customed_take_photo.dart';

class TakeNatioalPhotoScreen extends StatelessWidget {
  const TakeNatioalPhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomedTakePhoto(
      title: "Hold your National ID next to your face.",
      subTitle:
          "Make sure your face and the ID photo are clearly visible.\nTake the photo in good lighting.",
      firstIcon: Icons.circle_outlined,
      middleIcon: Icons.circle_outlined,
      lastIcon: Icons.circle,
      forwardScreen: AppRoutes.otpSignupVerification,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sijil_patient_portal/core/utils/app_routes.dart';
import 'package:sijil_patient_portal/features/auth/widget/customed_take_photo.dart';

class TakeBackPhotoScreen extends StatelessWidget {
  const TakeBackPhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomedTakePhoto(
      title: "Take a clear photo of the back of your National ID",
      subTitle:
          "Make sure all information is visible and readable.\n"
          "Avoid glare and shadows.",
      firstIcon: Icons.circle_outlined,
      middleIcon: Icons.circle,
      lastIcon: Icons.circle_outlined,
      forwardScreen: AppRoutes.takeNatioalPhotoScreen,
    );
  }
}

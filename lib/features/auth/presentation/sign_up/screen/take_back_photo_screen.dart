import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sijil_patient_portal/core/utils/app_routes.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/register/register_request.dart';
import 'package:sijil_patient_portal/features/auth/widget/customed_take_photo.dart';

class TakeBackPhotoScreen extends StatefulWidget {
  const TakeBackPhotoScreen({super.key});

  @override
  State<TakeBackPhotoScreen> createState() => _TakeBackPhotoScreenState();
}

class _TakeBackPhotoScreenState extends State<TakeBackPhotoScreen> {
  File? imageTakeBackPhoto;
  @override
  Widget build(BuildContext context) {
    RegisterRequest args =
        ModalRoute.of(context)?.settings.arguments as RegisterRequest;
    return CustomedTakePhoto(
      title: "Take a clear photo of the back of your National ID",
      subTitle:
          "Make sure all information is visible and readable.\n"
          "Avoid glare and shadows.",
      firstIcon: Icons.circle_outlined,
      middleIcon: Icons.circle,
      lastIcon: Icons.circle_outlined,
      onImagePicked: (image) {
        imageTakeBackPhoto = image;
      },
      forwardScreen: () {
        Navigator.of(context).pushNamed(
          AppRoutes.takeNatioalPhotoScreen,
          arguments: RegisterRequest(
            firstName: args.firstName,
            middleName: args.middleName,
            surName: args.surName,
            gender: args.gender,
            dateOfBirth: args.dateOfBirth,
            nationalId: args.nationalId,
            email: args.email,
            password: args.password,
            phoneNumber: args.phoneNumber,
            nationalIdFront: args.nationalIdFront,
            nationalIdBack: imageTakeBackPhoto?.path,
          ),
        );
      },
    );
  }
}

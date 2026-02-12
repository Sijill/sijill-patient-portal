import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sijil_patient_portal/core/utils/app_routes.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/register/register_request.dart';
import 'package:sijil_patient_portal/features/auth/widget/customed_take_photo.dart';

class TakeFrontPhotoScreen extends StatefulWidget {
  const TakeFrontPhotoScreen({super.key});

  @override
  State<TakeFrontPhotoScreen> createState() => _TakeFrontPhotoScreenState();
}

class _TakeFrontPhotoScreenState extends State<TakeFrontPhotoScreen> {
  File? imageTakeFrontPhoto;
  late RegisterRequest args;
  bool _loaded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_loaded) {
      args = ModalRoute.of(context)!.settings.arguments as RegisterRequest;
      _loaded = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomedTakePhoto(
      title: "Take a clear photo of the front \n of your National ID",
      subTitle:
          "Make sure all information is visible and readable.\n"
          "Avoid glare and shadows.",
      firstIcon: Icons.circle,
      middleIcon: Icons.circle_outlined,
      lastIcon: Icons.circle_outlined,
      onImagePicked: (image) {
        imageTakeFrontPhoto = image;
      },
      forwardScreen: () {
        Navigator.of(context).pushNamed(
          AppRoutes.takeBackPhotoScreen,
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
            nationalIdFront: imageTakeFrontPhoto?.path,
          ),
        );
      },
    );
  }
}

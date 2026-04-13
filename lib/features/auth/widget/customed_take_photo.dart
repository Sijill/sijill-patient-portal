import 'dart:io';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sijil_patient_portal/core/utils/Padding.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_dialog.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/features/auth/widget/customed_auth_button.dart';
import 'package:sijil_patient_portal/features/auth/widget/customed_logo.dart';

class CustomedTakePhoto extends StatefulWidget {
  final String title;
  final String subTitle;
  final IconData firstIcon;
  final IconData middleIcon;
  final IconData lastIcon;
  final void Function() forwardScreen;
  final Function(File image) onImagePicked;

  const CustomedTakePhoto({
    super.key,
    required this.title,
    required this.subTitle,
    required this.firstIcon,
    required this.middleIcon,
    required this.lastIcon,
    required this.forwardScreen,
    required this.onImagePicked,
  });

  @override
  State<CustomedTakePhoto> createState() => _CustomedTakePhotoState();
}

class _CustomedTakePhotoState extends State<CustomedTakePhoto> {
  final ImagePicker _picker = ImagePicker();
  File? _image;

  Future<void> _pickImage() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.camera,
      );

      if (pickedFile != null && mounted) {
        setState(() {
          _image = File(pickedFile.path);
        });

        widget.onImagePicked(_image!);
      }
    } catch (e) {
      debugPrint("Error picking image: $e");
    }
  }

  bool _validateImage(BuildContext context) {
    if (_image == null) {
      AppDialog.showDialogMessage(message: "Please take a photo first");

      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 21.w),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomedLogo(),
                SizedBox(height: 30.h),
                AutoSizeText(
                  widget.title,
                  style: AppStyle.semiBoldBlack22,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 14.h),
                AutoSizeText(
                  widget.subTitle,
                  style: AppStyle.mediumBlack16,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30.h),
                GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    height: height * 0.28,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.blueLight,
                      border: Border.all(color: AppColors.grey, width: 2.w),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: _image == null
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                AppAssets.cameraImg,
                                height: 75,
                                width: 75,
                                fit: BoxFit.scaleDown,
                              ),
                              SizedBox(height: 20.h),
                              AutoSizeText(
                                "Tap to take a photo",
                                style: AppStyle.boldGrey14,
                              ),
                            ],
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(12.r),
                            child: Image.file(_image!, fit: BoxFit.cover),
                          ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      widget.firstIcon,
                      color: AppColors.blueLight,
                      size: 10.sp,
                    ),
                    SizedBox(width: width * 0.02),
                    Icon(
                      widget.middleIcon,
                      color: AppColors.blueLight,
                      size: 10.sp,
                    ),
                    SizedBox(width: width * 0.02),
                    Icon(
                      widget.lastIcon,
                      color: AppColors.blueLight,
                      size: 10.sp,
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomedAuthButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icons.arrow_back_ios_new_outlined,
                    ),

                    CustomedAuthButton(
                      onPressed: () {
                        if (_validateImage(context)) {
                          widget.forwardScreen();
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

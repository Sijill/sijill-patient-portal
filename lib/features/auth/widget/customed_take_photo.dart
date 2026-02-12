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
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: height * 0.1),
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: width * 0.04),
                    decoration: BoxDecoration(
                      color: AppColors.authContainerColor,
                      borderRadius: BorderRadius.circular(40.r),
                      border: Border.all(
                        color: AppColors.authBorderColor,
                        width: 1.5.w,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: height * 0.04,
                        horizontal: width * 0.04,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          AutoSizeText(
                            widget.title,
                            style: AppStyle.boldBlack20,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: height * 0.008),
                          AutoSizeText(
                            widget.subTitle,
                            style: AppStyle.boldBlack16,
                            textAlign: TextAlign.center,
                          ).setVerticalPadding(context, 0.01),
                          SizedBox(height: height * 0.018),
                          GestureDetector(
                            onTap: _pickImage,
                            child: Container(
                              height: height * 0.28,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.grey,
                                  width: 2.w,
                                ),
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: _image == null
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.add_a_photo,
                                          size: 45.sp,
                                          color: AppColors.grey,
                                        ),
                                        SizedBox(height: height * 0.002),
                                        AutoSizeText(
                                          "Tap to take photo",
                                          style: AppStyle.boldGrey14,
                                        ),
                                      ],
                                    )
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(12.r),
                                      child: Image.file(
                                        _image!,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                            ),
                          ).setVerticalPadding(context, 0.001),
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
                          ).setVerticalPadding(context, 0.01),
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}

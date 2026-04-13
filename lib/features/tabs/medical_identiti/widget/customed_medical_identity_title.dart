import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';

class CustomedMedicalIdentityTitle extends StatelessWidget {
  final String title;
  final String imageName;
  const CustomedMedicalIdentityTitle({
    super.key,
    required this.title,
    required this.imageName,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5.w,
      children: [
        AutoSizeText(
          title,
          style: AppStyle.semiBoldBlack20.copyWith(fontSize: 17.sp),
        ),
        Image.asset(
          imageName,
          height: 27.h,
          width: 27.w,
          fit: BoxFit.scaleDown,
        ),
      ],
    );
  }
}

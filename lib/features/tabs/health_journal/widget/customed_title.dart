import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';

class CustomedTitle extends StatelessWidget {
  final String imageLogo;
  final String title;
  const CustomedTitle({
    super.key,
    required this.imageLogo,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5.w,
      children: [
        Image.asset(
          imageLogo,
          height: 30.h,
          width: 30.w,
          fit: BoxFit.scaleDown,
        ),
        AutoSizeText(title, style: AppStyle.boldBlack16),
      ],
    );
  }
}

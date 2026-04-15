import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';

class CustomedRemindersItem extends StatelessWidget {
  final String imageIcon;
  final String number;
  final String text;

  const CustomedRemindersItem({
    super.key,
    required this.imageIcon,
    required this.number,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          imageIcon,
          height: 35.h,
          width: 35.w,
          fit: BoxFit.scaleDown,
        ),
        SizedBox(width: 15.w),
        AutoSizeText(number, style: AppStyle.mediumBlack16),
        SizedBox(width: 15.w),
        AutoSizeText(text, style: AppStyle.mediumBlack16),
      ],
    );
  }
}

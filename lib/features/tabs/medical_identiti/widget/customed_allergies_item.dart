import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';

class CustomedAllergiesItem extends StatelessWidget {
  final Color backgroundColor;
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final Color? textColor1;
  final Color? textColor2;
  final Color? textColor3;
  final Color? textColor4;

  const CustomedAllergiesItem({
    super.key,
    required this.backgroundColor,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    this.textColor1,
    this.textColor2,
    this.textColor3,
    this.textColor4,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16.w, top: 16.h),
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8.h,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AutoSizeText(
                text1,
                style: AppStyle.boldBlack16.copyWith(color: textColor1),
              ),
              AutoSizeText(
                text2,
                style: AppStyle.boldBlack16.copyWith(
                  fontSize: 14.sp,
                  color: textColor2,
                ),
              ),
            ],
          ),
          AutoSizeText(
            text3,
            style: AppStyle.meduimBlack14.copyWith(color: textColor3),
          ),

          AutoSizeText(
            text4,
            style: AppStyle.boldGrey14.copyWith(
              color: textColor4 ?? AppColors.rose,
            ),
          ),
        ],
      ),
    );
  }
}

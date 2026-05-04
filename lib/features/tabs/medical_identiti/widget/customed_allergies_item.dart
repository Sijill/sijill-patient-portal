import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';

class CustomedAllergiesItem extends StatelessWidget {
  final Color backgroundColor;
  final String allergenName;
  final String severity;
  final String reactionDescription;
  final String diagnosedBy;
  final String diagnosedDate;
  final Color? allergenNamColor;
  final Color? severityColor;
  final Color? diagnosedByColor;
  final Color? diagnosedDateColor;

  const CustomedAllergiesItem({
    super.key,
    required this.backgroundColor,
    required this.allergenName,
    required this.severity,
    required this.reactionDescription,
    required this.diagnosedBy,
    required this.diagnosedDate,
    this.allergenNamColor,
    this.severityColor,
    this.diagnosedByColor,
    this.diagnosedDateColor,
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
                allergenName,
                style: AppStyle.boldBlack16.copyWith(
                  color: allergenNamColor ?? AppColors.black,
                ),
              ),
              AutoSizeText(
                severity,
                style: AppStyle.boldBlack16.copyWith(
                  fontSize: 14.sp,
                  color: severityColor ?? AppColors.darkRed,
                ),
              ),
            ],
          ),
          AutoSizeText(
            "Reaction: $reactionDescription",
            style: AppStyle.meduimBlack14,
          ),

          AutoSizeText(
            diagnosedBy,
            style: AppStyle.boldGrey14.copyWith(
              color: diagnosedByColor ?? AppColors.red3,
            ),
          ),
          AutoSizeText(
            diagnosedDate,
            style: AppStyle.boldGrey14.copyWith(
              color: diagnosedDateColor ?? AppColors.red3,
            ),
          ),
        ],
      ),
    );
  }
}

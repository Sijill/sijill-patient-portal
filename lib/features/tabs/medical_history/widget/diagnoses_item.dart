import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';

class DiagnosesItem extends StatelessWidget {
  const DiagnosesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(color: AppColors.darkGreen2, width: 6.w),
        ),
        color: AppColors.iceGrey,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 5.h,
        children: [
          AutoSizeText(
            "BA80.1 — Essential (primary) hypertension",
            style: AppStyle.boldBlack16.copyWith(
              fontSize: 13.sp,
              color: AppColors.darkGreen2,
            ),
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Clinical Description: ",
                  style: AppStyle.semiBoldBlack20.copyWith(
                    fontSize: 12.sp,
                    color: AppColors.darkGreen2,
                  ),
                ),
                TextSpan(
                  text:
                      "Patient presents with elevated blood pressure readings (systolic 145-160 mmHg, diastolic 90-100 mmHg) on multiple occasions. No secondary causes identified. Patient reports occasional headaches and mild fatigue. Lifestyle factors reviewed including salt intake and stress levels.",
                  style: AppStyle.mediumBlack16.copyWith(
                    fontSize: 12.sp,
                    height: 3.h,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';

class PrescribedMedicationsItem extends StatelessWidget {
  const PrescribedMedicationsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(color: AppColors.tabBarSelectedColor, width: 6.w),
        ),
        color: AppColors.iceGrey,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 5.h,
        children: [
          Row(
            children: [
              AutoSizeText(
                "Lisinopril",
                style: AppStyle.boldBlack16.copyWith(fontSize: 14.sp),
              ),
              SizedBox(width: 55.w),
              AutoSizeText(
                "May 2015 : June 2015",
                style: AppStyle.boldGrey14.copyWith(fontSize: 13.sp),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Row(
            children: [
              AutoSizeText(
                "Dosage: ",
                style: AppStyle.boldBlack14.copyWith(fontSize: 12.sp),
              ),
              AutoSizeText(
                "10mg",
                style: AppStyle.boldGrey14.copyWith(fontSize: 12.sp),
              ),
            ],
          ),
          Row(
            children: [
              AutoSizeText(
                "Form: ",
                style: AppStyle.boldBlack14.copyWith(fontSize: 12.sp),
              ),
              AutoSizeText(
                "Tablet",
                style: AppStyle.boldGrey14.copyWith(fontSize: 12.sp),
              ),
            ],
          ),
          Row(
            children: [
              AutoSizeText(
                "Frequency: ",
                style: AppStyle.boldBlack14.copyWith(fontSize: 12.sp),
              ),
              AutoSizeText(
                "Once Daily",
                style: AppStyle.boldGrey14.copyWith(fontSize: 12.sp),
              ),
            ],
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Instruction: ",
                  style: AppStyle.boldBlack14.copyWith(fontSize: 12.sp),
                ),
                TextSpan(
                  text: "Take in the morning with or without food",
                  style: AppStyle.boldGrey14.copyWith(
                    fontSize: 12.sp,
                    height: 1.5.h,
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

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';

class PrescribedMedicationsItem extends StatelessWidget {
  final String medicationName;
  final String startDate;
  final int dosageAmount;
  final String dosageUnit;
  final String from;
  final String frequency;
  final String instructions;

  const PrescribedMedicationsItem({
    super.key,
    required this.medicationName,
    required this.startDate,
    required this.dosageAmount,
    required this.dosageUnit,
    required this.from,
    required this.frequency,
    required this.instructions,
  });

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
                medicationName,
                style: AppStyle.boldBlack16.copyWith(fontSize: 14.sp),
              ),
              SizedBox(width: 55.w),
              AutoSizeText(
                startDate,
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
                "$dosageAmount $dosageUnit",
                style: AppStyle.boldGrey14.copyWith(fontSize: 12.sp),
              ),
            ],
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Form: ",
                  style: AppStyle.boldBlack14.copyWith(fontSize: 12.sp),
                ),
                TextSpan(
                  text: from,
                  style: AppStyle.boldGrey14.copyWith(
                    fontSize: 12.sp,
                    height: 1.5.h,
                  ),
                ),
              ],
            ),
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Frequency: ",
                  style: AppStyle.boldBlack14.copyWith(fontSize: 12.sp),
                ),
                TextSpan(
                  text: frequency,
                  style: AppStyle.boldGrey14.copyWith(
                    fontSize: 12.sp,
                    height: 1.5.h,
                  ),
                ),
              ],
            ),
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Instruction: ",
                  style: AppStyle.boldBlack14.copyWith(fontSize: 12.sp),
                ),
                TextSpan(
                  text: instructions,
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

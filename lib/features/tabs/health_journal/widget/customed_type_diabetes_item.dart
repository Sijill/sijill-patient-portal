import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';

class CustomedTypeDiabetesItem extends StatelessWidget {
  final String date;
  final String patientOutcome;
  final String painLevel;
  final String energyLevel;
  final String mood;
  final String patientOutcomeDetails;
  const CustomedTypeDiabetesItem({
    super.key,
    required this.date,
    required this.patientOutcome,
    required this.painLevel,
    required this.energyLevel,
    required this.mood,
    required this.patientOutcomeDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
      decoration: BoxDecoration(
        color: AppColors.tabBarUnSelectedColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10.h,
        children: [
          AutoSizeText(
            date,
            style: AppStyle.mediumGray14.copyWith(fontSize: 12.sp),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AutoSizeText(
                "Patient outcome: ",
                style: AppStyle.mediumBlack16.copyWith(fontSize: 12.sp),
              ),
              Expanded(
                child: AutoSizeText(
                  patientOutcome,
                  style: AppStyle.mediumGray16.copyWith(fontSize: 12.sp),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      "Pain Level: ",
                      style: AppStyle.mediumBlack16.copyWith(fontSize: 12.sp),
                    ),
                    Expanded(
                      child: AutoSizeText(
                        painLevel,
                        style: AppStyle.mediumGray16.copyWith(fontSize: 12.sp),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      "Energy Level: ",
                      style: AppStyle.mediumBlack16.copyWith(fontSize: 12.sp),
                    ),
                    Expanded(
                      child: AutoSizeText(
                        energyLevel,
                        style: AppStyle.mediumGray16.copyWith(fontSize: 12.sp),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AutoSizeText(
                "Mood: ",
                style: AppStyle.mediumBlack16.copyWith(fontSize: 12.sp),
              ),
              Expanded(
                child: AutoSizeText(
                  mood,
                  style: AppStyle.mediumGray16.copyWith(fontSize: 12.sp),
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AutoSizeText(
                "Patient outcome details: ",
                style: AppStyle.mediumBlack16.copyWith(fontSize: 12.sp),
              ),
              Expanded(
                child: AutoSizeText(
                  patientOutcomeDetails,
                  style: AppStyle.mediumGray16.copyWith(fontSize: 12.sp),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

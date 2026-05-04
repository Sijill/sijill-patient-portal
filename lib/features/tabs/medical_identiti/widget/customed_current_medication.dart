import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';

class CustomedCurrentMedication extends StatelessWidget {
  final String medicationName;
  final String dosageAmount;
  final String dosageUnit;
  final String form;
  final String frequency;
  final String startDate;
  final String endDate;
  final String prescribedBy;
  final String prescribedAt;

  const CustomedCurrentMedication({
    super.key,
    required this.medicationName,
    required this.dosageAmount,
    required this.dosageUnit,
    required this.form,
    required this.frequency,
    required this.startDate,
    required this.endDate,
    required this.prescribedBy,
    required this.prescribedAt,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16.w, top: 16.h),
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 6.h,
        children: [
          AutoSizeText(medicationName, style: AppStyle.boldBlack16),
          AutoSizeText(
            "$dosageAmount $dosageUnit — $form — $frequency",
            style: AppStyle.meduimBlack14,
          ),
          AutoSizeText(
            "Start Date: $startDate / End Date: $endDate",
            style: AppStyle.boldGrey14.copyWith(color: AppColors.blueGrey),
          ),
          AutoSizeText(
            "Prescriped By: DR. $prescribedBy",
            style: AppStyle.boldGrey14.copyWith(color: AppColors.blueGrey),
          ),
          AutoSizeText(
            prescribedAt,
            style: AppStyle.boldGrey14.copyWith(color: AppColors.blueGrey),
          ),
        ],
      ),
    );
  }
}

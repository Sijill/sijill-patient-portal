import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';

class CustomedActiveDiagnosisItem extends StatelessWidget {
  final String icd11Title;
  final String icd11Code;
  final String diagnosedBy;
  final String diagnosedDate;

  const CustomedActiveDiagnosisItem({
    super.key,
    required this.icd11Title,
    required this.icd11Code,
    required this.diagnosedBy,
    required this.diagnosedDate,
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
        spacing: 8.h,
        children: [
          AutoSizeText(icd11Title, style: AppStyle.boldBlack16),
          AutoSizeText("ICD11 — $icd11Code", style: AppStyle.meduimBlack14),
          AutoSizeText(
            "Diagnosed By:$diagnosedBy",
            style: AppStyle.boldGrey14.copyWith(color: AppColors.blueGrey),
          ),
          AutoSizeText(
            diagnosedDate,
            style: AppStyle.boldGrey14.copyWith(color: AppColors.blueGrey),
          ),
        ],
      ),
    );
  }
}

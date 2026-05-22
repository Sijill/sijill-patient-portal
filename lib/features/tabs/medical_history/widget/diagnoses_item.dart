import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';

class DiagnosesItem extends StatelessWidget {
  final String icd11Code;
  final String icd11Title;
  final String clinicalDescription;
  const DiagnosesItem({
    super.key,
    required this.icd11Code,
    required this.icd11Title,
    required this.clinicalDescription,
  });

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
            "$icd11Code — Essential (primary)",
            style: AppStyle.boldBlack16.copyWith(
              fontSize: 13.sp,
              color: AppColors.darkGreen2,
            ),
          ),
          AutoSizeText(
            icd11Title,
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
                  text: clinicalDescription,
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

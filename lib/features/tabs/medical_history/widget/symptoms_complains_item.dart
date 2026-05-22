import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';

class SymptomsComplainsItem extends StatelessWidget {
  final String? title;
  final String? subTitle;

  const SymptomsComplainsItem({super.key, this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(color: AppColors.red2, width: 6.w),
        ),
        color: AppColors.iceGrey,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 5.h,
        children: [
          AutoSizeText(
            title ?? "Occasional headaches",
            style: AppStyle.boldBlack16.copyWith(fontSize: 13.sp),
          ),
          AutoSizeText(
            subTitle ?? "Typically in the mornings, lasts 30 minutes to 1 hour",
            style: AppStyle.semiBoldBlack20.copyWith(fontSize: 12.sp),
          ),
        ],
      ),
    );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';

class CustomedEmergencyContactsItem extends StatelessWidget {
  const CustomedEmergencyContactsItem({super.key});

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
        children: [
          Row(
            children: [
              AutoSizeText("Mahmoud Khedr — ", style: AppStyle.boldBlack16),
              AutoSizeText("Parent", style: AppStyle.mediumBlack16),
              Spacer(),
              AutoSizeText("Primary", style: AppStyle.boldBlack16),
            ],
          ),
          SizedBox(height: 15.h),
          Row(
            children: [
              AutoSizeText("01285963258", style: AppStyle.boldBlack14),
              Spacer(),
              Image.asset(
                AppAssets.phoneOffImg,
                height: 20.h,
                width: 20.w,
                fit: BoxFit.scaleDown,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

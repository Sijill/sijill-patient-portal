import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_routes.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';

class MedicalHistoryItem extends StatelessWidget {
  const MedicalHistoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(AppRoutes.medicalHistroyDetails);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        decoration: BoxDecoration(
          color: AppColors.tabBarUnSelectedColor,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10.h,
          children: [
            AutoSizeText(
              "Dr. Layla Hassan (Cardiology)",
              style: AppStyle.boldBlack16,
            ),
            AutoSizeText(
              "ICD-11 — BA80.1 — Essential (primary) hypertension",
              style: AppStyle.boldBlack14.copyWith(fontSize: 12.sp),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 3.w,
              children: [
                Image.asset(
                  AppAssets.calender,
                  height: 27.h,
                  width: 27.w,
                  fit: BoxFit.scaleDown,
                ),
                AutoSizeText(
                  "March 3, 2026",
                  style: AppStyle.boldGrey14.copyWith(fontSize: 12.sp),
                ),
                SizedBox(width: 10.w),
                Image.asset(
                  AppAssets.location,
                  height: 27.h,
                  width: 27.w,
                  fit: BoxFit.scaleDown,
                ),
                Expanded(
                  child: AutoSizeText(
                    "Cairo University Hospital",
                    style: AppStyle.boldGrey14.copyWith(fontSize: 12.sp),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

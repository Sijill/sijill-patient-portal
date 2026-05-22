import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_routes.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';

class MedicalHistoryItem extends StatelessWidget {
  final String doctorName;
  final String icd11Code;
  final String icd11Title;
  final String doctorSpeciality;
  final String encounterDate;
  final String location;
  final void Function()? onTap;

  const MedicalHistoryItem({
    super.key,
    required this.doctorName,
    required this.icd11Code,
    required this.icd11Title,
    required this.doctorSpeciality,
    required this.encounterDate,
    required this.location,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
            AutoSizeText(doctorName, style: AppStyle.boldBlack16),
            AutoSizeText(
              "$icd11Code — $icd11Code — Essential (primary)",
              style: AppStyle.boldBlack14.copyWith(fontSize: 12.sp),
            ),
            AutoSizeText(
              doctorSpeciality,
              style: AppStyle.boldBlack14.copyWith(fontSize: 12.sp),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 3.w,
              children: [
                Image.asset(
                  AppAssets.calender,
                  height: 27.h,
                  width: 27.w,
                  fit: BoxFit.scaleDown,
                ),
                AutoSizeText(
                  encounterDate,
                  style: AppStyle.boldGrey14.copyWith(fontSize: 12.sp),
                ),
              ],
            ),
            Row(
              children: [
                Image.asset(
                  AppAssets.location,
                  height: 27.h,
                  width: 27.w,
                  fit: BoxFit.scaleDown,
                ),
                Expanded(
                  child: AutoSizeText(
                    location,
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

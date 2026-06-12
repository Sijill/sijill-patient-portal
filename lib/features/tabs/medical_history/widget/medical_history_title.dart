import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';

class MedicalHistoryTitle extends StatefulWidget {
  const MedicalHistoryTitle({super.key});

  @override
  State<MedicalHistoryTitle> createState() => _MedicalHistoryTitleState();
}

class _MedicalHistoryTitleState extends State<MedicalHistoryTitle> {
  TextEditingController healthcareProviderController = TextEditingController();
  @override
  void dispose() {
    healthcareProviderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 6.h),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.gray),
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: Image.asset(
              AppAssets.searchlight,
              height: 25.h,
              width: 25.w,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),

        SizedBox(width: 8.w),
        Expanded(
          flex: 5,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              border: Border.all(color: AppColors.gray),
            ),
            child: Row(
              spacing: 5.w,
              children: [
                AutoSizeText(
                  "Healthcare Provider",
                  style: AppStyle.meduimBlack14.copyWith(fontSize: 10.sp),
                ),
                Expanded(child: Icon(Icons.arrow_drop_down)),
              ],
            ),
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          flex: 4,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 6.h),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.gray),
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: Row(
              spacing: 5.w,
              children: [
                AutoSizeText(
                  "From",
                  style: AppStyle.mediumBlack16.copyWith(fontSize: 12.sp),
                ),

                Image.asset(
                  AppAssets.calender,
                  height: 25.h,
                  width: 25.w,
                  fit: BoxFit.scaleDown,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: BoxBorder.symmetric(
                      vertical: BorderSide(color: AppColors.black),
                    ),
                  ),
                  height: 25.h,
                ),
                AutoSizeText(
                  "To",
                  style: AppStyle.mediumBlack16.copyWith(fontSize: 12.sp),
                ),
                Image.asset(
                  AppAssets.calender,
                  height: 25.h,
                  width: 25.w,
                  fit: BoxFit.scaleDown,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

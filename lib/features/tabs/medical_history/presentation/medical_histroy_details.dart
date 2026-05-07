import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/features/tabs/medical_history/widget/diagnoses_item.dart';
import 'package:sijil_patient_portal/features/tabs/medical_history/widget/prescribed_medications_item.dart';
import 'package:sijil_patient_portal/features/tabs/medical_history/widget/symptoms_complains_item.dart';

class MedicalHistroyDetails extends StatelessWidget {
  const MedicalHistroyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText("Medical History", style: AppStyle.semiBoldBlack20),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: AppColors.tabBarUnSelectedColor,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    "Dr. Layla Hassan (Cardiology)",
                    style: AppStyle.boldBlack16,
                  ),
                  SizedBox(height: 12.h),
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
                  SizedBox(height: 26.h),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 16.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          "Symptoms & Complaints",
                          style: AppStyle.boldBlack16,
                        ),
                        SizedBox(height: 20.h),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) =>
                              SymptomsComplainsItem(),
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 16.h),
                          itemCount: 2,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 26.h),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 16.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText("Diagnoses", style: AppStyle.boldBlack16),
                        SizedBox(height: 20.h),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => DiagnosesItem(),
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 16.h),
                          itemCount: 1,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 26.h),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 16.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          "Prescribed Medications",
                          style: AppStyle.boldBlack16,
                        ),
                        SizedBox(height: 20.h),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) =>
                              PrescribedMedicationsItem(),
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 16.h),
                          itemCount: 2,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

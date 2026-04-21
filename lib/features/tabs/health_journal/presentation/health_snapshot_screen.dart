import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/core/utils/customed_button.dart';

class HealthSnapshotScreen extends StatelessWidget {
  const HealthSnapshotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 16.w),
          margin: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
            top: 30.h,
            bottom: 140.h,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.r),
            color: AppColors.primaryColor,
          ),
          child: Column(
            children: [
              Image.asset(
                AppAssets.healthSnapshot,
                height: 80.h,
                width: 80.w,
                fit: BoxFit.fill,
              ),
              SizedBox(height: 10.h),
              AutoSizeText("Your Health Snapshot", style: AppStyle.boldBlack22),
              SizedBox(height: 20.h),
              AutoSizeText(
                "It looks like you've maintained a consistent hydration goal this week. Taking these small moments for reflection is a powerful way to lower cortisol and improve your overall well-being.",
                style: AppStyle.meduimBlack14,
              ),
              SizedBox(height: 10.h),
              AutoSizeText(
                "Keep listening to your body's rhythm you're doing a wonderful job.",
                style: AppStyle.meduimBlack14,
              ),

              Padding(
                padding: EdgeInsets.only(left: 20.w, bottom: 20.h, top: 50.h),
                child: AutoSizeText(
                  "This snapshot is AI generated, it can mistakes, don’t forget to consult your doctor before taking any actions.",
                  style: AppStyle.meduimGray14,
                ),
              ),
              CustomedButton(
                backgroundColor: AppColors.tabBarSelectedColor,
                text: "Got it, Thanks!",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

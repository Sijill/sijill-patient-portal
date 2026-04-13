import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_routes.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';

import 'package:sijil_patient_portal/core/utils/customed_button.dart';

class ApplicationReviewPage extends StatelessWidget {
  const ApplicationReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 100.h, horizontal: 21.w),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
            decoration: BoxDecoration(
              color: AppColors.blueLight,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 150.h,
                  width: 200.w,
                  alignment: AlignmentGeometry.center,
                  decoration: BoxDecoration(
                    color: AppColors.tabBarSelectedColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.check,
                    size: 120.sp,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(height: 50.h),
                AutoSizeText(
                  "Your Application Is Being Reviewed\nCheck Your Accounts For Updates\nEstimate Review Time: 2 Hours",
                  textAlign: TextAlign.center,
                  style: AppStyle.meduimBlack18,
                ),
                SizedBox(height: 20.h),
                CustomedButton(
                  horizontal: 80.w,
                  text: "Ok",
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      AppRoutes.signInScreen,
                      (route) => false,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/Padding.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_routes.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/core/utils/customed_button.dart';

class ApplicationReviewPage extends StatelessWidget {
  const ApplicationReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.authBg),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        body: SafeArea(
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: width * 0.04),
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.04,
                  vertical: height * 0.02,
                ),
                decoration: BoxDecoration(
                  color: AppColors.authContainerColor,
                  borderRadius: BorderRadius.circular(40.r),
                  border: Border.all(
                    color: AppColors.authBorderColor,
                    width: 1.5.w,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.01,
                    vertical: height * 0.02,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: height * 0.15,
                        width: width * 0.4,
                        decoration: BoxDecoration(
                          color: AppColors.green,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.check,
                            size: 100.sp,
                            color: AppColors.white,
                          ),
                        ),
                      ).setVerticalPadding(context, 0.02),
                      Text(
                        "Your Application Is Being Reviewed\nCheck Your Accounts For Updates\nEstimate Review Time: 2 Hours",
                        textAlign: TextAlign.center,
                        style: AppStyle.meduimBlack18,
                      ).setVerticalPadding(context, 0.01),
                      SizedBox(height: height * 0.02),
                      CustomedButton(
                        horizontal: width * 0.002,
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
              ).setHorizontalAndVerticalPadding(context, 0.060, 0.15),
            ),
          ),
        ),
      ),
    );
  }
}

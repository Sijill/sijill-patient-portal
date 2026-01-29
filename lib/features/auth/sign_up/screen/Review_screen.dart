import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/Padding.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_routes.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/core/utils/customed_button.dart';
import 'package:sijil_patient_portal/features/auth/widget/customed_auth_button.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

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
                    vertical: height * 0.04,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Review images and ensure",
                        style: AppStyle.boldBlack20,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "There is no blur/glare/shadows",
                        style: AppStyle.boldBlack16,
                        textAlign: TextAlign.center,
                      ).setVerticalPadding(context, 0.01),
                      SizedBox(height: height * 0.02),
                      CustomedButton(
                        horizontal: width * 0.001,
                        text: "View ID Front",
                        backgroundColor: AppColors.white,
                        textColor: AppColors.black,
                        radius: 8.r,
                        onPressed: () {},
                      ),
                      SizedBox(height: height * 0.015),
                      CustomedButton(
                        horizontal: width * 0.001,
                        text: "View ID Back",
                        backgroundColor: AppColors.white,
                        textColor: AppColors.black,
                        radius: 8.r,
                        onPressed: () {},
                      ),
                      SizedBox(height: height * 0.015),
                      CustomedButton(
                        horizontal: width * 0.001,
                        text: "View Selfie",
                        backgroundColor: AppColors.white,
                        textColor: AppColors.black,
                        radius: 8.r,
                        onPressed: () {},
                      ),

                      SizedBox(height: height * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomedAuthButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icons.arrow_back_ios_new_outlined,
                          ),

                          CustomedAuthButton(
                            onPressed: () {
                              Navigator.of(
                                context,
                              ).pushNamed(AppRoutes.otpSignupVerification);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ).setVerticalPadding(context, 0.08),
            ),
          ),
        ),
      ),
    );
  }
}

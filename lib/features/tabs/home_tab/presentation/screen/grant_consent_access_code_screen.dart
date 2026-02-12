import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/core/utils/customed_button.dart';

class GrantConsentAccessCodeScreen extends StatelessWidget {
  const GrantConsentAccessCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.grantBg),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 40.sp,
                    color: AppColors.blueLight,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: height * 0.14),
                  height: height * 0.3,
                  width: width,
                  padding: EdgeInsets.only(top: 25.h, left: 16.w, right: 16.w),
                  decoration: BoxDecoration(
                    color: AppColors.blueLight.withAlpha(60),
                    borderRadius: BorderRadius.circular(24.r),
                    border: Border.all(color: AppColors.white, width: 2.w),
                  ),
                  child: Column(
                    children: [
                      Text("Access Code", style: AppStyle.boldBlack24),
                      Container(
                        width: width,
                        margin: EdgeInsets.symmetric(vertical: 20.h),
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 10.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: AppColors.white.withAlpha(180),
                        ),
                        child: Text(
                          textAlign: TextAlign.center,
                          "[58967412]",
                          style: AppStyle.boldBlack18,
                        ),
                      ),
                      CustomedButton(
                        horizontal: width * 0.2,
                        text: "REVOKE",
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

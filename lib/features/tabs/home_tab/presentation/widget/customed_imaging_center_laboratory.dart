import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_routes.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/core/utils/customed_button.dart';

class CustomedImagingCenterLaboratory extends StatelessWidget {
  final String imageName;
  final String title1;
  final String title2;

  const CustomedImagingCenterLaboratory({
    super.key,
    required this.imageName,
    required this.title1,
    required this.title2,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(10.r),
      ),
      color: AppColors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 16.h),
              padding: EdgeInsets.symmetric(horizontal: 120.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: AppColors.grantAccessContainerColor,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: SvgPicture.asset(
                imageName,
                height: 72.h,
                width: 72.h,
                fit: BoxFit.fill,
              ),
            ),
            AutoSizeText(title1, style: AppStyle.meduimBlack14),
            SizedBox(height: 16.h),
            AutoSizeText(title2, style: AppStyle.meduimBlack14),
            SizedBox(height: 16.h),
            CustomedButton(
              text: "Generate Permission Token",
              addItem: true,
              vertical: 13.h,
              sufficImageName: AppAssets.key,
              spaceAfterText: 17.w,
              backgroundColor: AppColors.tabBarSelectedColor,
              onPressed: () {
                Navigator.of(
                  context,
                ).pushNamed(AppRoutes.grantAccessPermissionToken);
              },
            ),
          ],
        ),
      ),
    );
  }
}

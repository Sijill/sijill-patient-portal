import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';

class YourTrackedItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final void Function()? onTap;
  const YourTrackedItem({
    super.key,
    required this.title,
    required this.subTitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 30.w),
        decoration: BoxDecoration(
          color: AppColors.tabBarUnSelectedColor,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10.h,
          children: [
            AutoSizeText(
              title,
              style: AppStyle.semiBoldBlack20.copyWith(
                color: AppColors.black,
                fontSize: 16.sp,
              ),
            ),
            AutoSizeText(
              subTitle,
              style: AppStyle.mediumGray16.copyWith(fontSize: 12.sp),
            ),
          ],
        ),
      ),
    );
  }
}

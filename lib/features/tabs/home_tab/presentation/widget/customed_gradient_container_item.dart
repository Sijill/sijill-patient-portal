import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';

class CustomedGradientContainerItem extends StatelessWidget {
  final Widget? child;
  const CustomedGradientContainerItem({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.sp),
      margin: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        gradient: LinearGradient(
          colors: [AppColors.blueLight, AppColors.darkBlue],
          transform: GradientRotation(120.r),
          tileMode: TileMode.mirror,
        ),
      ),
      child: child,
    );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';

class CustomedMedicalIdentityItem extends StatelessWidget {
  final String imageIcon;
  final String title;
  final String description;

  const CustomedMedicalIdentityItem({
    super.key,
    required this.imageIcon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.w,
      padding: EdgeInsets.only(top: 8.w, bottom: 8.w, left: 8.w, right: 4.w),
      decoration: BoxDecoration(
        color: AppColors.tabBarUnSelectedColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                imageIcon,
                height: 27.h,
                width: 27.w,
                fit: BoxFit.scaleDown,
              ),
              SizedBox(width: 5.w),
              AutoSizeText(
                title,
                style: AppStyle.semiBoldBlack20.copyWith(
                  fontSize: 12.sp,
                  color: AppColors.gray,
                ),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: AutoSizeText(
              description,
              style: AppStyle.meduimBlack14.copyWith(fontSize: 12.sp),
            ),
          ),
        ],
      ),
    );
  }
}

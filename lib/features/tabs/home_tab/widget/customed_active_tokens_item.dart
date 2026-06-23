import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/core/utils/customed_button.dart';

class CustomedActiveTokensItem extends StatelessWidget {
  final String accessTo;
  final String accessType;
  final String experiseAt;
  final void Function() viewClick;

  const CustomedActiveTokensItem({
    super.key,
    required this.accessTo,
    required this.accessType,
    required this.experiseAt,
    required this.viewClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 14.h),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.grantAccessContainerColor,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AutoSizeText(accessType, style: AppStyle.mediumBlack16),
              SizedBox(
                height: 33.h,
                child: CustomedButton(
                  backgroundColor: AppColors.tabBarSelectedColor,
                  text: "View",
                  textStyle: AppStyle.meduimBlack14,
                  vertical: 3.h,
                  onPressed: viewClick,
                ),
              ),
            ],
          ),
          AutoSizeText(
            accessTo,
            style: AppStyle.mediumGray14.copyWith(fontSize: 12.sp),
          ),
          SizedBox(height: 7.h),
          AutoSizeText(
            experiseAt,
            style: AppStyle.mediumGray14.copyWith(fontSize: 12.sp),
          ),
        ],
      ),
    );
  }
}

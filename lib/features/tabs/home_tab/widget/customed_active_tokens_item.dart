import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/api/model/home_tab/active_tokens_model.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/core/utils/customed_button.dart';

class CustomedActiveTokensItem extends StatelessWidget {
  final ActiveTokensModel model;
  const CustomedActiveTokensItem({super.key, required this.model});

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
              AutoSizeText(model.title, style: AppStyle.mediumBlack16),
              SizedBox(
                height: 33.h,
                child: CustomedButton(
                  backgroundColor: AppColors.tabBarSelectedColor,
                  text: "View",
                  textStyle: AppStyle.meduimBlack14,
                  vertical: 3.h,
                  onPressed: () {},
                ),
              ),
            ],
          ),
          AutoSizeText(
            model.access,
            style: AppStyle.mediumGray14.copyWith(fontSize: 12.sp),
          ),
          SizedBox(height: 7.h),
          AutoSizeText(
            model.time,
            style: AppStyle.mediumGray14.copyWith(fontSize: 12.sp),
          ),
        ],
      ),
    );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';

class CustomedGrantAccessItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final String imageName;
  final void Function()? selectItemClick;
  const CustomedGrantAccessItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.imageName,
    this.selectItemClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 14.h),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: AppColors.grantAccessContainerColor,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            title,
            style: AppStyle.semiBoldBlack20.copyWith(fontSize: 16.sp),
          ),
          AutoSizeText(
            subTitle,
            style: AppStyle.mediumGray14.copyWith(fontSize: 12.sp),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                imageName,
                height: 40.h,
                width: 40.w,
                fit: BoxFit.fill,
              ),
              MaterialButton(
                color: AppColors.tabBarSelectedColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                onPressed: selectItemClick,
                child: AutoSizeText("Select", style: AppStyle.meduimBlack14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

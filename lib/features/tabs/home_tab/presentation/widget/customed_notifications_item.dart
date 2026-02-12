import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';

class CustomedNotificationsItem extends StatelessWidget {
  final String title;
  final String? textNumber;
  final String? imageName;
  final double? imageWidth;

  final void Function()? onTap;
  const CustomedNotificationsItem({
    super.key,
    required this.title,
    this.imageName,
    this.onTap,
    this.textNumber,
    this.imageWidth,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.04,
          vertical: height * 0.01,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(color: AppColors.white, width: 2.w),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                imageName == null
                    ? Container(
                        padding: EdgeInsets.all(5.sp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(36.r),
                          color: AppColors.blueLight,
                        ),
                        child: Icon(
                          Icons.notifications,
                          color: AppColors.white,
                          size: 30.sp,
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Image.asset(
                          imageName!,
                          height: 35.h,
                          width: imageWidth ?? 45.w,
                          fit: BoxFit.fill,
                        ),
                      ),
                SizedBox(width: width * 0.03),
                Text(
                  title,
                  style: AppStyle.boldBlack14.copyWith(fontSize: 14.sp),
                ),
              ],
            ),

            textNumber == null
                ? Icon(Icons.arrow_forward_ios, color: AppColors.blueLight)
                : Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 2.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.r),
                      color: AppColors.darkGreen,
                    ),
                    child: Text(
                      "$textNumber",
                      style: AppStyle.boldWhite16.copyWith(fontSize: 14.sp),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

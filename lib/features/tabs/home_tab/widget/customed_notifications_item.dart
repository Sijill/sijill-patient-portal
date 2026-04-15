import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';

class CustomedNotificationsItem extends StatelessWidget {
  final String title;
  final String time;
  final String imageName;
  final String subTitle;

  final void Function()? onTap;
  const CustomedNotificationsItem({
    super.key,
    required this.title,
    required this.imageName,
    required this.onTap,
    required this.time,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        leading: Image.asset(
          imageName,
          height: 40.h,
          width: 40.w,
          fit: BoxFit.scaleDown,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AutoSizeText(
              title,
              style: AppStyle.semiBoldBlack20.copyWith(fontSize: 14.sp),
            ),
            AutoSizeText(
              time,
              style: AppStyle.mediumGray14.copyWith(fontSize: 12),
            ),
          ],
        ),
        subtitle: AutoSizeText(
          subTitle,
          style: AppStyle.semiBoldGrey16.copyWith(fontSize: 12.sp),
        ),
      ),
    );
  }
}

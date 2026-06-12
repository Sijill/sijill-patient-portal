import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';

class CustomedNotificationsItem extends StatelessWidget {
  final String title;
  final String time;
  final String imageName;
  final String message;
  final bool isUnread;

  final void Function()? onTap;
  const CustomedNotificationsItem({
    super.key,
    required this.title,
    required this.imageName,
    required this.onTap,
    required this.time,
    required this.message,
    required this.isUnread,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 5.h),
      child: Card(
        color: AppColors.bgColor,
        child: ListTile(
          onTap: onTap,
          leading: Image.asset(
            imageName,
            height: 40.h,
            width: 40.w,
            fit: BoxFit.scaleDown,
          ),
          title: Row(
            spacing: 10.w,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: AutoSizeText(
                  title,
                  style: AppStyle.semiBoldBlack20.copyWith(fontSize: 14.sp),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              AutoSizeText(
                time,
                style: AppStyle.mediumGray14.copyWith(fontSize: 12),
              ),
            ],
          ),
          trailing: isUnread
              ? Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: AppColors.teal,
                    shape: BoxShape.circle,
                  ),
                )
              : const SizedBox(),
          subtitle: AutoSizeText(
            message,
            style: AppStyle.mediumGray14.copyWith(fontSize: 12.sp),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}

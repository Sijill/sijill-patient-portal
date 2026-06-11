import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/core/utils/customed_button.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/cubit/notification_cubit.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/widget/reminder_days_widget.dart';

class CustomChangeDays extends StatelessWidget {
  final int index;
  const CustomChangeDays({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 18.w, right: 18.w, bottom: 380.h),
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 18.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: AppColors.tabBarUnSelectedColor,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  "Amoxicillin",
                  style: AppStyle.semiBoldBlack20.copyWith(fontSize: 13.sp),
                ),
                AutoSizeText(
                  "May 2015 : June 2015",
                  style: AppStyle.semiBoldGrey16.copyWith(fontSize: 13.sp),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            AutoSizeText(
              "500mg · Capsule · 3 times a week",
              style: AppStyle.mediumBlack16.copyWith(fontSize: 12.sp),
            ),
            SizedBox(height: 8.h),
            Divider(color: AppColors.gray, endIndent: 25.w, indent: 25.w),
            SizedBox(height: 8.h),
            AutoSizeText(
              "Reminder Days",
              style: AppStyle.meduimWhitek14.copyWith(color: AppColors.teal),
            ),
            SizedBox(height: 10.h),
            ReminderDaysWidget(index: index),
            SizedBox(height: 10.h),
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: CustomedButton(
                    backgroundColor: AppColors.teal,
                    textColor: AppColors.white,
                    textStyle: AppStyle.meduimWhitek14,
                    vertical: 8.h,
                    radius: 5.r,
                    text: "Save",
                    onPressed: () {
                      context.read<NotificationCubit>().saveSelectedDays(index);
                      Navigator.pop(context);
                    },
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 8.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.lightGray,
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: Icon(Icons.close),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

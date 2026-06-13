import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';

class ImplementTodaySchedule extends StatelessWidget {
  const ImplementTodaySchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Image.asset(
            AppAssets.todayScheduleCheck,
            height: 120.h,
            fit: BoxFit.fill,
          ),
          SizedBox(height: 20.h),
          AutoSizeText(
            "You’re All Caught Up!",
            style: AppStyle.semiBoldBlack20.copyWith(fontSize: 18.sp),
          ),
          SizedBox(height: 10.h),
          SizedBox(
            width: 212.w,
            child: AutoSizeText(
              "No reminders or\nappointments scheduled for\ntoday. Take some time for\nyourself!",
              textAlign: TextAlign.center,
              maxLines: 4,
              style: AppStyle.mediumGray16.copyWith(
                height: 1.7.h,
                color: AppColors.grey,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

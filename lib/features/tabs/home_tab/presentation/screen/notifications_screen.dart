import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/presentation/widget/customed_notifications_item.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/presentation/widget/customed_read_message.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/presentation/widget/customed_tab_bar.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText("Notifications", style: AppStyle.semiBoldBlack20),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomedTabBar(),
            CustomedReadMessage(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 48.w, vertical: 20.h),
              child: MaterialButton(
                padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 10.w),
                color: AppColors.tabBarUnSelectedColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SvgPicture.asset(
                      AppAssets.viewDoctor,
                      height: 33.h,
                      width: 33.w,
                      fit: BoxFit.scaleDown,
                    ),
                    AutoSizeText(
                      "View Doctor’s Set Reminders",
                      style: AppStyle.boldBlack14.copyWith(fontSize: 12.sp),
                    ),
                    Icon(Icons.arrow_forward, size: 19.sp),
                  ],
                ),
              ),
            ),
            CustomedNotificationsItem(
              title: "Appointment",
              imageName: AppAssets.appointment,
              onTap: () {},
              time: "2m ago",
              subTitle: "Upcoming: Appointment with doctor....",
            ),
            CustomedNotificationsItem(
              title: "Medication",
              imageName: AppAssets.medicines,
              onTap: () {},
              time: "23m ago",
              subTitle: "Time for your Lisropril (10mg)",
            ),
            CustomedNotificationsItem(
              title: "Imaging Order",
              imageName: AppAssets.imagingOrder,
              onTap: () {},
              time: "2h ago",
              subTitle: "Upcoming: Appointment with doctor....",
            ),
            CustomedNotificationsItem(
              title: "Lab Test",
              imageName: AppAssets.labTest,
              onTap: () {},
              time: "6h ago",
              subTitle: "Complete your blood count",
            ),
            CustomedNotificationsItem(
              title: "Follow Up",
              imageName: AppAssets.followUp,
              onTap: () {},
              time: "14h ago",
              subTitle: "Hey Alex how is your pain level today....",
            ),
            CustomedNotificationsItem(
              title: "System",
              imageName: AppAssets.system,
              onTap: () {},
              time: "2d ago",
              subTitle: "Alert: doctor Williams has accessed ....",
            ),
          ],
        ),
      ),
    );
  }
}

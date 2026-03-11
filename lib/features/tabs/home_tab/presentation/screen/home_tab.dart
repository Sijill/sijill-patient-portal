import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_routes.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/core/utils/customed_button.dart';
import 'package:sijil_patient_portal/features/auth/widget/customed_logo.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/presentation/widget/customed_gradient_container_item.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/presentation/widget/customed_reminders_item.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/presentation/widget/customed_today_schedule_item.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 22.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomedLogo(height: 49.h, width: 53.w),
                  CustomedButton(
                    text: "Grant Access",
                    addItem: true,
                    spaceAfterText: 5.w,
                    sufficImageName: AppAssets.key,
                    onPressed: () {
                      Navigator.of(
                        context,
                      ).pushNamed(AppRoutes.grantAccessScreen);
                    },
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(
                        context,
                      ).pushNamed(AppRoutes.notificationsScreen);
                    },
                    child: SvgPicture.asset(
                      AppAssets.notification,
                      height: 41,
                      width: 42,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              Divider(endIndent: 12.w, indent: 12.w),
              SizedBox(height: 10.h),
              CustomedGradientContainerItem(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      "Hello Alex, How Are You \nDoing Today!",
                      style: AppStyle.boldBlack20,
                    ),
                    SizedBox(height: 8.h),
                    AutoSizeText(
                      "Keep track of your symptoms and health.",
                      style: AppStyle.mediumGray16,
                    ),
                    SizedBox(height: 20.h),
                    CustomedButton(
                      addItem: true,
                      preImageName: AppAssets.healthJournal,
                      spaceBeforeText: 10.w,
                      text: "Log Your Health Journal",
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25.h),
              CustomedGradientContainerItem(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      "Reminders",
                      style: AppStyle.mediumBlack16.copyWith(fontSize: 20.sp),
                    ),
                    SizedBox(height: 16.h),
                    CustomedRemindersItem(
                      imageIcon: AppAssets.pendingMedications,
                      number: "4",
                      text: "Pending Medications",
                    ),
                    SizedBox(height: 12.h),
                    CustomedRemindersItem(
                      imageIcon: AppAssets.upcomingAppoinments,
                      number: "1",
                      text: "Upcoming Appointments",
                    ),
                    SizedBox(height: 12.h),
                    CustomedRemindersItem(
                      imageIcon: AppAssets.pendingTestOrders,
                      number: "2",
                      text: "Pending Test Orders",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Divider(endIndent: 12.w, indent: 12.w),
              Padding(
                padding: EdgeInsets.only(
                  left: 12.w,
                  right: 12.w,
                  top: 10.h,
                  bottom: 20.h,
                ),
                child: Row(
                  children: [
                    AutoSizeText(
                      "Today’s Schedule",
                      style: AppStyle.meduimBlack16,
                    ),
                    Spacer(),
                    AutoSizeText(
                      "Monday, Oct 28",
                      style: AppStyle.meduimGray14,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 300.h,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => CustomedTodayScheduleItem(
                    index: index,
                    time: "08:00\nAM",
                    title: "Morning Vitamins",
                  ),
                  separatorBuilder: (context, index) => SizedBox(),
                  itemCount: 5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

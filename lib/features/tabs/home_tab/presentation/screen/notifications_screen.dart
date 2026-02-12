import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_routes.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/presentation/widget/customed_notifications_item.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.homeBg),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: height * 0.01,
              horizontal: width * 0.04,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 40.sp,
                    color: AppColors.blueLight,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.w, top: 16.h, bottom: 16.h),
                  child: Text("Notifications", style: AppStyle.boldBlack24),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: height * 0.01),
                  height: height * 0.57,
                  width: width,
                  padding: EdgeInsets.only(top: 25.h, left: 20.w, right: 20.w),
                  decoration: BoxDecoration(
                    color: AppColors.blueLight.withAlpha(60),
                    borderRadius: BorderRadius.circular(24.r),
                    border: Border.all(color: AppColors.white, width: 4.w),
                  ),
                  child: Column(
                    children: [
                      CustomedNotificationsItem(
                        title: "Medication Reminders",
                        imageName: AppAssets.medicationReminders,
                        textNumber: "7",
                        imageWidth: 40.w,
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            AppRoutes.notificationsItemConatain,
                            arguments: "Medication Reminders",
                          );
                        },
                      ),
                      SizedBox(height: height * 0.03),

                      CustomedNotificationsItem(
                        title: "Appointments Reminders",
                        imageName: AppAssets.appointmentsReminders,
                        imageWidth: 40.w,
                        textNumber: "5",
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            AppRoutes.notificationsItemConatain,
                            arguments: "Appointments Reminders",
                          );
                        },
                      ),
                      SizedBox(height: height * 0.03),
                      CustomedNotificationsItem(
                        title: "Test Orders",
                        imageName: AppAssets.testOrder,
                        imageWidth: 40.w,
                        textNumber: "8",
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            AppRoutes.notificationsItemConatain,
                            arguments: "Test Orders",
                          );
                        },
                      ),
                      SizedBox(height: height * 0.03),
                      CustomedNotificationsItem(
                        title: "Follow Up",
                        imageName: AppAssets.followUp,
                        textNumber: "2",
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            AppRoutes.notificationsItemConatain,
                            arguments: "Follow Up",
                          );
                        },
                      ),
                      SizedBox(height: height * 0.03),
                      CustomedNotificationsItem(
                        title: "System Notifications",
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            AppRoutes.notificationsItemConatain,
                            arguments: "System Notifications",
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

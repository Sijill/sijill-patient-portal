import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_routes.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/core/utils/dialog_utils.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/cubit/notifcaton_state.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/cubit/notification_cubit.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/widget/customed_notifications_item.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/widget/customed_read_message.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<NotificationCubit>().getListAllPatientNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText("Notifications", style: AppStyle.semiBoldBlack20),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 48.w, vertical: 20.h),
                child: MaterialButton(
                  padding: EdgeInsets.symmetric(
                    vertical: 6.h,
                    horizontal: 10.w,
                  ),
                  color: AppColors.tabBarUnSelectedColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.remindersScreen);
                  },
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

              CustomedReadMessage(),
              SizedBox(height: 10.h),
              BlocConsumer<NotificationCubit, NotifcatonState>(
                listener: (context, state) {
                  if (state is GetListAllPatentNotificatinError) {
                    DialogUtils.showDialogMessage(message: state.message);
                  }
                },
                builder: (context, state) {
                  final cubit = context.read<NotificationCubit>();
                  if (state is GetListAllPatentNotificatinLoading) {
                    return SizedBox(
                      height: 300.h,
                      child: const Center(
                        child: CircularProgressIndicator(color: AppColors.teal),
                      ),
                    );
                  }
                  final data = cubit.filteredNotifications;
                  return Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return CustomedNotificationsItem(
                            title: data[index].title ?? "",
                            imageName: data[index].notificationType == "SYSTEM"
                                ? AppAssets.system
                                : AppAssets.appointment,
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                AppRoutes.notificationDetailsScreen,
                                arguments: data[index].notificationId,
                              );
                            },
                            time: (data[index].sentAt != null)
                                ? timeago.format(
                                    DateTime.parse(
                                      data[index].sentAt!,
                                    ).toLocal(),
                                  )
                                : "",
                            message: data[index].message ?? "",
                            isUnread: data[index].readAt == null,
                          );
                        },
                        itemCount: data.length,
                      ),
                      if (cubit.selectIndexFromReadMessage == 0 ||
                          cubit.selectIndexFromReadMessage == 1) ...[
                        CustomedNotificationsItem(
                          title: "Medication",
                          imageName: AppAssets.medicines,
                          onTap: () {},
                          time: "14h ago",
                          message: "Hey Alex how is your pain level today....",
                          isUnread: false,
                        ),
                        CustomedNotificationsItem(
                          title: "Lab Test",
                          imageName: AppAssets.labTest,
                          onTap: () {},
                          time: "2d ago",
                          message: "Alert: doctor Williams has accessed ....",
                          isUnread: false,
                        ),
                        CustomedNotificationsItem(
                          title: "Imaging Order",
                          imageName: AppAssets.imagingOrder,
                          onTap: () {},
                          time: "2d ago",
                          message: "Alert: doctor Williams has accessed ....",
                          isUnread: false,
                        ),
                        CustomedNotificationsItem(
                          title: "Follow Up",
                          imageName: AppAssets.followUp,
                          onTap: () {},
                          time: "2d ago",
                          message: "Alert: doctor Williams has accessed ....",
                          isUnread: false,
                        ),
                      ],
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

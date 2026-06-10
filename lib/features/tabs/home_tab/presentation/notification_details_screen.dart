import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/cubit/notifcaton_state.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/cubit/notification_cubit.dart';

class NotificationDetailsScreen extends StatefulWidget {
  const NotificationDetailsScreen({super.key});
  @override
  State<NotificationDetailsScreen> createState() =>
      _NotificationDetailsScreenState();
}

class _NotificationDetailsScreenState extends State<NotificationDetailsScreen> {
  late String notificationId;
  bool _isInit = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_isInit) {
      notificationId = ModalRoute.of(context)!.settings.arguments as String;

      context.read<NotificationCubit>().getNotificationRead(
        notificationId: notificationId,
      );

      _isInit = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 14.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  spacing: 57.w,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                        context.read<NotificationCubit>().resetReadMessageTab();
                        context
                            .read<NotificationCubit>()
                            .getListAllPatientNotification();
                      },
                      child: Icon(Icons.arrow_back),
                    ),

                    AutoSizeText(
                      "Notification Details",
                      style: AppStyle.semiBoldBlack20,
                    ),
                  ],
                ),
                SizedBox(height: 22.h),
                BlocBuilder<NotificationCubit, NotifcatonState>(
                  builder: (context, state) {
                    if (state is GetNotificationReadLoading) {
                      return SizedBox(
                        height: 500.h,
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.teal,
                          ),
                        ),
                      );
                    }

                    if (state is GetNotificationReadSuccess) {
                      final data = state.notificationReadResponse;
                      return Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Column(
                              children: [
                                ListTile(
                                  leading:
                                      data.notification?.notificationType ==
                                          "SYSTEM"
                                      ? Image.asset(AppAssets.system)
                                      : Image.asset(AppAssets.appointment),
                                  title: AutoSizeText(
                                    "Title",
                                    style: AppStyle.mediumGray14,
                                  ),
                                  subtitle: AutoSizeText(
                                    data.notification?.title ?? "",
                                    style: AppStyle.mediumBlack16,
                                  ),
                                ),
                                Divider(
                                  color: AppColors.gray,
                                  indent: 20.w,
                                  endIndent: 20.w,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16.w,
                                    vertical: 10.h,
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(6.sp),
                                        decoration: BoxDecoration(
                                          color: AppColors.lightBlue,
                                          borderRadius: BorderRadius.circular(
                                            20.r,
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.messenger_outline,
                                          size: 30.sp,
                                          color: AppColors.teal,
                                        ),
                                      ),
                                      SizedBox(width: 12.w),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Message",
                                              style: AppStyle.mediumGray14,
                                            ),
                                            SizedBox(height: 4.h),
                                            AutoSizeText(
                                              maxLines: null,
                                              overflow: TextOverflow.visible,
                                              data.notification?.message ?? "",
                                              style: AppStyle.mediumBlack16,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: AppColors.gray,
                                  indent: 20.w,
                                  endIndent: 20.w,
                                ),
                                ListTile(
                                  leading: Container(
                                    padding: EdgeInsets.all(6.sp),
                                    decoration: BoxDecoration(
                                      color: AppColors.lightBlue,
                                      borderRadius: BorderRadius.circular(20.r),
                                    ),
                                    child: Icon(
                                      Icons.schedule_outlined,
                                      color: AppColors.teal,
                                      size: 30.sp,
                                    ),
                                  ),
                                  title: AutoSizeText(
                                    "Scheduled For",
                                    style: AppStyle.mediumGray14,
                                  ),
                                  subtitle: AutoSizeText(
                                    data.notification?.scheduledFor != null
                                        ? DateFormat(
                                            'dd MMM yyyy, hh:mm a',
                                          ).format(
                                            data.notification!.scheduledFor!
                                                .toLocal(),
                                          )
                                        : 'N/A',
                                    style: AppStyle.mediumBlack16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }

                    return const SizedBox();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

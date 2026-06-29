import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:sijil_patient_portal/core/cache/shared_prefs_utils.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_routes.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/core/utils/customed_button.dart';
import 'package:sijil_patient_portal/core/utils/dialog_utils.dart';
import 'package:sijil_patient_portal/features/auth/widget/customed_logo.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/cubit/home_tab_cubt.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/cubit/home_tab_state.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/widget/customed_gradient_container_item.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/widget/customed_reminders_item.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/widget/customed_today_schedule_item.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/widget/implement_today_schedule.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  void initState() {
    super.initState();
    context.read<HomeTabCubt>().homeReminderCounters();
    context.read<HomeTabCubt>().getTodaySchedule();
    context.read<HomeTabCubt>().getPatientName();
  }

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
                    BlocBuilder<HomeTabCubt, HomeTabState>(
                      builder: (context, state) {
                        final patientName = context
                            .read<HomeTabCubt>()
                            .patientNameResponse;
                        SharedPrefsUtils.saveData(
                          key: "name",
                          value: patientName?.name?.firstName ?? "",
                        );
                        if (state is GetPatientNameError) {
                          DialogUtils.showDialogMessage(message: state.message);
                        }
                        return AutoSizeText(
                          "Hello ${patientName?.name?.firstName ?? ""}, How Are You \nDoing Today!",
                          style: AppStyle.boldBlack20,
                        );
                      },
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
                      onPressed: () {
                        Navigator.of(
                          context,
                        ).pushNamed(AppRoutes.trackNewSymptomScreen);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25.h),
              BlocBuilder<HomeTabCubt, HomeTabState>(
                buildWhen: (previous, current) {
                  return current is GetHomeReminderCountersLoading ||
                      current is GetHomeReminderCountersSuccess ||
                      current is GetHomeReminderCountersError;
                },
                builder: (context, state) {
                  final viewModel = context
                      .read<HomeTabCubt>()
                      .homeReminderCountersResponse
                      ?.counters;
                  if (state is GetHomeReminderCountersLoading) {
                    return Center(
                      child: CircularProgressIndicator(color: AppColors.teal),
                    );
                  } else if (state is GetHomeReminderCountersError) {
                    DialogUtils.showDialogMessage(message: state.message);
                  }
                  return CustomedGradientContainerItem(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          "Reminders",
                          style: AppStyle.mediumBlack16.copyWith(
                            fontSize: 20.sp,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        CustomedRemindersItem(
                          imageIcon: AppAssets.pendingMedications,
                          number: "${viewModel?.medicationReminders ?? 0}",
                          text: "Medications Reminders",
                        ),
                        SizedBox(height: 12.h),
                        CustomedRemindersItem(
                          imageIcon: AppAssets.upcomingAppoinments,
                          number: "${viewModel?.upcomingAppointments ?? 0}",
                          text: "Upcoming Appointments",
                        ),
                        SizedBox(height: 12.h),
                        CustomedRemindersItem(
                          imageIcon: AppAssets.pendingTestOrders,
                          number: "${viewModel?.pendingTestOrders ?? 0}",
                          text: "Pending Test Orders",
                        ),
                      ],
                    ),
                  );
                },
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
                      DateFormat('EEEE, MMM d').format(DateTime.now()),
                      style: AppStyle.meduimGray14,
                    ),
                  ],
                ),
              ),
              BlocBuilder<HomeTabCubt, HomeTabState>(
                builder: (context, state) {
                  final cubit = context.read<HomeTabCubt>();

                  final todaySchedule =
                      cubit.todayScheduleResponse?.schedule ?? [];

                  if (state is GetTodayScheduleLoading) {
                    return Center(
                      child: CircularProgressIndicator(color: AppColors.teal),
                    );
                  } else if (state is GetTodayScheduleError) {
                    DialogUtils.showDialogMessage(message: state.message);
                  } else if (todaySchedule.isEmpty ||
                      cubit.choiceValue.length == todaySchedule.length) {
                    return ImplementTodaySchedule();
                  }

                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: todaySchedule.length,
                    itemBuilder: (context, index) {
                      return CustomedTodayScheduleItem(
                        index: index,
                        time: todaySchedule[index].time ?? "",
                        title: todaySchedule[index].what ?? "",
                      );
                    },
                    separatorBuilder: (_, _) => const SizedBox(),
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

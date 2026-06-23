import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/core/utils/dialog_utils.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/cubit/home_tab_cubt.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/cubit/home_tab_state.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/cubit/notifcaton_state.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/cubit/notification_cubit.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/widget/appointments_tab.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/widget/medical_orders_tab.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/widget/medications_tab.dart';

class RemindersScreen extends StatefulWidget {
  const RemindersScreen({super.key});

  @override
  State<RemindersScreen> createState() => _RemindersScreenState();
}

class _RemindersScreenState extends State<RemindersScreen> {
  @override
  void initState() {
    super.initState();
    context.read<NotificationCubit>().getListActivePatientReminders();
  }

  String formatTime(String? time) {
    if (time == null || time.isEmpty) return '';

    return DateFormat('hh:mm a').format(DateFormat('HH:mm:ss').parse(time));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText("Reminders", style: AppStyle.semiBoldBlack20),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: BlocBuilder<HomeTabCubt, HomeTabState>(
            builder: (context, state) {
              final cubit = context.watch<HomeTabCubt>();
              return DefaultTabController(
                length: 3,
                initialIndex: 0,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      decoration: BoxDecoration(
                        color: AppColors.tabBarUnSelectedColor,
                        borderRadius: BorderRadius.circular(7.r),
                      ),
                      child: TabBar(
                        isScrollable: true,
                        tabAlignment: TabAlignment.start,
                        labelPadding: EdgeInsets.only(left: 15.w),
                        dividerColor: AppColors.transparent,
                        onTap: cubit.changeSelectIndexFromReminders,
                        indicatorColor: AppColors.transparent,
                        tabs: cubit.remendersItem.asMap().entries.map((entry) {
                          final index = entry.key;
                          final element = entry.value;
                          final isSelected =
                              cubit.selectIndexFromReminders == index;
                          return isSelected
                              ? Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 6.h,
                                    horizontal: 6.w,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(7.r),
                                  ),
                                  alignment: Alignment.center,
                                  child: AutoSizeText(
                                    element,
                                    style: AppStyle.semiBoldBlack20.copyWith(
                                      fontSize: 13.sp,
                                      color: AppColors.tabBarSelectedColor,
                                    ),
                                  ),
                                )
                              : AutoSizeText(
                                  element,
                                  style: AppStyle.semiBoldBlack20.copyWith(
                                    fontSize: 13.sp,
                                  ),
                                );
                        }).toList(),
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          BlocBuilder<NotificationCubit, NotifcatonState>(
                            builder: (context, state) {
                              final cubit = context.read<NotificationCubit>();
                              if (state
                                  is GetListActivePatientRemindersLoading) {
                                return SizedBox(
                                  height: 200.h,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: AppColors.teal,
                                    ),
                                  ),
                                );
                              } else if (cubit.remindersResponse?.reminders ==
                                  []) {
                                return const SizedBox();
                              } else if (state
                                  is GetListActivePatientRemindersError) {
                                DialogUtils.showDialogMessage(
                                  message: state.message,
                                );
                              }
                              final medicationData =
                                  cubit.remindersResponse?.reminders
                                      ?.where((e) => e.medication != null)
                                      .toList() ??
                                  [];

                              return ListView.separated(
                                padding: EdgeInsets.only(top: 30.h),
                                itemBuilder: (context, index) => MedicationsTab(
                                  index: index,
                                  reminderId:
                                      medicationData[index].reminderId ?? "",
                                  name: medicationData[index].medication?.name,
                                  dosageAmount: medicationData[index]
                                      .medication
                                      ?.dosageAmount,
                                  dosageUnit: medicationData[index]
                                      .medication
                                      ?.dosageUnit,
                                  frequency: medicationData[index]
                                      .medication
                                      ?.frequency,
                                  endDate:
                                      medicationData[index]
                                              .medication!
                                              .endDate !=
                                          null
                                      ? DateFormat('MMMM yyyy').format(
                                          medicationData[index]
                                              .medication!
                                              .endDate!,
                                        )
                                      : '',
                                  startDate:
                                      medicationData[index]
                                              .medication
                                              ?.startDate !=
                                          null
                                      ? DateFormat('MMMM yyyy').format(
                                          medicationData[index]
                                              .medication!
                                              .startDate!,
                                        )
                                      : '',
                                  reminderTime: formatTime(
                                    medicationData[index].reminderTime,
                                  ),
                                ),
                                separatorBuilder: (context, index) =>
                                    SizedBox(height: 20.h),
                                itemCount: medicationData.length,
                              );
                            },
                          ),
                          BlocBuilder<NotificationCubit, NotifcatonState>(
                            builder: (context, state) {
                              final cubit = context.read<NotificationCubit>();
                              if (state
                                  is GetListActivePatientRemindersLoading) {
                                return SizedBox(
                                  height: 200.h,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: AppColors.teal,
                                    ),
                                  ),
                                );
                              } else if (state
                                  is GetListActivePatientRemindersError) {
                                DialogUtils.showDialogMessage(
                                  message: state.message,
                                );
                              } else if (cubit
                                  .remindersResponse!
                                  .reminders!
                                  .isEmpty) {
                                return const SizedBox();
                              }

                              final medicalOrderData =
                                  cubit.remindersResponse?.reminders
                                      ?.where((e) => e.medicalOrder != null)
                                      .toList() ??
                                  [];
                              return ListView.separated(
                                padding: EdgeInsets.only(top: 30.h),
                                itemBuilder: (context, index) =>
                                    MedicalOrdersTab(
                                      orderType:
                                          medicalOrderData[index]
                                                  .medicalOrder
                                                  ?.orderType ==
                                              "LABORATORY"
                                          ? AppAssets.labTest
                                          : AppAssets.imagingOrder,
                                      orderName:
                                          medicalOrderData[index]
                                              .medicalOrder
                                              ?.orderName ??
                                          "",
                                      prioity:
                                          medicalOrderData[index]
                                              .medicalOrder
                                              ?.priority ??
                                          "",
                                      orderedBy:
                                          medicalOrderData[index]
                                              .medicalOrder
                                              ?.orderedBy ??
                                          "",
                                      orderdAt: DateFormat('MMMM d, y').format(
                                        medicalOrderData[index]
                                            .medicalOrder!
                                            .orderedAt!,
                                      ),
                                      specimenType:
                                          medicalOrderData[index]
                                              .medicalOrder
                                              ?.specimenType ??
                                          "",
                                      bodyPart:
                                          medicalOrderData[index]
                                              .medicalOrder
                                              ?.bodyPart ??
                                          "",
                                      index: index,
                                      dismissClick: () {},
                                    ),
                                separatorBuilder: (context, index) =>
                                    SizedBox(height: 20.h),
                                itemCount: medicalOrderData.length,
                              );
                            },
                          ),
                          BlocBuilder<NotificationCubit, NotifcatonState>(
                            builder: (context, state) {
                              final cubit = context.read<NotificationCubit>();
                              if (state
                                  is GetListActivePatientRemindersLoading) {
                                return SizedBox(
                                  height: 200.h,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: AppColors.teal,
                                    ),
                                  ),
                                );
                              } else if (state
                                  is GetListActivePatientRemindersError) {
                                DialogUtils.showDialogMessage(
                                  message: state.message,
                                );
                              } else if (cubit
                                  .remindersResponse!
                                  .reminders!
                                  .isEmpty) {
                                return const SizedBox();
                              }

                              final appointmentData =
                                  cubit.remindersResponse?.reminders
                                      ?.where((e) => e.appointment != null)
                                      .toList() ??
                                  [];
                              return ListView.separated(
                                padding: EdgeInsets.only(top: 30.h),
                                itemBuilder: (context, index) =>
                                    AppointmentsTab(
                                      doctorName:
                                          appointmentData[index]
                                              .appointment
                                              ?.doctorName ??
                                          "",
                                      location:
                                          appointmentData[index]
                                              .appointment
                                              ?.location ??
                                          "",
                                      notes:
                                          appointmentData[index]
                                              .appointment
                                              ?.notes ??
                                          "",
                                    ),
                                separatorBuilder: (context, index) =>
                                    SizedBox(height: 20.h),
                                itemCount: appointmentData.length,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

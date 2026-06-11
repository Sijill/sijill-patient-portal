import 'package:auto_size_text/auto_size_text.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/cubit/notifcaton_state.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/cubit/notification_cubit.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/widget/custom_change_days.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/widget/reminders_button.dart';

class MedicationsTab extends StatefulWidget {
  final String? name;
  final String? reminderTime;
  final int? dosageAmount;
  final String? dosageUnit;
  final String? frequency;
  final String? startDate;
  final String? endDate;
  final int index;
  const MedicationsTab({
    super.key,
    required this.index,
    this.name,
    this.dosageAmount,
    this.dosageUnit,
    this.frequency,
    this.startDate,
    this.endDate,
    this.reminderTime,
  });

  @override
  State<MedicationsTab> createState() => _MedicationsTabState();
}

class _MedicationsTabState extends State<MedicationsTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 18.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: AppColors.tabBarUnSelectedColor,
      ),
      child: BlocBuilder<NotificationCubit, NotifcatonState>(
        builder: (context, state) {
          final viewModel = context.read<NotificationCubit>();

          final selectedDays = viewModel.getMedicationDays(widget.index);
          final isEveryDay = selectedDays.length == 7;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText(
                    widget.name ?? "",
                    style: AppStyle.semiBoldBlack20.copyWith(fontSize: 13.sp),
                  ),
                  AutoSizeText(
                    "${widget.startDate} : ${widget.endDate}",
                    style: AppStyle.semiBoldGrey16.copyWith(fontSize: 13.sp),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              AutoSizeText(
                "${widget.dosageAmount} ${widget.dosageUnit} · Capsule · ${widget.frequency}",
                style: AppStyle.mediumBlack16.copyWith(fontSize: 12.sp),
              ),
              SizedBox(height: 8.h),
              Divider(color: AppColors.gray, endIndent: 25.w, indent: 25.w),
              SizedBox(height: 8.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.watch_later_outlined, size: 20.sp),
                  SizedBox(width: 7.w),
                  AutoSizeText(
                    viewModel.getMedicationTime(widget.index).format(context),
                    style: AppStyle.mediumBlack16.copyWith(fontSize: 12.sp),
                  ),
                  SizedBox(width: 10.w),

                  Expanded(
                    child: Wrap(
                      spacing: 5.w,
                      runSpacing: 5.h,
                      children: isEveryDay
                          ? [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 2.h,
                                  horizontal: 9.w,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(15.r),
                                ),
                                child: AutoSizeText(
                                  "Every Day",
                                  style: AppStyle.mediumBlack16.copyWith(
                                    fontSize: 12.sp,
                                    color: AppColors.tabBarSelectedColor,
                                  ),
                                ),
                              ),
                            ]
                          : selectedDays.isEmpty
                          ? []
                          : selectedDays.map((day) {
                              return Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 2.h,
                                  horizontal: 9.w,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(15.r),
                                ),
                                child: AutoSizeText(
                                  day,
                                  style: AppStyle.mediumBlack16.copyWith(
                                    fontSize: 12.sp,
                                    color: AppColors.tabBarSelectedColor,
                                  ),
                                ),
                              );
                            }).toList(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                spacing: 16.w,
                children: [
                  Expanded(
                    child: RemindersButton(
                      icon: Icons.watch_later_outlined,
                      text: "Change Time",
                      onPressed: () {
                        Navigator.of(context).push(
                          showPicker(
                            context: context,
                            value: viewModel.getMedicationTime(widget.index),
                            onChange: (newTime) {
                              viewModel.changeMedicationTime(
                                index: widget.index,
                                newTime: newTime,
                              );
                            },
                            is24HrFormat: false,
                            accentColor: AppColors.teal,
                            okStyle: AppStyle.mediumWhite16.copyWith(
                              fontSize: 12.sp,
                            ),
                            buttonStyle: ButtonStyle(
                              shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.r),
                                ),
                              ),
                              backgroundColor: WidgetStateProperty.all(
                                AppColors.teal,
                              ),
                            ),
                            buttonsSpacing: 16.w,
                            cancelStyle: AppStyle.mediumWhite16.copyWith(
                              fontSize: 12.sp,
                            ),
                            iosStylePicker: false,
                            themeData: ThemeData.light(),
                            showCancelButton: true,
                            isOnChangeValueMode: false,
                            cancelButtonStyle: ButtonStyle(
                              shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.r),
                                ),
                              ),
                              backgroundColor: WidgetStateProperty.all(
                                AppColors.red,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: RemindersButton(
                      icon: Icons.calendar_month_rounded,
                      text: "Change Days",
                      onPressed: () {
                        viewModel.initTempDays(widget.index);
                        showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: AppColors.transparent,
                          context: context,
                          builder: (context) =>
                              CustomChangeDays(index: widget.index),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

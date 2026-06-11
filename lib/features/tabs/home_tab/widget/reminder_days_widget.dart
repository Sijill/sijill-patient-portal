import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/cubit/notifcaton_state.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/cubit/notification_cubit.dart';

class ReminderDaysWidget extends StatelessWidget {
  final int index;
  const ReminderDaysWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotifcatonState>(
      builder: (context, state) {
        final cubit = context.read<NotificationCubit>();
        return Wrap(
          spacing: 8,
          runSpacing: 8,
          children: cubit.days.map((day) {
            final bool isSelected = (cubit.tempMedicationDays[index] ?? [])
                .contains(day);

            return InkWell(
              borderRadius: BorderRadius.circular(15.r),
              onTap: () {
                cubit.toggleTempDay(index: index, day: day);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.white : AppColors.lightGray,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: AutoSizeText(
                  day,
                  style: AppStyle.mediumBlack16.copyWith(
                    fontSize: 11.sp,
                    color: isSelected ? AppColors.teal : AppColors.gray,
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

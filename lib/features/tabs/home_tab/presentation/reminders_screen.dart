import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/cubit/home_tab_cubt.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/cubit/home_tab_state.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/widget/appointments_tab.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/widget/medical_orders_tab.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/widget/medications_tab.dart';

class RemindersScreen extends StatelessWidget {
  const RemindersScreen({super.key});

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
                          ListView.separated(
                            padding: EdgeInsets.only(top: 30.h),
                            itemBuilder: (context, index) =>
                                MedicationsTab(index: index),
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 20.h),
                            itemCount: 3,
                          ),
                          MedicalOrdersTab(),
                          AppointmentsTab(),
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

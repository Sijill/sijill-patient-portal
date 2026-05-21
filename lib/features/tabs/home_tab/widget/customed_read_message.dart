import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/cubit/home_tab_cubt.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/cubit/home_tab_state.dart';

class CustomedReadMessage extends StatefulWidget {
  const CustomedReadMessage({super.key});

  @override
  State<CustomedReadMessage> createState() => _CustomedReadMessageState();
}

class _CustomedReadMessageState extends State<CustomedReadMessage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabCubt, HomeTabState>(
      builder: (context, state) {
        final viewModel = context.watch<HomeTabCubt>();
        return Container(
          margin: EdgeInsets.only(top: 12.h, left: 16.w),
          padding: EdgeInsets.all(5.sp),
          width: 200.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: AppColors.tabBarUnSelectedColor,
          ),
          child: DefaultTabController(
            length: 3,
            child: TabBar(
              tabAlignment: TabAlignment.start,
              labelPadding: EdgeInsets.only(right: 14.w, left: 8.w),
              overlayColor: WidgetStateProperty.all(AppColors.transparent),
              dividerColor: AppColors.transparent,
              isScrollable: true,
              indicator: BoxDecoration(color: AppColors.transparent),
              onTap: viewModel.changeSelectIndexFromReadMessage,
              tabs: viewModel.readMessage.asMap().entries.map((entry) {
                final index = entry.key;
                final element = entry.value;
                final isSelected =
                    viewModel.selectIndexFromReadMessage == index;
                return isSelected
                    ? Container(
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        padding: EdgeInsets.all(8.sp),
                        child: AutoSizeText(
                          element,
                          style: AppStyle.semiBoldBlack20.copyWith(
                            color: AppColors.tabBarSelectedColor,
                            fontSize: 12.sp,
                          ),
                        ),
                      )
                    : AutoSizeText(
                        element,
                        style: AppStyle.semiBoldGrey16.copyWith(
                          fontSize: 12.sp,
                        ),
                      );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}

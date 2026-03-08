import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/api/injctable/di.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/presentation/cubit/home_tab_cubt.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/presentation/cubit/home_tab_state.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/presentation/widget/customed_check_box_shadow.dart';

class CustomedTodayScheduleItem extends StatefulWidget {
  final String time;
  final String title;
  final int index;
  const CustomedTodayScheduleItem({
    super.key,
    required this.time,
    required this.title,
    required this.index,
  });

  @override
  State<CustomedTodayScheduleItem> createState() =>
      _CustomedTodayScheduleItemState();
}

class _CustomedTodayScheduleItemState extends State<CustomedTodayScheduleItem> {
  late HomeTabCubt viewModel;
  @override
  void initState() {
    viewModel = getIt<HomeTabCubt>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
      margin: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 12.h),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(color: AppColors.borderLeftColor, width: 7.w),
        ),
        color: AppColors.bgColor,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        children: [
          AutoSizeText(widget.time, style: AppStyle.mediumGray14),
          Spacer(),
          AutoSizeText(
            widget.title,
            style: AppStyle.mediumBlack16.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
            ),
          ),
          Spacer(),
          BlocBuilder<HomeTabCubt, HomeTabState>(
            bloc: viewModel,
            builder: (context, state) {
              return CustomedCheckBoxShadow(
                index: widget.index,
                choiceValue: viewModel.choiceValue,
                onChanged: (value) {
                  viewModel.choiceMultipleValue(widget.index, value!);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

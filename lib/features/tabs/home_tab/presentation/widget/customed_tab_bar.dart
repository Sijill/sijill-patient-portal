import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/api/injctable/di.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/presentation/cubit/home_tab_cubt.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/presentation/cubit/home_tab_state.dart';

class CustomedTabBar extends StatefulWidget {
  const CustomedTabBar({super.key});

  @override
  State<CustomedTabBar> createState() => _CustomedTabBarState();
}

class _CustomedTabBarState extends State<CustomedTabBar> {
  var viewModel = getIt<HomeTabCubt>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabCubt, HomeTabState>(
      bloc: viewModel,
      builder: (context, state) {
        return DefaultTabController(
          length: viewModel.notificationItem.length,
          child: TabBar(
            padding: EdgeInsets.only(left: 16.w),
            tabAlignment: TabAlignment.start,
            labelPadding: EdgeInsets.zero,
            overlayColor: WidgetStateProperty.all(AppColors.transparent),
            dividerColor: AppColors.transparent,
            isScrollable: true,
            indicator: BoxDecoration(color: AppColors.transparent),
            onTap: viewModel.tabBarClick,
            tabs: viewModel.notificationItem
                .asMap()
                .entries
                .map(
                  (item) => Container(
                    margin: EdgeInsets.only(right: 12.w),
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      color: viewModel.selectItemFromNotification == item.key
                          ? AppColors.tabBarSelectedColor
                          : AppColors.tabBarUnSelectedColor,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: AutoSizeText(
                      item.value,
                      style: viewModel.selectItemFromNotification == item.key
                          ? AppStyle.meduimBlack16
                          : AppStyle.mediumGray16,
                    ),
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}

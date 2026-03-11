import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/api/injctable/di.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/presentation/cubit/home_tab_cubt.dart';

class CustomedReadMessage extends StatefulWidget {
  const CustomedReadMessage({super.key});

  @override
  State<CustomedReadMessage> createState() => _CustomedReadMessageState();
}

class _CustomedReadMessageState extends State<CustomedReadMessage> {
  var viewModel = getIt<HomeTabCubt>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: viewModel,
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.only(top: 12.h, left: 16.w),
          padding: EdgeInsets.all(5.sp),
          width: 125.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: AppColors.tabBarUnSelectedColor,
          ),

          child: DefaultTabController(
            length: 2,
            child: TabBar(
              padding: EdgeInsets.only(left: 5.w),
              tabAlignment: TabAlignment.start,
              labelPadding: EdgeInsets.only(right: 8.w),
              overlayColor: WidgetStateProperty.all(AppColors.transparent),
              dividerColor: AppColors.transparent,
              isScrollable: true,
              indicator: BoxDecoration(color: AppColors.transparent),
              onTap: viewModel.tabBarClick,
              tabs: [
                viewModel.selectItemFromNotification == 0
                    ? Container(
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        padding: EdgeInsets.all(8.sp),
                        child: AutoSizeText(
                          "UNREAD",
                          style: AppStyle.boldBlack14.copyWith(
                            color: AppColors.tabBarSelectedColor,
                            fontSize: 12.sp,
                          ),
                        ),
                      )
                    : AutoSizeText(
                        "UNREAD",
                        style: AppStyle.semiBoldBlack20.copyWith(
                          fontSize: 12.sp,
                        ),
                      ),
                viewModel.selectItemFromNotification == 1
                    ? Container(
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        padding: EdgeInsets.all(8.sp),
                        child: AutoSizeText(
                          "ALL",
                          style: AppStyle.boldBlack14.copyWith(
                            color: AppColors.tabBarSelectedColor,
                            fontSize: 12.sp,
                          ),
                        ),
                      )
                    : AutoSizeText(
                        "ALL",
                        style: AppStyle.semiBoldBlack20.copyWith(
                          fontSize: 12.sp,
                        ),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}

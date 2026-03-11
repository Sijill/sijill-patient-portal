import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/presentation/cubit/home_tab_cubt.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/presentation/cubit/home_tab_state.dart';

class CustomedHealthcareProviderAccessType extends StatelessWidget {
  final String title;
  final String subTitle;
  final int index;
  const CustomedHealthcareProviderAccessType({
    super.key,
    required this.title,
    required this.subTitle,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 14.h),
      padding: EdgeInsets.only(
        left: 10.w,
        right: 16.w,
        bottom: 20.h,
        top: 10.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.grantAccessContainerColor,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            title,
            style: AppStyle.semiBoldBlack20.copyWith(fontSize: 16.sp),
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AutoSizeText(
                subTitle,
                style: AppStyle.mediumGray14.copyWith(fontSize: 12.sp),
              ),
              BlocBuilder<HomeTabCubt, HomeTabState>(
                builder: (context, state) {
                  var viewModel = context.read<HomeTabCubt>();
                  return InkWell(
                    onTap: () {
                      viewModel.selectAccessType(index);
                    },
                    child: SvgPicture.asset(
                      viewModel.selectedAccessIndex == index
                          ? AppAssets.selectAccessLight
                          : AppAssets.selectAccess,
                      height: 40.h,
                      width: 40.w,
                      fit: BoxFit.fill,
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

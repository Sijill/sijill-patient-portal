import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sijil_patient_portal/api/model/home_tab/active_tokens_model.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/presentation/widget/customed_active_tokens_item.dart';

class GrantAccessActiveTokensScreen extends StatelessWidget {
  const GrantAccessActiveTokensScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText("Active Tokens", style: AppStyle.semiBoldBlack20),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SafeArea(
          child: ActiveTokensModel.activeTokensModelList.isEmpty
              ? Column(
                  children: [
                    SizedBox(height: 20.h),
                    SvgPicture.asset(
                      AppAssets.search,
                      width: 375.w,
                      height: 339.h,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(height: 29.h),
                    AutoSizeText(
                      "No Active Tokens",
                      style: AppStyle.semiBoldBlack22,
                    ),
                  ],
                )
              : ListView.separated(
                  itemBuilder: (context, index) {
                    return CustomedActiveTokensItem(
                      model: ActiveTokensModel.activeTokensModelList[index],
                    );
                  },

                  itemCount: ActiveTokensModel.activeTokensModelList.length,
                  separatorBuilder: (context, index) => SizedBox(height: 15.h),
                ),
        ),
      ),
    );
  }
}

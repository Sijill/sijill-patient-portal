import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/widget/customed_drop_down.dart';

class MedicalHistoryTitle extends StatefulWidget {
  const MedicalHistoryTitle({super.key});

  @override
  State<MedicalHistoryTitle> createState() => _MedicalHistoryTitleState();
}

class _MedicalHistoryTitleState extends State<MedicalHistoryTitle> {
  TextEditingController healthcareProviderController = TextEditingController();
  @override
  void dispose() {
    healthcareProviderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 11.h),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.gray),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Image.asset(
            AppAssets.searchlight,
            height: 25.h,
            width: 25.w,
            fit: BoxFit.scaleDown,
          ),
        ),

        SizedBox(width: 10.w),
        Expanded(
          child: SizedBox(
            height: 50.h,
            child: CustomedDropDown(
              edgeInsets: EdgeInsets.symmetric(vertical: 10.h, horizontal: 8.w),
              borderColor: AppColors.gray,
              hintStyle: AppStyle.mediumBlack16.copyWith(fontSize: 12.sp),
              backgroundColor: AppColors.transparent,
              bottoShowSelectItem: [],
              controller: healthcareProviderController,
              hint: "Healthcare Provider",
              bottomSheetHeight: 550.h,
              bottomSheetLeft: 16.w,
              bottomSheetRight: 16.w,
              widthDropdown: double.infinity,
            ),
          ),
        ),
        SizedBox(width: 10.w),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 11.h),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.gray),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Row(
            spacing: 5.w,
            children: [
              AutoSizeText(
                "From",
                style: AppStyle.mediumBlack16.copyWith(fontSize: 12.sp),
              ),

              Image.asset(
                AppAssets.calender,
                height: 25.h,
                width: 25.w,
                fit: BoxFit.scaleDown,
              ),
              Container(
                decoration: BoxDecoration(
                  border: BoxBorder.symmetric(
                    vertical: BorderSide(color: AppColors.black),
                  ),
                ),
                height: 25.h,
              ),
              AutoSizeText(
                "To",
                style: AppStyle.mediumBlack16.copyWith(fontSize: 12.sp),
              ),
              Image.asset(
                AppAssets.calender,
                height: 25.h,
                width: 25.w,
                fit: BoxFit.scaleDown,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/core/utils/validators.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/widget/customed_drop_down.dart';

class CustomedAccessDuration extends StatefulWidget {
  final TextEditingController timeController;
  final double? bottomSheetHeight;
  final double? bottomSheetLeft;
  final double? bottomSheetRight;
  const CustomedAccessDuration({
    super.key,
    required this.timeController,
    this.bottomSheetHeight,
    this.bottomSheetLeft,
    this.bottomSheetRight,
  });

  @override
  State<CustomedAccessDuration> createState() => _CustomedAccessDurationState();
}

class _CustomedAccessDurationState extends State<CustomedAccessDuration> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 14.h, bottom: 20.h),
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
            "Set how long will the provider have\n access after activation",
            style: AppStyle.mediumGray14.copyWith(fontSize: 12.sp),
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            spacing: 20.w,
            children: [
              Expanded(
                flex: 5,
                child: CustomedDropDown(
                  fontSize: 18.sp,
                  heightDrobdown: 150.h,
                  bottomSheetHeight: widget.bottomSheetHeight ?? 25.h,
                  bottomSheetRight: widget.bottomSheetRight ?? 150.w,
                  bottomSheetLeft: widget.bottomSheetLeft ?? 10.w,
                  onValidate: (val) {
                    return AppValidators.validateDuration(val);
                  },
                  controller: widget.timeController,
                  backgroundColor: AppColors.white,
                  bottoShowSelectItem: ["15", "30", "45", "60"],
                  hint: "Duration",
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: AutoSizeText(
                    "Minutes",
                    style: AppStyle.meduimBlack20.copyWith(fontSize: 18.sp),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  OutlineInputBorder customedOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: BorderSide(color: AppColors.white),
    );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/presentation/widget/customed_grant_drop_down.dart';

class CustomedHealthcareProviderAccessDuration extends StatefulWidget {
  const CustomedHealthcareProviderAccessDuration({super.key});

  @override
  State<CustomedHealthcareProviderAccessDuration> createState() =>
      _CustomedHealthcareProviderAccessDurationState();
}

class _CustomedHealthcareProviderAccessDurationState
    extends State<CustomedHealthcareProviderAccessDuration> {
  TextEditingController timeController = TextEditingController();
  @override
  void dispose() {
    timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> time = ["Seconds", "Minutes", "Hours", "Day", "Week"];
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
            children: [
              Container(
                width: 80.w,
                height: 80.h,
                padding: EdgeInsets.only(top: 10.h),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: AppStyle.meduimBlack20.copyWith(fontSize: 24.sp),
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus!.unfocus();
                  },
                  cursorHeight: 28.h,
                  controller: timeController,
                  decoration: InputDecoration(
                    hintText: "6",
                    hintStyle: AppStyle.meduimBlack20.copyWith(fontSize: 24.sp),
                    contentPadding: EdgeInsets.symmetric(vertical: 4.h),
                    fillColor: AppColors.white,
                    filled: true,
                    enabledBorder: customedOutlineInputBorder(),
                    focusedBorder: customedOutlineInputBorder(),
                  ),
                ),
              ),
              CustomedGrantDropDown(
                selectedDropDown: "Hours",
                bottoShowSelectItem: time,
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

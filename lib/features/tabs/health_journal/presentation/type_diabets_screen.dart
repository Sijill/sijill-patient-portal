import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_routes.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/core/utils/custom_text_field.dart';
import 'package:sijil_patient_portal/core/utils/customed_button.dart';
import 'package:sijil_patient_portal/features/tabs/health_journal/widget/pain_level_selector.dart';
import 'package:sijil_patient_portal/features/tabs/health_journal/widget/customed_title.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/widget/customed_drop_down.dart';

class TypeDiabetsScreen extends StatefulWidget {
  const TypeDiabetsScreen({super.key});

  @override
  State<TypeDiabetsScreen> createState() => _TypeDiabetsScreenState();
}

class _TypeDiabetsScreenState extends State<TypeDiabetsScreen> {
  TextEditingController progressDetailsController = TextEditingController();
  TextEditingController modeController = TextEditingController();
  @override
  void dispose() {
    progressDetailsController.dispose();
    modeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText("Type 2 Diabetes", style: AppStyle.semiBoldBlack20),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 20.w, top: 10.h, bottom: 30.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  "Monday, Oct 28",
                  style: AppStyle.mediumGray16.copyWith(fontSize: 18.sp),
                ),
                SizedBox(height: 30.h),
                CustomedTitle(
                  imageLogo: AppAssets.overallProgress,
                  title: "Overall Progress",
                ),
                SizedBox(height: 10.h),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    spacing: 7.w,
                    children: [
                      CustomedButton(
                        horizontal: 10.w,
                        backgroundColor: AppColors.lightGreen,
                        textStyle: AppStyle.semiBoldBlack22.copyWith(
                          fontSize: 12.sp,
                        ),
                        text: "Fully Recovered",
                        onPressed: () {},
                      ),
                      CustomedButton(
                        backgroundColor: AppColors.tabBarSelectedColor,
                        horizontal: 30.w,
                        textStyle: AppStyle.semiBoldBlack22.copyWith(
                          fontSize: 12.sp,
                        ),
                        text: "Improved",
                        onPressed: () {},
                      ),
                      CustomedButton(
                        textStyle: AppStyle.semiBoldBlack22.copyWith(
                          fontSize: 12.sp,
                        ),
                        text: "No Change",
                        onPressed: () {},
                      ),
                      CustomedButton(
                        backgroundColor: AppColors.rose,
                        horizontal: 35.w,
                        textStyle: AppStyle.semiBoldBlack22.copyWith(
                          fontSize: 12.sp,
                        ),
                        text: "Worse",
                        onPressed: () {},
                      ),
                      SizedBox(width: 16.w),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20.w, top: 16.h),
                  child: CustomTextField(
                    controller: progressDetailsController,
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(bottom: 80.h),
                      child: Image.asset(
                        AppAssets.progressDetails,
                        height: 30.h,
                        width: 30.w,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    hint: "Progress Details...",
                    hintStyle: AppStyle.mediumGray14,
                    maxLines: 4,
                  ),
                ),
                SizedBox(height: 30.h),
                CustomedTitle(
                  imageLogo: AppAssets.painLevel,
                  title: "Pain Level",
                ),
                PainLevelSelector(isEnergy: false),
                SizedBox(height: 30.h),
                CustomedTitle(
                  imageLogo: AppAssets.energyLevel,
                  title: "Energy Level",
                ),
                PainLevelSelector(isEnergy: true),
                Padding(
                  padding: EdgeInsets.only(
                    top: 30.h,
                    bottom: 25.h,
                    right: 20.w,
                  ),
                  child: CustomedDropDown(
                    backgroundColor: AppColors.tabBarUnSelectedColor,
                    bottomSheetHeight: 10.h,
                    bottomSheetLeft: 20.w,
                    bottomSheetRight: 20.w,
                    widthDropdown: double.infinity,
                    bottoShowSelectItem: [
                      "Happy",
                      "Calm",
                      "Sad",
                      "Anxious",
                      "Frustrated",
                      "Exhausted",
                      "Overwhelmed",
                      "Unwell",
                      "Neutral",
                    ],
                    controller: modeController,
                    hint: "Mood",
                    textColor: AppColors.gray,
                    fontSize: 18.sp,
                  ),
                ),

                Center(
                  child: CustomedButton(
                    backgroundColor: AppColors.tabBarSelectedColor,
                    text: "Take note",
                    onPressed: () {
                      Navigator.of(
                        context,
                      ).pushNamed(AppRoutes.healthSnapshotScreen);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

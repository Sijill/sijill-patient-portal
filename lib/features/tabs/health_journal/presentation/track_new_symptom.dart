import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_routes.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/core/utils/customed_button.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/widget/customed_drop_down.dart';

class TrackNewSymptom extends StatefulWidget {
  const TrackNewSymptom({super.key});

  @override
  State<TrackNewSymptom> createState() => _TrackNewSymptomState();
}

class _TrackNewSymptomState extends State<TrackNewSymptom> {
  TextEditingController controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText("Health Journal", style: AppStyle.semiBoldBlack20),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
            child: Column(
              children: [
                SizedBox(height: 70.h),
                AutoSizeText(
                  "Select the diagnosis you want to note about.",
                  style: AppStyle.boldBlack20.copyWith(fontSize: 20.sp),
                ),

                Container(
                  margin: EdgeInsets.only(top: 60.h),
                  padding: EdgeInsets.symmetric(
                    vertical: 20.h,
                    horizontal: 16.w,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.grantAccessContainerColor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Column(
                    children: [
                      CustomedDropDown(
                        backgroundColor: AppColors.whiteLight,
                        textColor: AppColors.gray,
                        bottoShowSelectItem: [],
                        controller: controller,
                        hint: "Choose a condition...",
                        widthDropdown: double.infinity,
                        bottomSheetHeight: 350.h,
                        bottomSheetRight: 32.w,
                        bottomSheetLeft: 32.w,
                      ),
                      SizedBox(height: 20.h),
                      CustomedButton(
                        backgroundColor: AppColors.tabBarSelectedColor,
                        text: "Continue",
                        onPressed: () {
                          Navigator.of(
                            context,
                          ).pushNamed(AppRoutes.typeDiabetsScreen);
                        },
                      ),
                    ],
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

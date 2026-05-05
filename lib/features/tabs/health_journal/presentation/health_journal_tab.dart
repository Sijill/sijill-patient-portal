import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_routes.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/core/utils/customed_button.dart';
import 'package:sijil_patient_portal/features/tabs/health_journal/widget/your_tracked_item.dart';

class HealthJournalTab extends StatelessWidget {
  const HealthJournalTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            child: Column(
              children: [
                AutoSizeText("Health Journal", style: AppStyle.semiBoldBlack20),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.w,
                    vertical: 40.h,
                  ),
                  child: CustomedButton(
                    vertical: 5.h,
                    addItem: true,
                    spaceBeforeText: 5.w,
                    preImageName: AppAssets.trackNewSymptom,
                    text: "Track New Symptom",
                    onPressed: () {
                      Navigator.of(
                        context,
                      ).pushNamed(AppRoutes.trackNewSymptomScreen);
                    },
                  ),
                ),

                Row(
                  spacing: 10.w,
                  children: [
                    Icon(Icons.folder, color: AppColors.black, size: 25.sp),
                    AutoSizeText(
                      "Your Tracked Conditions",
                      style: AppStyle.semiBoldBlack20.copyWith(
                        color: AppColors.black,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25.h),
                YourTrackedItem(
                  title: "Type 2 Diabetes",
                  subTitle: "Last entry: 2 days ago",
                  onTap: () {
                    Navigator.of(
                      context,
                    ).pushNamed(AppRoutes.trackConditionTypeDiabetsScreen);
                  },
                ),
                SizedBox(height: 20.h),
                YourTrackedItem(
                  title: "Lumbar Disc Herniation",
                  subTitle: "Last entry: 2 days ago",
                  onTap: () {},
                ),
                SizedBox(height: 20.h),
                YourTrackedItem(
                  title: "Hypertension",
                  subTitle: "Last entry: 3 weeks ago",
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

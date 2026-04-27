import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/features/tabs/health_journal/widget/customed_type_diabetes_item.dart';

class TrackConditionTypeDiabetsScreen extends StatelessWidget {
  const TrackConditionTypeDiabetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText("Type 2 Diabetes", style: AppStyle.semiBoldBlack20),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
            child: Column(
              children: [
                CustomedTypeDiabetesItem(
                  date: "Monday, Oct 28",
                  progress:
                      "Improved — Details: Tired after meals but manageable",
                  painLevel: "4/10",
                  energyLevel: "6/10",
                  mood: "Calm",
                ),
                SizedBox(height: 16.h),
                CustomedTypeDiabetesItem(
                  date: "Monday, Oct 28",
                  progress:
                      "Improved — Details: Tired after meals but manageable",
                  painLevel: "4/10",
                  energyLevel: "6/10",
                  mood: "Calm",
                ),
                SizedBox(height: 16.h),
                CustomedTypeDiabetesItem(
                  date: "Monday, Oct 28",
                  progress:
                      "Improved — Details: Tired after meals but manageable",
                  painLevel: "4/10",
                  energyLevel: "6/10",
                  mood: "Calm",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

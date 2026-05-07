import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/features/tabs/medical_history/widget/medical_history_item.dart';
import 'package:sijil_patient_portal/features/tabs/medical_history/widget/medical_history_title.dart';

class MedicalHistoryTab extends StatefulWidget {
  const MedicalHistoryTab({super.key});

  @override
  State<MedicalHistoryTab> createState() => _MedicalHistoryTabState();
}

class _MedicalHistoryTabState extends State<MedicalHistoryTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText("Medical History", style: AppStyle.semiBoldBlack20),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                MedicalHistoryTitle(),
                SizedBox(height: 30.h),
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => MedicalHistoryItem(),
                  separatorBuilder: (context, index) => SizedBox(height: 16.h),
                  itemCount: 7,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

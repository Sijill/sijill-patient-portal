import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/presentation/widget/customed_imaging_center_laboratory.dart';

class GrantAccessImagingCenterLaboratoryScreen extends StatelessWidget {
  const GrantAccessImagingCenterLaboratoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText("Grant Access", style: AppStyle.semiBoldBlack20),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
            child: Column(
              children: [
                CustomedImagingCenterLaboratory(
                  imageName: AppAssets.microscope,
                  title1: "Ordered By: Dr William",
                  title2: "Ordered At: 13/5/2026",
                ),
                SizedBox(height: 20.h),
                CustomedImagingCenterLaboratory(
                  imageName: AppAssets.imaging,
                  title1: "Ordered By: Dr William",
                  title2: "Ordered At: 13/5/2026",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

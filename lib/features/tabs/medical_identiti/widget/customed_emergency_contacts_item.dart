import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';

class CustomedEmergencyContactsItem extends StatelessWidget {
  final String contactName;
  final String relationship;
  final String phoneNumber;
  final bool isPrimary;

  const CustomedEmergencyContactsItem({
    super.key,
    required this.contactName,
    required this.relationship,
    required this.phoneNumber,
    required this.isPrimary,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16.w, top: 16.h),
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      AutoSizeText("$contactName — "),
                      AutoSizeText(relationship),
                    ],
                  ),
                ),
              ),
              isPrimary
                  ? AutoSizeText("Primary", style: AppStyle.boldBlack16)
                  : SizedBox(),
            ],
          ),
          SizedBox(height: 15.h),
          Row(
            children: [
              AutoSizeText(phoneNumber, style: AppStyle.boldBlack14),
              Spacer(),
              Image.asset(
                AppAssets.phoneOffImg,
                height: 20.h,
                width: 20.w,
                fit: BoxFit.scaleDown,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

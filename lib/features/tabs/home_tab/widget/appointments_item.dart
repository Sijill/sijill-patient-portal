import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';

class AppointmentsItem extends StatelessWidget {
  final String hcp;
  final String dataTime;
  final String location;
  final void Function()? onTap;

  const AppointmentsItem({
    super.key,
    required this.hcp,
    required this.dataTime,
    required this.location,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
        color: AppColors.tabBarUnSelectedColor,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      AutoSizeText(
                        "HCP: ",
                        style: AppStyle.semiBoldBlack24.copyWith(
                          fontSize: 12.sp,
                        ),
                      ),
                      AutoSizeText(
                        hcp,
                        style: AppStyle.meduimBlack14.copyWith(fontSize: 12.sp),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      AutoSizeText(
                        "Date/Time: ",
                        style: AppStyle.semiBoldBlack24.copyWith(
                          fontSize: 12.sp,
                        ),
                      ),
                      AutoSizeText(
                        dataTime,
                        style: AppStyle.meduimBlack14.copyWith(fontSize: 12.sp),
                      ),
                    ],
                  ),
                ],
              ),
              InkWell(
                onTap: onTap,
                child: Image.asset(
                  AppAssets.appointment,
                  height: 40.h,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Row(
            children: [
              AutoSizeText(
                "Lcation: ",
                style: AppStyle.semiBoldBlack24.copyWith(fontSize: 12.sp),
              ),
              AutoSizeText(
                location,
                style: AppStyle.meduimBlack14.copyWith(fontSize: 12.sp),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

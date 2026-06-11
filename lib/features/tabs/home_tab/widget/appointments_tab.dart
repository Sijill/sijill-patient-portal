import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';

class AppointmentsTab extends StatelessWidget {
  final String doctorName;
  final String location;
  final String notes;
  final void Function()? onTap;

  const AppointmentsTab({
    super.key,
    required this.doctorName,
    required this.location,
    required this.notes,
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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        AutoSizeText(
                          "Doctor Name: ",
                          style: AppStyle.semiBoldBlack24.copyWith(
                            fontSize: 12.sp,
                          ),
                        ),
                        Expanded(
                          child: AutoSizeText(
                            doctorName,
                            style: AppStyle.meduimBlack14.copyWith(
                              color: AppColors.blueGrey,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          "Location: ",
                          style: AppStyle.semiBoldBlack24.copyWith(
                            fontSize: 12.sp,
                          ),
                        ),
                        Expanded(
                          child: AutoSizeText(
                            location,
                            style: AppStyle.meduimBlack14.copyWith(
                              fontSize: 12.sp,
                              color: AppColors.blueGrey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              InkWell(
                onTap: onTap,
                child: Image.asset(
                  AppAssets.appointment,
                  height: 40.h,
                  width: 45.w,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                "Notes: ",
                style: AppStyle.semiBoldBlack24.copyWith(fontSize: 12.sp),
              ),
              Expanded(
                child: AutoSizeText(
                  notes,
                  style: AppStyle.meduimBlack14.copyWith(
                    fontSize: 12.sp,
                    color: AppColors.blueGrey,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/core/utils/customed_button.dart';

class MedicalOrdersTab extends StatelessWidget {
  final String orderType;
  final String orderName;
  final String prioity;
  final String orderedBy;
  final String orderdAt;
  final String specimenType;
  final String bodyPart;
  final int index;
  final void Function() dismissClick;
  const MedicalOrdersTab({
    super.key,
    required this.orderType,
    required this.orderName,
    required this.prioity,
    required this.orderedBy,
    required this.orderdAt,
    required this.specimenType,
    required this.bodyPart,
    required this.index,
    required this.dismissClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.tabBarUnSelectedColor,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 120.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: AppColors.lightBlue,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Image.asset(orderType, height: 70.h, fit: BoxFit.fill),
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              AutoSizeText(
                "order Name: ",
                style: AppStyle.semiBoldBlack24.copyWith(fontSize: 12.sp),
              ),
              AutoSizeText(
                orderName,
                style: AppStyle.meduimBlack14.copyWith(fontSize: 12.sp),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Row(
            children: [
              AutoSizeText(
                "Priority: ",
                style: AppStyle.semiBoldBlack24.copyWith(fontSize: 12.sp),
              ),
              AutoSizeText(
                prioity,
                style: AppStyle.meduimBlack14.copyWith(fontSize: 12.sp),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Row(
            children: [
              AutoSizeText(
                "Ordered By: ",
                style: AppStyle.semiBoldBlack24.copyWith(fontSize: 12.sp),
              ),
              AutoSizeText(
                orderedBy,
                style: AppStyle.meduimBlack14.copyWith(fontSize: 12.sp),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Row(
            children: [
              AutoSizeText(
                "Ordered At: ",
                style: AppStyle.semiBoldBlack24.copyWith(fontSize: 12.sp),
              ),
              AutoSizeText(
                orderdAt,
                style: AppStyle.meduimBlack14.copyWith(fontSize: 12.sp),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        AutoSizeText(
                          "Specimen Type: ",
                          style: AppStyle.semiBoldBlack24.copyWith(
                            fontSize: 12.sp,
                          ),
                        ),
                        AutoSizeText(
                          specimenType,
                          style: AppStyle.meduimBlack14.copyWith(
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      children: [
                        AutoSizeText(
                          "Body Part: ",
                          style: AppStyle.semiBoldBlack24.copyWith(
                            fontSize: 12.sp,
                          ),
                        ),
                        AutoSizeText(
                          bodyPart,
                          style: AppStyle.meduimBlack14.copyWith(
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: CustomedButton(
                  radius: 5.r,
                  horizontal: 10.w,
                  vertical: 5.h,
                  spaceAfterText: 5.w,
                  backgroundColor: AppColors.teal,
                  textStyle: AppStyle.mediumWhite16.copyWith(fontSize: 12.sp),
                  text: "Dismiss",
                  addItem: true,
                  sufficImageName: AppAssets.dismiss,
                  onPressed: dismissClick,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

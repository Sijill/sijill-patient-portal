import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_routes.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/core/utils/customed_button.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/presentation/widget/customed_grant_drop_down.dart';

class GrantConsentScreen extends StatefulWidget {
  const GrantConsentScreen({super.key});

  @override
  State<GrantConsentScreen> createState() => _GrantConsentScreenState();
}

class _GrantConsentScreenState extends State<GrantConsentScreen> {
  String? gender;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.grantBg),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: 40.sp,
                      color: AppColors.blueLight,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 16.w,
                      top: 16.h,
                      bottom: 16.h,
                    ),
                    child: Text("Grant Consent", style: AppStyle.boldBlack24),
                  ),
                  Container(
                    height: height * 0.53,
                    width: width,
                    padding: EdgeInsets.only(top: 8.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32.r),
                      border: Border.all(color: AppColors.white, width: 10.w),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 8.w),
                            ClipRRect(
                              clipBehavior: Clip.antiAlias,
                              borderRadius: BorderRadiusGeometry.circular(32.r),
                              child: Image.asset(
                                AppAssets.healthcareImg,
                                height: 50.h,
                                width: 50.w,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Text(
                              "Healthcare Provider Access",
                              style: AppStyle.boldBlack16,
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 10.h,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 10.h,
                          ),
                          height: height * 0.26,
                          width: width,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  ClipRRect(
                                    clipBehavior: Clip.antiAlias,
                                    borderRadius: BorderRadiusGeometry.circular(
                                      32.r,
                                    ),
                                    child: Image.asset(
                                      AppAssets.roleImage,
                                      height: 45.h,
                                      width: 45.w,
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                  Text("Role", style: AppStyle.meduimBlack16),
                                  SizedBox(width: 20.w),
                                  Container(
                                    width: 165.w,
                                    padding: EdgeInsets.symmetric(
                                      vertical: 8.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.containerDarkBlueColor,
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      "Healthcare Provier",
                                      style: AppStyle.boldWhite16.copyWith(
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4.h),
                              CustomedGrantDropDown(
                                title: "Access\nType",
                                imageName: AppAssets.accessType,
                                selectedDropDown: "Read & Write",
                                bottoShowSelectItem: [
                                  "Read Only",
                                  "Write Only",
                                  "Read & Write",
                                ],
                              ),
                              SizedBox(height: 8.h),
                              CustomedGrantDropDown(
                                title: "Expires\nAfter",
                                imageName: AppAssets.expiresAfter,
                                selectedDropDown: "10 Minutes",
                                bottoShowSelectItem: [
                                  "5 Minutes",
                                  "10 Minutes",
                                  "15 Minutes",
                                  "20 Minutes",
                                  "25 Minutes",
                                  "30 Minutes",
                                  "35 Minutes",
                                  "40 Minutes",
                                  "45 Minutes",
                                  "50 Minutes",
                                  "55 Minutes",
                                  "60 Minutes",
                                ],
                                bottomSheetHeight: 233.h,
                                containerColor:
                                    AppColors.containerLightBlueColor,
                              ),
                            ],
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 30.w,
                            vertical: 20.h,
                          ),
                          width: width,
                          child: CustomedButton(
                            text: "Genrate Access Code",
                            horizontal: 16.w,
                            radius: 12.r,
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                AppRoutes.grantConsentAccessCodeScreen,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

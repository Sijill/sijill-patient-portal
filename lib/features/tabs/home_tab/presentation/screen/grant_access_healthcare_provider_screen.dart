import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sijil_patient_portal/api/injctable/di.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_routes.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/core/utils/customed_button.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/presentation/cubit/home_tab_cubt.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/presentation/widget/customed_healthcare_provider_access_duration.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/presentation/widget/customed_healthcare_provider_access_type.dart';

class GrantAccessHealthcareProviderScreen extends StatelessWidget {
  const GrantAccessHealthcareProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText("Grant Access", style: AppStyle.semiBoldBlack20),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: BlocProvider(
              create: (context) => getIt<HomeTabCubt>(),
              child: Column(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppAssets.accessType,
                        height: 33.h,
                        width: 33.w,
                        fit: BoxFit.scaleDown,
                      ),
                      SizedBox(width: 10.w),
                      AutoSizeText(
                        "Access Type",
                        style: AppStyle.semiBoldBlack20.copyWith(
                          fontSize: 18.sp,
                        ),
                      ),
                    ],
                  ),
                  CustomedHealthcareProviderAccessType(
                    title: "Read & Write",
                    subTitle:
                        "Full access to read medical records\n and add a new record",
                    index: 0,
                  ),
                  CustomedHealthcareProviderAccessType(
                    title: "Read Only",
                    subTitle:
                        "View-Only access to medical history\n and medical identity",
                    index: 1,
                  ),
                  CustomedHealthcareProviderAccessType(
                    title: "Write Only",
                    subTitle: "Write-Only access to add new\n medical records",
                    index: 2,
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 28.sp,
                        color: AppColors.darkBlue,
                      ),
                      SizedBox(width: 10.w),
                      AutoSizeText(
                        "Access Duration",
                        style: AppStyle.semiBoldBlack20.copyWith(
                          fontSize: 18.sp,
                        ),
                      ),
                    ],
                  ),
                  CustomedHealthcareProviderAccessDuration(),
                  CustomedButton(
                    text: "Generate Permission Token",
                    addItem: true,
                    vertical: 13.h,
                    sufficImageName: AppAssets.key,
                    spaceAfterText: 17.w,
                    backgroundColor: AppColors.tabBarSelectedColor,
                    onPressed: () {
                      Navigator.of(
                        context,
                      ).pushNamed(AppRoutes.grantAccessPermissionToken);
                    },
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

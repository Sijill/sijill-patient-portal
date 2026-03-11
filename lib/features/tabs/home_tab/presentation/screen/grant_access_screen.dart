import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_routes.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/core/utils/customed_button.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/presentation/widget/customed_grant_access_item.dart';

class GrantAccessScreen extends StatefulWidget {
  const GrantAccessScreen({super.key});

  @override
  State<GrantAccessScreen> createState() => _GrantAccessScreenState();
}

class _GrantAccessScreenState extends State<GrantAccessScreen> {
  String? gender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText("Grant Access", style: AppStyle.semiBoldBlack20),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  "Select who you want to provide access to your medical records",
                  style: AppStyle.mediumGray16,
                ),
                CustomedGrantAccessItem(
                  title: "Healthcare Provider",
                  subTitle:
                      "Authorize doctors, clinics, general practitioners, primary care teams etc....",
                  imageName: AppAssets.healthcareProvider,
                  selectItemClick: () {
                    Navigator.of(
                      context,
                    ).pushNamed(AppRoutes.grantAccessHealthcareProviderScreen);
                  },
                ),
                CustomedGrantAccessItem(
                  title: "Laboratory",
                  subTitle:
                      "Authorize blood work facilities, pathology centers, diagnostic labs etc.... ",
                  imageName: AppAssets.laboratory,
                  selectItemClick: () {
                    Navigator.of(context).pushNamed(
                      AppRoutes.grantAccessImagingCenterLaboratoryScreen,
                    );
                  },
                ),
                CustomedGrantAccessItem(
                  title: "Imaging Center",
                  subTitle:
                      "Authorize X-ray, MRI, CT scans and other radiological imaging services",
                  imageName: AppAssets.imagingCenter,
                  selectItemClick: () {
                    Navigator.of(context).pushNamed(
                      AppRoutes.grantAccessImagingCenterLaboratoryScreen,
                    );
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 70.w,
                    vertical: 30.h,
                  ),
                  child: CustomedButton(
                    backgroundColor: AppColors.tabBarSelectedColor,
                    addItem: true,
                    sufficImageName: AppAssets.key,
                    spaceAfterText: 5.w,
                    text: "Active Tokens",
                    onPressed: () {
                      Navigator.of(
                        context,
                      ).pushNamed(AppRoutes.grantAccessActiveTokensScreen);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

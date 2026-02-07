import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_routes.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/presentation/widget/customed_home_item.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.share),
                    onPressed: () {
                      Navigator.of(
                        context,
                      ).pushNamed(AppRoutes.grantConsentScreen);
                    },
                    color: AppColors.blueLight,
                    iconSize: 35.sp,
                  ),
                  IconButton(
                    icon: Icon(Icons.notifications_none),
                    onPressed: () {},
                    color: AppColors.blueLight,
                    iconSize: 35.sp,
                  ),
                ],
              ),
              SizedBox(height: height * 0.01),
              ListTile(
                title: Text("Hello, Mohamed", style: AppStyle.boldBlack24),
                subtitle: Text(
                  "How's your health today?",
                  style: AppStyle.meduimBlack20,
                ),
              ),
              SizedBox(height: height * 0.04),
              InkWell(
                onTap: () {},

                child: Container(
                  padding: EdgeInsets.all(2.sp),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(32.r),
                    border: BoxBorder.all(width: 2.w, color: AppColors.white),
                  ),
                  child: Image.asset(
                    AppAssets.dailyHealthJurnaly,
                    height: height * 0.17,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              CustomedHomeItem(),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_routes.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/core/utils/customed_button.dart';
import 'package:sijil_patient_portal/features/home/cubit/home_cubit.dart';
import 'package:sijil_patient_portal/features/tabs/chatbot/presentation/chatbot.dart';

class HealthSnapshotScreen extends StatelessWidget {
  const HealthSnapshotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String note = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40.h),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 16.w),
            margin: EdgeInsets.only(
              left: 20.w,
              right: 20.w,
              top: 30.h,
              bottom: 140.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.r),
              color: AppColors.primaryColor,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    AppAssets.healthSnapshot,
                    height: 80.h,
                    width: 80.w,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(height: 10.h),
                  AutoSizeText(
                    "Your Health Snapshot",
                    style: AppStyle.boldBlack22,
                  ),
                  SizedBox(height: 20.h),
                  AutoSizeText(note, style: AppStyle.meduimBlack14),

                  Padding(
                    padding: EdgeInsets.only(
                      left: 20.w,
                      bottom: 20.h,
                      top: 50.h,
                    ),
                    child: AutoSizeText(
                      "This snapshot is AI generated, it can mistakes, don’t forget to consult your doctor before taking any actions.",
                      style: AppStyle.meduimGray14,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CustomedButton(
                          backgroundColor: AppColors.tabBarSelectedColor,

                          text: "Home",
                          onPressed: () {
                            context.read<HomeCubit>().changeTap(0);
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              AppRoutes.homeScreen,
                              (route) => false,
                            );
                          },
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: CustomedButton(
                          backgroundColor: AppColors.tabBarSelectedColor,
                          text: "AI Assistant",
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Chatbot(showAppBar: true),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
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

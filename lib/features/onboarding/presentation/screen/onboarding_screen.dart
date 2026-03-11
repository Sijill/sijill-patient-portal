import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:sijil_patient_portal/api/injctable/di.dart';
import 'package:sijil_patient_portal/core/cache/shared_prefs_utils.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_routes.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/features/onboarding/presentation/cubit/onboarding_cubit.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var hight = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    var viewModel = getIt<OnboardingCubit>();
    PageViewModel customedPageViewModel({
      required String title,
      required String body,
      required String image,
    }) {
      return PageViewModel(
        decoration: PageDecoration(
          pageColor: AppColors.white,
          imageFlex: 2,
          bodyFlex: 1,
        ),

        titleWidget: AutoSizeText(
          title,
          style: AppStyle.semiBoldBlack22,
          textAlign: TextAlign.center,
        ),
        bodyWidget: AutoSizeText(
          body,
          style: AppStyle.semiBoldGrey16,
          textAlign: TextAlign.center,
        ),
        image: Image.asset(image, height: hight * 0.45, fit: BoxFit.fill),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          showNextButton: true,
          showSkipButton: true,
          next: AutoSizeText("Next", style: AppStyle.semiBoldBlack20),
          done: AutoSizeText("Done", style: AppStyle.semiBoldBlack20),
          skip: AutoSizeText("Skip", style: AppStyle.semiBoldBlack20),
          onDone: () async {
            await SharedPrefsUtils.saveData(key: "onboarding", value: true);
            Navigator.of(context).pushReplacementNamed(AppRoutes.signInScreen);
          },
          globalBackgroundColor: AppColors.transparent,
          animationDuration: 900,
          curve: Curves.easeInOut,
          pages: viewModel.onboardingList.map((item) {
            return customedPageViewModel(
              title: item.title,
              body: item.body,
              image: item.image,
            );
          }).toList(),

          dotsDecorator: DotsDecorator(
            size: const Size.square(12.0),
            activeSize: Size(29.w, 17.h),
            activeColor: AppColors.primaryColor,
            color: AppColors.lightGray,
            spacing: EdgeInsets.symmetric(horizontal: width * 0.015),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
        ),
      ),
    );
  }
}

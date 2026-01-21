import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:sijil_patient_portal/api/model/onboarding_model.dart';
import 'package:sijil_patient_portal/core/cache/shared_prefs_utils.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_routes.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var hight = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    List<OnboardingModel> onboardingList = [
      OnboardingModel(
        title:
            "Sijill is your official digital health record managed by the ministry of health",
        body: "Clear Vision, For Better Healthcare",
        image: AppAssets.onboarding1,
      ),
      OnboardingModel(
        title: "All your medical history in one place",
        body:
            "Visits, test results, prescriptions, and diagnoses all connected",
        image: AppAssets.onboarding2,
      ),
      OnboardingModel(
        title: "You decide who sees your records and for how long",
        body: "",
        image: AppAssets.onboarding3,
      ),
    ];
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
        title: title,
        body: body,
        image: Image.asset(image, height: hight * 0.45, fit: BoxFit.fill),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          showNextButton: true,
          showSkipButton: true,
          next: const Text("Next"),
          done: const Text("Done"),
          skip: const Text("Skip"),
          onDone: () async {
            await SharedPrefsUtils.saveData(key: "onboarding", value: true);
            Navigator.of(context).pushReplacementNamed(AppRoutes.signUpScreen);
          },
          globalBackgroundColor: AppColors.transparent,

          pages: onboardingList.map((item) {
            return customedPageViewModel(
              title: item.title,
              body: item.body,
              image: item.image,
            );
          }).toList(),

          dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: Size(width * 0.04, width * 0.02),
            activeColor: AppColors.primaryColor,
            color: Colors.black26,
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

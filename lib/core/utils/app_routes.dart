import 'package:flutter/material.dart';
import 'package:sijil_patient_portal/features/auth/sign_in/screen/sign_in_screen.dart';
import 'package:sijil_patient_portal/features/auth/sign_up/screen/sign_up_screen.dart';
import 'package:sijil_patient_portal/features/health_journal/screen/health_journal_tab.dart';
import 'package:sijil_patient_portal/features/home/screen/home_tab.dart';
import 'package:sijil_patient_portal/features/home_screen.dart';
import 'package:sijil_patient_portal/features/medical_history/screen/medical_history_tab.dart';
import 'package:sijil_patient_portal/features/onboarding/screen/onboarding_screen.dart';
import 'package:sijil_patient_portal/features/profile/screen/profile_tab.dart';
import 'package:sijil_patient_portal/features/settings/screen/settings_tab.dart';
import 'package:sijil_patient_portal/features/auth/forgetpassword/forget_password.dart';
import 'package:sijil_patient_portal/features/auth/sign_in/screen/otp_signin_verification.dart';
import 'package:sijil_patient_portal/features/auth/sign_up/screen/Application_Review_Page.dart';
import 'package:sijil_patient_portal/features/auth/sign_up/screen/Review_screen.dart';
import 'package:sijil_patient_portal/features/auth/sign_up/screen/otp_signup_verification.dart';
import 'package:sijil_patient_portal/features/auth/sign_up/screen/signup_credentials_screen.dart';
import 'package:sijil_patient_portal/features/auth/sign_up/screen/take_back_photo_screen.dart';
import 'package:sijil_patient_portal/features/auth/sign_up/screen/take_front_photo_screen.dart';
import 'package:sijil_patient_portal/features/auth/sign_up/screen/take_natioal_photo_screen.dart';

class AppRoutes {
  static const String homeScreen = "/homeScreen";
  static const String homeTab = "/homeTab";
  static const String profileTab = "/profileTab";
  static const String healthJournalTab = "/healthJournalTab";
  static const String medicalHistoryTab = "/medicalHistoryTab";
  static const String settingsTab = "/settingsTab";
  static const String signInScreen = "/signInScreen";
  static const String signUpScreen = "/signUpScreen";
  static const String forgetPassword = "/forgetPassword";
  static const String onboardingsScreen = "/onboardingsScreen";
  static const String signUpCredentialsScreen = "/signUpCredentialsScreen";
  static const String takeFrontPhotoScreen = "/takeFrontPhotoScreen";
  static const String takeBackPhotoScreen = "/takeBackPhotoScreen";
  static const String takeNatioalPhotoScreen = "/takeNatioalPhotoScreen";
  static const String otpSignupVerification = "/otpSignupVerification";
  static const String applicationReviewPage = "/applicationReviewPage";
  static const String reviewScreen = "/reviewScreen";
  static const String otpSigninVerification = "/otpSigninVerification";

  static Map<String, Widget Function(BuildContext)> routeScreen = {
    AppRoutes.homeScreen: (context) => HomeScreen(),
    AppRoutes.signInScreen: (context) => SignInScreen(),
    AppRoutes.otpSigninVerification: (context) => OtpSigninVerification(),
    AppRoutes.signUpScreen: (context) => SignUpScreen(),
    AppRoutes.signUpCredentialsScreen: (context) => SignUpCredentialsScreen(),
    AppRoutes.forgetPassword: (context) => ForgetPassword(),
    AppRoutes.takeFrontPhotoScreen: (context) => TakeFrontPhotoScreen(),
    AppRoutes.takeBackPhotoScreen: (context) => TakeBackPhotoScreen(),
    AppRoutes.takeNatioalPhotoScreen: (context) => TakeNatioalPhotoScreen(),
    AppRoutes.reviewScreen: (context) => ReviewScreen(),
    AppRoutes.otpSignupVerification: (context) => OtpSignupVerification(),
    AppRoutes.applicationReviewPage: (context) => ApplicationReviewPage(),
    AppRoutes.onboardingsScreen: (context) => OnboardingScreen(),

    AppRoutes.homeTab: (context) => HomeTab(),

    AppRoutes.profileTab: (context) => ProfileTab(),
    AppRoutes.healthJournalTab: (context) => HealthJournalTab(),
    AppRoutes.medicalHistoryTab: (context) => MedicalHistoryTab(),
    AppRoutes.settingsTab: (context) => SettingsTab(),
  };
}

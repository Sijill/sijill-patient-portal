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

class AppRoutes {
  static const String homeScreen = "/homeScreen";
  static const String homeTab = "/homeTab";
  static const String profileTab = "/profileTab";
  static const String healthJournalTab = "/healthJournalTab";
  static const String medicalHistoryTab = "/medicalHistoryTab";
  static const String settingsTab = "/settingsTab";
  static const String signInScreen = "/signInScreen";
  static const String signUpScreen = "/signUpScreen";
  static const String onboardingsScreen = "/onboardingsScreen";

  static Map<String, Widget Function(BuildContext)> routeScreen = {
    AppRoutes.homeScreen: (context) => HomeScreen(),
    AppRoutes.homeTab: (context) => HomeTab(),
    AppRoutes.signInScreen: (context) => SignInScreen(),
    AppRoutes.signUpScreen: (context) => SignUpScreen(),
    AppRoutes.onboardingsScreen: (context) => OnboardingScreen(),
    AppRoutes.profileTab: (context) => ProfileTab(),
    AppRoutes.healthJournalTab: (context) => HealthJournalTab(),
    AppRoutes.medicalHistoryTab: (context) => MedicalHistoryTab(),
    AppRoutes.settingsTab: (context) => SettingsTab(),
  };
}

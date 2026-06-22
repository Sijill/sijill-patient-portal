import 'package:flutter/material.dart';
import 'package:sijil_patient_portal/features/auth/presentation/forgetpassword/screen/reset_password.dart';
import 'package:sijil_patient_portal/features/auth/presentation/sign_in/screen/sign_in_screen.dart';
import 'package:sijil_patient_portal/features/auth/presentation/sign_up/screen/sign_up_screen.dart';
import 'package:sijil_patient_portal/features/tabs/chatbot/presentation/chatbot.dart';
import 'package:sijil_patient_portal/features/tabs/chatbot/presentation/chatbot_archive.dart';
import 'package:sijil_patient_portal/features/tabs/health_journal/presentation/health_journal_tab.dart';
import 'package:sijil_patient_portal/features/tabs/health_journal/presentation/track_condition_type_diabets_screen.dart';
import 'package:sijil_patient_portal/features/tabs/health_journal/presentation/track_new_symptom.dart';
import 'package:sijil_patient_portal/features/tabs/health_journal/presentation/health_snapshot_screen.dart';
import 'package:sijil_patient_portal/features/tabs/health_journal/presentation/type_diabets_screen.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/presentation/grant_access_active_tokens_screen.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/presentation/grant_access_healthcare_provider_screen.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/presentation/grant_access_imaging_center_screen.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/presentation/grant_access_laboratory_screen.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/presentation/grant_access_permission_token_imaging_order_screen.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/presentation/grant_access_permission_token_laboratory_screen.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/presentation/grant_access_permission_token_healthcare_provider_screen.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/presentation/grant_access_screen.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/presentation/home_tab.dart';
import 'package:sijil_patient_portal/features/home/presentation/home_screen.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/presentation/notification_details_screen.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/presentation/notifications_screen.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/presentation/reminders_screen.dart';
import 'package:sijil_patient_portal/features/tabs/medical_history/presentation/medical_history_tab.dart';
import 'package:sijil_patient_portal/features/onboarding/presentation/onboarding_screen.dart';
import 'package:sijil_patient_portal/features/tabs/medical_history/presentation/medical_histroy_details.dart';
import 'package:sijil_patient_portal/features/tabs/medical_identiti/presentation/medical_identity_tab.dart';
import 'package:sijil_patient_portal/features/auth/presentation/forgetpassword/screen/forget_password.dart';
import 'package:sijil_patient_portal/features/auth/presentation/sign_in/screen/otp_signin_verification.dart';
import 'package:sijil_patient_portal/features/auth/presentation/sign_up/screen/application_review_page.dart';
import 'package:sijil_patient_portal/features/auth/presentation/sign_up/screen/otp_signup_verification.dart';
import 'package:sijil_patient_portal/features/auth/presentation/sign_up/screen/signup_credentials_screen.dart';
import 'package:sijil_patient_portal/features/auth/presentation/sign_up/screen/take_back_photo_screen.dart';
import 'package:sijil_patient_portal/features/auth/presentation/sign_up/screen/take_front_photo_screen.dart';
import 'package:sijil_patient_portal/features/auth/presentation/sign_up/screen/take_natioal_photo_screen.dart';

class AppRoutes {
  static const String homeScreen = "/homeScreen";
  static const String homeTab = "/homeTab";
  static const String medicalIdentityTab = "/medicalIdentityTab";
  static const String healthJournalTab = "/healthJournalTab";
  static const String medicalHistoryTab = "/medicalHistoryTab";
  static const String chatbot = "/chatbot";
  static const String chatbotArchive = "/chatbotArchive";
  static const String signInScreen = "/signInScreen";
  static const String signUpScreen = "/signUpScreen";
  static const String forgetPassword = "/forgetPassword";
  static const String resetPassword = "/resetPassword";
  static const String onboardingsScreen = "/onboardingsScreen";
  static const String signUpCredentialsScreen = "/signUpCredentialsScreen";
  static const String takeFrontPhotoScreen = "/takeFrontPhotoScreen";
  static const String takeBackPhotoScreen = "/takeBackPhotoScreen";
  static const String takeNatioalPhotoScreen = "/takeNatioalPhotoScreen";
  static const String otpSignupVerification = "/otpSignupVerification";
  static const String applicationReviewPage = "/applicationReviewPage";
  static const String otpSigninVerification = "/otpSigninVerification";
  static const String grantAccessScreen = "/grantAccessScreen";
  static const String grantAccessHealthcareProviderScreen =
      "/grantAccessHealthcareProviderScreen";
  static const String grantAccessLaboratoryScreen =
      "/grantAccessLaboratoryScreen";
  static const String grantAccessImagingCenterScreen =
      "/grantAccessImagingCenterScreen";
  static const String grantAccessPermissionTokenHealthcareProviderScreen =
      "/grantAccessPermissionTokenHealthcareProviderScreen";
  static const String grantAccessPermissionTokenLaboratoryScreen =
      "/grantAccessPermissionTokenLaboratoryScreen";
  static const String grantAccessPermissionTokenImagingOrderScreen =
      "/grantAccessPermissionTokenImagingOrderScreen";
  static const String grantAccessActiveTokensScreen =
      "/grantAccessActiveTokensScreen";
  static const String notificationsScreen = "/notificationsScreen";
  static const String typeDiabetsScreen = "/typeDiabetsScreen";
  static const String healthSnapshotScreen = "/healthSnapshotScreen";
  static const String trackNewSymptomScreen = "/trackNewSymptomScreen";
  static const String trackConditionTypeDiabetsScreen =
      "/trackConditionTypeDiabetsScreen";
  static const String medicalHistroyDetails = "/medicalHistroyDetails";
  static const String remindersScreen = "/remindersScreen";
  static const String notificationDetailsScreen = "/notificationDetailsScreen";

  static Map<String, Widget Function(BuildContext)> routeScreen = {
    AppRoutes.homeScreen: (context) => HomeScreen(),
    AppRoutes.signInScreen: (context) => SignInScreen(),
    AppRoutes.otpSigninVerification: (context) => OtpSigninVerification(),
    AppRoutes.signUpScreen: (context) => SignUpScreen(),
    AppRoutes.signUpCredentialsScreen: (context) => SignUpCredentialsScreen(),
    AppRoutes.forgetPassword: (context) => ForgetPassword(),
    AppRoutes.resetPassword: (context) => ResetPassword(),
    AppRoutes.takeFrontPhotoScreen: (context) => TakeFrontPhotoScreen(),
    AppRoutes.takeBackPhotoScreen: (context) => TakeBackPhotoScreen(),
    AppRoutes.takeNatioalPhotoScreen: (context) => TakeNatioalPhotoScreen(),
    AppRoutes.otpSignupVerification: (context) => OtpSignupVerification(),
    AppRoutes.applicationReviewPage: (context) => ApplicationReviewPage(),
    AppRoutes.onboardingsScreen: (context) => OnboardingScreen(),
    AppRoutes.homeTab: (context) => HomeTab(),
    AppRoutes.medicalIdentityTab: (context) => MedicalIdentityTab(),
    AppRoutes.healthJournalTab: (context) => HealthJournalTab(),
    AppRoutes.medicalHistoryTab: (context) => MedicalHistoryTab(),
    AppRoutes.chatbot: (context) => Chatbot(),
    AppRoutes.grantAccessScreen: (context) => GrantAccessScreen(),
    AppRoutes.grantAccessHealthcareProviderScreen: (context) =>
        GrantAccessHealthcareProviderScreen(),
    AppRoutes.grantAccessLaboratoryScreen: (context) =>
        GrantAccessLaboratoryScreen(),
    AppRoutes.grantAccessPermissionTokenLaboratoryScreen: (context) =>
        GrantAccessPermissionTokenLaboratoryScreen(),
    AppRoutes.grantAccessPermissionTokenImagingOrderScreen: (context) =>
        GrantAccessPermissionTokenImagingOrderScreen(),

    AppRoutes.grantAccessImagingCenterScreen: (context) =>
        GrantAccessImagingCenterScreen(),
    AppRoutes.grantAccessPermissionTokenHealthcareProviderScreen: (context) =>
        GrantAccessPermissionTokenHealthcareProviderScreen(),
    AppRoutes.grantAccessActiveTokensScreen: (context) =>
        GrantAccessActiveTokensScreen(),
    AppRoutes.notificationsScreen: (context) => NotificationsScreen(),
    AppRoutes.typeDiabetsScreen: (context) => TypeDiabetsScreen(),
    AppRoutes.healthSnapshotScreen: (context) => HealthSnapshotScreen(),
    AppRoutes.trackNewSymptomScreen: (context) => TrackNewSymptom(),
    AppRoutes.trackConditionTypeDiabetsScreen: (context) =>
        TrackConditionTypeDiabetsScreen(),
    AppRoutes.medicalHistroyDetails: (context) => MedicalHistroyDetails(),
    AppRoutes.remindersScreen: (context) => RemindersScreen(),
    AppRoutes.notificationDetailsScreen: (context) =>
        NotificationDetailsScreen(),
    AppRoutes.chatbotArchive: (context) => ChatbotArchive(),
  };
}

import 'package:flutter/material.dart';
import 'package:sijil_patient_portal/core/utils/app_routes.dart';
import 'package:sijil_patient_portal/core/utils/app_theme.dart';
import 'package:sijil_patient_portal/features/auth/sign_in/screen/sign_in_screen.dart';
import 'package:sijil_patient_portal/features/auth/sign_up/screen/sign_up_screen.dart';
import 'package:sijil_patient_portal/features/home/screen/home_screen.dart';
import 'package:sijil_patient_portal/features/onboarding/screen/onboarding_screen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeScreen,
      routes: {
        AppRoutes.homeScreen: (context) => HomeScreen(),
        AppRoutes.signInScreen: (context) => SignInScreen(),
        AppRoutes.signUpScreen: (context) => SignUpScreen(),
        AppRoutes.onboardingsScreen: (context) => OnboardingScreen(),
      },
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sijil_patient_portal/core/cache/shared_prefs_utils.dart';
import 'package:sijil_patient_portal/core/utils/app_routes.dart';
import 'package:sijil_patient_portal/core/utils/app_theme.dart';
import 'package:sijil_patient_portal/features/auth/sign_in/screen/sign_in_screen.dart';
import 'package:sijil_patient_portal/features/auth/sign_up/screen/sign_up_screen.dart';
import 'package:sijil_patient_portal/features/home/screen/home_screen.dart';
import 'package:sijil_patient_portal/features/onboarding/screen/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPrefsUtils.sharedPrefs = await SharedPreferences.getInstance();
  final token = SharedPrefsUtils.getData(key: "onboarding");
  runApp(MyApp(token: token));
}

class MyApp extends StatelessWidget {
  final token;
  const MyApp({super.key, required this.token});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: token == true
          ? AppRoutes.signUpScreen
          : AppRoutes.onboardingsScreen,
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

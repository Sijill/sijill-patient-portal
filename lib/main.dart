import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/cache/shared_prefs_utils.dart';
import 'package:sijil_patient_portal/core/utils/app_routes.dart';
import 'package:sijil_patient_portal/core/utils/app_theme.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await SharedPrefsUtils.init();
//   final bool token = SharedPrefsUtils.getOnboarding();
//   runApp(MyApp(token: token));
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefsUtils.init();
  final bool token = SharedPrefsUtils.getOnboarding();
  runApp(MyApp(token: token));
}

class MyApp extends StatelessWidget {
  final bool token;
  const MyApp({super.key, required this.token});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: token == true
            ? AppRoutes.signInScreen
            : AppRoutes.onboardingsScreen,
        routes: AppRoutes.routeScreen,
        theme: AppTheme.lightTheme,
        themeMode: ThemeMode.light,
      ),
    );
  }
}

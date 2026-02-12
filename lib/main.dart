import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/api/injctable/di.dart';
import 'package:sijil_patient_portal/core/cache/check_token_is_expired.dart';
import 'package:sijil_patient_portal/core/cache/shared_prefs_utils.dart';
import 'package:sijil_patient_portal/core/utils/my_bloc_observer.dart';
import 'package:sijil_patient_portal/core/utils/app_routes.dart';
import 'package:sijil_patient_portal/core/utils/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  await SharedPrefsUtils.init();
  final bool onboarding = SharedPrefsUtils.getOnboarding();
  final String? accessToken = SharedPrefsUtils.getAccessToken();
  bool validToken = false;

  if (accessToken != null && accessToken.isNotEmpty) {
    validToken = !CheckTokenIsExpired.isTokenExpired(accessToken);
  }
  runApp(
    MyApp(
      onboarding: onboarding,
      accessToken: accessToken,
      validToken: validToken,
    ),
  );

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool onboarding;
  final String? accessToken;
  final bool validToken;
  const MyApp({
    super.key,
    required this.onboarding,
    this.accessToken,
    required this.validToken,
  });
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: onboarding == true
            ? (validToken ? AppRoutes.homeScreen : AppRoutes.signInScreen)
            : AppRoutes.onboardingsScreen,
        routes: AppRoutes.routeScreen,
        theme: AppTheme.lightTheme,
        themeMode: ThemeMode.light,
      ),
    );
  }
}

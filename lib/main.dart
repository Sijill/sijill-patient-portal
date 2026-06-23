import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/api/firebase_options.dart';
import 'package:sijil_patient_portal/api/injctable/di.dart';
import 'package:sijil_patient_portal/api/notifications/local_notification_service.dart';
import 'package:sijil_patient_portal/core/cache/shared_prefs_utils.dart';
import 'package:sijil_patient_portal/core/utils/my_bloc_observer.dart';
import 'package:sijil_patient_portal/core/utils/app_routes.dart';
import 'package:sijil_patient_portal/core/utils/app_theme.dart';
import 'package:sijil_patient_portal/features/home/cubit/home_cubit.dart';
import 'package:sijil_patient_portal/features/tabs/chatbot/cubit/chat_cubit.dart';
import 'package:sijil_patient_portal/features/tabs/health_journal/cubit/health_journal_cubit.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/cubit/home_tab_cubt.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/cubit/notification_cubit.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/cubit/permission_token_cubit.dart';
import 'package:sijil_patient_portal/features/tabs/medical_history/cubit/medical_history_cubit.dart';
import 'package:sijil_patient_portal/features/tabs/medical_identiti/cubit/medical_identity_cubit.dart';
import 'package:timezone/data/latest.dart' as tz;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  tz.initializeTimeZones();
  await LocalNotificationService.init();
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  await SharedPrefsUtils.init();
  final bool onboarding = SharedPrefsUtils.getOnboarding();
  final String? accessToken = SharedPrefsUtils.getAccessToken();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<NotificationCubit>()..startPendingNotificationsPolling(),
        ),
        BlocProvider(
          create: (context) => getIt<HomeCubit>()..startAppPolling(),
        ),
        BlocProvider(create: (context) => getIt<HomeTabCubt>()),
        BlocProvider(create: (context) => getIt<PermissionTokenCubit>()),
        BlocProvider(create: (context) => getIt<MedicalIdentityCubit>()),
        BlocProvider(create: (context) => getIt<HealthJournalCubit>()),
        BlocProvider(create: (context) => getIt<MedicalHistoryCubit>()),
        BlocProvider(create: (context) => getIt<ChatCubit>()),
      ],
      child: MyApp(onboarding: onboarding, accessToken: accessToken),
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

  const MyApp({super.key, required this.onboarding, this.accessToken});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 840),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: onboarding == true
            ? ((accessToken != null && accessToken!.isNotEmpty)
                  ? AppRoutes.homeScreen
                  : AppRoutes.signInScreen)
            : AppRoutes.onboardingsScreen,
        routes: AppRoutes.routeScreen,
        theme: AppTheme.lightTheme,
        themeMode: ThemeMode.light,
      ),
    );
  }
}

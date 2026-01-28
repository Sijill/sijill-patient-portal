import 'package:flutter/material.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(backgroundColor: AppColors.white),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.white,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      selectedIconTheme: IconThemeData(color: AppColors.white),
      unselectedIconTheme: IconThemeData(color: AppColors.darkBlue),
    ),
  );
}

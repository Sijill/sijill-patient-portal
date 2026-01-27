import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';

class AppStyle {
  static TextStyle boldPrimary16 = GoogleFonts.lato(
    textStyle: TextStyle(
      color: AppColors.primaryColor,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
  );
  static TextStyle boldPrimary24 = GoogleFonts.lato(
    textStyle: TextStyle(
      color: AppColors.primaryColor,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
  );
  static TextStyle boldBlue24 = GoogleFonts.lato(
    textStyle: TextStyle(
      color: AppColors.primaryColor,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
  );
  static TextStyle mediumBlue16 = GoogleFonts.lato(
    textStyle: TextStyle(
      color: AppColors.primaryColor,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
  );
  static TextStyle subtitle = GoogleFonts.lato(
    textStyle: TextStyle(
      color: AppColors.text,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
  );
  static TextStyle title = GoogleFonts.lato(
    textStyle: TextStyle(
      color: AppColors.text,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  );
}

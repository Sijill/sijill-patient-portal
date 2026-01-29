import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';

class AppDialog {
  static Future<bool?> showDialogMessage({
    String? message,
    Color? backgroundColor,
    Color? textColor,
  }) {
    return Fluttertoast.showToast(
      msg: message ?? "",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor ?? AppColors.red,
      textColor: textColor ?? AppColors.white,
      fontSize: 16.0,
    );
  }
}

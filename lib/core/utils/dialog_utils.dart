import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';

class DialogUtils {
  static void showLoading(BuildContext context) => showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => PopScope(
      canPop: false,
      child: AlertDialog(
        backgroundColor: AppColors.transparent,
        content: SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                AppAssets.loading,
                height: MediaQuery.sizeOf(context).height * 0.28,
                width: MediaQuery.sizeOf(context).height * 0.3,
                fit: BoxFit.fill,
              ),
            ],
          ),
        ),
      ),
    ),
  );

  static void hideLoading(BuildContext context) => Navigator.of(context).pop();

  static Future<bool?> showDialogMessage({
    String? message,
    Color? backgroundColor,
    Color? textColor,
  }) {
    return Fluttertoast.showToast(
      msg: message ?? "",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor ?? AppColors.red,
      textColor: textColor ?? AppColors.white,
      fontSize: 14.0.sp,
    );
  }

  static Future<dynamic> showAwesomeDialogMessage({
    required BuildContext context,
    required String message,
    void Function()? btnOkOnPress,
  }) {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.rightSlide,
      title: message,
      titleTextStyle: AppStyle.boldBlack14,
      btnCancelOnPress: () {},
      btnOkOnPress: btnOkOnPress,
    ).show();
  }
}

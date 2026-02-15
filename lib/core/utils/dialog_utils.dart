import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';

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
                'assets/svg/loading3.json',
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

  static void showMessage(String message) =>
      Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_SHORT);
}

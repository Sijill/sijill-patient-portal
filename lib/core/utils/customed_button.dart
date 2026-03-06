import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';

class CustomedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? horizontal;
  final Color? backgroundColor;
  final Color? textColor;
  final double? radius;
  const CustomedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.horizontal,
    this.backgroundColor,
    this.radius,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return MaterialButton(
      padding: EdgeInsets.symmetric(
        vertical: height * 0.01,
        horizontal: horizontal ?? 25.w,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(radius ?? 10.r),
        side: BorderSide(color: AppColors.primaryColor),
      ),
      color: backgroundColor ?? AppColors.primaryColor,
      onPressed: () {
        onPressed();
      },
      child: AutoSizeText(text, style: AppStyle.mediumBlack16),
    );
  }
}

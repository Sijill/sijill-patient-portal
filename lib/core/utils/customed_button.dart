import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';

class CustomedButton extends StatelessWidget {
  final String text;
  final bool? addItem;
  final VoidCallback onPressed;
  final double? horizontal;
  final double? vertical;
  final Color? backgroundColor;
  final Color? textColor;
  final double? radius;
  final double? spaceBeforeText;
  final double? spaceAfterText;
  final String? preImageName;
  final String? sufficImageName;
  final TextStyle? textStyle;
  const CustomedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.horizontal,
    this.backgroundColor,
    this.radius,
    this.textColor,
    this.addItem = false,
    this.preImageName,
    this.sufficImageName,
    this.spaceBeforeText,
    this.spaceAfterText,
    this.vertical,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return MaterialButton(
      padding: EdgeInsets.symmetric(
        vertical: vertical ?? height * 0.01,
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
      child: addItem == false
          ? AutoSizeText(text, style: textStyle ?? AppStyle.mediumBlack16)
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (preImageName != null)
                  SvgPicture.asset(
                    preImageName!,
                    height: 40.h,
                    width: 40.w,
                    fit: BoxFit.scaleDown,
                  ),
                SizedBox(width: spaceBeforeText ?? 0),
                AutoSizeText(text, style: textStyle ?? AppStyle.mediumBlack16),
                SizedBox(width: spaceAfterText ?? 0),
                if (sufficImageName != null)
                  SvgPicture.asset(
                    sufficImageName!,
                    height: 24.h,
                    width: 24.w,
                    fit: BoxFit.scaleDown,
                  ),
              ],
            ),
    );
  }
}

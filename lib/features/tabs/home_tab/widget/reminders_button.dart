import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';

class RemindersButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function()? onPressed;
  const RemindersButton({
    super.key,
    required this.text,
    this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
          side: BorderSide(color: AppColors.tabBarSelectedColor),
        ),
        backgroundColor: AppColors.white,
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          Icon(icon, size: 20.sp, color: AppColors.black),
          SizedBox(width: 6.w),
          Flexible(
            child: AutoSizeText(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              minFontSize: 8,
              style: AppStyle.meduimBlack14.copyWith(fontSize: 12.sp),
            ),
          ),
        ],
      ),
    );
  }
}

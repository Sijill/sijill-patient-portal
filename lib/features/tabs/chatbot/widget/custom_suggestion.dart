import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';

class CustomSuggestion extends StatelessWidget {
  final IconData icon;
  final String title;
  final void Function()? onTap;
  const CustomSuggestion({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        spacing: 10.w,
        children: [
          CircleAvatar(
            backgroundColor: AppColors.tabBarUnSelectedColor,
            child: Icon(icon, size: 25.sp),
          ),
          AutoSizeText(title, style: AppStyle.boldBlack14),
        ],
      ),
    );
  }
}

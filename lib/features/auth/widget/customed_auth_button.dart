import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/Padding.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';

class CustomedAuthButton extends StatelessWidget {
  final AlignmentGeometry? alignment;
  final VoidCallback onPressed;
  final IconData? icon;
  final double? size;
  const CustomedAuthButton({
    super.key,
    this.alignment,
    this.icon,
    this.size,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment ?? Alignment.centerRight,
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(15),
          backgroundColor: AppColors.blueLight,
          elevation: 0,
        ),
        child: Icon(
          icon ?? Icons.arrow_forward_ios_outlined,
          color: AppColors.white,
          size: size ?? 20.sp,
        ),
      ),
    ).setVerticalPadding(context, 0.01);
  }
}

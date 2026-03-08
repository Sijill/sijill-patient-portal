import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';

class CustomedLogo extends StatelessWidget {
  final double? height;
  final double? width;
  const CustomedLogo({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        AppAssets.logo,
        height: height ?? 100.h,
        width: width ?? 91.w,
      ),
    );
  }
}

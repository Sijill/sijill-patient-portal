import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';

class NoActivePermissionToken extends StatelessWidget {
  const NoActivePermissionToken({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        SvgPicture.asset(
          AppAssets.search,
          width: 375.w,
          height: 339.h,
          fit: BoxFit.fill,
        ),
        SizedBox(height: 29.h),
        AutoSizeText("No Active Tokens", style: AppStyle.semiBoldBlack22),
      ],
    );
  }
}

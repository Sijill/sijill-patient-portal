import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';

class CustomedOverviewItem extends StatelessWidget {
  final String imageName;
  final String number;
  final String title;
  final String subTitle;
  final Color? numberColor;
  const CustomedOverviewItem({
    super.key,
    required this.imageName,
    required this.number,
    required this.title,
    required this.subTitle,
    this.numberColor,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Container(
      decoration: BoxDecoration(color: AppColors.whiteLight),
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.015,
        vertical: height * 0.01,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                imageName,
                height: 40.h,
                width: 50.w,
                fit: BoxFit.fill,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    number,
                    style: AppStyle.boldDarkBlue20.copyWith(
                      color: numberColor ?? AppColors.darkBlue,
                    ),
                  ),
                  Text(title, style: AppStyle.meduimGray14),
                ],
              ),
            ],
          ),
          Text("   $subTitle", style: AppStyle.boldBlack14),
        ],
      ),
    );
  }
}

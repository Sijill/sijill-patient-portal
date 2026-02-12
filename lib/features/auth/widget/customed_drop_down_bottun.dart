import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/Padding.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/core/utils/validators.dart';

class CustomedDropDownBottun extends StatelessWidget {
  final String? gender;
  final Function(String?) onChanged;
  const CustomedDropDownBottun({
    super.key,
    this.gender,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return DropdownButtonFormField<String>(
      initialValue: gender,
      padding: EdgeInsets.only(left: 4.w),
      style: AppStyle.meduimBlack18,
      icon: Icon(
        Icons.keyboard_arrow_down_rounded,
        size: 30.sp,
        color: AppColors.blueLight,
      ),
      hint: AutoSizeText("Gender", style: AppStyle.meduimBlack18),

      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(
          horizontal: width * 0.03,
          vertical: height * 0.015,
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 12.w),
          child: Icon(Icons.people, color: AppColors.blueLight, size: 25.sp),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: AppColors.blueLight, width: 1.w),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: AppColors.blueLight, width: 1.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.blueLight, width: 1.w),
        ),
      ),
      items: [
        DropdownMenuItem(
          value: "MALE",
          child: AutoSizeText("MALE", style: AppStyle.meduimBlack18),
        ),
        DropdownMenuItem(
          value: "FEMALE",
          child: AutoSizeText("FEMALE", style: AppStyle.meduimBlack18),
        ),
      ],
      onChanged: (value) {
        onChanged(value);
        Form.of(context).validate();
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (val) => AppValidators.validateGender(val),
    ).setVerticalPadding(context, 0.01);
  }
}

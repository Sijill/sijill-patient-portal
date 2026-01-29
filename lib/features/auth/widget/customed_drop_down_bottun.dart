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
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(
          horizontal: width * 0.03,
          vertical: height * 0.015,
        ),
        prefixIcon: Icon(Icons.people, color: AppColors.blueLight, size: 25.sp),
        hintText: "Gender",
        hintStyle: AppStyle.meduimBlack18,
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
      items: const [
        DropdownMenuItem(value: "Male", child: Text("Male")),
        DropdownMenuItem(value: "Female", child: Text("Female")),
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

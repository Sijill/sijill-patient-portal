import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/core/utils/customed_button.dart';

class GrantAccessPermissionToken extends StatefulWidget {
  const GrantAccessPermissionToken({super.key});

  @override
  State<GrantAccessPermissionToken> createState() =>
      _GrantAccessPermissionTokenState();
}

class _GrantAccessPermissionTokenState
    extends State<GrantAccessPermissionToken> {
  TextEditingController timeController = TextEditingController();
  @override
  void dispose() {
    timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          "Permission Token",
          style: AppStyle.semiBoldBlack20,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 70.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  "Access To: Healthcare Provider",
                  style: AppStyle.mediumBlack16,
                ),
                SizedBox(height: 16.h),
                AutoSizeText(
                  "Access Type: Read & Write",
                  style: AppStyle.mediumBlack16,
                ),
                SizedBox(height: 16.h),
                AutoSizeText(
                  "Expires At: 29/10/2026 - 06:35:00",
                  style: AppStyle.mediumBlack16,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 35.h),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: AppStyle.meduimBlack20.copyWith(fontSize: 24.sp),
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus!.unfocus();
                    },
                    cursorHeight: 28.h,
                    controller: timeController,
                    decoration: InputDecoration(
                      hintText: "61489327",
                      hintStyle: AppStyle.meduimBlack20.copyWith(
                        fontSize: 24.sp,
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 10.h),
                      fillColor: AppColors.grantAccessContainerColor,
                      filled: true,
                      enabledBorder: customedOutlineInputBorder(),
                      focusedBorder: customedOutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 75.w,
                    vertical: 20.h,
                  ),
                  child: CustomedButton(
                    textStyle: AppStyle.semiBoldBlack20.copyWith(
                      fontSize: 18.sp,
                    ),
                    backgroundColor: AppColors.tabBarSelectedColor,
                    vertical: 19.h,
                    addItem: true,
                    sufficImageName: AppAssets.revoke,
                    spaceAfterText: 7.w,
                    text: "REVOKE",
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder customedOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: BorderSide(color: AppColors.white),
    );
  }
}

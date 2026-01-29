import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/Padding.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/core/utils/custom_text_field.dart';
import 'package:sijil_patient_portal/core/utils/customed_button.dart';
import 'package:sijil_patient_portal/core/utils/validators.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.authBg),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                  decoration: BoxDecoration(
                    color: AppColors.authContainerColor,
                    borderRadius: BorderRadius.circular(40.r),
                    border: Border.all(
                      color: AppColors.authBorderColor,
                      width: 1.5.w,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.01,
                      vertical: height * 0.04,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Forget Password", style: AppStyle.boldBlack24),
                          SizedBox(height: height * 0.03),
                          ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(16.r),
                            clipBehavior: Clip.antiAlias,
                            child: Image.asset(
                              AppAssets.forgetPasswordImg,
                              height: height * 0.3,
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(height: height * 0.003),
                          CustomTextField(
                            onValidate: (val) {
                              return AppValidators.validateEmail(val);
                            },
                            hint: "Email",
                            hintColor: AppColors.black,
                            prefixIcon: Icon(
                              Icons.mail,
                              color: AppColors.blueLight,
                            ),
                          ).setOnlyPadding(context, 0.015, 0.0, 0.0, 0.0),
                          SizedBox(height: height * 0.02),
                          CustomedButton(
                            text: "Verify Email",
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {}
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ).setVerticalPadding(context, 0.12),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

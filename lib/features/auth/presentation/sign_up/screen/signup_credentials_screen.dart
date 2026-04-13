import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_routes.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/core/utils/custom_text_field.dart';
import 'package:sijil_patient_portal/core/utils/validators.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/register/register_request.dart';
import 'package:sijil_patient_portal/features/auth/widget/customed_auth_button.dart';
import 'package:sijil_patient_portal/features/auth/widget/customed_logo.dart';

class SignUpCredentialsScreen extends StatefulWidget {
  const SignUpCredentialsScreen({super.key});

  @override
  State<SignUpCredentialsScreen> createState() =>
      _SignUpCredentialsScreenState();
}

class _SignUpCredentialsScreenState extends State<SignUpCredentialsScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool obscure = true;
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    RegisterRequest args =
        ModalRoute.of(context)?.settings.arguments as RegisterRequest;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 21.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomedLogo(),
                  SizedBox(height: 30.h),
                  Text("Create an Account", style: AppStyle.boldBlack24),
                  SizedBox(height: 20.h),

                  CustomTextField(
                    onValidate: (val) {
                      return AppValidators.validateEmail(val);
                    },
                    controller: emailController,
                    hint: "Email",
                    hintColor: AppColors.black,
                    prefixIcon: Icon(
                      Icons.mail,
                      size: 25.sp,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  CustomTextField(
                    onValidate: (val) {
                      return AppValidators.validatePassword(val);
                    },
                    controller: passwordController,
                    isPassword: true,
                    maxLines: 1,
                    hint: "Password",
                    hintColor: AppColors.black,
                    prefixIcon: Icon(
                      Icons.lock,
                      size: 25.sp,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  CustomTextField(
                    onValidate: (val) {
                      return AppValidators.validateConfirmPassword(
                        val,
                        passwordController.text,
                      );
                    },
                    controller: confirmPasswordController,
                    isPassword: true,
                    maxLines: 1,
                    hint: "Confirm Password",
                    hintColor: AppColors.black,
                    prefixIcon: Icon(
                      Icons.lock,
                      size: 25.sp,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  CustomTextField(
                    onValidate: (val) {
                      return AppValidators.validatePhoneNumber(val);
                    },
                    controller: phoneController,
                    hint: "Phone Number",
                    hintColor: AppColors.black,
                    keyboardType: TextInputType.phone,
                    prefixIcon: Icon(
                      Icons.phone,
                      size: 25.sp,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: 20.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomedAuthButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icons.arrow_back_ios_new_outlined,
                      ),

                      CustomedAuthButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.of(context).pushNamed(
                              AppRoutes.takeFrontPhotoScreen,
                              arguments: RegisterRequest(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                                phoneNumber: phoneController.text.trim(),
                                firstName: args.firstName,
                                middleName: args.middleName,
                                surName: args.surName,
                                dateOfBirth: args.dateOfBirth,
                                gender: args.gender,
                                nationalId: args.nationalId,
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

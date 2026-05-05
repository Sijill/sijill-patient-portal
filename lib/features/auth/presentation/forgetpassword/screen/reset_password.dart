import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/api/injctable/di.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/dialog_utils.dart';
import 'package:sijil_patient_portal/core/utils/app_routes.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/core/utils/custom_text_field.dart';
import 'package:sijil_patient_portal/core/utils/customed_button.dart';
import 'package:sijil_patient_portal/core/utils/validators.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/password_reset/password_reset_confirm_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/password_reset/password_reset_resend_otp_request.dart';
import 'package:sijil_patient_portal/features/auth/cubit/auth_cubit.dart';
import 'package:sijil_patient_portal/features/auth/cubit/auth_state.dart';
import 'package:sijil_patient_portal/features/auth/widget/customed_logo.dart';
import 'package:sijil_patient_portal/features/auth/widget/customed_otp_pin_code_textField.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  late String passwordResndOtp;
  @override
  void dispose() {
    newPasswordController.dispose();
    otpController.dispose();
    super.dispose();
  }

  var viewModel = getIt<AuthCubit>();
  @override
  Widget build(BuildContext context) {
    passwordResndOtp = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
            child: BlocListener<AuthCubit, AuthState>(
              bloc: viewModel,
              listener: (context, state) {
                if (state is PasswordResetConfirmLoadingState) {
                  DialogUtils.showLoading(context);
                } else if (state is PasswordResetConfirmErrorState) {
                  DialogUtils.hideLoading(context);
                  DialogUtils.showDialogMessage(message: state.message);
                } else if (state is PasswordResetResendOtpSccessState) {
                  passwordResndOtp =
                      state.passwordResetResendOtpResponse.resetSessionId!;
                } else if (state is PasswordResetConfirmSccessState) {
                  DialogUtils.hideLoading(context);
                  DialogUtils.showDialogMessage(
                    message: state.passwordResetConfirmResponse.message,
                    backgroundColor: AppColors.darkGreen,
                  );
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    AppRoutes.signInScreen,
                    (route) => false,
                  );
                }
              },
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomedLogo(),
                    SizedBox(height: 30.h),
                    Center(
                      child: AutoSizeText(
                        "Reset Password",
                        style: AppStyle.boldBlack24.copyWith(fontSize: 26.sp),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    AutoSizeText(
                      "Enter the code sent to your email",
                      style: AppStyle.boldBlack16,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16.h),
                    CustomedOtpPinCodeTextfield(
                      otpController: otpController,
                      validator: (val) {
                        return AppValidators.validateOtp(val);
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          "Nothing Yet?",
                          style: AppStyle.boldBlack16,
                        ),
                        TextButton(
                          onPressed: () {
                            viewModel.passwordResetResendOtp(
                              passwordResetResendOtpRequest:
                                  PasswordResetResendOtpRequest(
                                    resetSessionId: passwordResndOtp,
                                  ),
                            );
                          },
                          child: AutoSizeText(
                            "Resend Code",
                            style: AppStyle.boldPrimary16.copyWith(
                              color: AppColors.tabBarSelectedColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    CustomTextField(
                      iconVisabilyColor: AppColors.blue,
                      controller: newPasswordController,
                      fillColor: AppColors.blueLight.withAlpha(120),
                      onValidate: (val) {
                        return AppValidators.validatePassword(val);
                      },
                      hint: "New Password",
                      hintStyle: AppStyle.boldBlack16.copyWith(
                        color: AppColors.gray,
                      ),
                      textStyle: AppStyle.boldBlack16.copyWith(
                        color: AppColors.black,
                      ),
                      isPassword: true,
                      maxLines: 1,
                      prefixIcon: Icon(
                        Icons.lock,
                        color: AppColors.gray,
                        size: 25.sp,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Center(
                      child: CustomedButton(
                        backgroundColor: AppColors.tabBarSelectedColor,
                        horizontal: 25.w,
                        text: "Reset Password",
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            viewModel.passwordResetConfirm(
                              passwordResetConfirmRequest:
                                  PasswordResetConfirmRequest(
                                    newPassword: newPasswordController.text
                                        .trim(),
                                    otp: otpController.text.trim(),
                                    resetSessionId: passwordResndOtp,
                                  ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

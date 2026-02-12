import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/api/injctable/di.dart';
import 'package:sijil_patient_portal/core/utils/Padding.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_dialog.dart';
import 'package:sijil_patient_portal/core/utils/app_routes.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/core/utils/custom_text_field.dart';
import 'package:sijil_patient_portal/core/utils/customed_button.dart';
import 'package:sijil_patient_portal/core/utils/dialog_utils.dart';
import 'package:sijil_patient_portal/core/utils/validators.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/password_reset/password_reset_confirm_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/password_reset/password_reset_resend_otp_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/resend_code_model.dart';
import 'package:sijil_patient_portal/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:sijil_patient_portal/features/auth/presentation/cubit/auth_state.dart';
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

  @override
  void dispose() {
    otpController.dispose();
    newPasswordController.dispose();
    super.dispose();
  }

  var viewModel = getIt<AuthCubit>();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    ResendCodeModel args =
        ModalRoute.of(context)?.settings.arguments as ResendCodeModel;
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
                  margin: EdgeInsets.symmetric(horizontal: width * 0.04),
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.04,
                    vertical: height * 0.01,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.authContainerColor,
                    borderRadius: BorderRadius.circular(40.r),
                    border: Border.all(
                      color: AppColors.authBorderColor,
                      width: 1.5,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.01,
                      vertical: height * 0.04,
                    ),
                    child: BlocListener<AuthCubit, AuthState>(
                      bloc: viewModel,
                      listener: (context, state) {
                        if (state is PasswordResetConfirmLoadingState) {
                          DialogUtils.showLoading(context);
                        } else if (state is PasswordResetConfirmErrorState) {
                          DialogUtils.hideLoading(context);
                          AppDialog.showDialogMessage(message: state.message);
                        } else if (state is PasswordResetConfirmSccessState) {
                          DialogUtils.hideLoading(context);
                          AppDialog.showDialogMessage(
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
                          children: [
                            Text(
                              "Reset Password",
                              style: AppStyle.boldBlack24.copyWith(
                                fontSize: 26.sp,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: height * 0.02),
                            Text(
                              "Enter the code sent to your email",
                              style: AppStyle.boldBlack16,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: height * 0.02),
                            CustomedOtpPinCodeTextfield(
                              otpController: otpController,
                              validator: (val) {
                                return AppValidators.validateOtp(val);
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Nothing Yet?",
                                  style: AppStyle.boldBlack16,
                                ),
                                TextButton(
                                  onPressed: () {
                                    viewModel.passwordResetResendOtp(
                                      passwordResetResendOtpRequest:
                                          PasswordResetResendOtpRequest(
                                            resetSessionId: args.resendCode,
                                          ),
                                    );
                                  },
                                  child: Text(
                                    "Resend Code",
                                    style: AppStyle.boldPrimary16,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: height * 0.02),
                            CustomTextField(
                              iconVisabilyColor: AppColors.darkBlue,
                              controller: newPasswordController,
                              fillColor: AppColors.blueLight.withAlpha(120),
                              onValidate: (val) {
                                return AppValidators.validatePassword(val);
                              },
                              hint: "New Password",
                              hintStyle: AppStyle.boldBlack16.copyWith(
                                color: AppColors.darkBlue,
                              ),
                              textStyle: AppStyle.boldBlack16.copyWith(
                                color: AppColors.darkBlue,
                              ),
                              isPassword: true,
                              maxLines: 1,
                              prefixIcon: Icon(
                                Icons.lock,
                                color: AppColors.darkBlue,
                              ),
                            ),
                            SizedBox(height: height * 0.04),
                            CustomedButton(
                              horizontal: width * 0.225,
                              text: "Reset Password",
                              onPressed: () {
                                viewModel.passwordResetConfirm(
                                  passwordResetConfirmRequest:
                                      PasswordResetConfirmRequest(
                                        newPassword: newPasswordController.text
                                            .trim(),
                                        otp: otpController.text.trim(),
                                        resetSessionId: args.authSessionId,
                                      ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ).setVerticalPadding(context, 0.16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

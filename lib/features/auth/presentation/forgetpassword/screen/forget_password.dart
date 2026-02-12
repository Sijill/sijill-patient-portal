import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
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
import 'package:sijil_patient_portal/domain/entities/auth/request/password_reset/password_reset_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/password_reset/password_reset_resend_otp_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/resend_code_model.dart';
import 'package:sijil_patient_portal/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:sijil_patient_portal/features/auth/presentation/cubit/auth_state.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _formKey = GlobalKey<FormState>();
  var viewModel = getIt<AuthCubit>();
  String? resendCode;
  final TextEditingController _emailController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

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
                          AutoSizeText(
                            "Forget Password",
                            style: AppStyle.boldBlack24,
                          ),
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
                            controller: _emailController,
                            onValidate: (val) {
                              return AppValidators.validateEmail(val);
                            },
                            hint: "Email",
                            hintColor: AppColors.black,
                            prefixIcon: Icon(
                              Icons.mail,
                              color: AppColors.blueLight,
                              size: 25.sp,
                            ),
                          ).setOnlyPadding(context, 0.015, 0.0, 0.0, 0.0),
                          SizedBox(height: height * 0.02),
                          BlocListener<AuthCubit, AuthState>(
                            bloc: viewModel,
                            listener: (context, state) {
                              if (state is PasswordResetLoadingState) {
                                DialogUtils.showLoading(context);
                              } else if (state is PasswordResetErrorState) {
                                DialogUtils.hideLoading(context);
                                AppDialog.showDialogMessage(
                                  message: state.message,
                                );
                              } else if (state is PasswordResetSccessState) {
                                DialogUtils.hideLoading(context);
                                resendCode =
                                    state.passwordResetResponse.resetSessionId!;

                                viewModel.passwordResetResendOtp(
                                  passwordResetResendOtpRequest:
                                      PasswordResetResendOtpRequest(
                                        resetSessionId: resendCode,
                                      ),
                                );
                              } else if (state
                                  is PasswordResetResendOtpSccessState) {
                                DialogUtils.hideLoading(context);
                                Navigator.of(context).pushNamed(
                                  AppRoutes.resetPassword,
                                  arguments: ResendCodeModel(
                                    resendCode: resendCode!,
                                    authSessionId: state
                                        .passwordResetResendOtpResponse
                                        .resetSessionId!,
                                  ),
                                );
                              }
                            },
                            child: CustomedButton(
                              text: "Verify Email",
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  viewModel.passwordReset(
                                    passwordResetRequest: PasswordResetRequest(
                                      email: _emailController.text.trim(),
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
                ).setVerticalPadding(context, 0.12),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

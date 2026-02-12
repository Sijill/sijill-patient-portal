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
import 'package:sijil_patient_portal/domain/entities/auth/request/login/login_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/login/login_resend_otp_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/resend_code_model.dart';
import 'package:sijil_patient_portal/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:sijil_patient_portal/features/auth/presentation/cubit/auth_state.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool isObscure = true;
  bool rememberMe = false;
  var viewModel = getIt<AuthCubit>();
  String? resendCode;
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
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
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: width * 0.04),
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.04,
                  vertical: height * 0.02,
                ),
                decoration: BoxDecoration(
                  color: AppColors.authContainerColor,
                  borderRadius: BorderRadius.circular(40.r),
                  border: Border.all(
                    color: AppColors.authBorderColor,
                    width: 1.5.w,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: height * 0.02),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Welcome Back 👋", style: AppStyle.boldBlack24),
                      SizedBox(height: height * 0.01),
                      Text(
                        textAlign: TextAlign.center,
                        "Sign in to continue your health journey today!",
                        style: AppStyle.meduimBlack18,
                      ),
                      Form(
                        key: globalKey,
                        child: Column(
                          children: [
                            CustomTextField(
                              controller: _emailController,
                              hint: "Email",
                              hintColor: AppColors.black,
                              onValidate: (val) {
                                return AppValidators.validateEmail(val);
                              },
                              prefixIcon: Icon(
                                Icons.mail,
                                color: AppColors.blueLight,
                              ),
                            ).setOnlyPadding(context, 0.03, 0.015, 0.0, 0.0),
                            CustomTextField(
                              controller: _passwordController,
                              isPassword: true,
                              maxLines: 1,
                              onValidate: (val) {
                                return AppValidators.validatePassword(val);
                              },
                              hint: "Password",

                              hintColor: AppColors.black,
                              prefixIcon: Icon(
                                Icons.lock,
                                color: AppColors.blueLight,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Transform.scale(
                                scale: 0.9.sp,
                                child: Checkbox(
                                  value: rememberMe,
                                  activeColor: AppColors.blueLight,
                                  onChanged: (value) {
                                    setState(() {
                                      rememberMe = value!;
                                    });
                                  },
                                ),
                              ),
                              Text(
                                "Remember Me",
                                style: AppStyle.meduimBlack14,
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () {
                              if (globalKey.currentState!.validate()) {
                                Navigator.of(
                                  context,
                                ).pushNamed(AppRoutes.forgetPassword);
                              }
                            },
                            child: Text(
                              "Forget Password ?",
                              style: AppStyle.meduimBlue15,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: height * 0.01),
                      BlocListener<AuthCubit, AuthState>(
                        bloc: viewModel,
                        listener: (context, state) {
                          if (state is LoginLoadingState) {
                            DialogUtils.showLoading(context);
                          } else if (state is LoginSccessState) {
                            DialogUtils.hideLoading(context);
                            resendCode = state.loginResponse.loginSessionId;
                            viewModel.loginResendOtp(
                              loginResendOtpRequest: LoginResendOtpRequest(
                                loginSessionId: resendCode,
                              ),
                            );
                          } else if (state is LoginErrorState) {
                            DialogUtils.hideLoading(context);
                            AppDialog.showDialogMessage(message: state.message);
                          } else if (state is LoginResendOtpSccessState) {
                            DialogUtils.hideLoading(context);
                            Navigator.of(context).pushNamed(
                              AppRoutes.otpSigninVerification,
                              arguments: ResendCodeModel(
                                resendCode: resendCode!,
                                authSessionId: state
                                    .loginResendOtpResponse
                                    .loginSessionId!,
                              ),
                            );
                          }
                        },
                        child: CustomedButton(
                          text: "Submit",
                          horizontal: width * 0.32,
                          onPressed: () {
                            if (globalKey.currentState!.validate()) {
                              viewModel.login(
                                loginRequest: LoginRequest(
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text.trim(),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have account ?",
                            style: AppStyle.boldBlack16,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(
                                context,
                              ).pushNamed(AppRoutes.signUpScreen);
                            },
                            child: Text(
                              "Create account",
                              style: AppStyle.meduimBlueLight16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ).setVerticalPadding(context, 0.12),
            ),
          ),
        ),
      ),
    );
  }
}

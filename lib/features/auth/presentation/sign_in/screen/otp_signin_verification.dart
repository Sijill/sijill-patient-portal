import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sijil_patient_portal/api/injctable/di.dart';
import 'package:sijil_patient_portal/core/cache/shared_prefs_utils.dart';
import 'package:sijil_patient_portal/core/utils/app_dialog.dart';
import 'package:sijil_patient_portal/core/utils/app_routes.dart';
import 'package:sijil_patient_portal/core/utils/dialog_utils.dart';
import 'package:sijil_patient_portal/core/utils/validators.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/login/login_resend_otp_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/login/login_verfiy_otp_request.dart';
import 'package:sijil_patient_portal/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:sijil_patient_portal/features/auth/presentation/cubit/auth_state.dart';
import 'package:sijil_patient_portal/features/auth/widget/customed_otp_content.dart';

class OtpSigninVerification extends StatefulWidget {
  const OtpSigninVerification({super.key});

  @override
  State<OtpSigninVerification> createState() => _OtpSigninVerificationState();
}

class _OtpSigninVerificationState extends State<OtpSigninVerification> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();
  var viewModel = getIt<AuthCubit>();
  late String loginResndOtp;

  @override
  Widget build(BuildContext context) {
    loginResndOtp = ModalRoute.of(context)!.settings.arguments as String;

    return BlocListener<AuthCubit, AuthState>(
      bloc: viewModel,
      listener: (context, state) async {
        if (state is LoginResendOtpSccessState) {
          loginResndOtp = state.loginResendOtpResponse.loginSessionId!;
        } else if (state is LoginResendOtpErrorState) {
          AppDialog.showDialogMessage(message: state.message);
        } else if (state is LoginVerifyOtpLoadingState) {
          DialogUtils.showLoading(context);
        } else if (state is LoginVerifyOtpSccessState) {
          DialogUtils.hideLoading(context);
          await SharedPrefsUtils.saveData(
            key: "accessToken",
            value: state.loginVerifyOtpResponse.accessToken,
          );
          await SharedPrefsUtils.saveData(
            key: "refreshToken",
            value: state.loginVerifyOtpResponse.refreshToken,
          );
          Navigator.of(
            context,
          ).pushNamedAndRemoveUntil(AppRoutes.homeScreen, (route) => false);
        } else if (state is LoginVerifyOtpErrorState) {
          DialogUtils.hideLoading(context);
          AppDialog.showDialogMessage(message: state.message);
        }
      },
      child: Form(
        key: _formKey,
        child: CustomedOtpContent(
          otpController: otpController,
          validator: (val) {
            return AppValidators.validateOtp(val);
          },
          navigateScreen: () {
            if (_formKey.currentState!.validate()) {
              viewModel.loginVerifyOtp(
                loginVerfiyOtpRequest: LoginVerfiyOtpRequest(
                  loginSessionId: loginResndOtp,
                  otp: otpController.text,
                  platform: "mobile",
                ),
              );
            }
          },
          resendCode: () {
            viewModel.loginResendOtp(
              loginResendOtpRequest: LoginResendOtpRequest(
                loginSessionId: loginResndOtp,
              ),
            );
          },
        ),
      ),
    );
  }
}

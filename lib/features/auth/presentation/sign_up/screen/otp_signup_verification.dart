import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sijil_patient_portal/api/injctable/di.dart';
import 'package:sijil_patient_portal/core/utils/app_dialog.dart';
import 'package:sijil_patient_portal/core/utils/app_routes.dart';
import 'package:sijil_patient_portal/core/utils/dialog_utils.dart';
import 'package:sijil_patient_portal/core/utils/validators.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/register/register_resend_otp_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/register/register_verify_otp_request.dart';
import 'package:sijil_patient_portal/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:sijil_patient_portal/features/auth/presentation/cubit/auth_state.dart';
import 'package:sijil_patient_portal/features/auth/widget/customed_otp_content.dart';

class OtpSignupVerification extends StatefulWidget {
  const OtpSignupVerification({super.key});

  @override
  State<OtpSignupVerification> createState() => _OtpSignupVerificationState();
}

class _OtpSignupVerificationState extends State<OtpSignupVerification> {
  final _formKey = GlobalKey<FormState>();
  var vieModel = getIt<AuthCubit>();
  String? registerResndOtp;
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String registrationSessionId =
        ModalRoute.of(context)?.settings.arguments as String;
    return BlocListener<AuthCubit, AuthState>(
      bloc: vieModel,
      listener: (context, state) {
        if (state is RegisterVerifyOtpSccessState) {
          DialogUtils.hideLoading(context);
          Navigator.of(context).pushNamedAndRemoveUntil(
            AppRoutes.applicationReviewPage,
            (route) => false,
          );
        } else if (state is RegisterVerifyOtpLoadingState) {
          DialogUtils.showLoading(context);
        } else if (state is RegisterVerifyOtpErrorState) {
          DialogUtils.hideLoading(context);
          AppDialog.showDialogMessage(message: state.message);
        } else if (state is RegisterResndOtpSccessState) {
          registerResndOtp =
              state.registerResendOtpResponse.registrationSessionId;
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
              vieModel.registerVerifyOtp(
                registerVerifyOtpRequest: RegisterVerifyOtpRequest(
                  registrationSessionId: registerResndOtp,
                  otp: otpController.text,
                ),
              );
            }
          },
          resendCode: () {
            vieModel.registerResendOtp(
              registerResendOtpRequest: RegisterResendOtpRequest(
                registrationSessionId: registrationSessionId,
              ),
            );
          },
        ),
      ),
    );
  }
}

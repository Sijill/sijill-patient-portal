import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sijil_patient_portal/api/injctable/di.dart';
import 'package:sijil_patient_portal/domain/entities/auth/resend_code_model.dart';
import 'package:sijil_patient_portal/core/utils/app_dialog.dart';
import 'package:sijil_patient_portal/core/utils/app_routes.dart';
import 'package:sijil_patient_portal/core/utils/dialog_utils.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/register/register_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/register/register_resend_otp_request.dart';
import 'package:sijil_patient_portal/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:sijil_patient_portal/features/auth/presentation/cubit/auth_state.dart';
import 'package:sijil_patient_portal/features/auth/widget/customed_take_photo.dart';

class TakeNatioalPhotoScreen extends StatefulWidget {
  const TakeNatioalPhotoScreen({super.key});

  @override
  State<TakeNatioalPhotoScreen> createState() => _TakeNatioalPhotoScreenState();
}

class _TakeNatioalPhotoScreenState extends State<TakeNatioalPhotoScreen> {
  var viewModel = getIt<AuthCubit>();
  File? imageTakeNatioalPhoto;
  final role = "PATIENT";
  String? resendCode;
  @override
  Widget build(BuildContext context) {
    RegisterRequest args =
        ModalRoute.of(context)?.settings.arguments as RegisterRequest;
    return BlocListener<AuthCubit, AuthState>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          DialogUtils.showLoading(context);
        } else if (state is RegisterSccessState) {
          DialogUtils.hideLoading(context);
          resendCode = state.registerResponse.registrationSessionId;
          viewModel.registerResendOtp(
            registerResendOtpRequest: RegisterResendOtpRequest(
              registrationSessionId:
                  state.registerResponse.registrationSessionId,
            ),
          );
        } else if (state is RegisterErrorState) {
          DialogUtils.hideLoading(context);
          AppDialog.showDialogMessage(message: state.message);
        } else if (state is RegisterResndOtpSccessState) {
          Navigator.of(context).pushNamed(
            AppRoutes.otpSignupVerification,
            arguments: ResendCodeModel(
              resendCode: resendCode!,
              registrationSessionId:
                  state.registerResendOtpResponse.registrationSessionId!,
            ),
          );
        }
      },
      child: CustomedTakePhoto(
        title: "Hold your National ID next to your face.",
        subTitle:
            "Make sure your face and the ID photo are clearly visible.\nTake the photo in good lighting.",
        firstIcon: Icons.circle_outlined,
        middleIcon: Icons.circle_outlined,
        lastIcon: Icons.circle,
        onImagePicked: (image) {
          imageTakeNatioalPhoto = image;
        },

        forwardScreen: () {
          if (imageTakeNatioalPhoto == null) {
            AppDialog.showDialogMessage(message: "Please take a photo first");
            return;
          }

          viewModel.register(
            registerRequest: RegisterRequest(
              firstName: args.firstName,
              middleName: args.middleName,
              surName: args.surName,
              gender: args.gender,
              dateOfBirth: args.dateOfBirth,
              nationalId: args.nationalId,
              email: args.email,
              password: args.password,
              phoneNumber: args.phoneNumber,
              nationalIdFront: args.nationalIdFront,
              nationalIdBack: args.nationalIdBack,
              selfieWithId: imageTakeNatioalPhoto?.path,
              role: role,
            ),
          );
        },
      ),
    );
  }
}

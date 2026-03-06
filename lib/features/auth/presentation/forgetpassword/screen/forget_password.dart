import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/api/injctable/di.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_dialog.dart';
import 'package:sijil_patient_portal/core/utils/app_routes.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/core/utils/custom_text_field.dart';
import 'package:sijil_patient_portal/core/utils/customed_button.dart';
import 'package:sijil_patient_portal/core/utils/dialog_utils.dart';
import 'package:sijil_patient_portal/core/utils/validators.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/password_reset/password_reset_request.dart';
import 'package:sijil_patient_portal/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:sijil_patient_portal/features/auth/presentation/cubit/auth_state.dart';
import 'package:sijil_patient_portal/features/auth/widget/customed_logo.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _formKey = GlobalKey<FormState>();
  var viewModel = getIt<AuthCubit>();

  final TextEditingController _emailController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 120.h, horizontal: 21.w),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomedLogo(),
                  SizedBox(height: 50.h),
                  AutoSizeText(
                    "Forget Password",
                    style: AppStyle.semiBoldBlack22,
                  ),
                  SizedBox(height: 40.h),
                  CustomTextField(
                    controller: _emailController,
                    onValidate: (val) {
                      return AppValidators.validateEmail(val);
                    },
                    hint: "Email",
                    hintColor: AppColors.black,
                    prefixIcon: Icon(
                      Icons.mail,
                      color: AppColors.gray,
                      size: 25.sp,
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  BlocListener<AuthCubit, AuthState>(
                    bloc: viewModel,
                    listener: (context, state) {
                      if (state is PasswordResetLoadingState) {
                        DialogUtils.showLoading(context);
                      } else if (state is PasswordResetErrorState) {
                        DialogUtils.hideLoading(context);
                        AppDialog.showDialogMessage(message: state.message);
                      } else if (state is PasswordResetSccessState) {
                        DialogUtils.hideLoading(context);
                        Navigator.of(context).pushNamed(
                          AppRoutes.resetPassword,
                          arguments: state.passwordResetResponse.resetSessionId,
                        );
                      }
                    },
                    child: Center(
                      child: CustomedButton(
                        text: "Submit",
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/api/injctable/di.dart';
import 'package:sijil_patient_portal/core/cache/shared_prefs_utils.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_routes.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/core/utils/dialog_utils.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/logout/logout_request.dart';
import 'package:sijil_patient_portal/features/auth/cubit/auth_cubit.dart';
import 'package:sijil_patient_portal/features/auth/cubit/auth_state.dart';

class CutomLogoutButton extends StatefulWidget {
  const CutomLogoutButton({super.key});

  @override
  State<CutomLogoutButton> createState() => _CutomLogoutButtonState();
}

class _CutomLogoutButtonState extends State<CutomLogoutButton> {
  var viewModel = getIt<AuthCubit>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: BlocListener<AuthCubit, AuthState>(
        bloc: viewModel,
        listener: (context, state) {
          if (state is LogoutLoadingState) {
            DialogUtils.showLoading(context);
          } else if (state is LogoutErrorState) {
            DialogUtils.hideLoading(context);
            DialogUtils.showDialogMessage(message: state.message);
          } else if (state is LogoutSccessState) {
            DialogUtils.hideLoading(context);
            SharedPrefsUtils.logout();
            DialogUtils.showDialogMessage(
              message: state.logoutResponse.message,
              backgroundColor: AppColors.green,
            );
            Navigator.of(
              context,
            ).pushNamedAndRemoveUntil(AppRoutes.signInScreen, (route) => false);
          }
        },
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
            backgroundColor: AppColors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          onPressed: () {
            viewModel.logout(
              logoutRequest: LogoutRequest(
                refreshToken: SharedPrefsUtils.getRefreshToken() ?? "",
              ),
            );
          },
          child: Row(
            spacing: 10.w,
            children: [
              Icon(Icons.exit_to_app, color: AppColors.white, size: 30.sp),
              Text(
                "Logout",
                style: AppStyle.boldBlack18.copyWith(color: AppColors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

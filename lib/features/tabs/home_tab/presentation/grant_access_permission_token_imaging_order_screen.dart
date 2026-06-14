import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/dialog_utils.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/core/utils/customed_button.dart';
import 'package:sijil_patient_portal/domain/entities/permission_token/response/generate_imaging_permission_token_response/generate_imaging_permission_token_response.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/cubit/permission_token_cubit.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/cubit/permission_token_state.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/widget/customed_permission_token_item.dart';

class GrantAccessPermissionTokenImagingOrderScreen extends StatelessWidget {
  const GrantAccessPermissionTokenImagingOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final token =
        ModalRoute.of(context)!.settings.arguments
            as GenerateImagingPermissionTokenResponse;
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          context
              .read<PermissionTokenCubit>()
              .getListPatientActiveImagingOrders();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: AutoSizeText(
            "Permission Token",
            style: AppStyle.semiBoldBlack20,
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 60.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomedPermissionTokenItem(
                    accessEntity: "${token.entityType}",
                    accessType: "${token.accessType}",
                    expertAt: DateFormat(
                      'EEEE, MMM d',
                    ).format(token.expiresAt!),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20.h),
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 14.h,
                    ),
                    alignment: AlignmentGeometry.center,
                    decoration: BoxDecoration(
                      color: AppColors.tabBarUnSelectedColor,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Text(token.code ?? "", style: AppStyle.boldBlack18),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 75.w,
                      vertical: 30.h,
                    ),
                    child:
                        BlocListener<
                          PermissionTokenCubit,
                          PermissionTokenState
                        >(
                          listener: (context, state) {
                            if (state is PermissionTokenRevokeILoading) {
                              DialogUtils.showLoading(context);
                            } else if (state is PermissionTokenRevokeError) {
                              DialogUtils.hideLoading(context);
                              DialogUtils.showDialogMessage(
                                message: state.message,
                              );
                            } else if (state is PermissionTokenRevokeSuccess) {
                              DialogUtils.hideLoading(context);
                              DialogUtils.showDialogMessage(
                                message:
                                    state.permissionTokenRevokeResponse.message,
                                backgroundColor: AppColors.green,
                              );
                              Navigator.of(context)
                                ..pop()
                                ..pop();
                            }
                          },
                          child: CustomedButton(
                            textStyle: AppStyle.semiBoldBlack20.copyWith(
                              fontSize: 18.sp,
                            ),
                            backgroundColor: AppColors.tabBarSelectedColor,
                            vertical: 12.h,
                            addItem: true,
                            sufficImageName: AppAssets.revoke,
                            spaceAfterText: 7.w,
                            text: "REVOKE",
                            onPressed: () {
                              context
                                  .read<PermissionTokenCubit>()
                                  .permissionRevokeToken(
                                    tokenId: token.tokenId ?? "",
                                  );
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

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_dialog.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/core/utils/customed_button.dart';
import 'package:sijil_patient_portal/core/utils/dialog_utils.dart';
import 'package:sijil_patient_portal/core/utils/validators.dart';
import 'package:sijil_patient_portal/domain/entities/permission_token/request/permission_token_revoke/permission_token_revoke_request.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/cubit/permission_token_cubit.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/cubit/permission_token_state.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/widget/customed_permission_token_item.dart';

class GrantAccessPermissionToken extends StatefulWidget {
  const GrantAccessPermissionToken({super.key});

  @override
  State<GrantAccessPermissionToken> createState() =>
      _GrantAccessPermissionTokenState();
}

class _GrantAccessPermissionTokenState
    extends State<GrantAccessPermissionToken> {
  TextEditingController timeController = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  void initState() {
    context.read<PermissionTokenCubit>().getPermissionToken();
    super.initState();
  }

  @override
  void dispose() {
    timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String tokenId = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          "Permission Token",
          style: AppStyle.semiBoldBlack20,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Form(
              key: globalKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocConsumer<PermissionTokenCubit, PermissionTokenState>(
                    listener: (context, state) {
                      if (state is GetPermissionTokenILoading) {
                        Center(
                          child: CircularProgressIndicator(
                            color: AppColors.black,
                          ),
                        );
                      }

                      if (state is GetPermissionTokenError) {
                        AppDialog.showDialogMessage(message: state.message);
                      }
                    },
                    builder: (context, state) {
                      if (state is GetPermissionTokenSuccess) {
                        var token =
                            state.getPermissionTokenResponse.getTokenList ?? [];
                        return ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) =>
                              CustomedPermissionTokenItem(
                                accessEntity: "${token[index].entityType}",
                                accessType: "${token[index].accessType}",
                                expertAt: "${token[index].expiresAt}",
                              ),
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 8.h),
                          itemCount: token.length,
                        );
                      }
                      return Center(
                        child: AutoSizeText(
                          "No permission tokens available",
                          style: AppStyle.boldBlack20,
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30.h),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: AppStyle.meduimBlack20.copyWith(fontSize: 22.sp),
                      onTapOutside: (event) {
                        FocusManager.instance.primaryFocus!.unfocus();
                      },
                      validator: (val) {
                        return AppValidators.validateOtp(val);
                      },
                      cursorHeight: 28.h,
                      controller: timeController,
                      decoration: InputDecoration(
                        hintText: "Enter permission token",
                        hintStyle: AppStyle.meduimBlack20.copyWith(
                          fontSize: 18.sp,
                          color: AppColors.gray,
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 10.h),
                        fillColor: AppColors.grantAccessContainerColor,
                        filled: true,
                        enabledBorder: customedOutlineInputBorder(),
                        focusedBorder: customedOutlineInputBorder(),
                        errorBorder: customedOutlineInputBorder(AppColors.red),
                      ),
                    ),
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
                              AppDialog.showDialogMessage(
                                message: state.message,
                              );
                            } else if (state is PermissionTokenRevokeSuccess) {
                              DialogUtils.showLoading(context);
                              AppDialog.showDialogMessage(
                                message:
                                    state.permissionTokenRevokeResponse.message,
                                backgroundColor: AppColors.green,
                              );
                            }
                          },
                          child: CustomedButton(
                            textStyle: AppStyle.semiBoldBlack20.copyWith(
                              fontSize: 18.sp,
                            ),
                            backgroundColor: AppColors.tabBarSelectedColor,
                            vertical: 19.h,
                            addItem: true,
                            sufficImageName: AppAssets.revoke,
                            spaceAfterText: 7.w,
                            text: "REVOKE",
                            onPressed: () {
                              if (globalKey.currentState!.validate()) {
                                context
                                    .read<PermissionTokenCubit>()
                                    .permissionRevokeToken(
                                      permissionTokenRevokeRequest:
                                          PermissionTokenRevokeRequest(
                                            tokenId: tokenId,
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

  OutlineInputBorder customedOutlineInputBorder([Color? bordedColor]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: BorderSide(color: bordedColor ?? AppColors.white),
    );
  }
}

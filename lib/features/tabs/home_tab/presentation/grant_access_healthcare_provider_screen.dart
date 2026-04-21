import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_dialog.dart';
import 'package:sijil_patient_portal/core/utils/app_routes.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/core/utils/customed_button.dart';
import 'package:sijil_patient_portal/core/utils/dialog_utils.dart';
import 'package:sijil_patient_portal/domain/entities/permission_token/request/generate_permission_token/generate_permission_token_request.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/cubit/permission_token_cubit.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/cubit/permission_token_state.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/widget/customed_access_duration.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/widget/customed_access_type.dart';

class GrantAccessHealthcareProviderScreen extends StatefulWidget {
  const GrantAccessHealthcareProviderScreen({super.key});

  @override
  State<GrantAccessHealthcareProviderScreen> createState() =>
      _GrantAccessHealthcareProviderScreenState();
}

class _GrantAccessHealthcareProviderScreenState
    extends State<GrantAccessHealthcareProviderScreen> {
  TextEditingController timeController = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  @override
  void dispose() {
    timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText("Grant Access", style: AppStyle.semiBoldBlack20),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: BlocBuilder<PermissionTokenCubit, PermissionTokenState>(
              builder: (context, state) {
                var cubit = context.read<PermissionTokenCubit>();
                return Form(
                  key: globalKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppAssets.accessType,
                            height: 33.h,
                            width: 33.w,
                            fit: BoxFit.scaleDown,
                          ),
                          SizedBox(width: 10.w),
                          AutoSizeText(
                            "Access Type",
                            style: AppStyle.semiBoldBlack20.copyWith(
                              fontSize: 18.sp,
                            ),
                          ),
                        ],
                      ),
                      CustomedAccessType(
                        isSelected: cubit.selectedAccessType == 0,
                        title: "Read & Write",
                        subTitle:
                            "Full access to read medical records\n and add a new record",
                        index: 0,
                        onTap: () {
                          cubit.selectAccessType(0);
                        },
                      ),
                      CustomedAccessType(
                        isSelected: cubit.selectedAccessType == 1,
                        title: "Read Only",
                        subTitle:
                            "View-Only access to medical history\n and medical identity",
                        index: 1,
                        onTap: () {
                          cubit.selectAccessType(1);
                        },
                      ),
                      CustomedAccessType(
                        isSelected: cubit.selectedAccessType == 2,
                        title: "Write Only",
                        subTitle:
                            "Write-Only access to add new\n medical records",
                        index: 2,
                        onTap: () {
                          cubit.selectAccessType(2);
                        },
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            size: 28.sp,
                            color: AppColors.darkBlue,
                          ),
                          SizedBox(width: 10.w),
                          AutoSizeText(
                            "Access Duration",
                            style: AppStyle.semiBoldBlack20.copyWith(
                              fontSize: 18.sp,
                            ),
                          ),
                        ],
                      ),
                      CustomedAccessDuration(timeController: timeController),
                      BlocListener<PermissionTokenCubit, PermissionTokenState>(
                        listener: (context, state) {
                          if (state is GeneratePermissionTokenILoading) {
                            DialogUtils.showLoading(context);
                          } else if (state is GeneratePermissionTokenError) {
                            DialogUtils.hideLoading(context);
                            AppDialog.showDialogMessage(message: state.message);
                          } else if (state is GeneratePermissionTokenSuccess) {
                            DialogUtils.hideLoading(context);
                            if (!context.mounted) return;
                            Navigator.of(context)
                                .pushNamed(
                                  AppRoutes.grantAccessPermissionToken,
                                  arguments: state
                                      .generatePermissionTokenResponse
                                      .tokenId,
                                )
                                .then((_) {
                                  final cubit = context
                                      .read<PermissionTokenCubit>();
                                  cubit.resetGrantAccess();
                                  timeController.clear();
                                });
                          }
                        },
                        child: CustomedButton(
                          text: "Generate Permission Token",
                          addItem: true,
                          vertical: 13.h,
                          sufficImageName: AppAssets.key,
                          spaceAfterText: 17.w,
                          backgroundColor: AppColors.tabBarSelectedColor,
                          onPressed: () {
                            if (globalKey.currentState!.validate()) {
                              cubit.generatePermissionToken(
                                generatePermissionTokenRequest:
                                    GeneratePermissionTokenRequest(
                                      entityType: "HEALTHCARE_PROVIDER",
                                      accessType: cubit.getAccessTypeValue(),
                                      expiresInMinutes: int.parse(
                                        timeController.text,
                                      ),
                                    ),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

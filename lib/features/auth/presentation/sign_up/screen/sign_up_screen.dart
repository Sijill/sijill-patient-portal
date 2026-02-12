import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:sijil_patient_portal/api/injctable/di.dart';
import 'package:sijil_patient_portal/core/utils/Padding.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_routes.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/core/utils/custom_text_field.dart';
import 'package:sijil_patient_portal/core/utils/validators.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/register/register_request.dart';
import 'package:sijil_patient_portal/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:sijil_patient_portal/features/auth/presentation/cubit/auth_state.dart';
import 'package:sijil_patient_portal/features/auth/widget/customed_auth_button.dart';
import 'package:sijil_patient_portal/features/auth/widget/customed_drop_down_bottun.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  void dispose() {
    fNameController.dispose();
    mNameController.dispose();
    lNameController.dispose();
    nationalIdController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  final fNameController = TextEditingController();
  final mNameController = TextEditingController();
  final lNameController = TextEditingController();
  final nationalIdController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  var viewModel = getIt<AuthCubit>();
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
            child: Form(
              key: _formKey,
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.04,
                      vertical: height * 0.04,
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
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.01,
                        vertical: 0.4,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Create an Account",
                            style: AppStyle.boldBlack24,
                          ),
                          SizedBox(height: height * 0.01),
                          Text(
                            "Start your health journey today!",
                            style: AppStyle.boldBlack16,
                          ),
                          SizedBox(height: height * 0.02),
                          CustomTextField(
                            onValidate: (val) {
                              return AppValidators.validateFullName(val);
                            },
                            controller: fNameController,
                            hint: "First Name",
                            hintColor: AppColors.black,
                            prefixIcon: Icon(
                              Icons.person,
                              size: 25.sp,
                              color: AppColors.blueLight,
                            ),
                          ).setVerticalPadding(context, 0.001),
                          CustomTextField(
                            onValidate: (val) {
                              return AppValidators.validateFullName(val);
                            },
                            controller: mNameController,
                            hint: "Middle Name",
                            hintColor: AppColors.black,
                            prefixIcon: Icon(
                              Icons.person,
                              size: 25.sp,
                              color: AppColors.blueLight,
                            ),
                          ).setVerticalPadding(context, 0.015),
                          CustomTextField(
                            onValidate: (val) {
                              return AppValidators.validateFullName(val);
                            },
                            controller: lNameController,
                            hint: "Last Name",
                            hintColor: AppColors.black,
                            prefixIcon: Icon(
                              Icons.person,
                              size: 25.sp,
                              color: AppColors.blueLight,
                            ),
                          ).setVerticalPadding(context, 0.001),
                          SizedBox(height: height * 0.004),
                          BlocBuilder<AuthCubit, AuthState>(
                            bloc: viewModel,
                            builder: (context, state) {
                              return CustomedDropDownBottun(
                                onChanged: (val) {
                                  viewModel.changeSelectGender(val);
                                },
                                gender: viewModel.gender,
                              );
                            },
                          ),
                          CustomTextField(
                            readOnly: true,
                            controller: dateController,
                            hint: "Date Of Birth",
                            hintColor: AppColors.black,
                            enabled: true,
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                firstDate: DateTime(1900),
                                lastDate: DateTime.now(),
                                initialDate: DateTime(2000),
                              );

                              if (pickedDate != null) {
                                dateController.text = DateFormat(
                                  'yyyy-MM-dd',
                                ).format(pickedDate);
                              }
                            },
                            prefixIcon: Icon(
                              Icons.calendar_month_rounded,
                              size: 25.sp,
                              color: AppColors.blueLight,
                            ),
                            onValidate: (val) {
                              return AppValidators.validateDate(val);
                            },
                          ).setVerticalPadding(context, 0.005),

                          CustomTextField(
                            onValidate: (val) {
                              return AppValidators.validateNationalID(val);
                            },
                            keyboardType: TextInputType.number,
                            controller: nationalIdController,
                            hint: "National ID",
                            hintColor: AppColors.black,
                            prefixIcon: Icon(
                              Icons.numbers_outlined,
                              color: AppColors.blueLight,
                              size: 25.sp,
                            ),
                          ).setVerticalPadding(context, 0.01),
                          SizedBox(height: height * 0.01),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomedAuthButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: Icons.arrow_back_ios_new_outlined,
                              ),
                              CustomedAuthButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    Navigator.of(context).pushNamed(
                                      AppRoutes.signUpCredentialsScreen,
                                      arguments: RegisterRequest(
                                        firstName: fNameController.text,
                                        middleName: mNameController.text,
                                        surName: lNameController.text,
                                        gender: viewModel.gender,
                                        dateOfBirth: dateController.text,
                                        nationalId: nationalIdController.text,
                                      ),
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ).setVerticalPadding(context, 0.08),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

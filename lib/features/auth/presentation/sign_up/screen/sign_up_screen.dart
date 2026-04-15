import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:sijil_patient_portal/api/injctable/di.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_routes.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/core/utils/custom_text_field.dart';
import 'package:sijil_patient_portal/core/utils/validators.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/register/register_request.dart';
import 'package:sijil_patient_portal/features/auth/cubit/auth_cubit.dart';
import 'package:sijil_patient_portal/features/auth/widget/customed_auth_button.dart';
import 'package:sijil_patient_portal/features/auth/widget/customed_logo.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/widget/customed_drop_down.dart';

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
    genderController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  final fNameController = TextEditingController();
  final mNameController = TextEditingController();
  final lNameController = TextEditingController();
  final nationalIdController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController genderController = TextEditingController();

  var viewModel = getIt<AuthCubit>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 21.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomedLogo(),
                  SizedBox(height: 30.h),
                  Text("Create an Account", style: AppStyle.boldBlack22),
                  SizedBox(height: 20.h),
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
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: 16.h),
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
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: 16.h),
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
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  CustomedDropDown(
                    controller: genderController,
                    prefixIcon: Icons.transgender,
                    hint: "Gender",
                    bottomSheetWidth: 16.w,
                    bottomSheetHeight: 225.h,
                    heightDrobdown: 95.h,
                    fontSize: 16.sp,
                    paddingVerticalItem: 12.h,
                    widthDropdown: double.infinity,
                    bottoShowSelectItem: ['MALE', 'FEMALE'],
                    onValidate: (val) {
                      return AppValidators.validateGender(val);
                    },
                  ),

                  SizedBox(height: 16.h),
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
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: ColorScheme.light(
                                primary: AppColors.primaryColor,
                                onPrimary: Colors.black,
                                onSurface: AppColors.black,
                              ),
                              dialogTheme: DialogThemeData(
                                backgroundColor: Colors.white,
                              ),
                              textButtonTheme: TextButtonThemeData(
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.black,
                                ),
                              ),
                            ),
                            child: child!,
                          );
                        },
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
                      color: AppColors.black,
                    ),
                    onValidate: (val) {
                      return AppValidators.validateDate(val);
                    },
                  ),
                  SizedBox(height: 16.h),
                  CustomTextField(
                    onValidate: (val) {
                      return AppValidators.validateNationalID(val);
                    },
                    keyboardType: TextInputType.number,
                    controller: nationalIdController,
                    hint: "National ID",
                    hintColor: AppColors.black,
                    prefixIcon: Icon(
                      Icons.credit_card,
                      color: AppColors.black,
                      size: 25.sp,
                    ),
                  ),
                  SizedBox(height: 16.h),
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
                                gender: genderController.text,
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
          ),
        ),
      ),
    );
  }
}

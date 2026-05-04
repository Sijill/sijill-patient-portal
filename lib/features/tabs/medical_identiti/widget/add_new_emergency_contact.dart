import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/core/utils/custom_text_field.dart';
import 'package:sijil_patient_portal/core/utils/customed_button.dart';
import 'package:sijil_patient_portal/core/utils/dialog_utils.dart';
import 'package:sijil_patient_portal/core/utils/validators.dart';
import 'package:sijil_patient_portal/domain/entities/medical_identity/request/add_emergency_contact/add_emergency_contact_request.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/widget/customed_drop_down.dart';
import 'package:sijil_patient_portal/features/tabs/medical_identiti/cubit/medical_identity_cubit.dart';
import 'package:sijil_patient_portal/features/tabs/medical_identiti/cubit/medical_identity_state.dart';

class AddNewEmergencyContact extends StatefulWidget {
  const AddNewEmergencyContact({super.key});

  @override
  State<AddNewEmergencyContact> createState() => _AddNewEmergencyContactState();
}

class _AddNewEmergencyContactState extends State<AddNewEmergencyContact> {
  TextEditingController nameController = TextEditingController();
  TextEditingController relationshipController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    nameController.dispose();
    relationshipController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MedicalIdentityCubit, MedicalIdentityState>(
      listener: (context, state) {
        if (state is AddEmergencyContactLoading) {
          DialogUtils.showLoading(context);
        }
        if (state is AddEmergencyContactSuccess) {
          DialogUtils.hideLoading(context);
          Navigator.of(context).pop();
        }
        if (state is AddEmergencyContactError) {
          DialogUtils.hideLoading(context);
          DialogUtils.showDialogMessage(message: state.message);
        }
      },
      builder: (context, state) {
        var cubit = context.read<MedicalIdentityCubit>();
        return AnimatedPadding(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            constraints: BoxConstraints(maxHeight: 0.55.sh),
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
            margin: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 10.h),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      "Add New Emergency Contact",
                      style: AppStyle.semiBoldBlack20,
                    ),
                    SizedBox(height: 35.h),
                    CustomTextField(
                      hint: "Name",
                      prefixIcon: Icon(Icons.person, color: AppColors.black),
                      controller: nameController,
                      onValidate: (val) {
                        return AppValidators.validateFullName(val);
                      },
                    ),
                    SizedBox(height: 20.h),
                    CustomTextField(
                      hint: "Phone",
                      prefixIcon: Icon(Icons.phone, color: AppColors.black),
                      controller: phoneController,
                      onValidate: (val) {
                        return AppValidators.validatePhoneNumber(val);
                      },
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(height: 20.h),
                    CustomedDropDown(
                      onValidate: (val) {
                        return AppValidators.validateRelationship(val);
                      },
                      controller: relationshipController,
                      prefixIcon: Icons.people_alt_outlined,
                      fontSize: 16.sp,
                      backgroundColor: AppColors.primaryColor,
                      hint: "Relationship",
                      widthDropdown: double.infinity,
                      bottomSheetLeft: 32.w,
                      bottomSheetRight: 32.w,
                      heightDrobdown: 150.h,
                      bottomSheetHeight: 20.h,
                      bottoShowSelectItem: [
                        "PARENT",
                        "SPOUSE",
                        "SIBLING",
                        "FRIEND",
                        "CAREGIVER",
                        "OTHER",
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AutoSizeText("Is Primary", style: AppStyle.boldBlack20),
                        InkWell(
                          onTap: () {
                            cubit.toggleSelectItem();
                          },
                          child: SvgPicture.asset(
                            cubit.selectItem == true
                                ? AppAssets.selectAccessLight
                                : AppAssets.selectAccess,
                            height: 40.h,
                            width: 40.w,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Center(
                      child: CustomedButton(
                        horizontal: 80.w,
                        text: "Add",
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            cubit.addEmergencyContact(
                              AddEmergencyContactRequest(
                                contactName: nameController.text,
                                phoneNumber: phoneController.text,
                                relationship: relationshipController.text,
                                isPrimary: cubit.selectItem,
                              ),
                            );
                            context
                                .read<MedicalIdentityCubit>()
                                .getMedicalIdentity();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

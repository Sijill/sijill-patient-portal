import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sijil_patient_portal/api/injctable/di.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/core/utils/custom_text_field.dart';
import 'package:sijil_patient_portal/core/utils/customed_button.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/presentation/widget/customed_drop_down.dart';
import 'package:sijil_patient_portal/features/tabs/medical_identiti/cubit/medical_identity_cubit.dart';
import 'package:sijil_patient_portal/features/tabs/medical_identiti/cubit/medical_identity_state.dart';

class AddNewEmergencyContact extends StatefulWidget {
  const AddNewEmergencyContact({super.key});

  @override
  State<AddNewEmergencyContact> createState() => _AddNewEmergencyContactState();
}

class _AddNewEmergencyContactState extends State<AddNewEmergencyContact> {
  TextEditingController relationshipController = TextEditingController();
  @override
  void dispose() {
    relationshipController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MedicalIdentityCubit>(),
      child: AnimatedPadding(
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
              ),
              SizedBox(height: 20.h),
              CustomTextField(
                hint: "Phone",
                prefixIcon: Icon(Icons.phone, color: AppColors.black),
              ),
              SizedBox(height: 20.h),
              CustomedDropDown(
                controller: relationshipController,
                prefixIcon: Icons.people_alt_outlined,
                fontSize: 16.sp,
                containerWidth: double.infinity,
                backgroundColor: AppColors.primaryColor,
                hint: "Relationship",
                widthDropdown: double.infinity,
                bottomSheetWidth: 32.w,
                bottoShowSelectItem: [
                  "Parent",
                  "Sibling",
                  "Spouse",
                  "Child",
                  "Relative",
                  "Friend",
                  "Neighbor",
                  "Colleague",
                  "Guardian",
                  "Other",
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText("Is Primary", style: AppStyle.boldBlack20),
                  BlocBuilder<MedicalIdentityCubit, MedicalIdentityState>(
                    builder: (context, state) {
                      final cubit = context.watch<MedicalIdentityCubit>();
                      return InkWell(
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
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Center(
                child: CustomedButton(
                  horizontal: 80.w,
                  text: "Add",
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/core/utils/dialog_utils.dart';
import 'package:sijil_patient_portal/features/tabs/medical_identiti/cubit/medical_identity_cubit.dart';
import 'package:sijil_patient_portal/features/tabs/medical_identiti/cubit/medical_identity_state.dart';

class CustomedEmergencyContactsItem extends StatelessWidget {
  final String contactName;
  final String relationship;
  final String phoneNumber;
  final bool isPrimary;
  final String contactId;

  const CustomedEmergencyContactsItem({
    super.key,
    required this.contactName,
    required this.relationship,
    required this.phoneNumber,
    required this.isPrimary,
    required this.contactId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16.w, top: 16.h),
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      AutoSizeText("$contactName — "),
                      AutoSizeText(relationship),
                    ],
                  ),
                ),
              ),
              isPrimary
                  ? AutoSizeText("Primary", style: AppStyle.boldBlack16)
                  : SizedBox(),
            ],
          ),
          SizedBox(height: 15.h),
          BlocListener<MedicalIdentityCubit, MedicalIdentityState>(
            listener: (context, state) {
              if (state is DeleteEmergencyContactError) {
                DialogUtils.showDialogMessage(message: state.message);
              } else if (state is DeleteEmergencyContactSuccess) {
                context.read<MedicalIdentityCubit>().getMedicalIdentity();
              }
            },
            child: Row(
              children: [
                AutoSizeText(phoneNumber, style: AppStyle.boldBlack14),
                Spacer(),
                InkWell(
                  onTap: () {
                    DialogUtils.showAwesomeDialogMessage(
                      context: context,
                      message: 'Are you sure about deleting it?',
                      btnOkOnPress: () {
                        context
                            .read<MedicalIdentityCubit>()
                            .deleteEmergencyContact(contactId: contactId);
                      },
                    );
                  },
                  child: Image.asset(
                    AppAssets.phoneOffImg,
                    height: 20.h,
                    width: 20.w,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

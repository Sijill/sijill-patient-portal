import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_dialog.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/features/tabs/medical_identiti/cubit/medical_identity_cubit.dart';
import 'package:sijil_patient_portal/features/tabs/medical_identiti/cubit/medical_identity_state.dart';
import 'package:sijil_patient_portal/features/tabs/medical_identiti/widget/add_new_emergency_contact.dart';
import 'package:sijil_patient_portal/features/tabs/medical_identiti/widget/customed_active_diagnosis_item.dart';
import 'package:sijil_patient_portal/features/tabs/medical_identiti/widget/customed_allergies_item.dart';
import 'package:sijil_patient_portal/features/tabs/medical_identiti/widget/customed_chronic_condition_item.dart';
import 'package:sijil_patient_portal/features/tabs/medical_identiti/widget/customed_current_medication.dart';
import 'package:sijil_patient_portal/features/tabs/medical_identiti/widget/customed_emergency_contacts_item.dart';
import 'package:sijil_patient_portal/features/tabs/medical_identiti/widget/customed_medical_identity_item.dart';
import 'package:sijil_patient_portal/features/tabs/medical_identiti/widget/customed_medical_identity_title.dart';
import 'package:sijil_patient_portal/features/tabs/medical_identiti/widget/customed_peofile_picture.dart';

class MedicalIdentityTab extends StatefulWidget {
  const MedicalIdentityTab({super.key});

  @override
  State<MedicalIdentityTab> createState() => _MedicalIdentityTabState();
}

class _MedicalIdentityTabState extends State<MedicalIdentityTab> {
  @override
  void initState() {
    context.read<MedicalIdentityCubit>().getMedicalIdentity();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MedicalIdentityCubit, MedicalIdentityState>(
      listener: (context, state) {
        if (state is GetMedicalIdentityLoading) {
          const Center(child: CircularProgressIndicator());
        } else if (state is GetMedicalIdentityError) {
          AppDialog.showDialogMessage(message: state.message);
        }
      },
      builder: (context, state) {
        var data = context.watch<MedicalIdentityCubit>().cubit;
        var dataTime = context.watch<MedicalIdentityCubit>();
        if (data == null) {
          return const Center(child: CircularProgressIndicator());
        }
        return SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 16.h, bottom: 22.h, left: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: AutoSizeText(
                      "Medical Identity",
                      style: AppStyle.semiBoldBlack20,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Center(child: CustomedPeofilePicture()),
                  SizedBox(height: 10.h),
                  Center(
                    child: AutoSizeText(
                      "Mostafa Mahmoud Khedr",
                      style: AppStyle.semiBoldBlack20.copyWith(fontSize: 16.sp),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 10.w,
                      children: [
                        CustomedMedicalIdentityItem(
                          imageIcon: AppAssets.ageImg,
                          title: "Age",
                          description:
                              "${data.basicInfo?.age ?? "0"} Years Old",
                        ),
                        CustomedMedicalIdentityItem(
                          imageIcon: AppAssets.genderImg,
                          title: "Gender",
                          description: data.basicInfo?.gender ?? "",
                        ),
                        CustomedMedicalIdentityItem(
                          imageIcon: AppAssets.bloodType,
                          title: "Blood Type",
                          description: data.basicInfo?.bloodType ?? "",
                        ),
                        SizedBox(width: 4.w),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 10.w,
                      children: [
                        CustomedMedicalIdentityItem(
                          imageIcon: AppAssets.weightImg,
                          title: "Weight",
                          description: "${data.basicInfo?.weightKg ?? "0"} kg",
                        ),
                        CustomedMedicalIdentityItem(
                          imageIcon: AppAssets.heightImg,
                          title: "Height",
                          description: "${data.basicInfo?.heightCm ?? "0"} cm",
                        ),
                        CustomedMedicalIdentityItem(
                          imageIcon: AppAssets.bmiImg,
                          title: "BMI",
                          description: "${data.basicInfo?.bmi ?? "0"}",
                        ),
                        SizedBox(width: 4.w),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Divider(color: AppColors.tabBarUnSelectedColor),
                  SizedBox(height: 10.h),
                  CustomedMedicalIdentityTitle(
                    title: "Active Diagnosis",
                    imageName: AppAssets.activeDiagnosisImg,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) =>
                        data.activeDiagnoses == null
                        ? const SizedBox()
                        : CustomedActiveDiagnosisItem(
                            icd11Title:
                                data.activeDiagnoses?[index].icd11Title ?? "",
                            icd11Code:
                                data.activeDiagnoses?[index].icd11Code ?? "",
                            diagnosedBy:
                                data.activeDiagnoses?[index].diagnosedBy ?? "",
                            diagnosedDate: dataTime.formatDate(
                              data.activeDiagnoses?[index].diagnosedDate,
                            ),
                          ),

                    itemCount: data.activeDiagnoses?.length ?? 0,
                  ),
                  SizedBox(height: 10.h),
                  Divider(color: AppColors.tabBarUnSelectedColor),
                  SizedBox(height: 10.h),
                  CustomedMedicalIdentityTitle(
                    title: "Current Medications",
                    imageName: AppAssets.currentMedicationsImg,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) =>
                        data.currentMedications == null
                        ? const SizedBox()
                        : CustomedCurrentMedication(
                            medicationName:
                                data
                                    .currentMedications?[index]
                                    .medicationName ??
                                "",
                            dosageAmount:
                                "${data.currentMedications?[index].dosageAmount ?? ""}",
                            dosageUnit:
                                data.currentMedications?[index].dosageUnit ??
                                "",
                            form: data.currentMedications?[index].form ?? "",
                            frequency:
                                data.currentMedications?[index].frequency ?? "",
                            startDate: dataTime.formatDate(
                              data.currentMedications?[index].startDate,
                            ),
                            endDate: dataTime.formatDate(
                              data.currentMedications?[index].endDate,
                            ),
                            prescribedBy:
                                data.currentMedications?[index].prescribedBy ??
                                "",
                            prescribedAt: dataTime.formatDate(
                              data.currentMedications?[index].prescribedAt,
                            ),
                          ),
                    itemCount: data.currentMedications?.length ?? 0,
                  ),
                  SizedBox(height: 10.h),
                  Divider(color: AppColors.tabBarUnSelectedColor),
                  SizedBox(height: 10.h),
                  CustomedMedicalIdentityTitle(
                    title: "Allergies",
                    imageName: AppAssets.allergiesImg,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => data.allergies == null
                        ? const SizedBox()
                        : CustomedAllergiesItem(
                            backgroundColor:
                                data.allergies?[index].severity == "MODERATE"
                                ? AppColors.bageColor
                                : data.allergies?[index].severity == "SEVERE"
                                ? AppColors.redWhite
                                : data.allergies?[index].severity == "MILD"
                                ? AppColors.lightGreen2
                                : AppColors.red2,
                            allergenName:
                                data.allergies?[index].allergenName ?? "",
                            severity: data.allergies?[index].severity ?? "",
                            severityColor:
                                data.allergies?[index].severity == "MODERATE"
                                ? AppColors.brown
                                : data.allergies?[index].severity == "SEVERE"
                                ? AppColors.darkRed
                                : data.allergies?[index].severity == "MILD"
                                ? AppColors.green
                                : AppColors.white,
                            reactionDescription:
                                data.allergies?[index].reactionDescription ??
                                "",
                            diagnosedBy:
                                data.allergies?[index].diagnosedBy ?? "",
                            diagnosedDate: dataTime.formatDate(
                              data.allergies?[index].diagnosedDate,
                            ),
                          ),
                    itemCount: data.allergies?.length ?? 0,
                  ),

                  SizedBox(height: 10.h),
                  Divider(color: AppColors.tabBarUnSelectedColor),
                  SizedBox(height: 10.h),
                  CustomedMedicalIdentityTitle(
                    title: "Chronic Conditions",
                    imageName: AppAssets.chronicConditionsImg,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) =>
                        data.chronicConditions == null
                        ? const SizedBox()
                        : CustomedChronicConditionItem(
                            icd11Title:
                                data.chronicConditions?[index].icd11Title ?? "",
                            icd11Code:
                                data.chronicConditions?[index].icd11Code ?? "",
                            diagnosedBy:
                                data.chronicConditions?[index].diagnosedBy ??
                                "",
                            diagnosedDate: dataTime.formatDate(
                              data.chronicConditions?[index].diagnosedDate,
                            ),
                          ),

                    itemCount: data.chronicConditions?.length ?? 0,
                  ),

                  SizedBox(height: 10.h),
                  Divider(color: AppColors.tabBarUnSelectedColor),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.only(right: 16.w),
                    child: Row(
                      spacing: 5.w,
                      children: [
                        AutoSizeText(
                          "Emergency Contacts",
                          style: AppStyle.semiBoldBlack20.copyWith(
                            fontSize: 17.sp,
                          ),
                        ),
                        Image.asset(
                          AppAssets.emergencyContactsImg,
                          height: 27.h,
                          width: 27.w,
                          fit: BoxFit.scaleDown,
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              useSafeArea: true,
                              backgroundColor: Colors.transparent,
                              builder: (context) => AddNewEmergencyContact(),
                            );
                          },
                          child: Image.asset(
                            AppAssets.addEmergencyContactImg,
                            height: 30.h,
                            width: 30.w,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) =>
                        data.emergencyContacts == null
                        ? const SizedBox()
                        : CustomedEmergencyContactsItem(
                            contactName:
                                data.emergencyContacts?[index].contactName ??
                                "",
                            relationship:
                                data.emergencyContacts?[index].relationship ??
                                "",
                            phoneNumber:
                                data.emergencyContacts?[index].phoneNumber ??
                                "",
                            isPrimary:
                                data.emergencyContacts![index].isPrimary!,
                          ),
                    itemCount: data.emergencyContacts?.length ?? 0,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

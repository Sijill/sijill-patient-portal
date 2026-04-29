import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/api/injctable/di.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/features/tabs/medical_identiti/cubit/medical_identity_cubit.dart';
import 'package:sijil_patient_portal/features/tabs/medical_identiti/widget/add_new_emergency_contact.dart';
import 'package:sijil_patient_portal/features/tabs/medical_identiti/widget/customed_allergies_item.dart';
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
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 16.h, bottom: 22.h, left: 16.w),
          child: BlocProvider(
            create: (context) => getIt<MedicalIdentityCubit>(),
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
                        description: "22 Years Old",
                      ),
                      CustomedMedicalIdentityItem(
                        imageIcon: AppAssets.genderImg,
                        title: "Gender",
                        description: "Male",
                      ),
                      CustomedMedicalIdentityItem(
                        imageIcon: AppAssets.bloodType,
                        title: "Blood Type",
                        description: "AB+",
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
                        description: "89 kg",
                      ),
                      CustomedMedicalIdentityItem(
                        imageIcon: AppAssets.heightImg,
                        title: "Height",
                        description: "185 cm",
                      ),
                      CustomedMedicalIdentityItem(
                        imageIcon: AppAssets.bmiImg,
                        title: "BMI",
                        description: "32.6",
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
                CustomedAllergiesItem(
                  backgroundColor: AppColors.primaryColor,
                  text1: "Asthma",
                  textColor1: const Color.fromRGBO(43, 43, 43, 1),
                  text2: "",
                  textColor2: AppColors.green,
                  text3: "ICD11 Code: FA24",
                  textColor3: AppColors.black,
                  text4: "Diagnosed By DR. Michel Chen - MAY 2015",
                  textColor4: AppColors.blueGrey,
                ),
                SizedBox(height: 10.h),
                Divider(color: AppColors.tabBarUnSelectedColor),
                SizedBox(height: 10.h),
                CustomedMedicalIdentityTitle(
                  title: "Current Medications",
                  imageName: AppAssets.currentMedicationsImg,
                ),
                Container(
                  margin: EdgeInsets.only(right: 16.w, top: 16.h),
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    vertical: 12.h,
                    horizontal: 16.w,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 6.h,
                    children: [
                      AutoSizeText("Metformin", style: AppStyle.boldBlack16),
                      AutoSizeText(
                        "500mg — Tablet — Twice Daily",
                        style: AppStyle.meduimBlack14,
                      ),
                      AutoSizeText(
                        "Start Date: May 2015 / End Date: June 2015",
                        style: AppStyle.boldGrey14.copyWith(
                          color: AppColors.blueGrey,
                        ),
                      ),
                      AutoSizeText(
                        "Prescriped By DR. Michel Chen - MAY 2015",
                        style: AppStyle.boldGrey14.copyWith(
                          color: AppColors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                Divider(color: AppColors.tabBarUnSelectedColor),
                SizedBox(height: 10.h),
                CustomedMedicalIdentityTitle(
                  title: "Allergies",
                  imageName: AppAssets.allergiesImg,
                ),
                CustomedAllergiesItem(
                  backgroundColor: AppColors.red2,
                  text1: "Penicillin",
                  textColor1: AppColors.white,
                  text2: "LIFE THREATENING",
                  textColor2: AppColors.white,
                  text3: "Reaction: Causes anaphylaxis",
                  textColor3: AppColors.white,
                  text4: "Verified By DR. Michel Chen - MAY 2015",
                ),
                CustomedAllergiesItem(
                  backgroundColor: AppColors.redWhite,
                  text1: "Penicillin",
                  textColor1: AppColors.black,
                  text2: "SEVERE",
                  textColor2: AppColors.darkRed,
                  text3: "Reaction: Hives/Anaphylaxis",
                  textColor3: AppColors.black,
                  text4: "Verified By DR. Michel Chen - MAY 2015",
                  textColor4: AppColors.red3,
                ),
                CustomedAllergiesItem(
                  backgroundColor: AppColors.bageColor,
                  text1: "Dust",
                  textColor1: AppColors.black,
                  text2: "MODERATE",
                  textColor2: AppColors.brown,
                  text3: "Reaction: Runny nose, itchy",
                  textColor3: AppColors.black,
                  text4: "Verified By DR. Michel Chen - MAY 2015",
                ),
                CustomedAllergiesItem(
                  backgroundColor: AppColors.lightGreen2,
                  text1: "Peanuts",
                  textColor1: AppColors.black,
                  text2: "MILD",
                  textColor2: AppColors.green,
                  text3: "Reaction: Skin Rash",
                  textColor3: AppColors.black,
                  text4: "Verified By DR. Michel Chen - MAY 2015",
                ),
                SizedBox(height: 10.h),
                Divider(color: AppColors.tabBarUnSelectedColor),
                SizedBox(height: 10.h),
                CustomedMedicalIdentityTitle(
                  title: "Chronic Conditions",
                  imageName: AppAssets.chronicConditionsImg,
                ),
                CustomedAllergiesItem(
                  backgroundColor: AppColors.primaryColor,
                  text1: "Type 2 Diabetes Mellitus",
                  textColor1: const Color.fromRGBO(43, 43, 43, 1),
                  text2: "",
                  textColor2: AppColors.green,
                  text3: "ICD11 Code: FA24",
                  textColor3: AppColors.black,
                  text4: "Diagnosed By DR. Michel Chen - MAY 2015",
                  textColor4: AppColors.blueGrey,
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
                CustomedEmergencyContactsItem(),
                CustomedEmergencyContactsItem(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

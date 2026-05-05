import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_routes.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/core/utils/custom_text_field.dart';
import 'package:sijil_patient_portal/core/utils/customed_button.dart';
import 'package:sijil_patient_portal/core/utils/dialog_utils.dart';
import 'package:sijil_patient_portal/core/utils/validators.dart';
import 'package:sijil_patient_portal/domain/entities/health_journal/request/health_journal_notes_requst.dart';
import 'package:sijil_patient_portal/features/tabs/health_journal/cubit/health_journal_cubit.dart';
import 'package:sijil_patient_portal/features/tabs/health_journal/cubit/health_journal_state.dart';
import 'package:sijil_patient_portal/features/tabs/health_journal/widget/pain_level_selector.dart';
import 'package:sijil_patient_portal/features/tabs/health_journal/widget/customed_title.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/widget/customed_drop_down.dart';

class TypeDiabetsScreen extends StatefulWidget {
  const TypeDiabetsScreen({super.key});

  @override
  State<TypeDiabetsScreen> createState() => _TypeDiabetsScreenState();
}

class _TypeDiabetsScreenState extends State<TypeDiabetsScreen> {
  TextEditingController progressDetailsController = TextEditingController();
  TextEditingController modeController = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  String? patientOutcome;
  int? selectedEnergyLevelIndex;
  int? selectedPainLevelIndex;
  @override
  void dispose() {
    progressDetailsController.dispose();
    modeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String diagnosisId = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText("Type 2 Diabetes", style: AppStyle.semiBoldBlack20),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 20.w, top: 10.h, bottom: 30.h),
            child: Form(
              key: globalKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    "Monday, Oct 28",
                    style: AppStyle.mediumGray16.copyWith(fontSize: 18.sp),
                  ),
                  SizedBox(height: 30.h),
                  CustomedTitle(
                    imageLogo: AppAssets.overallProgress,
                    title: "Overall Progress",
                  ),
                  SizedBox(height: 10.h),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 7.w,
                      children: [
                        CustomedButton(
                          horizontal: 10.w,
                          backgroundColor: AppColors.lightGreen,
                          textStyle: AppStyle.semiBoldBlack22.copyWith(
                            fontSize: 12.sp,
                          ),
                          text: "Fully Recovered",
                          onPressed: () {
                            patientOutcome = "FULLY_RECOVERED";
                          },
                        ),
                        CustomedButton(
                          backgroundColor: AppColors.tabBarSelectedColor,
                          horizontal: 30.w,
                          textStyle: AppStyle.semiBoldBlack22.copyWith(
                            fontSize: 12.sp,
                          ),
                          text: "Improved",
                          onPressed: () {
                            patientOutcome = "IMPROVED";
                          },
                        ),
                        CustomedButton(
                          textStyle: AppStyle.semiBoldBlack22.copyWith(
                            fontSize: 12.sp,
                          ),
                          text: "No Change",
                          onPressed: () {
                            patientOutcome = "NO_CHANGE";
                          },
                        ),
                        CustomedButton(
                          backgroundColor: AppColors.rose,
                          horizontal: 35.w,
                          textStyle: AppStyle.semiBoldBlack22.copyWith(
                            fontSize: 12.sp,
                          ),
                          text: "Worse",
                          onPressed: () {
                            patientOutcome = "WORSE";
                          },
                        ),
                        SizedBox(width: 16.w),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20.w, top: 16.h),
                    child: CustomTextField(
                      onValidate: (val) {
                        return AppValidators.validateFullName(val);
                      },
                      controller: progressDetailsController,
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(bottom: 80.h),
                        child: Image.asset(
                          AppAssets.progressDetails,
                          height: 30.h,
                          width: 30.w,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      hint: "Progress Details...",
                      hintStyle: AppStyle.mediumGray14,
                      maxLines: 4,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  CustomedTitle(
                    imageLogo: AppAssets.painLevel,
                    title: "Pain Level",
                  ),
                  PainLevelSelector(
                    isEnergy: false,
                    onChanged: (index) {
                      selectedPainLevelIndex = index + 1;
                    },
                  ),
                  SizedBox(height: 30.h),
                  CustomedTitle(
                    imageLogo: AppAssets.energyLevel,
                    title: "Energy Level",
                  ),
                  PainLevelSelector(
                    isEnergy: true,
                    onChanged: (index) {
                      selectedEnergyLevelIndex = index + 1;
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 30.h,
                      bottom: 25.h,
                      right: 20.w,
                    ),
                    child: CustomedDropDown(
                      backgroundColor: AppColors.tabBarUnSelectedColor,
                      bottomSheetHeight: 10.h,
                      bottomSheetLeft: 20.w,
                      bottomSheetRight: 20.w,
                      widthDropdown: double.infinity,
                      onValidate: (val) {
                        return AppValidators.validateMode(val);
                      },
                      bottoShowSelectItem: [
                        "Happy",
                        "Calm",
                        "Sad",
                        "Anxious",
                        "Frustrated",
                        "Exhausted",
                        "Overwhelmed",
                        "Unwell",
                        "Neutral",
                      ],
                      controller: modeController,
                      hint: "Mood",
                      textColor: AppColors.gray,
                      fontSize: 18.sp,
                    ),
                  ),

                  BlocListener<HealthJournalCubit, HealthJournalState>(
                    listener: (context, state) {
                      if (state is HealthJournalNotesLoading) {
                        return DialogUtils.showLoading(context);
                      } else if (state is HealthJournalNotesError) {
                        DialogUtils.hideLoading(context);
                        DialogUtils.showDialogMessage(message: state.message);
                      } else if (state is HealthJournalNotesSuccess) {
                        DialogUtils.hideLoading(context);
                        Navigator.of(
                          context,
                        ).pushNamed(AppRoutes.healthSnapshotScreen);
                      }
                    },
                    child: Center(
                      child: CustomedButton(
                        backgroundColor: AppColors.tabBarSelectedColor,
                        text: "Take note",
                        onPressed: () {
                          if (globalKey.currentState!.validate()) {
                            if (selectedPainLevelIndex == null ||
                                selectedEnergyLevelIndex == null ||
                                patientOutcome == null) {
                              DialogUtils.showDialogMessage(
                                message: "Please fill all required fields",
                              );
                              return;
                            }

                            context
                                .read<HealthJournalCubit>()
                                .healthJournalNotes(
                                  healthJournalNotesRequst:
                                      HealthJournalNotesRequst(
                                        diagnosisId: diagnosisId,
                                        energyLevel: selectedEnergyLevelIndex,
                                        mood: modeController.text,
                                        painLevel: selectedPainLevelIndex,
                                        patientOutcome: patientOutcome,
                                        patientOutcomeDetails:
                                            progressDetailsController.text,
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
}

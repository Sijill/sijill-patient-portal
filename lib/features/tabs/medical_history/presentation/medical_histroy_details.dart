import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/core/utils/dialog_utils.dart';
import 'package:sijil_patient_portal/features/tabs/medical_history/cubit/medical_history_cubit.dart';
import 'package:sijil_patient_portal/features/tabs/medical_history/cubit/medical_history_state.dart';
import 'package:sijil_patient_portal/features/tabs/medical_history/widget/diagnoses_item.dart';
import 'package:sijil_patient_portal/features/tabs/medical_history/widget/prescribed_medications_item.dart';
import 'package:sijil_patient_portal/features/tabs/medical_history/widget/print_pdf.dart';
import 'package:sijil_patient_portal/features/tabs/medical_history/widget/symptoms_complains_item.dart';

class MedicalHistroyDetails extends StatefulWidget {
  const MedicalHistroyDetails({super.key});

  @override
  State<MedicalHistroyDetails> createState() => _MedicalHistroyDetailsState();
}

class _MedicalHistroyDetailsState extends State<MedicalHistroyDetails> {
  late String encounterId;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<MedicalHistoryCubit>().getMedicalHistory(
        encounterId: encounterId,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    encounterId = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  spacing: 80.w,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                        context
                            .read<MedicalHistoryCubit>()
                            .getListMedicalHistory();
                      },
                      child: Icon(Icons.arrow_back, size: 25.sp),
                    ),
                    AutoSizeText(
                      "Medical History",
                      style: AppStyle.semiBoldBlack20,
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 30.h),
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 16.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.tabBarUnSelectedColor,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: SingleChildScrollView(
                    child: BlocConsumer<MedicalHistoryCubit, MedicalHistoryState>(
                      listener: (context, state) {
                        if (state is GetMedicalHistoryError) {
                          DialogUtils.showDialogMessage(message: state.message);
                        }
                      },
                      builder: (context, state) {
                        final cubit = context.read<MedicalHistoryCubit>();
                        if (state is GetMedicalHistoryLoading) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height * 0.6,
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                        if (state is GetMedicalHistorySuccess) {
                          final data = state.getMedicalHistoryResponse;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                "Dr. ${data.encounter?.doctorName}",
                                style: AppStyle.boldBlack16,
                              ),
                              SizedBox(height: 12.h),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                spacing: 3.w,
                                children: [
                                  Image.asset(
                                    AppAssets.calender,
                                    height: 27.h,
                                    width: 27.w,
                                    fit: BoxFit.scaleDown,
                                  ),
                                  AutoSizeText(
                                    cubit.formatDate(
                                      data.encounter?.encounterDate,
                                    ),
                                    style: AppStyle.boldGrey14.copyWith(
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    AppAssets.location,
                                    height: 27.h,
                                    width: 27.w,
                                    fit: BoxFit.scaleDown,
                                  ),
                                  Expanded(
                                    child: AutoSizeText(
                                      data.encounter?.location ?? "",
                                      style: AppStyle.boldGrey14.copyWith(
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 26.h),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12.w,
                                  vertical: 16.h,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AutoSizeText(
                                      "Symptoms & Complaints",
                                      style: AppStyle.boldBlack16,
                                    ),
                                    SizedBox(height: 20.h),
                                    ListView.separated(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) =>
                                          SymptomsComplainsItem(),
                                      separatorBuilder: (context, index) =>
                                          SizedBox(height: 16.h),
                                      itemCount: 2,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 26.h),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12.w,
                                  vertical: 16.h,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AutoSizeText(
                                      "Diagnoses",
                                      style: AppStyle.boldBlack16,
                                    ),
                                    SizedBox(height: 20.h),
                                    ListView.separated(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) =>
                                          DiagnosesItem(
                                            icd11Code:
                                                data
                                                    .encounter
                                                    ?.diagnoses?[index]
                                                    .icd11Code ??
                                                "",
                                            icd11Title:
                                                data
                                                    .encounter
                                                    ?.diagnoses?[index]
                                                    .icd11Title ??
                                                "",
                                            clinicalDescription:
                                                data
                                                    .encounter
                                                    ?.diagnoses?[index]
                                                    .clinicalDescription ??
                                                "",
                                          ),
                                      separatorBuilder: (context, index) =>
                                          SizedBox(height: 16.h),
                                      itemCount:
                                          data.encounter?.diagnoses?.length ??
                                          0,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 26.h),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12.w,
                                  vertical: 16.h,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AutoSizeText(
                                      "Prescribed Medications",
                                      style: AppStyle.boldBlack16,
                                    ),
                                    SizedBox(height: 20.h),
                                    ListView.separated(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) => PrescribedMedicationsItem(
                                        medicationName:
                                            data
                                                .encounter
                                                ?.prescribedMedications?[index]
                                                .medicationName ??
                                            "",
                                        startDate: cubit.formatDate(
                                          DateTime.tryParse(
                                            data
                                                    .encounter
                                                    ?.prescribedMedications?[index]
                                                    .startDate ??
                                                "",
                                          ),
                                        ),
                                        dosageAmount:
                                            data
                                                .encounter
                                                ?.prescribedMedications?[index]
                                                .dosageAmount ??
                                            0,
                                        dosageUnit:
                                            data
                                                .encounter
                                                ?.prescribedMedications?[index]
                                                .dosageUnit ??
                                            "",
                                        from:
                                            data
                                                .encounter
                                                ?.prescribedMedications?[index]
                                                .form ??
                                            "",
                                        frequency:
                                            data
                                                .encounter
                                                ?.prescribedMedications?[index]
                                                .frequency ??
                                            "",
                                        instructions:
                                            data
                                                .encounter
                                                ?.prescribedMedications?[index]
                                                .instructions ??
                                            "",
                                      ),
                                      separatorBuilder: (context, index) =>
                                          SizedBox(height: 16.h),
                                      itemCount:
                                          data
                                              .encounter
                                              ?.prescribedMedications
                                              ?.length ??
                                          0,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20.h),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.r),
                                    ),
                                    backgroundColor: AppColors.teal,
                                  ),
                                  onPressed: () async {
                                    await printPdf(data);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    spacing: 8.w,
                                    children: [
                                      Icon(
                                        Icons.download,
                                        size: 24.sp,
                                        color: AppColors.black,
                                      ),
                                      Expanded(
                                        child: Text(
                                          "Medical History PDF",
                                          style: AppStyle.boldBlack16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return const SizedBox();
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
    );
  }
}

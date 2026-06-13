import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_routes.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/core/utils/dialog_utils.dart';
import 'package:sijil_patient_portal/features/tabs/medical_history/cubit/medical_history_cubit.dart';
import 'package:sijil_patient_portal/features/tabs/medical_history/cubit/medical_history_state.dart';
import 'package:sijil_patient_portal/features/tabs/medical_history/widget/medical_history_item.dart';
import 'package:sijil_patient_portal/features/tabs/medical_history/widget/medical_history_title.dart';

class MedicalHistoryTab extends StatefulWidget {
  const MedicalHistoryTab({super.key});

  @override
  State<MedicalHistoryTab> createState() => _MedicalHistoryTabState();
}

class _MedicalHistoryTabState extends State<MedicalHistoryTab> {
  @override
  void initState() {
    context.read<MedicalHistoryCubit>().getListMedicalHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText("Medical History", style: AppStyle.semiBoldBlack20),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                MedicalHistoryTitle(),
                SizedBox(height: 30.h),
                BlocConsumer<MedicalHistoryCubit, MedicalHistoryState>(
                  listener: (context, state) {
                    if (state is GetListMedicalHistoryError) {
                      DialogUtils.showDialogMessage(message: state.message);
                    }
                  },
                  builder: (context, state) {
                    final cubit = context.read<MedicalHistoryCubit>();
                    if (state is GetListMedicalHistoryLoading) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.6,
                        child: const Center(child: CircularProgressIndicator()),
                      );
                    }
                    if (state is GetListMedicalHistoryError) {
                      DialogUtils.showDialogMessage(message: state.message);
                    }
                    if (state is GetListMedicalHistorySuccess) {
                      final data =
                          state.getListMedicalHistoryResponse.encounters ?? [];
                      return ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => MedicalHistoryItem(
                          doctorName: "${data[index].doctorName}",
                          icd11Code:
                              data[index].primaryDiagnosis?.icd11Code ?? "",
                          icd11Title:
                              data[index].primaryDiagnosis?.icd11Title ?? "",
                          doctorSpeciality: "${data[index].doctorSpeciality}",
                          encounterDate: cubit.formatDate(
                            data[index].encounterDate,
                          ),
                          location: "${data[index].location}",
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              AppRoutes.medicalHistroyDetails,
                              arguments: data[index].encounterId,
                            );
                          },
                        ),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 16.h),
                        itemCount: data.length,
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

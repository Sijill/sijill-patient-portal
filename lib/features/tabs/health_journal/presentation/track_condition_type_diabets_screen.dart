import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/core/utils/dialog_utils.dart';
import 'package:sijil_patient_portal/features/tabs/health_journal/cubit/health_journal_cubit.dart';
import 'package:sijil_patient_portal/features/tabs/health_journal/cubit/health_journal_state.dart';
import 'package:sijil_patient_portal/features/tabs/health_journal/widget/customed_format_data.dart';
import 'package:sijil_patient_portal/features/tabs/health_journal/widget/customed_type_diabetes_item.dart';

class TrackConditionTypeDiabetsScreen extends StatefulWidget {
  const TrackConditionTypeDiabetsScreen({super.key});

  @override
  State<TrackConditionTypeDiabetsScreen> createState() =>
      _TrackConditionTypeDiabetsScreenState();
}

class _TrackConditionTypeDiabetsScreenState
    extends State<TrackConditionTypeDiabetsScreen> {
  late String diagnosisId;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      diagnosisId = ModalRoute.of(context)!.settings.arguments as String;

      context.read<HealthJournalCubit>().getHealthJournalNotesDiagonsesId(
        diagnosisId: diagnosisId,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          context.read<HealthJournalCubit>().getHealthJournalNotes();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: AutoSizeText(
            "Type 2 Diabetes",
            style: AppStyle.semiBoldBlack20,
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
              child: BlocConsumer<HealthJournalCubit, HealthJournalState>(
                listener: (context, state) {
                  if (state is GetHealthJournalNotesDiagonsesIdError) {
                    DialogUtils.showDialogMessage(message: state.message);
                  }
                },
                builder: (context, state) {
                  if (state is GetHealthJournalNotesDiagonsesIdLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is GetHealthJournalNotesDiagonsesIdSuccess) {
                    final data =
                        state.getHealthJournalNotesDiagonsesdResponse.notes;
                    return Column(
                      children: [
                        ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) =>
                              CustomedTypeDiabetesItem(
                                date: CustomedFormatData.formatNoteDate(
                                  data[index].noteDate,
                                ),
                                patientOutcome: "${data[index].patientOutcome}",
                                painLevel: "${data[index].painLevel}",
                                energyLevel: "${data[index].energyLevel}",
                                mood: "${data[index].mood}",
                                patientOutcomeDetails:
                                    "${data[index].patientOutcomeDetails}",
                              ),
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 10.h),
                          itemCount: data!.length,
                        ),
                      ],
                    );
                  }
                  return SizedBox();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

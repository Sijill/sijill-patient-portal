import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_routes.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/core/utils/customed_button.dart';
import 'package:sijil_patient_portal/core/utils/dialog_utils.dart';
import 'package:sijil_patient_portal/features/tabs/health_journal/cubit/health_journal_cubit.dart';
import 'package:sijil_patient_portal/features/tabs/health_journal/cubit/health_journal_state.dart';
import 'package:sijil_patient_portal/features/tabs/health_journal/widget/customed_time_ago.dart';
import 'package:sijil_patient_portal/features/tabs/health_journal/widget/your_tracked_item.dart';

class HealthJournalTab extends StatefulWidget {
  const HealthJournalTab({super.key});

  @override
  State<HealthJournalTab> createState() => _HealthJournalTabState();
}

class _HealthJournalTabState extends State<HealthJournalTab> {
  @override
  void initState() {
    context.read<HealthJournalCubit>().getHealthJournalNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            child: Column(
              children: [
                AutoSizeText("Health Journal", style: AppStyle.semiBoldBlack20),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.w,
                    vertical: 40.h,
                  ),
                  child: CustomedButton(
                    vertical: 5.h,
                    addItem: true,
                    spaceBeforeText: 5.w,
                    preImageName: AppAssets.trackNewSymptom,
                    text: "Track New Symptom",
                    onPressed: () {
                      Navigator.of(
                        context,
                      ).pushNamed(AppRoutes.trackNewSymptomScreen);
                    },
                  ),
                ),

                Row(
                  spacing: 10.w,
                  children: [
                    Icon(Icons.folder, color: AppColors.black, size: 25.sp),
                    AutoSizeText(
                      "Your Tracked Conditions",
                      style: AppStyle.semiBoldBlack20.copyWith(
                        color: AppColors.black,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25.h),
                BlocBuilder<HealthJournalCubit, HealthJournalState>(
                  builder: (context, state) {
                    if (state is GetHealthJournalNotesLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is GetHealthJournalNotesError) {
                      DialogUtils.showDialogMessage(message: state.message);
                    } else if (state is GetHealthJournalNotesSuccess) {
                      final data = state.gethealthJournalNotesResponse;

                      return ListView.separated(
                        itemCount: data.diagnoses?.length ?? 0,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final diagnosis = data.diagnoses?[index];
                          return YourTrackedItem(
                            title: data.diagnoses?[index].icd11Title ?? "",
                            subTitle:
                                "Last entry: ${CustomedTimeAgo.formatLastEntry(diagnosis?.lastEntryDate)}",
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                AppRoutes.trackConditionTypeDiabetsScreen,
                              );
                            },
                          );
                        },
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 20.h),
                      );
                    }
                    return SizedBox();
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

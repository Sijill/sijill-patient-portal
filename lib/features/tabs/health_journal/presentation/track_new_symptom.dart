import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_routes.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/core/utils/customed_button.dart';
import 'package:sijil_patient_portal/core/utils/dialog_utils.dart';
import 'package:sijil_patient_portal/core/utils/validators.dart';
import 'package:sijil_patient_portal/features/tabs/health_journal/cubit/health_journal_cubit.dart';
import 'package:sijil_patient_portal/features/tabs/health_journal/cubit/health_journal_state.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/widget/customed_drop_down.dart';

class TrackNewSymptom extends StatefulWidget {
  const TrackNewSymptom({super.key});

  @override
  State<TrackNewSymptom> createState() => _TrackNewSymptomState();
}

class _TrackNewSymptomState extends State<TrackNewSymptom> {
  int? selectedIndex;

  TextEditingController controller = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  @override
  void initState() {
    context.read<HealthJournalCubit>().getHealthJournalDiagonses();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                        context
                            .read<HealthJournalCubit>()
                            .getHealthJournalNotes();
                      },
                      child: Icon(Icons.arrow_back, size: 25.sp),
                    ),
                    SizedBox(width: 75.w),
                    AutoSizeText(
                      "Health Journal",
                      style: AppStyle.semiBoldBlack20,
                    ),
                  ],
                ),
                SizedBox(height: 70.h),
                AutoSizeText(
                  "Select the diagnosis you want to note about.",
                  style: AppStyle.boldBlack20.copyWith(fontSize: 20.sp),
                ),

                Container(
                  margin: EdgeInsets.only(top: 60.h),
                  padding: EdgeInsets.symmetric(
                    vertical: 20.h,
                    horizontal: 16.w,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.grantAccessContainerColor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: BlocConsumer<HealthJournalCubit, HealthJournalState>(
                    listener: (context, state) {
                      if (state is GetHealthJournalDiagonsesError) {
                        DialogUtils.showDialogMessage(message: state.message);
                      }
                    },
                    builder: (context, state) {
                      final data = context.read<HealthJournalCubit>().data;
                      final diagnoses =
                          data?.diagnoses
                              ?.where(
                                (e) =>
                                    e.diagnosisId != null &&
                                    e.icd11Title != null &&
                                    e.icd11Title!.isNotEmpty,
                              )
                              .toList() ??
                          [];
                      return Form(
                        key: globalKey,
                        child: Column(
                          children: [
                            CustomedDropDown(
                              onValidate: (val) {
                                return AppValidators.validateDiagonses(val);
                              },
                              backgroundColor: AppColors.whiteLight,
                              textColor: AppColors.gray,
                              bottoShowSelectItem: diagnoses
                                  .map((e) => e.icd11Title!)
                                  .toList(),
                              onChanged: (index) {
                                selectedIndex = index;
                              },
                              controller: controller,
                              hint: "Choose a condition...",
                              widthDropdown: double.infinity,
                              bottomSheetHeight: 300.h,
                              bottomSheetRight: 32.w,
                              bottomSheetLeft: 32.w,
                              heightDrobdown: 150.h,
                            ),
                            SizedBox(height: 20.h),
                            CustomedButton(
                              backgroundColor: AppColors.tabBarSelectedColor,
                              text: "Continue",
                              onPressed: () {
                                if (globalKey.currentState!.validate()) {
                                  Navigator.of(context).pushNamed(
                                    AppRoutes.typeDiabetsScreen,
                                    arguments: data!
                                        .diagnoses![selectedIndex!]
                                        .diagnosisId,
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      );
                    },
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

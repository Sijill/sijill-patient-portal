import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_routes.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/core/utils/dialog_utils.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/cubit/permission_token_cubit.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/cubit/permission_token_state.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/widget/customed_imaging_center_laboratory.dart';

class GrantAccessImagingCenterScreen extends StatefulWidget {
  const GrantAccessImagingCenterScreen({super.key});

  @override
  State<GrantAccessImagingCenterScreen> createState() =>
      _GrantAccessImagingCenterScreenState();
}

class _GrantAccessImagingCenterScreenState
    extends State<GrantAccessImagingCenterScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PermissionTokenCubit>().getListPatientActiveImagingOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText("Grant Access", style: AppStyle.semiBoldBlack20),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
            child: Column(
              children: [
                BlocConsumer<PermissionTokenCubit, PermissionTokenState>(
                  listener: (context, state) {
                    if (state is GenerateImagingPermissionTokenLoading) {
                      DialogUtils.showLoading(context);
                    } else if (state is GenerateImagingPermissionTokenError) {
                      DialogUtils.hideLoading(context);
                      DialogUtils.showDialogMessage(message: state.message);
                    } else if (state is GenerateImagingPermissionTokenSuccess) {
                      final viewModel =
                          state.generateImagingPermissionTokenResponse;
                      DialogUtils.hideLoading(context);
                      Navigator.of(context).pushNamed(
                        AppRoutes.grantAccessPermissionTokenImagingOrderScreen,
                        arguments: viewModel,
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is GetListPatientActiveImagingOrdersLoading) {
                      return SizedBox(
                        height: 300.h,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: AppColors.teal,
                          ),
                        ),
                      );
                    } else if (state
                        is GetListPatientActiveImagingOrdersError) {
                      DialogUtils.showDialogMessage(message: state.message);
                    } else if (state
                        is GetListPatientActiveImagingOrdersSuccess) {
                      final imagingOrder =
                          state
                              .getListPatientActiveImagingOrdersResponse
                              .orders ??
                          [];
                      return ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) =>
                            CustomedImagingCenterLaboratory(
                              imageName: AppAssets.imaging,
                              title1:
                                  "Ordered By: ${imagingOrder[index].orderedBy ?? ""}",
                              title2:
                                  "Ordered At: ${DateFormat('EEEE, MMM d').format(imagingOrder[index].orderedAt!)}",
                              onPressed: () {
                                context
                                    .read<PermissionTokenCubit>()
                                    .generateImagingpermissionToken(
                                      orderId:
                                          imagingOrder[index].orderId ?? "",
                                    );
                              },
                            ),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 20.h),
                        itemCount: imagingOrder.length,
                      );
                    }
                    return const SizedBox();
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

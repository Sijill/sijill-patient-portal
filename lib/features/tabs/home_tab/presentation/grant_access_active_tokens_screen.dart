import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/core/utils/dialog_utils.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/cubit/permission_token_cubit.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/cubit/permission_token_state.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/widget/customed_active_tokens_item.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/widget/no_active_permission_token.dart';

class GrantAccessActiveTokensScreen extends StatefulWidget {
  const GrantAccessActiveTokensScreen({super.key});

  @override
  State<GrantAccessActiveTokensScreen> createState() =>
      _GrantAccessActiveTokensScreenState();
}

class _GrantAccessActiveTokensScreenState
    extends State<GrantAccessActiveTokensScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PermissionTokenCubit>().getPermissionToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText("Active Tokens", style: AppStyle.semiBoldBlack20),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SafeArea(
          child: BlocBuilder<PermissionTokenCubit, PermissionTokenState>(
            builder: (context, state) {
              final tokenList =
                  context
                      .read<PermissionTokenCubit>()
                      .getPermissionTokenResponse
                      ?.getTokenList ??
                  [];
              if (state is GetPermissionTokenILoading) {
                return Center(
                  child: CircularProgressIndicator(color: AppColors.teal),
                );
              } else if (state is GetPermissionTokenError) {
                DialogUtils.showDialogMessage(message: state.message);
              } else if (tokenList.isEmpty) {
                return NoActivePermissionToken();
              }
              return ListView.separated(
                itemBuilder: (context, index) {
                  return CustomedActiveTokensItem(
                    accessTo: tokenList[index].entityType ?? "",
                    accessType: tokenList[index].accessType ?? "",
                    experiseAt: DateFormat(
                      'EEEE, MMM d',
                    ).format(tokenList[index].expiresAt!),
                  );
                },

                itemCount: tokenList.length,
                separatorBuilder: (context, index) => SizedBox(height: 15.h),
              );
            },
          ),
        ),
      ),
    );
  }
}

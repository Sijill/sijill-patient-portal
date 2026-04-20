import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';

class CustomedPermissionTokenItem extends StatelessWidget {
  final String accessEntity;
  final String accessType;
  final String expertAt;

  const CustomedPermissionTokenItem({
    super.key,
    required this.accessEntity,
    required this.accessType,
    required this.expertAt,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.grantAccessContainerColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                AutoSizeText(
                  "Access To: ",
                  style: AppStyle.mediumBlack16.copyWith(color: AppColors.gray),
                ),
                AutoSizeText(accessEntity, style: AppStyle.mediumBlack16),
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                AutoSizeText(
                  "Access Type: ",
                  style: AppStyle.mediumBlack16.copyWith(color: AppColors.gray),
                ),
                AutoSizeText(accessType, style: AppStyle.mediumBlack16),
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                AutoSizeText(
                  "Expires At: ",
                  style: AppStyle.mediumBlack16.copyWith(color: AppColors.gray),
                ),
                Expanded(
                  child: AutoSizeText(
                    expertAt,
                    style: AppStyle.mediumBlack16.copyWith(
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

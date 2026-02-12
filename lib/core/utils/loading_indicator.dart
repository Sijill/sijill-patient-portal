import 'package:flutter/material.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(color: AppColors.darkBlue));
  }
}

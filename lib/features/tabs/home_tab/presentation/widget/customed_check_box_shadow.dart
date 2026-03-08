import 'package:flutter/material.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';

class CustomedCheckBoxShadow extends StatelessWidget {
  final void Function(bool?)? onChanged;
  final int index;
  final Set<int> choiceValue;
  const CustomedCheckBoxShadow({
    super.key,
    this.onChanged,
    required this.index,
    required this.choiceValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: choiceValue.contains(index)
            ? [
                BoxShadow(
                  color: AppColors.lightGreen,
                  blurRadius: 7,
                  spreadRadius: 0.1,
                ),
              ]
            : [],
      ),
      child: Checkbox(
        shape: const CircleBorder(),
        activeColor: AppColors.green,
        value: choiceValue.contains(index),
        onChanged: onChanged,
      ),
    );
  }
}

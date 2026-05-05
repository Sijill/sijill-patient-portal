import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';

class PainLevelSelector extends StatefulWidget {
  final bool isEnergy;
  final Function(int index)? onChanged;
  const PainLevelSelector({
    super.key,
    required this.isEnergy,
    required this.onChanged,
  });

  @override
  State<PainLevelSelector> createState() => _PainLevelSelectorState();
}

class _PainLevelSelectorState extends State<PainLevelSelector> {
  int selectedIndex = -1;

  Color getPainLevelColor(int index) {
    if (index < 2) return AppColors.green1;
    if (index == 2) return AppColors.darkGreen;
    if (index == 3) return AppColors.green2;
    if (index <= 5) return AppColors.orangeAccent;
    if (index == 6) return AppColors.orange;
    if (index == 7) return AppColors.red2;
    if (index == 8) return AppColors.red;
    return AppColors.darkRed;
  }

  Color getEnergyLevelColor(int index) {
    if (index == 0) return AppColors.darkRed;
    if (index == 1) return AppColors.red;
    if (index == 2) return AppColors.red2;
    if (index == 3) return AppColors.red2;
    if (index == 4) return AppColors.orangeAccent;
    if (index <= 5) return AppColors.orangeAccent;
    if (index == 6) return AppColors.orange;
    if (index == 7) return AppColors.green2;
    if (index == 8) return AppColors.darkGreen;
    return AppColors.green1;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20.w, top: 16.h),
      padding: EdgeInsets.only(top: 10.h, bottom: 10.h, left: 10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.tabBarUnSelectedColor,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(10, (index) {
            final isSelected = selectedIndex == index;

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                  if (widget.onChanged != null) {
                    widget.onChanged!(index);
                  }
                });
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 4.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: selectedIndex != -1 && isSelected
                      ? Border.all(color: AppColors.black, width: 3)
                      : null,
                ),
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: widget.isEnergy
                      ? getEnergyLevelColor(index)
                      : getPainLevelColor(index),
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';

class TypingIndicator extends StatefulWidget {
  const TypingIndicator({super.key});

  @override
  State<TypingIndicator> createState() => _TypingIndicatorState();
}

class _TypingIndicatorState extends State<TypingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget buildDot(int index, Color color) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final value = ((_controller.value - index * 0.2) % 1.0).clamp(0.0, 1.0);

        final scale = 0.6 + (0.4 * (1 - (value - 0.5).abs() * 2));

        return Transform.scale(scale: scale, child: child);
      },
      child: Container(
        width: 8.w,
        height: 10.h,
        margin: EdgeInsets.symmetric(horizontal: 3.w),
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildDot(0, AppColors.borderLeftColor),
        buildDot(1, AppColors.tabBarSelectedColor),
        buildDot(2, AppColors.borderLeftColor),
      ],
    );
  }
}

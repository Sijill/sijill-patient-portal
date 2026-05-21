import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/widget/appointments_item.dart';

class AppointmentsTab extends StatelessWidget {
  const AppointmentsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(top: 30.h),
      itemBuilder: (context, index) => AppointmentsItem(
        hcp: "Dr. Ahmad Hasan",
        dataTime: "May 20, 2026 at 9:00 AM",
        location: "Cairo Medical Center",
        onTap: () {},
      ),
      separatorBuilder: (context, index) => SizedBox(height: 20.h),
      itemCount: 3,
    );
  }
}

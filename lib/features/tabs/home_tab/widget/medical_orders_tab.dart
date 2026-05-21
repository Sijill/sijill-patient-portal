import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/widget/medical_order_iem.dart';

class MedicalOrdersTab extends StatelessWidget {
  const MedicalOrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(top: 30.h),
      itemBuilder: (context, index) => MedicalOrderIem(
        type: "Complete Blood Count",
        prioity: "Urgen",
        orderedBy: "Dr. Gluteus Maximus",
        orderdAt: "May 9, 2026",
        bodyPart: "Abdomen",
        dismissClick: () {},
        index: index,
      ),
      separatorBuilder: (context, index) => SizedBox(height: 30.h),
      itemCount: 2,
    );
  }
}

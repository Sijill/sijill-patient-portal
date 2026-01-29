import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';

import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/features/home/widget/customed_overview_item.dart';
import 'package:sijil_patient_portal/features/home/widget/customed_time_line.dart';

typedef Onpressed = void Function();

class CustomedHomeItem extends StatelessWidget {
  const CustomedHomeItem({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Container(
      height: height * 0.37,
      width: width,
      padding: EdgeInsets.symmetric(
        vertical: height * 0.001,
        horizontal: width * 0.001,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: width * 0.06, top: height * 0.01),
            child: Text("Overview", style: AppStyle.meiumDarkBlue16),
          ),
          SizedBox(height: height * 0.01),
          Row(
            children: [
              CustomedOverviewItem(
                imageName: AppAssets.pendingMedications,
                number: "3",
                numberColor: AppColors.black,
                title: "Pending",
                subTitle: "Medications",
              ),

              CustomedOverviewItem(
                imageName: AppAssets.upcomingAppoinments,
                number: "2",
                numberColor: AppColors.brown,
                title: "Upcoming",
                subTitle: "Appointments",
              ),

              CustomedOverviewItem(
                imageName: AppAssets.pendingTestOrders,
                number: "1",
                title: "Pending",
                subTitle: "Test Orders",
              ),
            ],
          ),
          SizedBox(height: height * 0.02),
          Padding(
            padding: EdgeInsets.only(left: width * 0.06),
            child: Text("Today's Schedule", style: AppStyle.meiumDarkBlue16),
          ),
          SizedBox(height: height * 0.02),
          CustomedTimeLine(),
        ],
      ),
    );
  }
}

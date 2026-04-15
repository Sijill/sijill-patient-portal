import 'package:flutter/material.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:timeline_list/timeline_list.dart';

class CustomedTimeLine extends StatelessWidget {
  CustomedTimeLine({super.key});
  final List<Map<String, String>> todaySchedule = [
    {"time": "09:00 AM", "appointment": "Take Metformin"},
    {"time": "10:00 AM", "appointment": "Doctor Appointment"},
    {"time": "03:00 PM", "appointment": "Take Metformin"},
    {"time": "09:00 PM", "appointment": "Doctor Appointment"},
  ];

  final checkIcon = Container(
    width: 16,
    height: 16,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: AppColors.primaryColor,
    ),
  );
  final emptyIcon = Container(
    width: 16,
    height: 16,
    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
  );

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return Expanded(
      child: Timeline.builder(
        context: context,
        markerCount: todaySchedule.length,
        properties: TimelineProperties(
          iconAlignment: MarkerIconAlignment.center,
          iconSize: 16,
          timelinePosition: TimelinePosition.start,
        ),
        markerBuilder: (context, index) => Marker(
          child: RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: [
                TextSpan(
                  text: todaySchedule[index]['time'],
                  style: AppStyle.meduimGray14,
                ),
                WidgetSpan(child: SizedBox(width: width * 0.06)),
                TextSpan(
                  text: todaySchedule[index]['appointment'],
                  style: AppStyle.meduimBlack14,
                ),
              ],
            ),
          ),

          icon: index >= 2 ? emptyIcon : checkIcon,
          position: MarkerPosition.left,
        ),
      ),
    );
  }
}

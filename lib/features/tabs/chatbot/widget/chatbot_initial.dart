import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_routes.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/features/tabs/chatbot/widget/custom_suggestion.dart';

class ChatbotInitial extends StatelessWidget {
  const ChatbotInitial({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(AppRoutes.chatbotArchive);
            },
            child: Image.asset(
              AppAssets.archive,
              height: 40.h,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: 30.h),
          Center(
            child: Image.asset(
              AppAssets.chatbot,
              height: 100.h,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: 20.h),
          Center(
            child: AutoSizeText(
              "How Can I Help You [X]",
              style: AppStyle.meduimBlack20,
            ),
          ),
          SizedBox(height: 10.h),
          Center(
            child: AutoSizeText(
              "Your AI Health Assistant",
              style: AppStyle.meduimBlack14,
            ),
          ),
          SizedBox(height: 20.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(color: AppColors.darkBlue),
            ),
            child: Column(
              spacing: 10.h,
              children: [
                CustomSuggestion(
                  icon: Icons.medication_outlined,
                  title: "What medication am I taking? ",
                  onTap: () {},
                ),
                Divider(),
                CustomSuggestion(
                  icon: Icons.science_outlined,
                  title: "Show my latest lab reslts? ",
                  onTap: () {},
                ),
                Divider(),
                CustomSuggestion(
                  icon: Icons.health_and_safety_outlined,
                  title: "Exlain may diagnosis? ",
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

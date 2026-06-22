import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/core/utils/custom_text_field.dart';

class ChatbotArchive extends StatelessWidget {
  const ChatbotArchive({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          "Chats",
          style: AppStyle.boldBlack20.copyWith(fontSize: 22.sp),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.delete, size: 25.sp, color: AppColors.red),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                edgeInsets: EdgeInsets.symmetric(vertical: 16.h),
                raduis: 20.r,
                fillColor: AppColors.tabBarUnSelectedColor,
                prefixIcon: Icon(
                  Icons.search,
                  size: 25.sp,
                  color: AppColors.darkBlue,
                ),
                hint: "Search Chats",
                hintStyle: AppStyle.mediumGray14.copyWith(fontSize: 15.sp),
              ),
              SizedBox(height: 25.h),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.tabBarUnSelectedColor,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        "Having Blood Pressure Concerns",
                        style: AppStyle.boldBlack14,
                      ),
                      SizedBox(height: 8.h),
                      AutoSizeText(
                        // DateFormat('MMMM d, yyyy').format(),
                        "March 3, 2026",
                        style: AppStyle.mediumGray14,
                      ),
                    ],
                  ),
                ),
                separatorBuilder: (context, index) => SizedBox(height: 20.h),
                itemCount: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

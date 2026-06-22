import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:sijil_patient_portal/api/model/chatbot/chat_message.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/core/utils/custom_text_field.dart';
import 'package:sijil_patient_portal/features/tabs/chatbot/widget/chatbot_initial.dart';

class Chatbot extends StatefulWidget {
  const Chatbot({super.key});

  @override
  State<Chatbot> createState() => _ChatbotState();
}

class _ChatbotState extends State<Chatbot> {
  TextEditingController controller = TextEditingController();

  List<ChatMessage> chat = [];

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: chat.isEmpty
                    ? ChatbotInitial()
                    : Column(
                        children: [
                          Image.asset(AppAssets.chatbot),
                          SizedBox(height: 10.h),
                          Divider(),
                          SizedBox(height: 10.h),
                          Expanded(
                            child: ListView.separated(
                              itemBuilder: (context, index) => Align(
                                alignment: chat[index].isUser
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                                child: Container(
                                  padding: EdgeInsets.all(12.w),
                                  decoration: BoxDecoration(
                                    color: chat[index].isUser
                                        ? AppColors.tabBarUnSelectedColor
                                        : Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(16.r),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        chat[index].text,
                                        style: AppStyle.meduimBlack14,
                                      ),
                                      SizedBox(height: 6.h),
                                      Text(
                                        DateFormat(
                                          'hh:mm a',
                                        ).format(chat[index].time),
                                        style: AppStyle.mediumGray14.copyWith(
                                          fontSize: 11.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              separatorBuilder: (context, index) =>
                                  SizedBox(height: 20.h),
                              itemCount: chat.length,
                            ),
                          ),
                        ],
                      ),
              ),
              SizedBox(height: 10.h),
              AnimatedPadding(
                duration: const Duration(milliseconds: 200),
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),

                child: Row(
                  spacing: 10.w,
                  children: [
                    Expanded(
                      flex: 9,
                      child: CustomTextField(
                        minLines: 1,
                        maxLines: 3,
                        controller: controller,
                        fillColor: AppColors.tabBarUnSelectedColor,
                        borderColor: AppColors.tabBarUnSelectedColor,
                        raduis: 20.r,
                        hint: "Type a message...",
                        hintStyle: AppStyle.mediumGray14,
                        edgeInsets: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 12.h,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: InkWell(
                        onTap: () {
                          if (controller.text.trim().isEmpty) return;

                          setState(() {
                            chat.add(
                              ChatMessage(
                                text: controller.text,
                                time: DateTime.now(),
                                isUser: true,
                              ),
                            );
                          });

                          controller.clear();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 5.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.tabBarUnSelectedColor,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Image.asset(
                            AppAssets.send,
                            height: 28.h,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/core/utils/custom_text_field.dart';
import 'package:sijil_patient_portal/core/utils/dialog_utils.dart';
import 'package:sijil_patient_portal/domain/entities/chat/request/chat_message.dart';
import 'package:sijil_patient_portal/domain/entities/chat/request/chat_screen_args.dart';
import 'package:sijil_patient_portal/domain/entities/chat/request/send_message_to_ai_assistant_request/send_message_to_ai_assistant_request.dart';
import 'package:sijil_patient_portal/domain/entities/chat/response/create_new_chat_session_response/session.dart';
import 'package:sijil_patient_portal/features/tabs/chatbot/cubit/chat_cubit.dart';
import 'package:sijil_patient_portal/features/tabs/chatbot/cubit/chat_state.dart';
import 'package:sijil_patient_portal/features/tabs/chatbot/widget/typing_indicator.dart';

class SendMessageToChatbot extends StatefulWidget {
  const SendMessageToChatbot({super.key});

  @override
  State<SendMessageToChatbot> createState() => _SendMessageToChatbotState();
}

class _SendMessageToChatbotState extends State<SendMessageToChatbot> {
  final TextEditingController controller = TextEditingController();

  final List<ChatMessage> chat = [];

  bool isAiTyping = true;
  bool initialized = false;

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ChatScreenArgs;

    final Session session = args.session;

    if (!initialized) {
      initialized = true;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          chat.add(
            ChatMessage(
              text: args.firstMessage,
              isUser: true,
              time: DateTime.now(),
            ),
          );
        });
      });
    }

    return BlocListener<ChatCubit, ChatState>(
      listener: (context, state) {
        if (state is SendMessageToAiAssistantSuccess) {
          final data = state.sendMessageToAiAssistantResponse;
          setState(() {
            isAiTyping = false;

            chat.add(
              ChatMessage(
                text: data.assistantMessage!.content!,
                isUser: false,
                time: DateTime.now(),
              ),
            );
          });
        }
        if (state is SendMessageToAiAssistantError) {
          setState(() {
            isAiTyping = false;
            DialogUtils.showDialogMessage(message: state.message);
          });
        }

        if (state is SendMessageToAiAssistantLoading) {
          setState(() {
            isAiTyping = true;
          });
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: 20.w,
              right: 20.w,
              bottom: 20.h,
              top: 10.h,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(Icons.arrow_back, size: 30.sp),
                    ),
                    SizedBox(width: 90.w),
                    Image.asset(
                      AppAssets.chatbot,
                      height: 90.h,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),

                SizedBox(height: 10.h),

                Divider(),

                SizedBox(height: 10.h),

                Expanded(
                  child: ListView.separated(
                    itemCount: chat.length + (isAiTyping ? 1 : 0),

                    separatorBuilder: (_, _) => SizedBox(height: 20.h),

                    itemBuilder: (context, index) {
                      if (isAiTyping && index == chat.length) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              AppAssets.chatbot,
                              height: 40.h,
                              fit: BoxFit.fill,
                            ),

                            SizedBox(width: 10.w),

                            Container(
                              padding: EdgeInsets.all(12.w),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              child: SizedBox(
                                width: 45.w,
                                height: 20.h,
                                child: const TypingIndicator(),
                              ),
                            ),
                          ],
                        );
                      }

                      final message = chat[index];

                      return Align(
                        alignment: message.isUser
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          constraints: BoxConstraints(maxWidth: 0.75.sw),
                          padding: EdgeInsets.all(12.w),
                          decoration: BoxDecoration(
                            color: message.isUser
                                ? AppColors.tabBarUnSelectedColor
                                : Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(message.text, style: AppStyle.meduimBlack14),

                              SizedBox(height: 6.h),

                              Text(
                                DateFormat('hh:mm a').format(message.time),
                                style: AppStyle.mediumGray14.copyWith(
                                  fontSize: 11.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Expanded(
                      flex: 9,
                      child: CustomTextField(
                        controller: controller,
                        minLines: 1,
                        maxLines: 3,
                        fillColor: AppColors.tabBarUnSelectedColor,
                        borderColor: AppColors.tabBarUnSelectedColor,
                        raduis: 20.r,
                        hint: "Type a message...",
                      ),
                    ),

                    SizedBox(width: 10.w),

                    Expanded(
                      flex: 2,
                      child: InkWell(
                        onTap: controller.text.trim().isEmpty
                            ? null
                            : () {
                                final message = controller.text.trim();

                                setState(() {
                                  chat.add(
                                    ChatMessage(
                                      text: message,
                                      isUser: true,
                                      time: DateTime.now(),
                                    ),
                                  );

                                  isAiTyping = true;
                                });

                                controller.clear();

                                context
                                    .read<ChatCubit>()
                                    .sendMessageToAiAssistant(
                                      sessionId: session.id!,
                                      sendMessageToAiAssistantRequest:
                                          SendMessageToAiAssistantRequest(
                                            content: message,
                                          ),
                                    );
                              },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 5.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: controller.text.trim().isEmpty
                                ? AppColors.tabBarUnSelectedColor.withAlpha(50)
                                : AppColors.tabBarUnSelectedColor,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
import 'package:sijil_patient_portal/domain/entities/chat/request/send_message_to_ai_assistant_request/send_message_to_ai_assistant_request.dart';
import 'package:sijil_patient_portal/features/tabs/chatbot/cubit/chat_cubit.dart';
import 'package:sijil_patient_portal/features/tabs/chatbot/cubit/chat_state.dart';
import 'package:sijil_patient_portal/features/tabs/chatbot/widget/typing_indicator.dart';

class ChatRecentWithMessage extends StatefulWidget {
  const ChatRecentWithMessage({super.key});

  @override
  State<ChatRecentWithMessage> createState() => _ChatRecentWithMessageState();
}

class _ChatRecentWithMessageState extends State<ChatRecentWithMessage> {
  final TextEditingController controller = TextEditingController();

  List<ChatMessage> chat = [];

  bool isAiTyping = false;
  bool initialized = false;

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!initialized) {
      initialized = true;

      final cubit = context.read<ChatCubit>();

      final messages = cubit.chatSessionWithMessage?.messages ?? [];

      chat = messages.map((message) {
        return ChatMessage(
          text: message.content ?? "",
          isUser: message.role == "user",
          time: message.createdAt ?? DateTime.now(),
        );
      }).toList();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChatCubit>();

    final sessionId = cubit.chatSessionWithMessage?.session?.id ?? "";

    return BlocListener<ChatCubit, ChatState>(
      listener: (context, state) {
        if (state is SendMessageToAiAssistantLoading) {
          setState(() {
            isAiTyping = true;
          });
        }

        if (state is SendMessageToAiAssistantSuccess) {
          setState(() {
            isAiTyping = false;

            chat.add(
              ChatMessage(
                text:
                    state
                        .sendMessageToAiAssistantResponse
                        .assistantMessage
                        ?.content ??
                    "",
                isUser: false,
                time: DateTime.now(),
              ),
            );
          });
        }

        if (state is SendMessageToAiAssistantError) {
          setState(() {
            isAiTyping = false;
          });

          DialogUtils.showDialogMessage(message: state.message);
        }
      },
      child: PopScope(
        onPopInvokedWithResult: (didPop, result) {
          context.read<ChatCubit>().getListChatSession();
        },
        child: Scaffold(
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
                        onTap: () => Navigator.pop(context),
                        child: Icon(Icons.arrow_back, size: 30.sp),
                      ),
                      const Spacer(),
                      Image.asset(AppAssets.chatbot, height: 90.h),
                      const Spacer(),
                    ],
                  ),

                  SizedBox(height: 10.h),

                  const Divider(),

                  SizedBox(height: 10.h),

                  Expanded(
                    child: ListView.separated(
                      itemCount: chat.length + (isAiTyping ? 1 : 0),
                      separatorBuilder: (_, _) => SizedBox(height: 20.h),
                      itemBuilder: (context, index) {
                        if (isAiTyping && index == chat.length) {
                          return Row(
                            children: [
                              Image.asset(AppAssets.chatbot, height: 40.h),
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
                                Text(
                                  message.text,
                                  style: AppStyle.meduimBlack14,
                                ),

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
                                  });

                                  controller.clear();

                                  context
                                      .read<ChatCubit>()
                                      .sendMessageToAiAssistant(
                                        sessionId: sessionId,
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
                                  ? AppColors.tabBarUnSelectedColor.withAlpha(
                                      50,
                                    )
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
      ),
    );
  }
}

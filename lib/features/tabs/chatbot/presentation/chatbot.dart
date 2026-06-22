import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_routes.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/core/utils/custom_text_field.dart';
import 'package:sijil_patient_portal/core/utils/dialog_utils.dart';
import 'package:sijil_patient_portal/domain/entities/chat/request/chat_screen_args.dart';
import 'package:sijil_patient_portal/domain/entities/chat/request/create_new_chat_session_request/create_new_chat_session_request.dart';
import 'package:sijil_patient_portal/domain/entities/chat/request/send_message_to_ai_assistant_request/send_message_to_ai_assistant_request.dart';
import 'package:sijil_patient_portal/features/tabs/chatbot/cubit/chat_cubit.dart';
import 'package:sijil_patient_portal/features/tabs/chatbot/cubit/chat_state.dart';
import 'package:sijil_patient_portal/features/tabs/chatbot/widget/custom_suggestion.dart';

class Chatbot extends StatefulWidget {
  const Chatbot({super.key});

  @override
  State<Chatbot> createState() => _ChatbotState();
}

class _ChatbotState extends State<Chatbot> {
  TextEditingController controller = TextEditingController();

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

  void fillMessage(String message) {
    setState(() {
      controller.text = message;
      controller.selection = TextSelection.fromPosition(
        TextPosition(offset: message.length),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: SingleChildScrollView(
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
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 10.h,
                  ),
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
                        onTap: () =>
                            fillMessage("What medication am I taking?"),
                      ),
                      Divider(),
                      CustomSuggestion(
                        icon: Icons.science_outlined,
                        title: "Show my latest lab reslts? ",
                        onTap: () => fillMessage("Show my latest lab results?"),
                      ),
                      Divider(),
                      CustomSuggestion(
                        icon: Icons.health_and_safety_outlined,
                        title: "Exlain may diagnosis? ",
                        onTap: () => fillMessage("Explain my diagnosis?"),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 90.h),
                BlocListener<ChatCubit, ChatState>(
                  listener: (context, state) {
                    if (state is CreateNewChatSessionError) {
                      DialogUtils.showDialogMessage(message: state.message);
                    } else if (state is CreateNewChatSessionSuccess) {
                      final session = state.createChatSessionResponse.session;

                      Navigator.of(context)
                          .pushNamed(
                            AppRoutes.sendMessageToChatbot,
                            arguments: ChatScreenArgs(
                              session: session!,
                              firstMessage: controller.text,
                            ),
                          )
                          .then((value) {
                            controller.clear();
                          });
                      context.read<ChatCubit>().sendMessageToAiAssistant(
                        sessionId: session.id!,
                        sendMessageToAiAssistantRequest:
                            SendMessageToAiAssistantRequest(
                              content: controller.text,
                            ),
                      );
                    }
                  },
                  child: Row(
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
                          onTap: controller.text.isEmpty
                              ? null
                              : () {
                                  context
                                      .read<ChatCubit>()
                                      .createNewChatSession(
                                        createNewChatSessionRequest:
                                            CreateNewChatSessionRequest(
                                              title: controller.text,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

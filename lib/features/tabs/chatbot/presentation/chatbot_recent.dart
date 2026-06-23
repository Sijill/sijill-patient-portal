import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/core/utils/custom_text_field.dart';
import 'package:sijil_patient_portal/core/utils/dialog_utils.dart';
import 'package:sijil_patient_portal/domain/entities/chat/response/create_new_chat_session_response/session.dart';
import 'package:sijil_patient_portal/features/tabs/chatbot/cubit/chat_cubit.dart';
import 'package:sijil_patient_portal/features/tabs/chatbot/cubit/chat_state.dart';
import 'package:sijil_patient_portal/features/tabs/chatbot/widget/chatbot_recent_item.dart';

class ChatbotRecent extends StatefulWidget {
  const ChatbotRecent({super.key});

  @override
  State<ChatbotRecent> createState() => _ChatbotRecentState();
}

class _ChatbotRecentState extends State<ChatbotRecent> {
  @override
  void initState() {
    super.initState();

    context.read<ChatCubit>().getListChatSession();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: AutoSizeText(
              "Chats",
              style: AppStyle.boldBlack20.copyWith(fontSize: 22.sp),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  DialogUtils.showAwesomeDialogMessage(
                    context: context,
                    message: "Are you sure about deleting it?",
                    btnOkOnPress: () {
                      context.read<ChatCubit>().deleteAllChatSession();
                    },
                  );
                },
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
                    onChanged: (value) {
                      context.read<ChatCubit>().searchSessions(value!);
                    },
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
                  BlocBuilder<ChatCubit, ChatState>(
                    builder: (context, state) {
                      List<Session> data = [];
                      if (state is GetListChatSessionLoading) {
                        return SizedBox(
                          height: 400.h,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: AppColors.teal,
                            ),
                          ),
                        );
                      } else if (state is GetListChatSessionError) {
                        DialogUtils.showDialogMessage(message: state.message);
                      } else if (state is GetListChatSessionSuccess) {
                        data = state.listChatSessionResponse.sessions ?? [];
                      } else if (state is SearchChatSessionSuccess) {
                        data = state.filteredSessions;
                      }
                      return ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => ChatbotRecentItem(
                          title: "${data[index].title}",
                          time: DateFormat(
                            'MMMM d, yyyy',
                          ).format(data[index].createdAt!),
                        ),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 20.h),
                        itemCount: data.length,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

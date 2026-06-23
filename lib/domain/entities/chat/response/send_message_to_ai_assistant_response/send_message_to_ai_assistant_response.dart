import 'package:sijil_patient_portal/domain/entities/chat/response/send_message_to_ai_assistant_response/assistant_message.dart';
import 'package:sijil_patient_portal/domain/entities/chat/response/send_message_to_ai_assistant_response/meta.dart';
import 'package:sijil_patient_portal/domain/entities/chat/response/send_message_to_ai_assistant_response/session_send_message.dart';
import 'package:sijil_patient_portal/domain/entities/chat/response/send_message_to_ai_assistant_response/user_message.dart';

class SendMessageToAiAssistantResponse {
  UserMessage? userMessage;
  AssistantMessage? assistantMessage;
  SessionSendMessage? session;
  Meta? meta;

  SendMessageToAiAssistantResponse({
    this.userMessage,
    this.assistantMessage,
    this.session,
    this.meta,
  });
}

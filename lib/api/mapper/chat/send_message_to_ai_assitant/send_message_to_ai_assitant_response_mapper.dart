import 'package:sijil_patient_portal/api/mapper/chat/send_message_to_ai_assitant/assistant_message_mapper.dart';
import 'package:sijil_patient_portal/api/mapper/chat/send_message_to_ai_assitant/meta_mapper.dart';
import 'package:sijil_patient_portal/api/mapper/chat/send_message_to_ai_assitant/session_send_message_mapper.dart';
import 'package:sijil_patient_portal/api/mapper/chat/send_message_to_ai_assitant/user_message_mapper.dart';
import 'package:sijil_patient_portal/api/model/chat/response/send_message_to_ai_assistant_response/send_message_to_ai_assistant_response_dto.dart';
import 'package:sijil_patient_portal/domain/entities/chat/response/send_message_to_ai_assistant_response/send_message_to_ai_assistant_response.dart';

extension SendMessageToAiAssitantResponseMapper
    on SendMessageToAiAssistantResponseDto {
  SendMessageToAiAssistantResponse convertToSendMessageToAiAssistantResponse() {
    return SendMessageToAiAssistantResponse(
      assistantMessage: assistantMessage?.convertToAssistantMessage(),
      meta: meta?.convertToMeta(),
      session: session?.convertToSessionSendMessage(),
      userMessage: userMessage?.convertToUserMessage(),
    );
  }
}

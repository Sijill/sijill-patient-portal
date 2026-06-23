import 'package:sijil_patient_portal/api/model/chat/response/send_message_to_ai_assistant_response/assistant_message_dto.dart';
import 'package:sijil_patient_portal/domain/entities/chat/response/send_message_to_ai_assistant_response/assistant_message.dart';

extension AssistantMessageMapper on AssistantMessageDto {
  AssistantMessage convertToAssistantMessage() {
    return AssistantMessage(
      content: content,
      createdAt: createdAt,
      id: id,
      role: role,
    );
  }
}

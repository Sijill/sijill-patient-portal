import 'package:sijil_patient_portal/api/model/chat/request/send_message_to_ai_assistant_request/send_message_to_ai_assistant_request_dto.dart';
import 'package:sijil_patient_portal/domain/entities/chat/request/send_message_to_ai_assistant_request/send_message_to_ai_assistant_request.dart';

extension SendMessageToAiAssitantRequestMapper
    on SendMessageToAiAssistantRequest {
  SendMessageToAiAssistantRequestDto
  convertToSendMessageToAiAssistantRequestDto() {
    return SendMessageToAiAssistantRequestDto(content: content);
  }
}

import 'package:sijil_patient_portal/api/model/chat/response/send_message_to_ai_assistant_response/session_send_message_dto.dart';
import 'package:sijil_patient_portal/domain/entities/chat/response/send_message_to_ai_assistant_response/session_send_message.dart';

extension SessionSendMessageMapper on SessionSendMessageDto {
  SessionSendMessage convertToSessionSendMessage() {
    return SessionSendMessage(id: id, messageCount: messageCount, title: title);
  }
}

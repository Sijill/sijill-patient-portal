import 'package:sijil_patient_portal/api/model/chat/response/get_chat_session_with_message_response/message_dto.dart';
import 'package:sijil_patient_portal/domain/entities/chat/response/get_chat_session_with_message_response/message.dart';

extension MessageMapper on MessageDto {
  Message convertToMessage() {
    return Message(
      content: content,
      createdAt: createdAt,
      id: id,
      role: role,
      metadata: metadata,
      sessionId: sessionId,
    );
  }
}

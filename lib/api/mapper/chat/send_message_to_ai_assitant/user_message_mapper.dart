import 'package:sijil_patient_portal/api/model/chat/response/send_message_to_ai_assistant_response/user_message_dto.dart';
import 'package:sijil_patient_portal/domain/entities/chat/response/send_message_to_ai_assistant_response/user_message.dart';

extension UserMessageMapper on UserMessageDto {
  UserMessage convertToUserMessage() {
    return UserMessage(
      content: content,
      createdAt: createdAt,
      id: id,
      role: role,
    );
  }
}

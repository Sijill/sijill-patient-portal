import 'package:sijil_patient_portal/api/model/chat/response/create_new_chat_session_response/session_dto.dart';
import 'package:sijil_patient_portal/domain/entities/chat/response/create_new_chat_session_response/session.dart';

extension SessionMapper on SessionDto {
  Session convertToSession() {
    return Session(
      createdAt: createdAt,
      id: id,
      lastMessagePreview: lastMessagePreview,
      messageCount: messageCount,
      patientId: patientId,
      status: status,
      title: title,
      updatedAt: updatedAt,
    );
  }
}

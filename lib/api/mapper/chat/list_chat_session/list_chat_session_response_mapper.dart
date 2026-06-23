import 'package:sijil_patient_portal/api/mapper/chat/create_new_chat_session/session_mapper.dart';
import 'package:sijil_patient_portal/api/model/chat/response/list_chat_session_response/list_chat_session_response_dto.dart';
import 'package:sijil_patient_portal/domain/entities/chat/response/list_chat_session_response/list_chat_session_response.dart';

extension ListChatSessionResponseMapper on ListChatSessionResponseDto {
  ListChatSessionResponse convertToListChatSessionResponse() {
    return ListChatSessionResponse(
      sessions: sessions?.map((e) => e.convertToSession()).toList(),
    );
  }
}

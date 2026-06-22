import 'package:sijil_patient_portal/api/model/chat/request/create_new_chat_session_request/create_new_chat_session_request_dto.dart';
import 'package:sijil_patient_portal/domain/entities/chat/request/create_new_chat_session_request/create_new_chat_session_request.dart';

extension CreateNewChatSessionRequestMapper on CreateNewChatSessionRequest {
  CreateNewChatSessionRequestDto convertToCreateNewChatSessionRequestDto() {
    return CreateNewChatSessionRequestDto(title: title);
  }
}

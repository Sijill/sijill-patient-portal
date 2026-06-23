import 'package:sijil_patient_portal/api/mapper/chat/create_new_chat_session/session_mapper.dart';
import 'package:sijil_patient_portal/api/model/chat/response/create_new_chat_session_response/create_new_chat_session_response_dto.dart';
import 'package:sijil_patient_portal/domain/entities/chat/response/create_new_chat_session_response/create_new_chat_session_response.dart';

extension CreateNewChatSessionResponseMapper
    on CreateNewChatSessionResponseDto {
  CreateNewChatSessionResponse convertToCreateNewChatSessionResponse() {
    return CreateNewChatSessionResponse(session: session?.convertToSession());
  }
}

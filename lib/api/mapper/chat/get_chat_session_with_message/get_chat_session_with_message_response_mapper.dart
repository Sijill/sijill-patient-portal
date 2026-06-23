import 'package:sijil_patient_portal/api/mapper/chat/create_new_chat_session/session_mapper.dart';
import 'package:sijil_patient_portal/api/mapper/chat/get_chat_session_with_message/message_mapper.dart';
import 'package:sijil_patient_portal/api/model/chat/response/get_chat_session_with_message_response/get_chat_session_with_message_response_dto.dart';
import 'package:sijil_patient_portal/domain/entities/chat/response/get_chat_session_with_message_response/get_chat_session_with_message_response.dart';

extension GetChatSessionWithMessageResponseMapper
    on GetChatSessionWithMessageResponseDto {
  GetChatSessionWithMessageResponse
  convertToGetChatSessionWithMessageResponse() {
    return GetChatSessionWithMessageResponse(
      session: session?.convertToSession(),
      messages: messages?.map((e) => e.convertToMessage()).toList(),
    );
  }
}

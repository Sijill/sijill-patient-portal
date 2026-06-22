import 'package:sijil_patient_portal/domain/entities/chat/request/create_new_chat_session_request/create_new_chat_session_request.dart';
import 'package:sijil_patient_portal/domain/entities/chat/response/create_new_chat_session_response/create_new_chat_session_response.dart';

abstract class ChatDataSource {
  Future<CreateNewChatSessionResponse> createNewChatSession({
    required CreateNewChatSessionRequest createNewChatSessionRequest,
  });
}

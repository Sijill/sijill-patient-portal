import 'package:sijil_patient_portal/domain/entities/chat/request/create_new_chat_session_request/create_new_chat_session_request.dart';
import 'package:sijil_patient_portal/domain/entities/chat/request/send_message_to_ai_assistant_request/send_message_to_ai_assistant_request.dart';
import 'package:sijil_patient_portal/domain/entities/chat/response/create_new_chat_session_response/create_new_chat_session_response.dart';
import 'package:sijil_patient_portal/domain/entities/chat/response/list_chat_session_response/list_chat_session_response.dart';
import 'package:sijil_patient_portal/domain/entities/chat/response/send_message_to_ai_assistant_response/send_message_to_ai_assistant_response.dart';

abstract class ChatRepository {
  Future<CreateNewChatSessionResponse> createNewChatSession({
    required CreateNewChatSessionRequest createNewChatSessionRequest,
  });

  Future<SendMessageToAiAssistantResponse> sendMessageToAiAssistant({
    required String sessionId,
    required SendMessageToAiAssistantRequest sendMessageToAiAssistantRequest,
  });

  Future<ListChatSessionResponse> getListChatSession();
}

import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/data/data_sources/remote/chat/chat_data_source.dart';
import 'package:sijil_patient_portal/domain/entities/chat/request/create_new_chat_session_request/create_new_chat_session_request.dart';
import 'package:sijil_patient_portal/domain/entities/chat/request/send_message_to_ai_assistant_request/send_message_to_ai_assistant_request.dart';
import 'package:sijil_patient_portal/domain/entities/chat/response/create_new_chat_session_response/create_new_chat_session_response.dart';
import 'package:sijil_patient_portal/domain/entities/chat/response/send_message_to_ai_assistant_response/send_message_to_ai_assistant_response.dart';
import 'package:sijil_patient_portal/domain/repositories/chat/chat_repository.dart';

@Injectable(as: ChatRepository)
class ChatRepositoryImpl extends ChatRepository {
  ChatDataSource chatDataSource;
  ChatRepositoryImpl({required this.chatDataSource});
  @override
  Future<CreateNewChatSessionResponse> createNewChatSession({
    required CreateNewChatSessionRequest createNewChatSessionRequest,
  }) {
    return chatDataSource.createNewChatSession(
      createNewChatSessionRequest: createNewChatSessionRequest,
    );
  }

  @override
  Future<SendMessageToAiAssistantResponse> sendMessageToAiAssistant({
    required String sessionId,
    required SendMessageToAiAssistantRequest sendMessageToAiAssistantRequest,
  }) {
    return chatDataSource.sendMessageToAiAssistant(
      sessionId: sessionId,
      sendMessageToAiAssistantRequest: sendMessageToAiAssistantRequest,
    );
  }
}

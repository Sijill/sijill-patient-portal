import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/domain/entities/chat/request/send_message_to_ai_assistant_request/send_message_to_ai_assistant_request.dart';
import 'package:sijil_patient_portal/domain/entities/chat/response/send_message_to_ai_assistant_response/send_message_to_ai_assistant_response.dart';
import 'package:sijil_patient_portal/domain/repositories/chat/chat_repository.dart';

@injectable
class SendMessageToAiAssistantUseCase {
  ChatRepository chatRepository;
  SendMessageToAiAssistantUseCase({required this.chatRepository});

  Future<SendMessageToAiAssistantResponse> invoke({
    required String sessionId,
    required SendMessageToAiAssistantRequest sendMessageToAiAssistantRequest,
  }) {
    return chatRepository.sendMessageToAiAssistant(
      sessionId: sessionId,
      sendMessageToAiAssistantRequest: sendMessageToAiAssistantRequest,
    );
  }
}

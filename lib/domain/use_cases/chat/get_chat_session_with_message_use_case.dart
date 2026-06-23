import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/domain/entities/chat/response/get_chat_session_with_message_response/get_chat_session_with_message_response.dart';
import 'package:sijil_patient_portal/domain/repositories/chat/chat_repository.dart';

@injectable
class GetChatSessionWithMessageUseCase {
  ChatRepository chatRepository;
  GetChatSessionWithMessageUseCase({required this.chatRepository});

  Future<GetChatSessionWithMessageResponse> invoke({
    required String sessionId,
  }) {
    return chatRepository.getChatSessionWithMessage(sessionId: sessionId);
  }
}

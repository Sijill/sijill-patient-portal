import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/domain/entities/chat/request/create_new_chat_session_request/create_new_chat_session_request.dart';
import 'package:sijil_patient_portal/domain/entities/chat/response/create_new_chat_session_response/create_new_chat_session_response.dart';
import 'package:sijil_patient_portal/domain/repositories/chat/chat_repository.dart';

@injectable
class CreateNewChatSessionUseCase {
  ChatRepository chatRepository;
  CreateNewChatSessionUseCase({required this.chatRepository});

  Future<CreateNewChatSessionResponse> invoke({
    required CreateNewChatSessionRequest createNewChatSessionRequest,
  }) {
    return chatRepository.createNewChatSession(
      createNewChatSessionRequest: createNewChatSessionRequest,
    );
  }
}

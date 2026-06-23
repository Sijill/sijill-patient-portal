import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/domain/entities/chat/response/delete_all_chat_session_response/delete_all_chat_session_response.dart';
import 'package:sijil_patient_portal/domain/repositories/chat/chat_repository.dart';

@injectable
class DeleteAllChatSessionUseCase {
  ChatRepository chatRepository;
  DeleteAllChatSessionUseCase({required this.chatRepository});

  Future<DeleteAllChatSessionResponse> invoke() {
    return chatRepository.deleteAllChatSessions();
  }
}

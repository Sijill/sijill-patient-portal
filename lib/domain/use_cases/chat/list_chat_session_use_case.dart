import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/domain/entities/chat/response/list_chat_session_response/list_chat_session_response.dart';
import 'package:sijil_patient_portal/domain/repositories/chat/chat_repository.dart';

@injectable
class ListChatSessionUseCase {
  ChatRepository chatRepository;
  ListChatSessionUseCase({required this.chatRepository});

  Future<ListChatSessionResponse> invoke() {
    return chatRepository.getListChatSession();
  }
}

import 'package:sijil_patient_portal/api/model/chat/response/delete_all_chat_session_response/delete_all_chat_session_response_dto.dart';
import 'package:sijil_patient_portal/domain/entities/chat/response/delete_all_chat_session_response/delete_all_chat_session_response.dart';

extension DeleteAllChatSessionResponseMapper
    on DeleteAllChatSessionResponseDto {
  DeleteAllChatSessionResponse convertToDeleteAllChatSessionResponse() {
    return DeleteAllChatSessionResponse(
      deletedCount: deletedCount,
      message: message,
    );
  }
}

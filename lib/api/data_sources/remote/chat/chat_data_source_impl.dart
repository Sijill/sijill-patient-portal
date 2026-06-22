import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/api/mapper/chat/create_new_chat_session_request_mapper.dart';
import 'package:sijil_patient_portal/api/mapper/chat/create_new_chat_session_response_mapper.dart';
import 'package:sijil_patient_portal/api/web_service.dart';
import 'package:sijil_patient_portal/data/data_sources/remote/chat/chat_data_source.dart';
import 'package:sijil_patient_portal/domain/entities/chat/request/create_new_chat_session_request/create_new_chat_session_request.dart';
import 'package:sijil_patient_portal/domain/entities/chat/response/create_new_chat_session_response/create_new_chat_session_response.dart';

@Injectable(as: ChatDataSource)
class ChatDataSourceImpl extends ChatDataSource {
  WebService webService;
  ChatDataSourceImpl({required this.webService});
  @override
  Future<CreateNewChatSessionResponse> createNewChatSession({
    required CreateNewChatSessionRequest createNewChatSessionRequest,
  }) async {
    //todo:CreateNewChatSessionRequest => CreateNewChatSessionRequestDto
    final createNewChatSessionResponseDto = await webService
        .createNewChatSession(
          createNewChatSessionRequest.convertToCreateNewChatSessionRequestDto(),
        );

    //todo:CreateNewChatSessionResponseDto => CreateNewChatSessionResponse
    return createNewChatSessionResponseDto
        .convertToCreateNewChatSessionResponse();
  }
}

import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/api/mapper/chat/create_new_chat_session/create_new_chat_session_request_mapper.dart';
import 'package:sijil_patient_portal/api/mapper/chat/create_new_chat_session/create_new_chat_session_response_mapper.dart';
import 'package:sijil_patient_portal/api/mapper/chat/delete_all_chat_session/delete_all_chat_session_response_mapper.dart';
import 'package:sijil_patient_portal/api/mapper/chat/get_chat_session_with_message/get_chat_session_with_message_response_mapper.dart';
import 'package:sijil_patient_portal/api/mapper/chat/list_chat_session/list_chat_session_response_mapper.dart';
import 'package:sijil_patient_portal/api/mapper/chat/send_message_to_ai_assitant/send_message_to_ai_assitant_request_mapper.dart';
import 'package:sijil_patient_portal/api/mapper/chat/send_message_to_ai_assitant/send_message_to_ai_assitant_response_mapper.dart';
import 'package:sijil_patient_portal/api/web_service.dart';
import 'package:sijil_patient_portal/data/data_sources/remote/chat/chat_data_source.dart';
import 'package:sijil_patient_portal/domain/entities/chat/request/create_new_chat_session_request/create_new_chat_session_request.dart';
import 'package:sijil_patient_portal/domain/entities/chat/request/send_message_to_ai_assistant_request/send_message_to_ai_assistant_request.dart';
import 'package:sijil_patient_portal/domain/entities/chat/response/create_new_chat_session_response/create_new_chat_session_response.dart';
import 'package:sijil_patient_portal/domain/entities/chat/response/delete_all_chat_session_response/delete_all_chat_session_response.dart';
import 'package:sijil_patient_portal/domain/entities/chat/response/get_chat_session_with_message_response/get_chat_session_with_message_response.dart';
import 'package:sijil_patient_portal/domain/entities/chat/response/list_chat_session_response/list_chat_session_response.dart';
import 'package:sijil_patient_portal/domain/entities/chat/response/send_message_to_ai_assistant_response/send_message_to_ai_assistant_response.dart';

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

  @override
  Future<SendMessageToAiAssistantResponse> sendMessageToAiAssistant({
    required String sessionId,
    required SendMessageToAiAssistantRequest sendMessageToAiAssistantRequest,
  }) async {
    //todo:SendMessageToAiAssistantRequest => SendMessageToAiAssistantRequestDto
    final sendMessageToAiAssistantResponseDto = await webService
        .sendMessageToAiAssistant(
          sessionId,
          sendMessageToAiAssistantRequest
              .convertToSendMessageToAiAssistantRequestDto(),
        );

    //todo:SendMessageToAiAssistantResponseDto => SendMessageToAiAssistantResponse
    return sendMessageToAiAssistantResponseDto
        .convertToSendMessageToAiAssistantResponse();
  }

  @override
  Future<ListChatSessionResponse> getListChatSession() async {
    final listChatSessionResponseDto = await webService.getListChatSession();

    //todo:ListChatSessionResponseDto => ListChatSessionResponse
    return listChatSessionResponseDto.convertToListChatSessionResponse();
  }

  @override
  Future<DeleteAllChatSessionResponse> deleteAllChatSessions() async {
    final deleteAllChatSessionResponseDto = await webService
        .deleteAllChatSession();

    //todo: DeleteAllChatSessionResponseDto => DeleteAllChatSessionResponse
    return deleteAllChatSessionResponseDto
        .convertToDeleteAllChatSessionResponse();
  }

  @override
  Future<GetChatSessionWithMessageResponse> getChatSessionWithMessage({
    required String sessionId,
  }) async {
    final getChatSessionWithMessageResponseDto = await webService
        .getChatSessionWithMessage(sessionId);

    //todo: GetChatSessionWithMessageResponseDto => GetChatSessionWithMessageResponse
    return getChatSessionWithMessageResponseDto
        .convertToGetChatSessionWithMessageResponse();
  }
}

import 'package:sijil_patient_portal/domain/entities/chat/response/create_new_chat_session_response/create_new_chat_session_response.dart';
import 'package:sijil_patient_portal/domain/entities/chat/response/create_new_chat_session_response/session.dart';
import 'package:sijil_patient_portal/domain/entities/chat/response/delete_all_chat_session_response/delete_all_chat_session_response.dart';
import 'package:sijil_patient_portal/domain/entities/chat/response/get_chat_session_with_message_response/get_chat_session_with_message_response.dart';
import 'package:sijil_patient_portal/domain/entities/chat/response/list_chat_session_response/list_chat_session_response.dart';
import 'package:sijil_patient_portal/domain/entities/chat/response/send_message_to_ai_assistant_response/send_message_to_ai_assistant_response.dart';

abstract class ChatState {}

class ChatInitial extends ChatState {}

class CreateNewChatSessionLoading extends ChatState {}

class CreateNewChatSessionSuccess extends ChatState {
  CreateNewChatSessionResponse createChatSessionResponse;
  CreateNewChatSessionSuccess({required this.createChatSessionResponse});
}

class CreateNewChatSessionError extends ChatState {
  String message;
  CreateNewChatSessionError({required this.message});
}

class SendMessageToAiAssistantLoading extends ChatState {}

class SendMessageToAiAssistantSuccess extends ChatState {
  SendMessageToAiAssistantResponse sendMessageToAiAssistantResponse;
  SendMessageToAiAssistantSuccess({
    required this.sendMessageToAiAssistantResponse,
  });
}

class SendMessageToAiAssistantError extends ChatState {
  String message;
  SendMessageToAiAssistantError({required this.message});
}

class GetListChatSessionLoading extends ChatState {}

class GetListChatSessionSuccess extends ChatState {
  ListChatSessionResponse listChatSessionResponse;
  GetListChatSessionSuccess({required this.listChatSessionResponse});
}

class GetListChatSessionError extends ChatState {
  String message;
  GetListChatSessionError({required this.message});
}

class SearchChatSessionSuccess extends ChatState {
  final List<Session> filteredSessions;
  SearchChatSessionSuccess({required this.filteredSessions});
}

class DeleteAllChatSessionLoading extends ChatState {}

class DeleteAllChatSessionSuccess extends ChatState {
  DeleteAllChatSessionResponse deleteAllChatSessionResponse;
  DeleteAllChatSessionSuccess({required this.deleteAllChatSessionResponse});
}

class DeleteAllChatSessionError extends ChatState {
  String message;
  DeleteAllChatSessionError({required this.message});
}

class GetChatSessionWithMessageLoading extends ChatState {}

class GetChatSessionWithMessageSuccess extends ChatState {
  GetChatSessionWithMessageResponse getChatSessionWithMessageResponse;
  GetChatSessionWithMessageSuccess({
    required this.getChatSessionWithMessageResponse,
  });
}

class GetChatSessionWithMessageError extends ChatState {
  String message;
  GetChatSessionWithMessageError({required this.message});
}

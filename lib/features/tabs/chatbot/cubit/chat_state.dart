import 'package:sijil_patient_portal/domain/entities/chat/response/create_new_chat_session_response/create_new_chat_session_response.dart';
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

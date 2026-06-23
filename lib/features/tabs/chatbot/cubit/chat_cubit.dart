import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/core/exceptions/app_exception.dart';
import 'package:sijil_patient_portal/domain/entities/chat/request/create_new_chat_session_request/create_new_chat_session_request.dart';
import 'package:sijil_patient_portal/domain/entities/chat/request/send_message_to_ai_assistant_request/send_message_to_ai_assistant_request.dart';
import 'package:sijil_patient_portal/domain/entities/chat/response/create_new_chat_session_response/session.dart';
import 'package:sijil_patient_portal/domain/entities/chat/response/get_chat_session_with_message_response/get_chat_session_with_message_response.dart';
import 'package:sijil_patient_portal/domain/use_cases/chat/create_new_chat_session_use_case.dart';
import 'package:sijil_patient_portal/domain/use_cases/chat/delete_all_chat_session_use_case.dart';
import 'package:sijil_patient_portal/domain/use_cases/chat/get_chat_session_with_message_use_case.dart';
import 'package:sijil_patient_portal/domain/use_cases/chat/list_chat_session_use_case.dart';
import 'package:sijil_patient_portal/domain/use_cases/chat/send_message_to_ai_assistant_use_case.dart';
import 'package:sijil_patient_portal/features/tabs/chatbot/cubit/chat_state.dart';

@injectable
class ChatCubit extends Cubit<ChatState> {
  final CreateNewChatSessionUseCase createNewChatSessionUseCase;
  final SendMessageToAiAssistantUseCase sendMessageToAiAssistantUseCase;
  final ListChatSessionUseCase listChatSessionUseCase;
  final DeleteAllChatSessionUseCase deleteAllChatSessionUseCase;
  final GetChatSessionWithMessageUseCase getChatSessionWithMessageUseCase;
  ChatCubit({
    required this.createNewChatSessionUseCase,
    required this.sendMessageToAiAssistantUseCase,
    required this.listChatSessionUseCase,
    required this.deleteAllChatSessionUseCase,
    required this.getChatSessionWithMessageUseCase,
  }) : super(ChatInitial());

  GetChatSessionWithMessageResponse? chatSessionWithMessage;

  void createNewChatSession({
    required CreateNewChatSessionRequest createNewChatSessionRequest,
  }) async {
    emit(CreateNewChatSessionLoading());
    try {
      final createChatSessionResponse = await createNewChatSessionUseCase
          .invoke(createNewChatSessionRequest: createNewChatSessionRequest);
      emit(
        CreateNewChatSessionSuccess(
          createChatSessionResponse: createChatSessionResponse,
        ),
      );
    } on AppException catch (e) {
      emit(CreateNewChatSessionError(message: e.message));
    } on DioException catch (e) {
      final message = (e.error is AppException)
          ? (e.error as AppException).message
          : "Unexcepted error occurred";
      emit(CreateNewChatSessionError(message: message));
    } catch (e) {
      emit(CreateNewChatSessionError(message: e.toString()));
    }
  }

  void sendMessageToAiAssistant({
    required String sessionId,
    required SendMessageToAiAssistantRequest sendMessageToAiAssistantRequest,
  }) async {
    emit(SendMessageToAiAssistantLoading());
    try {
      final sendMessageToAiAssistantResponse =
          await sendMessageToAiAssistantUseCase.invoke(
            sessionId: sessionId,
            sendMessageToAiAssistantRequest: sendMessageToAiAssistantRequest,
          );
      emit(
        SendMessageToAiAssistantSuccess(
          sendMessageToAiAssistantResponse: sendMessageToAiAssistantResponse,
        ),
      );
    } on AppException catch (e) {
      emit(SendMessageToAiAssistantError(message: e.message));
    } on DioException catch (e) {
      final message = (e.error is AppException)
          ? (e.error as AppException).message
          : "Unexcepted error occurred";
      emit(SendMessageToAiAssistantError(message: message));
    } catch (e) {
      emit(SendMessageToAiAssistantError(message: e.toString()));
    }
  }

  List<Session> allSessions = [];

  void getListChatSession() async {
    emit(GetListChatSessionLoading());
    try {
      final listChatSessionResponse = await listChatSessionUseCase.invoke();

      allSessions = listChatSessionResponse.sessions ?? [];
      emit(
        GetListChatSessionSuccess(
          listChatSessionResponse: listChatSessionResponse,
        ),
      );
    } on AppException catch (e) {
      emit(GetListChatSessionError(message: e.message));
    } on DioException catch (e) {
      final message = (e.error is AppException)
          ? (e.error as AppException).message
          : "Unexcepted error occurred";
      emit(GetListChatSessionError(message: message));
    } catch (e) {
      emit(GetListChatSessionError(message: e.toString()));
    }
  }

  void searchSessions(String query) {
    if (query.trim().isEmpty) {
      emit(SearchChatSessionSuccess(filteredSessions: allSessions));
      return;
    }

    final filtered = allSessions.where((session) {
      return (session.title ?? "").toLowerCase().contains(query.toLowerCase());
    }).toList();

    emit(SearchChatSessionSuccess(filteredSessions: filtered));
  }

  void deleteAllChatSession() async {
    emit(DeleteAllChatSessionLoading());
    try {
      final deleteAllChatSessionResponse = await deleteAllChatSessionUseCase
          .invoke();
      allSessions.clear();
      emit(
        DeleteAllChatSessionSuccess(
          deleteAllChatSessionResponse: deleteAllChatSessionResponse,
        ),
      );
      emit(SearchChatSessionSuccess(filteredSessions: []));
    } on AppException catch (e) {
      emit(DeleteAllChatSessionError(message: e.message));
    } on DioException catch (e) {
      final message = (e.error is AppException)
          ? (e.error as AppException).message
          : "Unexcepted error occurred";
      emit(DeleteAllChatSessionError(message: message));
    } catch (e) {
      emit(DeleteAllChatSessionError(message: e.toString()));
    }
  }

  Future<void> getChatSessionWithMessage({required String sessionId}) async {
    try {
      final getChatSessionWithMessageResponse =
          await getChatSessionWithMessageUseCase.invoke(sessionId: sessionId);
      chatSessionWithMessage = getChatSessionWithMessageResponse;
      emit(
        GetChatSessionWithMessageSuccess(
          getChatSessionWithMessageResponse: getChatSessionWithMessageResponse,
        ),
      );
    } on AppException catch (e) {
      emit(GetChatSessionWithMessageError(message: e.message));
    } on DioException catch (e) {
      final message = (e.error is AppException)
          ? (e.error as AppException).message
          : "Unexcepted error occurred";
      emit(GetChatSessionWithMessageError(message: message));
    } catch (e) {
      emit(GetChatSessionWithMessageError(message: e.toString()));
    }
  }
}

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/core/exceptions/app_exception.dart';
import 'package:sijil_patient_portal/domain/entities/chat/request/create_new_chat_session_request/create_new_chat_session_request.dart';
import 'package:sijil_patient_portal/domain/use_cases/chat/create_new_chat_session_use_case.dart';
import 'package:sijil_patient_portal/features/tabs/chatbot/cubit/chat_state.dart';

@injectable
class ChatCubit extends Cubit<ChatState> {
  final CreateNewChatSessionUseCase createNewChatSessionUseCase;
  ChatCubit({required this.createNewChatSessionUseCase}) : super(ChatInitial());

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
}

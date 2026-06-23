import 'package:sijil_patient_portal/domain/entities/chat/response/create_new_chat_session_response/session.dart';

class ChatScreenArgs {
  final Session session;
  final String firstMessage;

  ChatScreenArgs({required this.session, required this.firstMessage});
}

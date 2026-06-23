import 'package:sijil_patient_portal/domain/entities/chat/response/create_new_chat_session_response/session.dart';
import 'package:sijil_patient_portal/domain/entities/chat/response/get_chat_session_with_message_response/message.dart';

class GetChatSessionWithMessageResponse {
  Session? session;
  List<Message>? messages;

  GetChatSessionWithMessageResponse({this.session, this.messages});
}

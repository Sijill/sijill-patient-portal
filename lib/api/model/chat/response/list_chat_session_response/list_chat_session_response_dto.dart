import 'package:json_annotation/json_annotation.dart';
import 'package:sijil_patient_portal/api/model/chat/response/create_new_chat_session_response/session_dto.dart';

part 'list_chat_session_response_dto.g.dart';

@JsonSerializable()
class ListChatSessionResponseDto {
  List<SessionDto>? sessions;

  ListChatSessionResponseDto({this.sessions});

  factory ListChatSessionResponseDto.fromJson(Map<String, dynamic> json) {
    return _$ListChatSessionResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ListChatSessionResponseDtoToJson(this);
}

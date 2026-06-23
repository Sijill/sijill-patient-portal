import 'package:json_annotation/json_annotation.dart';

part 'send_message_to_ai_assistant_request_dto.g.dart';

@JsonSerializable()
class SendMessageToAiAssistantRequestDto {
  String? content;

  SendMessageToAiAssistantRequestDto({this.content});

  factory SendMessageToAiAssistantRequestDto.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$SendMessageToAiAssistantRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SendMessageToAiAssistantRequestDtoToJson(this);
  }
}

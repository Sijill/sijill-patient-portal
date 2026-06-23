import 'package:json_annotation/json_annotation.dart';

part 'session_send_message_dto.g.dart';

@JsonSerializable()
class SessionSendMessageDto {
  String? id;
  int? messageCount;
  String? title;

  SessionSendMessageDto({this.id, this.messageCount, this.title});

  factory SessionSendMessageDto.fromJson(Map<String, dynamic> json) {
    return _$SessionSendMessageDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SessionSendMessageDtoToJson(this);
}

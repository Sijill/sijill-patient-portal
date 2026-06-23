import 'package:json_annotation/json_annotation.dart';

part 'delete_all_chat_session_response_dto.g.dart';

@JsonSerializable()
class DeleteAllChatSessionResponseDto {
  String? message;
  int? deletedCount;

  DeleteAllChatSessionResponseDto({this.message, this.deletedCount});

  factory DeleteAllChatSessionResponseDto.fromJson(Map<String, dynamic> json) {
    return _$DeleteAllChatSessionResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DeleteAllChatSessionResponseDtoToJson(this);
  }
}

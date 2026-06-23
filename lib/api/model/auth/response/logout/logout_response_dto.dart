import 'package:json_annotation/json_annotation.dart';

part 'logout_response_dto.g.dart';

@JsonSerializable()
class LogoutResponseDto {
  bool? success;
  String? message;

  LogoutResponseDto({this.success, this.message});

  factory LogoutResponseDto.fromJson(Map<String, dynamic> json) {
    return _$LogoutResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LogoutResponseDtoToJson(this);
}

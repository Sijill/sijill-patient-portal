import 'package:json_annotation/json_annotation.dart';

part 'password_reset_confirm_response_dto.g.dart';

@JsonSerializable()
class PasswordResetConfirmResponseDto {
  String? message;
  String? code;

  PasswordResetConfirmResponseDto({this.message, this.code});

  factory PasswordResetConfirmResponseDto.fromJson(Map<String, dynamic> json) {
    return _$PasswordResetConfirmResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PasswordResetConfirmResponseDtoToJson(this);
  }
}

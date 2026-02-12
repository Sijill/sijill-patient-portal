import 'package:json_annotation/json_annotation.dart';

part 'password_reset_confirm_request_dto.g.dart';

@JsonSerializable()
class PasswordResetConfirmRequestDto {
  String? resetSessionId;
  String? otp;
  String? newPassword;

  PasswordResetConfirmRequestDto({
    this.resetSessionId,
    this.otp,
    this.newPassword,
  });

  factory PasswordResetConfirmRequestDto.fromJson(Map<String, dynamic> json) {
    return _$PasswordResetConfirmRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PasswordResetConfirmRequestDtoToJson(this);
  }
}

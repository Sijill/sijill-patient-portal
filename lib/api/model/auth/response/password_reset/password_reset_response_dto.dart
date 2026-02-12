import 'package:json_annotation/json_annotation.dart';

part 'password_reset_response_dto.g.dart';

@JsonSerializable()
class PasswordResetResponseDto {
  String? resetSessionId;
  String? otpDelivery;
  DateTime? expiresAt;

  PasswordResetResponseDto({
    this.resetSessionId,
    this.otpDelivery,
    this.expiresAt,
  });

  factory PasswordResetResponseDto.fromJson(Map<String, dynamic> json) {
    return _$PasswordResetResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PasswordResetResponseDtoToJson(this);
}

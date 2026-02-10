import 'package:json_annotation/json_annotation.dart';

part 'password_reset_resend_otp_response_dto.g.dart';

@JsonSerializable()
class PasswordResetResendOtpResponseDto {
  String? resetSessionId;
  String? otpDelivery;
  DateTime? expiresAt;

  PasswordResetResendOtpResponseDto({
    this.resetSessionId,
    this.otpDelivery,
    this.expiresAt,
  });

  factory PasswordResetResendOtpResponseDto.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$PasswordResetResendOtpResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PasswordResetResendOtpResponseDtoToJson(this);
  }
}

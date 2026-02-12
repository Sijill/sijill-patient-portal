import 'package:json_annotation/json_annotation.dart';

part 'password_reset_resend_otp_request_dto.g.dart';

@JsonSerializable()
class PasswordResetResendOtpRequestDto {
  String? resetSessionId;

  PasswordResetResendOtpRequestDto({this.resetSessionId});

  factory PasswordResetResendOtpRequestDto.fromJson(Map<String, dynamic> json) {
    return _$PasswordResetResendOtpRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PasswordResetResendOtpRequestDtoToJson(this);
  }
}

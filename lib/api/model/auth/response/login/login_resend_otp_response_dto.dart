import 'package:json_annotation/json_annotation.dart';

part 'login_resend_otp_response_dto.g.dart';

@JsonSerializable()
class LoginResendOtpResponseDto {
  String? loginSessionId;
  String? otpDelivery;
  DateTime? expiresAt;

  LoginResendOtpResponseDto({
    this.loginSessionId,
    this.otpDelivery,
    this.expiresAt,
  });

  factory LoginResendOtpResponseDto.fromJson(Map<String, dynamic> json) {
    return _$LoginResendOtpResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginResendOtpResponseDtoToJson(this);
}

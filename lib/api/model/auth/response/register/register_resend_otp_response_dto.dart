import 'package:json_annotation/json_annotation.dart';

part 'register_resend_otp_response_dto.g.dart';

@JsonSerializable()
class RegisterResendOtpResponseDto {
  String? registrationSessionId;
  String? otpDelivery;
  DateTime? expiresAt;

  RegisterResendOtpResponseDto({
    this.registrationSessionId,
    this.otpDelivery,
    this.expiresAt,
  });

  factory RegisterResendOtpResponseDto.fromJson(Map<String, dynamic> json) {
    return _$RegisterResendOtpResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RegisterResendOtpResponseDtoToJson(this);
}

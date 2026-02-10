import 'package:json_annotation/json_annotation.dart';

part 'register_resend_otp_request_dto.g.dart';

@JsonSerializable()
class RegisterResendOtpRequestDto {
  String? registrationSessionId;

  RegisterResendOtpRequestDto({this.registrationSessionId});

  factory RegisterResendOtpRequestDto.fromJson(Map<String, dynamic> json) {
    return _$RegisterResendOtpRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RegisterResendOtpRequestDtoToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'login_resend_otp_request_dto.g.dart';

@JsonSerializable()
class LoginResendOtpRequestDto {
  String? loginSessionId;

  LoginResendOtpRequestDto({this.loginSessionId});

  factory LoginResendOtpRequestDto.fromJson(Map<String, dynamic> json) {
    return _$LoginResendOtpRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginResendOtpRequestDtoToJson(this);
}

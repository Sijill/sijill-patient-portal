import 'package:json_annotation/json_annotation.dart';

part 'login_verify_otp_request_dto.g.dart';

@JsonSerializable()
class LoginVerifyOtpRequestDto {
  String? loginSessionId;
  String? otp;
  String? platform;

  LoginVerifyOtpRequestDto({this.loginSessionId, this.otp, this.platform});

  factory LoginVerifyOtpRequestDto.fromJson(Map<String, dynamic> json) {
    return _$LoginVerifyOtpRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginVerifyOtpRequestDtoToJson(this);
}

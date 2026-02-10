import 'package:json_annotation/json_annotation.dart';

part 'login_verfiy_otp_request_dto.g.dart';

@JsonSerializable()
class LoginVerfiyOtpRequestDto {
  String? loginSessionId;
  String? otp;

  LoginVerfiyOtpRequestDto({this.loginSessionId, this.otp});

  factory LoginVerfiyOtpRequestDto.fromJson(Map<String, dynamic> json) {
    return _$LoginVerfiyOtpRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginVerfiyOtpRequestDtoToJson(this);
}

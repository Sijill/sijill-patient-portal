import 'package:json_annotation/json_annotation.dart';

part 'login_verify_otp_response_dto.g.dart';

@JsonSerializable()
class LoginVerifyOtpResponseDto {
  String? accessToken;

  LoginVerifyOtpResponseDto({this.accessToken});

  factory LoginVerifyOtpResponseDto.fromJson(Map<String, dynamic> json) {
    return _$LoginVerifyOtpResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginVerifyOtpResponseDtoToJson(this);
}

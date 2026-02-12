import 'package:json_annotation/json_annotation.dart';

part 'login_verify_otp_response_dto.g.dart';

@JsonSerializable()
class LoginVerifyOtpResponseDto {
  bool? success;
  String? message;
  String? userId;
  String? email;
  String? role;
  String? accessToken;
  String? refreshToken;

  LoginVerifyOtpResponseDto({
    this.success,
    this.message,
    this.userId,
    this.email,
    this.role,
    this.accessToken,
    this.refreshToken,
  });

  factory LoginVerifyOtpResponseDto.fromJson(Map<String, dynamic> json) {
    return _$LoginVerifyOtpResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginVerifyOtpResponseDtoToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'register_verify_otp_request_dto.g.dart';

@JsonSerializable()
class RegisterVerifyOtpRequestDto {
  String? registrationSessionId;
  String? otp;

  RegisterVerifyOtpRequestDto({this.registrationSessionId, this.otp});

  factory RegisterVerifyOtpRequestDto.fromJson(Map<String, dynamic> json) {
    return _$RegisterVerifyOtpRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RegisterVerifyOtpRequestDtoToJson(this);
}

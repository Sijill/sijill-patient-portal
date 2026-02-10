import 'package:json_annotation/json_annotation.dart';

part 'register_verify_otp_response_dto.g.dart';

@JsonSerializable()
class RegisterVerifyOtpResponseDto {
  String? registrationStatus;

  RegisterVerifyOtpResponseDto({this.registrationStatus});

  factory RegisterVerifyOtpResponseDto.fromJson(Map<String, dynamic> json) {
    return _$RegisterVerifyOtpResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RegisterVerifyOtpResponseDtoToJson(this);
}

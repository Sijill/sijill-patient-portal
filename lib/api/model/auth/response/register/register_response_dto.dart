import 'package:json_annotation/json_annotation.dart';

part 'register_response_dto.g.dart';

@JsonSerializable()
class RegisterResponseDto {
  String? registrationSessionId;
  String? otpDelivery;
  DateTime? expiresAt;

  RegisterResponseDto({
    this.registrationSessionId,
    this.otpDelivery,
    this.expiresAt,
  });

  factory RegisterResponseDto.fromJson(Map<String, dynamic> json) {
    return _$RegisterResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RegisterResponseDtoToJson(this);
}

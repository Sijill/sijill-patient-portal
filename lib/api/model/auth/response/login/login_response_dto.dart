import 'package:json_annotation/json_annotation.dart';

part 'login_response_dto.g.dart';

@JsonSerializable()
class LoginResponseDto {
  String? loginSessionId;
  String? otpDelivery;
  DateTime? expiresAt;

  LoginResponseDto({this.loginSessionId, this.otpDelivery, this.expiresAt});

  factory LoginResponseDto.fromJson(Map<String, dynamic> json) {
    return _$LoginResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginResponseDtoToJson(this);
}

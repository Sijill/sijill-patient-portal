import 'package:json_annotation/json_annotation.dart';

part 'password_reset_request_dto.g.dart';

@JsonSerializable()
class PasswordResetRequestDto {
  String? email;

  PasswordResetRequestDto({this.email});

  factory PasswordResetRequestDto.fromJson(Map<String, dynamic> json) {
    return _$PasswordResetRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PasswordResetRequestDtoToJson(this);
}

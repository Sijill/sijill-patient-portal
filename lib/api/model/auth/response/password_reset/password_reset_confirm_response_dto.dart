import 'package:json_annotation/json_annotation.dart';

part 'password_reset_confirm_response_dto.g.dart';

@JsonSerializable()
class PasswordResetConfirmResponseDto {
  bool? success;
  String? message;

  PasswordResetConfirmResponseDto({this.success, this.message});

  factory PasswordResetConfirmResponseDto.fromJson(Map<String, dynamic> json) {
    return _$PasswordResetConfirmResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PasswordResetConfirmResponseDtoToJson(this);
  }
}

import 'package:json_annotation/json_annotation.dart';

part 'delete_emergency_contact_response_dto.g.dart';

@JsonSerializable()
class DeleteEmergencyContactResponseDto {
  String? message;
  String? error;
  int? statusCode;

  DeleteEmergencyContactResponseDto({
    this.message,
    this.error,
    this.statusCode,
  });

  factory DeleteEmergencyContactResponseDto.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$DeleteEmergencyContactResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DeleteEmergencyContactResponseDtoToJson(this);
  }
}

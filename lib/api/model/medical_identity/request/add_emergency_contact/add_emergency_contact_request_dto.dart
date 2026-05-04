import 'package:json_annotation/json_annotation.dart';

part 'add_emergency_contact_request_dto.g.dart';

@JsonSerializable()
class AddEmergencyContactRequestDto {
  String? contactName;
  String? phoneNumber;
  String? relationship;
  bool? isPrimary;

  AddEmergencyContactRequestDto({
    this.contactName,
    this.phoneNumber,
    this.relationship,
    this.isPrimary,
  });

  factory AddEmergencyContactRequestDto.fromJson(Map<String, dynamic> json) {
    return _$AddEmergencyContactRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AddEmergencyContactRequestDtoToJson(this);
}

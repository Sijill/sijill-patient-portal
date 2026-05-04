import 'package:json_annotation/json_annotation.dart';

part 'emergency_contact_dto.g.dart';

@JsonSerializable()
class EmergencyContactDto {
  String? contactName;
  String? relationship;
  String? phoneNumber;
  bool? isPrimary;

  EmergencyContactDto({
    this.contactName,
    this.relationship,
    this.phoneNumber,
    this.isPrimary,
  });

  factory EmergencyContactDto.fromJson(Map<String, dynamic> json) {
    return _$EmergencyContactDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EmergencyContactDtoToJson(this);
}

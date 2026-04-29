import 'package:json_annotation/json_annotation.dart';

import 'contact.dart';

part 'add_emergency_contact_response_dto.g.dart';

@JsonSerializable()
class AddEmergencyContactResponseDto {
  Contact? contact;

  AddEmergencyContactResponseDto({this.contact});

  factory AddEmergencyContactResponseDto.fromJson(Map<String, dynamic> json) {
    return _$AddEmergencyContactResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddEmergencyContactResponseDtoToJson(this);
  }
}

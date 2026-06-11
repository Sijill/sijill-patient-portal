import 'package:json_annotation/json_annotation.dart';

part 'appointment_dto.g.dart';

@JsonSerializable()
class AppointmentDto {
  String? encounterId;
  String? doctorName;
  String? location;
  String? notes;

  AppointmentDto({
    this.encounterId,
    this.doctorName,
    this.location,
    this.notes,
  });

  factory AppointmentDto.fromJson(Map<String, dynamic> json) {
    return _$AppointmentDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AppointmentDtoToJson(this);
}

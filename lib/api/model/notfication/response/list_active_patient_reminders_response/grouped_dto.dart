import 'package:json_annotation/json_annotation.dart';

import 'appointment_dto.dart';
import 'medical_order_dto.dart';
import 'medication_dto.dart';

part 'grouped_dto.g.dart';

@JsonSerializable()
class GroupedDto {
  List<AppointmentDto>? appointments;
  List<MedicationDto>? medications;
  List<MedicalOrderDto>? medicalOrders;

  GroupedDto({this.appointments, this.medications, this.medicalOrders});

  factory GroupedDto.fromJson(Map<String, dynamic> json) {
    return _$GroupedDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GroupedDtoToJson(this);
}

import 'package:json_annotation/json_annotation.dart';
import 'package:sijil_patient_portal/api/model/home_tab/response/patient_name/name_dto.dart';

part 'patient_name_response_dto.g.dart';

@JsonSerializable()
class PatientNameResponseDto {
  NameDto? name;

  PatientNameResponseDto({this.name});

  factory PatientNameResponseDto.fromJson(Map<String, dynamic> json) {
    return _$PatientNameResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PatientNameResponseDtoToJson(this);
}

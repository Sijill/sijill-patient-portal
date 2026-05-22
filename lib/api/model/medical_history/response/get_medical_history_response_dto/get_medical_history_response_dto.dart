import 'package:json_annotation/json_annotation.dart';

import 'encounter_dto.dart';

part 'get_medical_history_response_dto.g.dart';

@JsonSerializable()
class GetMedicalHistoryResponseDto {
  EncounterDto? encounter;

  GetMedicalHistoryResponseDto({this.encounter});

  factory GetMedicalHistoryResponseDto.fromJson(Map<String, dynamic> json) {
    return _$GetMedicalHistoryResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetMedicalHistoryResponseDtoToJson(this);
}

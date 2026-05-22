import 'package:json_annotation/json_annotation.dart';

import 'encounter_dto.dart';

part 'get_list_medical_history_response_dto.g.dart';

@JsonSerializable()
class GetListMedicalHistoryResponseDto {
  List<EncounterDto>? encounters;

  GetListMedicalHistoryResponseDto({this.encounters});

  factory GetListMedicalHistoryResponseDto.fromJson(Map<String, dynamic> json) {
    return _$GetListMedicalHistoryResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetListMedicalHistoryResponseDtoToJson(this);
  }
}

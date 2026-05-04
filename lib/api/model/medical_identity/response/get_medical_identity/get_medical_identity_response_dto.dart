import 'package:json_annotation/json_annotation.dart';

import 'active_diagnosis_dto.dart';
import 'allergy_dto.dart';
import 'basic_info_dto.dart';
import 'chronic_condition_dto.dart';
import 'current_medication_dto.dart';
import 'emergency_contact_dto.dart';

part 'get_medical_identity_response_dto.g.dart';

@JsonSerializable()
class GetMedicalIdentityResponseDto {
  BasicInfoDto? basicInfo;
  List<ActiveDiagnosisDto>? activeDiagnoses;
  List<CurrentMedicationDto>? currentMedications;
  List<AllergyDto>? allergies;
  List<ChronicConditionDto>? chronicConditions;
  List<EmergencyContactDto>? emergencyContacts;

  GetMedicalIdentityResponseDto({
    this.basicInfo,
    this.activeDiagnoses,
    this.currentMedications,
    this.allergies,
    this.chronicConditions,
    this.emergencyContacts,
  });

  factory GetMedicalIdentityResponseDto.fromJson(Map<String, dynamic> json) {
    return _$GetMedicalIdentityResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetMedicalIdentityResponseDtoToJson(this);
}

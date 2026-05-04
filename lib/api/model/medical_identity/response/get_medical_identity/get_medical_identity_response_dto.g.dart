// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_medical_identity_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMedicalIdentityResponseDto _$GetMedicalIdentityResponseDtoFromJson(
  Map<String, dynamic> json,
) => GetMedicalIdentityResponseDto(
  basicInfo: json['basicInfo'] == null
      ? null
      : BasicInfoDto.fromJson(json['basicInfo'] as Map<String, dynamic>),
  activeDiagnoses: (json['activeDiagnoses'] as List<dynamic>?)
      ?.map((e) => ActiveDiagnosisDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  currentMedications: (json['currentMedications'] as List<dynamic>?)
      ?.map((e) => CurrentMedicationDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  allergies: (json['allergies'] as List<dynamic>?)
      ?.map((e) => AllergyDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  chronicConditions: (json['chronicConditions'] as List<dynamic>?)
      ?.map((e) => ChronicConditionDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  emergencyContacts: (json['emergencyContacts'] as List<dynamic>?)
      ?.map((e) => EmergencyContactDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$GetMedicalIdentityResponseDtoToJson(
  GetMedicalIdentityResponseDto instance,
) => <String, dynamic>{
  'basicInfo': instance.basicInfo,
  'activeDiagnoses': instance.activeDiagnoses,
  'currentMedications': instance.currentMedications,
  'allergies': instance.allergies,
  'chronicConditions': instance.chronicConditions,
  'emergencyContacts': instance.emergencyContacts,
};

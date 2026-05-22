// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'encounter_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EncounterDto _$EncounterDtoFromJson(Map<String, dynamic> json) => EncounterDto(
  encounterId: json['encounterId'] as String?,
  doctorName: json['doctorName'] as String?,
  doctorSpeciality: json['doctorSpeciality'] as String?,
  encounterDate: json['encounterDate'] == null
      ? null
      : DateTime.parse(json['encounterDate'] as String),
  location: json['location'] as String?,
  primaryDiagnosis: json['primaryDiagnosis'] == null
      ? null
      : PrimaryDiagnosisDto.fromJson(
          json['primaryDiagnosis'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$EncounterDtoToJson(EncounterDto instance) =>
    <String, dynamic>{
      'encounterId': instance.encounterId,
      'doctorName': instance.doctorName,
      'doctorSpeciality': instance.doctorSpeciality,
      'encounterDate': instance.encounterDate?.toIso8601String(),
      'location': instance.location,
      'primaryDiagnosis': instance.primaryDiagnosis,
    };

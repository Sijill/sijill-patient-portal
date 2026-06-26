// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_name_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientNameResponseDto _$PatientNameResponseDtoFromJson(
  Map<String, dynamic> json,
) => PatientNameResponseDto(
  name: json['name'] == null
      ? null
      : NameDto.fromJson(json['name'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PatientNameResponseDtoToJson(
  PatientNameResponseDto instance,
) => <String, dynamic>{'name': instance.name};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'name_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NameDto _$NameDtoFromJson(Map<String, dynamic> json) => NameDto(
  firstName: json['firstName'] as String?,
  middleName: json['middleName'] as String?,
  surname: json['surname'] as String?,
  fullName: json['fullName'] as String?,
);

Map<String, dynamic> _$NameDtoToJson(NameDto instance) => <String, dynamic>{
  'firstName': instance.firstName,
  'middleName': instance.middleName,
  'surname': instance.surname,
  'fullName': instance.fullName,
};

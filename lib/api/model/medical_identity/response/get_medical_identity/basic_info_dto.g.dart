// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasicInfoDto _$BasicInfoDtoFromJson(Map<String, dynamic> json) => BasicInfoDto(
  age: (json['age'] as num?)?.toInt(),
  gender: json['gender'] as String?,
  bloodType: json['bloodType'] as String?,
  weightKg: (json['weightKg'] as num?)?.toInt(),
  heightCm: (json['heightCm'] as num?)?.toInt(),
  bmi: (json['bmi'] as num?)?.toDouble(),
);

Map<String, dynamic> _$BasicInfoDtoToJson(BasicInfoDto instance) =>
    <String, dynamic>{
      'age': instance.age,
      'gender': instance.gender,
      'bloodType': instance.bloodType,
      'weightKg': instance.weightKg,
      'heightCm': instance.heightCm,
      'bmi': instance.bmi,
    };

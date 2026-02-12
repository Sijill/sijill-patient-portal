// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequestDto _$RegisterRequestDtoFromJson(Map<String, dynamic> json) =>
    RegisterRequestDto(
      role: json['role'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      password: json['password'] as String?,
      firstName: json['firstName'] as String?,
      middleName: json['middleName'] as String?,
      surName: json['surName'] as String?,
      gender: json['gender'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      nationalId: json['nationalId'] as String?,
      nationalIdFront: json['nationalIdFront'] as String?,
      nationalIdBack: json['nationalIdBack'] as String?,
      selfieWithId: json['selfieWithId'] as String?,
    );

Map<String, dynamic> _$RegisterRequestDtoToJson(RegisterRequestDto instance) =>
    <String, dynamic>{
      'role': instance.role,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'password': instance.password,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'surName': instance.surName,
      'gender': instance.gender,
      'dateOfBirth': instance.dateOfBirth,
      'nationalId': instance.nationalId,
      'nationalIdFront': instance.nationalIdFront,
      'nationalIdBack': instance.nationalIdBack,
      'selfieWithId': instance.selfieWithId,
    };

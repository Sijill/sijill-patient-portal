// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_patient_active_lab_order_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListPatientActiveLabOrderResponseDto
_$ListPatientActiveLabOrderResponseDtoFromJson(Map<String, dynamic> json) =>
    ListPatientActiveLabOrderResponseDto(
      orders: (json['orders'] as List<dynamic>?)
          ?.map((e) => OrderDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListPatientActiveLabOrderResponseDtoToJson(
  ListPatientActiveLabOrderResponseDto instance,
) => <String, dynamic>{'orders': instance.orders};

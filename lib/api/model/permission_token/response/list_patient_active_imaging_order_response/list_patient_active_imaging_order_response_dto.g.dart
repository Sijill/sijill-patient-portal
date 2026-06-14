// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_patient_active_imaging_order_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListPatientActiveImagingOrderResponseDto
_$ListPatientActiveImagingOrderResponseDtoFromJson(Map<String, dynamic> json) =>
    ListPatientActiveImagingOrderResponseDto(
      orders: (json['orders'] as List<dynamic>?)
          ?.map(
            (e) => OrderPatientImagingDto.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$ListPatientActiveImagingOrderResponseDtoToJson(
  ListPatientActiveImagingOrderResponseDto instance,
) => <String, dynamic>{'orders': instance.orders};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetaDto _$MetaDtoFromJson(Map<String, dynamic> json) => MetaDto(
  model: json['model'] as String?,
  latencyMs: (json['latencyMs'] as num?)?.toInt(),
);

Map<String, dynamic> _$MetaDtoToJson(MetaDto instance) => <String, dynamic>{
  'model': instance.model,
  'latencyMs': instance.latencyMs,
};

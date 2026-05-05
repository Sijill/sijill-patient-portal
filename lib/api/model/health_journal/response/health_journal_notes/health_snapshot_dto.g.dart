// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_snapshot_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HealthSnapshotDto _$HealthSnapshotDtoFromJson(Map<String, dynamic> json) =>
    HealthSnapshotDto(
      status: json['status'] as String?,
      model: json['model'] as String?,
      urgencyLevel: json['urgencyLevel'] as String?,
      summary: json['summary'],
      advice: json['advice'] as List<dynamic>?,
      watchouts: json['watchouts'] as List<dynamic>?,
      whenToContactDoctor: json['whenToContactDoctor'] as List<dynamic>?,
      disclaimer: json['disclaimer'] as String?,
      unavailableReason: json['unavailableReason'] as String?,
    );

Map<String, dynamic> _$HealthSnapshotDtoToJson(HealthSnapshotDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'model': instance.model,
      'urgencyLevel': instance.urgencyLevel,
      'summary': instance.summary,
      'advice': instance.advice,
      'watchouts': instance.watchouts,
      'whenToContactDoctor': instance.whenToContactDoctor,
      'disclaimer': instance.disclaimer,
      'unavailableReason': instance.unavailableReason,
    };

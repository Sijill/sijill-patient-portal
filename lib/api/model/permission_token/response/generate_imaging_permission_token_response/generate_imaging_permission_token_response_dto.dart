import 'package:json_annotation/json_annotation.dart';

part 'generate_imaging_permission_token_response_dto.g.dart';

@JsonSerializable()
class GenerateImagingPermissionTokenResponseDto {
  String? tokenId;
  String? code;
  String? entityType;
  String? accessType;
  DateTime? expiresAt;
  String? medicalOrderId;

  GenerateImagingPermissionTokenResponseDto({
    this.tokenId,
    this.code,
    this.entityType,
    this.accessType,
    this.expiresAt,
    this.medicalOrderId,
  });

  factory GenerateImagingPermissionTokenResponseDto.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$GenerateImagingPermissionTokenResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GenerateImagingPermissionTokenResponseDtoToJson(this);
  }
}

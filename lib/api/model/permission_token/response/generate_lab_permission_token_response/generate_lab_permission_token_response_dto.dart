import 'package:json_annotation/json_annotation.dart';

part 'generate_lab_permission_token_response_dto.g.dart';

@JsonSerializable()
class GenerateLabPermissionTokenResponseDto {
  String? tokenId;
  String? code;
  String? entityType;
  String? accessType;
  DateTime? expiresAt;
  String? medicalOrderId;

  GenerateLabPermissionTokenResponseDto({
    this.tokenId,
    this.code,
    this.entityType,
    this.accessType,
    this.expiresAt,
    this.medicalOrderId,
  });

  factory GenerateLabPermissionTokenResponseDto.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$GenerateLabPermissionTokenResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GenerateLabPermissionTokenResponseDtoToJson(this);
  }
}

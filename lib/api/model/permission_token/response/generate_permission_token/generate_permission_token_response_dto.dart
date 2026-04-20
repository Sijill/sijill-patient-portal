import 'package:json_annotation/json_annotation.dart';

part 'generate_permission_token_response_dto.g.dart';

@JsonSerializable()
class GeneratePermissionTokenResponseDto {
  String? tokenId;
  String? code;
  String? entityType;
  String? accessType;
  DateTime? expiresAt;

  GeneratePermissionTokenResponseDto({
    this.tokenId,
    this.code,
    this.entityType,
    this.accessType,
    this.expiresAt,
  });

  factory GeneratePermissionTokenResponseDto.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$GeneratePermissionTokenResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GeneratePermissionTokenResponseDtoToJson(this);
  }
}

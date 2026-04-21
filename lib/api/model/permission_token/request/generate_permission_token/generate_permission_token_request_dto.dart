import 'package:json_annotation/json_annotation.dart';

part 'generate_permission_token_request_dto.g.dart';

@JsonSerializable()
class GeneratePermissionTokenRequestDto {
  String? entityType;
  String? accessType;
  int? expiresInMinutes;

  GeneratePermissionTokenRequestDto({
    this.entityType,
    this.accessType,
    this.expiresInMinutes,
  });

  factory GeneratePermissionTokenRequestDto.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$GeneratePermissionTokenRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GeneratePermissionTokenRequestDtoToJson(this);
  }
}

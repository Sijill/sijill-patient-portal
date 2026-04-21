import 'package:json_annotation/json_annotation.dart';

part 'permission_token_revoke_response_dto.g.dart';

@JsonSerializable()
class PermissionTokenRevokeResponseDto {
  bool? success;
  String? message;
  String? tokenId;
  DateTime? revokedAt;

  PermissionTokenRevokeResponseDto({
    this.success,
    this.message,
    this.tokenId,
    this.revokedAt,
  });

  factory PermissionTokenRevokeResponseDto.fromJson(Map<String, dynamic> json) {
    return _$PermissionTokenRevokeResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PermissionTokenRevokeResponseDtoToJson(this);
  }
}

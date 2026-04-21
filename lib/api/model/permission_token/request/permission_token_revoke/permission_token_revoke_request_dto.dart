import 'package:json_annotation/json_annotation.dart';

part 'permission_token_revoke_request_dto.g.dart';

@JsonSerializable()
class PermissionTokenRevokeRequestDto {
  String? tokenId;

  PermissionTokenRevokeRequestDto({this.tokenId});

  factory PermissionTokenRevokeRequestDto.fromJson(Map<String, dynamic> json) {
    return _$PermissionTokenRevokeRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PermissionTokenRevokeRequestDtoToJson(this);
  }
}

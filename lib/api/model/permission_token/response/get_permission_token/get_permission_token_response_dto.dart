import 'package:json_annotation/json_annotation.dart';

import 'token.dart';

part 'get_permission_token_response_dto.g.dart';

@JsonSerializable()
class GetPermissionTokenResponseDto {
  List<Token>? tokens;

  GetPermissionTokenResponseDto({this.tokens});

  factory GetPermissionTokenResponseDto.fromJson(Map<String, dynamic> json) {
    return _$GetPermissionTokenResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetPermissionTokenResponseDtoToJson(this);
}

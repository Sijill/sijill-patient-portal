import 'package:json_annotation/json_annotation.dart';

part 'refresh_token_request_dto.g.dart';

@JsonSerializable()
class RefreshTokenRequestDto {
  String? refreshToken;

  RefreshTokenRequestDto({this.refreshToken});

  factory RefreshTokenRequestDto.fromJson(Map<String, dynamic> json) {
    return _$RefreshTokenRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RefreshTokenRequestDtoToJson(this);
}

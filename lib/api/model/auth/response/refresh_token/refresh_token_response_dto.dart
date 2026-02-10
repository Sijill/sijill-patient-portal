import 'package:json_annotation/json_annotation.dart';

part 'refresh_token_response_dto.g.dart';

@JsonSerializable()
class RefreshTokenResponseDto {
  String? accessToken;
  String? refreshToken;

  RefreshTokenResponseDto({this.accessToken, this.refreshToken});

  factory RefreshTokenResponseDto.fromJson(Map<String, dynamic> json) {
    return _$RefreshTokenResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RefreshTokenResponseDtoToJson(this);
}

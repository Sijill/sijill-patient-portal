import 'package:json_annotation/json_annotation.dart';

part 'logout_request_dto.g.dart';

@JsonSerializable()
class LogoutRequestDto {
  String? platform;
  String? refreshToken;

  LogoutRequestDto({this.platform = "mobile", this.refreshToken});

  factory LogoutRequestDto.fromJson(Map<String, dynamic> json) {
    return _$LogoutRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LogoutRequestDtoToJson(this);
}

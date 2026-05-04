import 'package:json_annotation/json_annotation.dart';

part 'upload_profile_image_response_dto.g.dart';

@JsonSerializable()
class UploadProfileImageResponseDto {
  String? message;
  String? error;
  int? statusCode;

  UploadProfileImageResponseDto({this.message, this.error, this.statusCode});

  factory UploadProfileImageResponseDto.fromJson(Map<String, dynamic> json) {
    return _$UploadProfileImageResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UploadProfileImageResponseDtoToJson(this);
}

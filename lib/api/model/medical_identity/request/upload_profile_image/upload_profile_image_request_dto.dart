import 'package:json_annotation/json_annotation.dart';

part 'upload_profile_image_request_dto.g.dart';

@JsonSerializable()
class UploadProfileImageRequestDto {
  String? profilePicture;

  UploadProfileImageRequestDto({this.profilePicture});

  factory UploadProfileImageRequestDto.fromJson(Map<String, dynamic> json) {
    return _$UploadProfileImageRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UploadProfileImageRequestDtoToJson(this);
}

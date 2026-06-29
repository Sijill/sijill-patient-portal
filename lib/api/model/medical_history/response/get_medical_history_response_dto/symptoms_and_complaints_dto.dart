import 'package:json_annotation/json_annotation.dart';

part 'symptoms_and_complaints_dto.g.dart';

@JsonSerializable()
class SymptomsAndComplaintsDto {
  String? title;
  String? description;

  SymptomsAndComplaintsDto({this.title, this.description});

  factory SymptomsAndComplaintsDto.fromJson(Map<String, dynamic> json) {
    return _$SymptomsAndComplaintsDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SymptomsAndComplaintsDtoToJson(this);
}

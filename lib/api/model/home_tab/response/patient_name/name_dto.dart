import 'package:json_annotation/json_annotation.dart';

part 'name_dto.g.dart';

@JsonSerializable()
class NameDto {
  String? firstName;
  String? middleName;
  String? surname;
  String? fullName;

  NameDto({this.firstName, this.middleName, this.surname, this.fullName});

  factory NameDto.fromJson(Map<String, dynamic> json) =>
      _$NameDtoFromJson(json);

  Map<String, dynamic> toJson() => _$NameDtoToJson(this);
}

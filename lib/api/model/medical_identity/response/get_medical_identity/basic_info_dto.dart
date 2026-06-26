import 'package:json_annotation/json_annotation.dart';

part 'basic_info_dto.g.dart';

@JsonSerializable()
class BasicInfoDto {
  String? firstName;
  String? middleName;
  String? surname;
  String? fullName;
  int? age;
  String? gender;
  String? bloodType;
  int? weightKg;
  int? heightCm;
  double? bmi;

  BasicInfoDto({
    this.firstName,
    this.middleName,
    this.surname,
    this.fullName,
    this.age,
    this.gender,
    this.bloodType,
    this.weightKg,
    this.heightCm,
    this.bmi,
  });

  factory BasicInfoDto.fromJson(Map<String, dynamic> json) {
    return _$BasicInfoDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BasicInfoDtoToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'register_request_dto.g.dart';

@JsonSerializable()
class RegisterRequestDto {
  String? role;
  String? email;
  String? phoneNumber;
  String? password;
  String? firstName;
  String? middleName;
  String? surName;
  String? gender;
  String? dateOfBirth;
  String? nationalId;
  String? nationalIdFront;
  String? nationalIdBack;
  String? selfieWithId;

  RegisterRequestDto({
    this.role,
    this.email,
    this.phoneNumber,
    this.password,
    this.firstName,
    this.middleName,
    this.surName,
    this.gender,
    this.dateOfBirth,
    this.nationalId,
    this.nationalIdFront,
    this.nationalIdBack,
    this.selfieWithId,
  });

  factory RegisterRequestDto.fromJson(Map<String, dynamic> json) {
    return _$RegisterRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RegisterRequestDtoToJson(this);
}

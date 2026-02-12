class RegisterRequest {
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

  RegisterRequest({
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
}

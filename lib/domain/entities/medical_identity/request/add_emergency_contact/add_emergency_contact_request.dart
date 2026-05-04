class AddEmergencyContactRequest {
  String? contactName;
  String? phoneNumber;
  String? relationship;
  bool? isPrimary;

  AddEmergencyContactRequest({
    this.contactName,
    this.phoneNumber,
    this.relationship,
    this.isPrimary,
  });
}

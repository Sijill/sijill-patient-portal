class CurrentMedication {
  String? medicationName;
  int? dosageAmount;
  String? dosageUnit;
  String? form;
  String? frequency;
  DateTime? startDate;
  dynamic endDate;
  String? prescribedBy;
  DateTime? prescribedAt;

  CurrentMedication({
    this.medicationName,
    this.dosageAmount,
    this.dosageUnit,
    this.form,
    this.frequency,
    this.startDate,
    this.endDate,
    this.prescribedBy,
    this.prescribedAt,
  });
}

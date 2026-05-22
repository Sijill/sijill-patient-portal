class PrescribedMedication {
  String? medicationName;
  int? dosageAmount;
  String? dosageUnit;
  String? form;
  String? frequency;
  String? instructions;
  String? startDate;
  dynamic endDate;

  PrescribedMedication({
    this.medicationName,
    this.dosageAmount,
    this.dosageUnit,
    this.form,
    this.frequency,
    this.instructions,
    this.startDate,
    this.endDate,
  });
}

class Medication {
  String? medicationId;
  String? name;
  int? dosageAmount;
  String? dosageUnit;
  String? form;
  String? frequency;
  DateTime? startDate;
  dynamic endDate;
  String? prescribedBy;

  Medication({
    this.medicationId,
    this.name,
    this.dosageAmount,
    this.dosageUnit,
    this.form,
    this.frequency,
    this.startDate,
    this.endDate,
    this.prescribedBy,
  });
}

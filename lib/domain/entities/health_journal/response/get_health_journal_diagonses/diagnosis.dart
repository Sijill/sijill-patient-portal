class Diagnosis {
  String? diagnosisId;
  String? icd11Code;
  String? icd11Title;
  String? clinicalDescription;
  bool? isChronic;
  String? diagnosedBy;
  DateTime? diagnosedDate;

  Diagnosis({
    this.diagnosisId,
    this.icd11Code,
    this.icd11Title,
    this.clinicalDescription,
    this.isChronic,
    this.diagnosedBy,
    this.diagnosedDate,
  });
}

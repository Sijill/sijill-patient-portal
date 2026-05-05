import 'package:sijil_patient_portal/domain/entities/health_journal/response/get_health_journal_notes/last_entry.dart';

class Diagnosis {
  String? diagnosisId;
  String? icd11Code;
  String? icd11Title;
  bool? isChronic;
  int? totalEntries;
  DateTime? lastEntryDate;
  LastEntry? lastEntry;

  Diagnosis({
    this.diagnosisId,
    this.icd11Code,
    this.icd11Title,
    this.isChronic,
    this.totalEntries,
    this.lastEntryDate,
    this.lastEntry,
  });
}

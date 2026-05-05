import 'package:sijil_patient_portal/api/mapper/health_journal/get_health_journal_notes/last_entrey_mapper.dart';
import 'package:sijil_patient_portal/api/model/health_journal/response/get_health_journal_notes/diagnosis_dto.dart';
import 'package:sijil_patient_portal/domain/entities/health_journal/response/get_health_journal_notes/diagnosis.dart';

extension DiagonsesMapper on DiagnosisDto {
  Diagnosis convertToDiagnosis() {
    return Diagnosis(
      lastEntryDate: lastEntryDate,
      totalEntries: totalEntries,
      diagnosisId: diagnosisId,
      icd11Code: icd11Code,
      icd11Title: icd11Title,
      isChronic: isChronic,
      lastEntry: lastEntry?.convertToLastEntry(),
    );
  }
}

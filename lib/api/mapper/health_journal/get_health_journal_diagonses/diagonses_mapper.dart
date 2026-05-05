import 'package:sijil_patient_portal/api/model/health_journal/response/get_health_journal_diagonses/diagnosis_dto.dart';
import 'package:sijil_patient_portal/domain/entities/health_journal/response/get_health_journal_diagonses/diagnosis.dart';

extension DiagonsesMapper on DiagnosisDto {
  Diagnosis convertToDiagnosis() {
    return Diagnosis(
      clinicalDescription: clinicalDescription,
      diagnosedBy: diagnosedBy,
      diagnosedDate: diagnosedDate,
      diagnosisId: diagnosisId,
      icd11Code: icd11Code,
      icd11Title: icd11Title,
      isChronic: isChronic,
    );
  }
}
